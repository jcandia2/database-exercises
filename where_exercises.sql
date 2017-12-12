USE employees;

SELECT *
FROM employees
ORDER BY last_name;

# Find all employees with first names 'Irena', 'Vidya', or 'Maya'
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');

# Find all employees whose last name starts with 'E'
SELECT *
FROM employees
WHERE last_name LIKE 'E%';

# Find all employees hired in the 90s
SELECT *
FROM employees
WHERE employees.hire_date BETWEEN '1990-01-01' AND '1999-12-31';

# another way to do previous is by using %
SELECT *
FROM employees
WHERE hire_date LIKE '199%';

# Find all employees born on Christmas
SELECT *
FROM employees
WHERE birth_date LIKE '%12-25';

# Find all employees with a 'q' in their last name
SELECT *
FROM employees
WHERE last_name LIKE '%q%';

# Find all employees with first names 'Irena', 'Vidya', or 'Maya' using OR instead of IN
SELECT *
FROM employees
WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';

# Find all employees with first names 'Irena', 'Vidya', or 'Maya' and gender is male
SELECT *
FROM employees
WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya') and gender = 'M';

# Find all employees whose last name starts or ends with 'E'
SELECT *
from employees
WHERE last_name like 'e%' or last_name like '%e'
ORDER BY last_name;

# Duplicate the previous query and update it to find all employees whose last name starts and ends with 'E'
SELECT *
from employees
WHERE last_name like 'e%' AND last_name like '%e'
ORDER BY last_name;


# Find all employees hired in the 90s and born on Christmas
SELECT *
FROM employees
WHERE (hire_date BETWEEN '1990-01-01' AND '1999-12-31') AND birth_date LIKE '%12-25';

# Find all employees with a 'q' in their last name but not 'qu'
select *
from employees
where last_name like '%q%' and last_name not like '%qu%'
ORDER BY last_name;

select *
from employees
where last_name like 'q%'
ORDER BY last_name;