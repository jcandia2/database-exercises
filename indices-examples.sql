use codeup_test_db;

# Add an index to make sure all album names combined with the artist are unique.
# Try to add duplicates to test the constraint.


-- Create albums table --
-- "Migrations" are files that create, modify, or delete tables --
-- it's very tedious to update or add information manually to a table so we use migration files to automate this
DROP TABLE IF EXISTS albums;

# creates table
# make sure we have a primary key
# adds a unique index for combination artist and name
# that means we can't have another entry where both the artist and name match an
# existing row
# you can do it on the table description
CREATE TABLE albums (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  artist VARCHAR(100) NOT NULL DEFAULT 'NONE',
  name VARCHAR(50) NOT NULL,
  release_date INT NOT NULL,
  sales FLOAT NOT NULL DEFAULT 0.0,
  genre VARCHAR(50) NOT NULL ,
  PRIMARY KEY (id),
  UNIQUE (artist, name)
);

# or you can alter it if it already exists
ALTER TABLE albums
  ADD UNIQUE (name, artist);

DESCRIBE albums;

select *
from albums a;

# this won't allow - Duplicate entry 'Eagles-Hotel California' for key artist
INSERT INTO albums (artist, name, release_date, sales, genre)
VALUES ('Eagles', 'Hotel California', 1976, 32.2, 'Rock')
;