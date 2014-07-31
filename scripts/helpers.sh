#!/bin/bash
#
# Helper scripts
#


function log {
	[ "${LOGGING_ON}" = "yes" ] || continue

	if [ "x" = "x$LOGFILE" ]; then 
    	echo $@ 1>&2   # stderr
    else
    	echo $@ >> ${LOGFILE}
  	fi
}

function bail {
	log $@
	log  "Exiting."
	echo "Exiting." 
	exit 1
}

