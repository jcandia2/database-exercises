USE employees;


# Return 10 employees in a result set named 'full_name' in the format of 'lastname, firstname' for each employee.
SELECT concat(e.last_name, ', ', e.first_name) AS 'full_name'
FROM employees AS e
LIMIT 10;

SELECT *
FROM employees;

# Add the date of birth for each employee as 'DOB' to the query.
# note keyword 'as' is optional
SELECT
  concat(e.last_name, ', ', e.first_name) 'full_name',
  e.birth_date                            'DOB'
FROM employees AS e
LIMIT 10;

# Update the query to format full name to include the employee number so it is formatted as
# 'employee number - lastname, firstname'.
SELECT
  concat(e.emp_no, ' - ', e.last_name, ', ', e.first_name) AS 'full_name',
  e.birth_date                                             AS 'DOB'
FROM employees AS e
LIMIT 10;

