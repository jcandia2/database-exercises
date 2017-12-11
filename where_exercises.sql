use employees;

SELECT *
FROM employees
where first_name in ('Irena', 'Vidya', 'Maya');

SELECT *
FROM employees
where last_name like 'E%';

SELECT *
FROM employees
where employees.hire_date BETWEEN '1990-01-01' and '1999-12-31';

SELECT *
FROM employees
where birth_date like '%12-25';

SELECT *
FROM employees
where last_name like '%q%';

