USE codeup_test_db;

-- Create albums table --
-- "Migrations" are files that create, modify, or delete tables --
-- it's very tedious to update or add information manually to a table so we use migration files to automate this
DROP TABLE IF EXISTS quotes;

-- creates table
-- make sure we have a primary key
CREATE TABLE quotes (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50),
  last_name  VARCHAR(100) NOT NULL,
  content TEXT NOT NULL,
  PRIMARY KEY (id)
);
