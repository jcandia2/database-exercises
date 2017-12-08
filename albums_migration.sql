USE codeup_test_db;

-- Create albums table --
-- "Migrations" are files that create, modify, or delete tables --
DROP TABLE IF EXISTS albums;

CREATE TABLE albums (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  artist VARCHAR(100) NOT NULL DEFAULT 'NONE',
  name VARCHAR(50) NOT NULL,
  release_date INT NOT NULL,
  sales FLOAT NOT NULL DEFAULT 0.0,
  genre VARCHAR(50) NOT NULL ,
  PRIMARY KEY (id)
);

