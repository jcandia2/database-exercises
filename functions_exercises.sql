# concat() to combine their first and last name together as a single column in your results.
SELECT concat(e.first_name," ",e.last_name)
as Full_Name
FROM employees as e
WHERE last_name LIKE 'E%'
ORDER BY e.last_name;

# For your query of employees born on Christmas and hired in the 90s, find how many
# days they have been working at the company using unix_timestamp
SELECT e.first_name, e.last_name, e.hire_date, concat((UNIX_TIMESTAMP() - unix_timestamp(hire_date))/31449600, ' years') as 'Years_Worked'
FROM employees as e
WHERE e.hire_date LIKE '199%' and e.birth_date like '%12-25'
ORDER BY e.birth_date, e.hire_date desc
limit 20;


# For your query of employees born on Christmas and hired in the 90s, use datediff() to find how many
# days they have been working at the company
SELECT e.first_name, e.last_name, e.hire_date, (datediff(now(),hire_date))/365 as 'Years_Worked'
FROM employees as e
WHERE e.hire_date LIKE '199%' and e.birth_date like '%12-25'
ORDER BY e.birth_date, e.hire_date desc
limit 20;




