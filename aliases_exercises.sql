use employees;

# Return 10 employees in a result set named 'full_name' in the format of 'lastname, firstname' for each employee.
SELECT concat(e.last_name,' ',e.first_name) as 'full_name'
from employees as e
limit 10;

SELECT *
FROM employees;

# Add the date of birth for each employee as 'DOB' to the query.
SELECT concat(e.last_name,', ',e.first_name) as 'full_name', e.birth_date as 'DOB'
from employees as e
limit 10;

# Update the query to format full name to include the employee number so it is formatted as
# 'employee number - lastname, firstname'.
SELECT concat(e.emp_no,' - ',e.last_name,', ',e.first_name) as 'full_name', e.birth_date as 'DOB'
from employees as e
limit 10;

