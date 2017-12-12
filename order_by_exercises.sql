# Modify your first query to order by first name. The first result should be Irena Majewski and the last result should
# be Vidya Schaft.
# Update the query to order by first name and then last name. The first result should now be Irena Acton and the last
# should be Vidya Zweizig.
# Change the order by clause so that you order by last name before first name. Your first result should still be Irena
#  Acton but now the last result should be Maya Zyda.
# Update your queries for employees with 'E' in their last name to sort the results by their employee number. Your
# results should not change!
# Now reverse the sort order for both queries.
# Change the query for employees hired in the 90s and born on Christmas such that the first result is the oldest
# employee who was hired last. It should be Khun Bernini.


SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;

SELECT *
FROM employees
WHERE last_name LIKE 'E%'
ORDER BY emp_no;

SELECT *
FROM employees
WHERE last_name LIKE 'E%'
ORDER BY emp_no desc;

SELECT *
FROM employees
WHERE hire_date LIKE '199%' and birth_date like '%12-25'
ORDER BY birth_date, hire_date desc;


