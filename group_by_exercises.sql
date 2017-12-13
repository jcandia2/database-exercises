USE employees;

SELECT *
FROM titles;

# In your script, use DISTINCT to find the unique titles in the titles table
SELECT DISTINCT t.title AS 'unique_titles'
FROM titles t;

# show titles and how many employees we have with each title
SELECT
  t.title      AS 'titles',
  count(title) AS 'count'
FROM titles t
GROUP BY t.title
ORDER BY count DESC;

# Find your query for employees whose last names start and end with 'E'. Update the query to find just
# the unique last names that start and end with 'E' using GROUP BY.
SELECT e.last_name
FROM employees AS e
WHERE e.last_name LIKE 'E%' AND e.last_name LIKE '%e'
GROUP BY e.last_name;

# Update your previous query to now find unique combinations of first and last name where the last name
# starts and ends with 'E'. You should get 846 rows.
SELECT e.first_name,e.last_name
  AS Full_Name
FROM employees AS e
WHERE e.last_name LIKE 'E%' AND e.last_name LIKE '%e'
GROUP BY e.first_name, e.last_name;

# Find the unique last names with a 'q' but not 'qu'. Your results should be:
# Chleq
# Lindqvist
# Qiwen

SELECT e.last_name
FROM employees e
WHERE e.last_name LIKE '%q%' AND e.last_name NOT LIKE '%qu%'
GROUP BY e.last_name;

# Add a COUNT() to your results and use ORDER BY to make it easier to find employees whose
# unusual name is shared with others
SELECT e.last_name, count(*)
FROM employees e
WHERE e.last_name LIKE '%q%' AND e.last_name NOT LIKE '%qu%'
GROUP BY e.last_name
ORDER BY count(*) DESC ;


SELECT
  e.first_name,
  count(e.first_name) AS 'Occurences_of_this_name'
FROM employees e
GROUP BY e.first_name
ORDER BY e.first_name;

# Update your query for 'Irena', 'Vidya', or 'Maya'. Use count(*) and GROUP BY to find the
# number of employees for each gender with those names. Your results should be:
# 441 M
# 268 F
SELECT
  count(e.gender) AS count,
  e.gender
FROM employees e
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY e.gender;






