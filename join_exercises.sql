CREATE DATABASE IF NOT EXISTS join_test_db;

CREATE TABLE roles (
  id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE users (
  id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name    VARCHAR(100) NOT NULL,
  email   VARCHAR(100) NOT NULL,
  role_id INT UNSIGNED          DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
  ('bob', 'bob@example.com', 1),
  ('joe', 'joe@example.com', 2),
  ('sally', 'sally@example.com', 3),
  ('adam', 'adam@example.com', 3),
  ('jane', 'jane@example.com', NULL),
  ('mike', 'mike@example.com', NULL);

# Insert 4 new users into the database. One should have a NULL
#  role. The other three should be authors.

INSERT INTO users (name, email, role_id) VALUES
  ('bill', 'bill@example.com', NULL),
  ('juan', 'juan@example.com', 2),
  ('luis', 'luis@example.com', 2),
  ('fer', 'fer@example.com', 2);

SELECT *
FROM users;

DESCRIBE roles;

SELECT *
FROM roles;

SELECT
  u.name AS name,
  r.name AS role
FROM users u
  JOIN roles r ON r.id = u.role_id
ORDER BY role;

SELECT
  u.name AS name,
  r.name AS role
FROM users u
  LEFT JOIN roles r ON r.id = u.role_id
ORDER BY role;

SELECT
  u.name AS name,
  r.name AS role
FROM users u
  RIGHT JOIN roles r ON r.id = u.role_id
ORDER BY role;

SELECT
  r.id,
  r.name        AS role,
  count(r.name) AS count
FROM users u
  RIGHT JOIN roles r ON r.id = u.role_id
GROUP BY r.id, r.name
ORDER BY role;

# write a query that shows each department along with the
# name of the current manager for that department.
#   Department Name    | Department Manager
#  --------------------+--------------------
#   Customer Service   | Yuchang Weedman
#   Development        | Leon DasSarma
#   Finance            | Isamu Legleitner
#   Human Resources    | Karsten Sigstam
#   Marketing          | Vishwani Minakawa
#   Production         | Oscar Ghazalie
#   Quality Management | Dung Pesch
#   Research           | Hilary Kambil
#   Sales              | Hauke Zhang

USE employees;

SELECT
  d.dept_name                            AS Department_Name,
  concat(e.first_name, ' ', e.last_name) AS Department_Manager
FROM employees e
  JOIN dept_manager dm ON dm.emp_no = e.emp_no
  JOIN departments d ON d.dept_no = dm.dept_no
WHERE dm.to_date > now() -- indicates current manager, leaving this off will show dept thru history
ORDER BY d.dept_name;

SELECT now();

SELECT curdate();

# Find the name of all departments currently managed by women.

# Department Name | Manager Name
# ----------------+-----------------
# Development     | Leon DasSarma
# Finance         | Isamu Legleitner
# Human Resources | Karsetn Sigstam
# Research        | Hilary Kambil

SELECT
  d.dept_name                            AS Department_Name,
  concat(e.first_name, ' ', e.last_name) AS Department_Manager,
  e.gender                               AS Gender
FROM employees e
  JOIN dept_manager dm ON dm.emp_no = e.emp_no
  JOIN departments d ON d.dept_no = dm.dept_no
WHERE dm.to_date > now() AND e.gender = 'F'-- indicates current manager
ORDER BY d.dept_name;

# Find the current titles of employees currently working in the Customer Service department.

# Title              | Count
# -------------------+------
# Assistant Engineer |    68
# Engineer           |   627
# Manager            |     1
# Senior Engineer    |  1790
# Senior Staff       | 11268
# Staff              |  3574
# Technique Leader   |   241

SELECT
  t.title        AS Title,
  count(t.title) AS Count
FROM titles t
  JOIN employees e ON e.emp_no = t.emp_no
  JOIN dept_emp de ON de.emp_no = e.emp_no
  JOIN departments d ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Customer Service' AND de.to_date > now() AND t.to_date > now()
#   need to check for employees current title as well
GROUP BY t.title;

SELECT
  de.dept_no,
  count(de.dept_no)
FROM dept_emp de
  JOIN departments d ON d.dept_no = de.dept_no
WHERE de.to_date > now() AND d.dept_name = 'Customer Service'
GROUP BY de.dept_no;

# Find the current salary of all current managers.

# Department Name    | Name              | Salary
# -------------------+-------------------+-------
# Customer Service   | Yuchang Weedman   |  58745
# Development        | Leon DasSarma     |  74510
# Finance            | Isamu Legleitner  |  83457
# Human Resources    | Karsten Sigstam   |  65400
# Marketing          | Vishwani Minakawa | 106491
# Production         | Oscar Ghazalie    |  56654
# Quality Management | Dung Pesch        |  72876
# Research           | Hilary Kambil     |  79393
# Sales              | Hauke Zhang       | 101987

SELECT
  d.dept_name                            AS Department_Name,
  concat(e.first_name, ' ', e.last_name) AS Department_Manager,
  s.salary                               AS Salary
FROM employees e
  JOIN dept_manager dm ON dm.emp_no = e.emp_no
  JOIN departments d ON d.dept_no = dm.dept_no
  JOIN salaries s ON s.emp_no = e.emp_no
WHERE dm.to_date > now() AND s.to_date > now()-- indicates current manager
ORDER BY d.dept_name;

# Bonus Find the names of all current employees, their department name, and their current
# manager's name.

# 240,124 Rows
#
# Employee Name | Department Name  |  Manager Name
# --------------|------------------|-----------------
# Huan Lortz   | Customer Service | Yuchang Weedman
#
# .....

-- SELECT
--   concat(e.first_name, ' ', e.last_name) AS 'Employee_Name',
--   de.dept_no,
--   d.dept_name,
--   de.from_date as since
-- FROM employees e
--   JOIN dept_emp de ON de.emp_no = e.emp_no
--   JOIN departments d ON d.dept_no = de.dept_no
-- where de.to_date > now();
