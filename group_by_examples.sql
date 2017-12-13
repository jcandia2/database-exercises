use employees;

# Distinct gives you unique list
SELECT DISTINCT first_name, last_name
from employees;

# group by - similar to distinct as it retuns unique entries but allows you to use aggregate functions
# need to make sure whatever you have in your select is used in your group by
# aggregate functions (functions with memory)
# count, avg, sum, max, min

SELECT count(*), first_name, last_name
FROM employees
GROUP BY first_name, last_name;


SELECT sum(s.salary), to_date -- projection
FROM salaries s
  where s.to_date = '9999-01-01' -- current employees salaries
GROUP BY s.to_date;

SELECT avg(s.salary), to_date -- projection
FROM salaries s
where s.to_date = '9999-01-01' -- current employees salaries
GROUP BY s.to_date;

SELECT max(s.salary), to_date -- projection
FROM salaries s
where s.to_date = '9999-01-01' -- current employees salaries
GROUP BY s.to_date;