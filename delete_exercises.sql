USE codeup_test_db;

# Write SELECT statements for:
# Albums released after 1991
# Albums with the genre 'disco'
# Albums by 'Whitney Houston' (...or maybe an artist of your choice)

SELECT 'Albums released after 1991' AS '';
SELECT *
FROM albums
WHERE release_date > 1991;

DELETE
FROM albums
WHERE release_date > 1991;

SELECT 'All albums after 1991 deleted:' AS '';
SELECT *
FROM albums;


SELECT 'Albums with genre = disco' AS '';
SELECT *
FROM albums
WHERE genre = 'disco';

DELETE
FROM albums
WHERE genre = 'disco';

select 'All albums after disco deleted' as '';
SELECT *
FROM albums;

SELECT 'Albums by The Beatles' AS '';
SELECT *
FROM albums
WHERE artist = 'The Beatles';

DELETE
FROM albums
WHERE artist = 'The Beatles';

select 'All albums after The Beatles deleted' as '';
SELECT *
FROM albums;

