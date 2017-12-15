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
                     WHERE emp_no = '101010');

# Find all the titles held by all employees with the first name Aamod.
# 314 total titles, 6 unique titles

SELECT t.title
FROM titles t
WHERE t.emp_no in (SELECT emp_no
                  FROM employees
                  WHERE first_name = 'Aamod');

SELECT t.title, count(t.title)
FROM titles t
WHERE t.emp_no in (SELECT emp_no
                   FROM employees
                   WHERE first_name = 'Aamod')
GROUP BY (t.title);

