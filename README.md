Defensive Scripting
===================

Tutorial and examples for a workshop on defensive scripting.

For the presentation and content, please see this Prezi:

* http://prezi.com/edhlulreb0sk/


## Problem

*The problem:*  Given a table in a database with user information `firstname`, `lastname`, and `email`, write to an additional table a set of entries that include an email alias of type `firstname.lastname@example.org` associated with the original email address. The entries need to be unique per user, and proerly formatted strings that are valid email addresses.

The final execution of this should only be done once, by execution of released (i.e. tagged as a release) code from GitHub. Before releasing, the process should be validated in a suitable test environment. Artifacts of the test process should be treated as part of the codebase of the script.

The solution must be captured in version control and code reviewed by another student. In addition, the process for executing the solution script should be documented with the code, and also part of version control.

## Requirements

The solution to the problem must demonstrate the defensive techniques as follows:

1. Demonstration of input validation of any script arguments and the data source
2. Validation of return codes and values when executing commands
3. Assertion testing of the state of data and the environment
4. Code reuse and hygiene, including both variables and functions
5. Canonicallized data (if appropriate)
6. Code code structure, variable and function naming, and comments
7. Logging of actions and results
8. Clear visibility into the state of the program on execution, and the ability to do a "Dry run"
9. Abrupt failure on error conditions, with clear output as to failure mode.
10. A simple but well-defined release process.

Last but not least, a clear mechanism to test and validate the code outside of production.

## Environment

The structure of the tutorial environment is simply a MySQL database, with two tables. The first table is structured as follows:

```
+----+------------+-----------+---------------------------+
| id | first_name | last_name | email                     |
+----+------------+-----------+---------------------------+
|  1 | Laurine    | Deskin    | Deskin6744@example.org    |
|  2 | Irwin      | Gholston  | Gholston24153@example.org |
|  3 | Beth       | Lafrance  | Lafrance5175@example.org  |
+----+------------+-----------+---------------------------+
```

And is populated with sample data.

The second table has the following structure:

```
+----+---------------+-------+
| id | primary_email | alias |
+----+---------------+-------+
+----+---------------+-------+
```
but is empty. 

Each student or pair will be given their own database to work with. 



