USE codeup_test_db;

SELECT 'All albums in your table' as '';
SELECT * from albums;

UPDATE albums
SET sales = sales * 10;

SELECT 'All albums in your table with sales updated' as '';
SELECT * from albums;


SELECT 'All albums released before 1980' as '';
SELECT * from albums where release_date < 1980;

UPDATE albums
SET  release_date = release_date - 100
WHERE release_date < 1980;

SELECT 'Move all the albums before 1980 back to the 1800s.' as '';
SELECT *
FROM albums
where release_date < 1980;

SELECT 'All albums by Michael Jackson' as '';
SELECT * from albums where artist = 'Michael Jackson';

UPDATE albums
set artist = 'Peter Jackson'
where artist = 'Michael jackson';

SELECT 'Michael Jackson changed to Peter Jackson' as '';
SELECT * from albums where artist = 'Peter Jackson';



