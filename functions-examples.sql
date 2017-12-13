use employees;


# using alias for columns and tables
# using an alias for a table will eliminat confusion if there are multiple databases with the same columns names
SELECT concat(e.first_name,' ',e.last_name) as 'Full_Name'
FROM employees AS e
limit 10;

# Like/Not Like - opposite of each other
# Like will return the resulst that match the pattern
# NOT LIKE will return the results that do not match the pattern.

# time on your server - right now we are using our computer so it's the time on our computer
SELECT NOW();

# returns unix timestamp for yesterday
SELECT curdate() - 1;

SELECT concat()