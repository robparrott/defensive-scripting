#!/bin/bash

#
# Create a problem environment for the workshop
#

NAMES_DATA_FILE=./data/names.txt
SQL_DDL_FILE=./scripts/DDL.sql

LOGGING_ON=yes

DOMAIN=example.org
MYSQL_HOST="defensivescripting.c7nlszhmupth.us-east-1.rds.amazonaws.com"
MYSQL_USER=admin
MYSQL_PASSWORD="lu-hyt-is"
MYSQL_DB="${1:-scripting}"


USER_EMAIL_TABLE="user_email"
source ./scripts/helpers.sh

# command for MySQL
MYSQL="mysql -h ${MYSQL_HOST} -u ${MYSQL_USER} -p${MYSQL_PASSWORD} "

#
# Are we in the right place?
#
if ! ( [ -d .git ] && [ -d scripts ] && [ -d data ] ); then
	bail_out "Please run this script from the root of the repository."
fi

#
# Read in our names with a space separating
# First and last Replace the space by a ":"
#
NAMES=$( cat ${NAMES_DATA_FILE} | tr ' ' ':' )

#
# Loop across names and insert 
#  into a SQL batch file, starting with
#  the DDL file
#
sql_batch=$( mktemp -t ./XXXXXXXX )

[ -r ${SQL_DDL_FILE} ] || bail "No DDL SQL file available!"
cat ${SQL_DDL_FILE} >> ${sql_batch}

for name in ${NAMES}; do 

	first_name=$( echo $name | awk -F: '{print $1}' )
	last_name=$(  echo $name | awk -F: '{print $2}' )

	email="${last_name}${RANDOM}@${DOMAIN}"

	SQL="INSERT INTO ${USER_EMAIL_TABLE} (first_name, last_name, email) \
	       VALUES ('${first_name}', '${last_name}', '${email}');"

	echo ${SQL} >> ${sql_batch}
done

#
# Try to create a database
#
echo "create database ${MYSQL_DB};" | ${MYSQL} 

#
# Write the results to the mysql database
#
cat ${sql_batch} | ${MYSQL} ${MYSQL_DB} || bail "Error creating tables in MySQL"

#
# Check the database for tables and the right number of entries
#
lines=$( wc -l ${NAMES_DATA_FILE} | awk '{print $1}')
rows=$( echo "select count(*) from ${USER_EMAIL_TABLE};" | ${MYSQL} ${MYSQL_DB} | grep -v count)

echo $lines / $rows


