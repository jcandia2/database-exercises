use employees;


# Modify your first query to order by first name.
SELECT *
FROM first_name, last_name
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;

# Update the query to order by first name and then last name.
SELECT *
FROM first_name, last_name
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;

# Change the order by clause so that you order by last name before first name.
SELECT *
FROM first_name, last_name
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;

# Update your queries for employees with 'E' in their last name to sort the results by their employee number.
SELECT *
FROM first_name, last_name
WHERE last_name LIKE 'E%'
ORDER BY emp_no;

# Now reverse the sort order for both queries.
SELECT *
FROM first_name, last_name
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name DESC, first_name desc;

SELECT *
FROM first_name, last_name
WHERE last_name LIKE 'E%'
ORDER BY emp_no desc;

# Change the query for employees hired in the 90s and born on Christmas such that the first result is the oldest
# employee who was hired last. It should be Khun Bernini.
SELECT *
FROM employees
WHERE hire_date LIKE '199%' and birth_date like '%12-25'
ORDER BY birth_date, hire_date desc;


