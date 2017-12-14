DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS roles;


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

TRUNCATE table roles;
TRUNCATE table users;

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


# show user name and their corresponding roles
# note that it will leave off the users who have a role id of null and
# it won't show blank users for commenter
SELECT users.name as user_name, roles.name as role_name
FROM users
  JOIN roles ON users.role_id = roles.id;

# show users who are admin
select u.name as user, r.name as role
from users u
join roles r on r.id = u.role_id
where r.name = 'admin';


# show users who are authors or reviewers
SELECT u.name as user, r.name as role
FROM users u
  JOIN roles r ON r.id = u.role_id
WHERE r.name IN ('author', 'reviewer')
;

# A left join is used when you want to retrieve all the records from the
# left table, regardless of whether or not they have a corresponding
# record in the right table.
SELECT users.name as user_name, roles.name as role_name
FROM users -- left table
  left JOIN roles ON users.role_id = roles.id; -- right table

SELECT users.name as user_name, roles.name as role_name
FROM users -- left table
  right JOIN roles ON users.role_id = roles.id; -- right table

