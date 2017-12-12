SELECT *
FROM employees
ORDER BY last_name, first_name;

SELECT *
FROM employees
WHERE birth_date LIKE '%04-26'
ORDER BY employees.birth_date, employees.last_name, employees.first_name;

SELECT
  emp_no,
  first_name,
  last_name
FROM employees
WHERE emp_no < 20000
      AND (
        last_name IN ('Herber', 'Baek')
        OR first_name = 'Shridhar'
      )
ORDER BY last_name, first_name;