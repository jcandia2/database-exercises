USE employees;
# Find all female employees with a current subtitle
SELECT
  e.first_name,
  e.last_name,
  e.gender
FROM employees e
WHERE e.gender = 'F' AND e.emp_no IN (SELECT t.emp_no
                                      FROM titles t
                                      WHERE t.to_date > now());

# Find all the employees with the same hire date as employee 101010 using a sub-query.
# 69 Rows

SELECT
  e.first_name,
  e.last_name,
  e.hire_date
FROM employees e
WHERE e.hire_date = (SELECT hire_date
                     FROM employees
                     WHERE emp_no = 101010);

# Find all the titles held by all employees with the first name Aamod.
# 314 total titles, 6 unique titles

SELECT t.title
FROM titles t
WHERE t.emp_no IN (SELECT emp_no
                   FROM employees
                   WHERE first_name = 'Aamod');

SELECT
  t.title,
  count(t.title)
FROM titles t
WHERE t.emp_no IN (SELECT emp_no
                   FROM employees
                   WHERE first_name = 'Aamod')
GROUP BY (t.title);

# Find all the current department managers that are female.
# +------------+------------+
# | first_name | last_name  |
# +------------+------------+
# | Isamu      | Legleitner |
# | Karsten    | Sigstam    |
# | Leon       | DasSarma   |
# | Hilary     | Kambil     |
# +------------+------------+

SHOW TABLES;
DESCRIBE dept_manager;
SELECT *
FROM dept_manager;

SELECT
  e.first_name,
  e.last_name
FROM employees e
WHERE e.gender = 'F' AND e.emp_no IN (SELECT emp_no
                                      FROM dept_manager
                                      WHERE to_date > now());

# BONUS Find all the department names that currently have female managers.
# +-----------------+
# | dept_name       |
# +-----------------+
# | Development     |
# | Finance         |
# | Human Resources |
# | Research        |
# +-----------------+

SELECT *
FROM departments;
SELECT *
FROM employees;

SELECT d.dept_name
FROM departments d
WHERE d.dept_no IN (SELECT dm.dept_no
                    FROM dept_manager dm
                    WHERE dm.to_date > now() and dm.emp_no IN (SELECT e.emp_no
                                        FROM employees e
                                        WHERE e.gender = 'F'));
