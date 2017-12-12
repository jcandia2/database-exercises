USE employees;

SELECT DISTINCT last_name
FROM employees
ORDER BY last_name DESC
LIMIT 10;

SELECT first_name, last_name
FROM employees
WHERE hire_date LIKE '199%' and birth_date like '%12-25'
ORDER BY birth_date, hire_date desc
limit 5;

# to display nth page of q results do n * q - q for offset
# limit * (offset -1)
SELECT first_name, last_name
FROM employees
WHERE hire_date LIKE '199%' and birth_date like '%12-25'
ORDER BY birth_date, hire_date desc
limit 5
OFFSET 45;