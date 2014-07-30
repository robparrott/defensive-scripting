Defensive Scripting
===================

Tutorial and examples for a workshop on defensive scripting.

For the presentation and content, please see this Prezi:

* http://prezi.com/edhlulreb0sk/


## Problem

*The problem:*  Given a table in a database with user information `firstname`, `lastname`, and `email`, write to an additional table a set of entries that include an email alias of type `firstname.lastname@example.org` associated with the original email address. The entries need to be unique per user, and proerly formatted strings that are valid email addresses.

The final execution of this should only be done once, but the process should be validated in a suitable test environment. Artifacts of the test process should be treated as part of the codebase of the script.

The solution must be captured in version control and code reviewed by another student. In addition, the process for executing the solution script should be documented with the code, and also part of version control.

## Environment

The structure of the tutorial environment is simply a MySQL database, with two tables. The first table is as follows:

And is populated with sample data.

The second table has the following structure:

but is empty. 

Each student or pair will be given their own database to work with. 



