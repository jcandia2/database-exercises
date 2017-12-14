USE codeup_test_db;

SELECT 'Albums by Pink Floyd' AS 'Caption';
SELECT name
FROM albums
WHERE artist = 'Pink Floyd';

SELECT release_date
FROM albums
WHERE name = 'Sgt. Pepper''s Lonely Hearts Club Band';

SELECT genre
FROM albums
WHERE name = 'Nevermind';

SELECT name
FROM albums
WHERE release_date >= 1990 AND release_date <= 1999;

SELECT *
FROM albums
WHERE release_date BETWEEN 1990 AND 1999;

SELECT name
FROM albums
WHERE sales < 20;

SELECT name
FROM albums
WHERE genre like 'Rock';

SELECT name AS Albums_by_Pink_Floyd
FROM albums
WHERE artist = 'Pink Floyd';

SELECT release_date AS Release_date_for_Sgt_Peppers_Lonely_Hearts_Club_Band
FROM albums
WHERE name = 'Sgt. Pepper''s Lonely Hearts Club Band';

SELECT genre AS Genre_for_Nevermind
FROM albums
WHERE name = 'Nevermind';

SELECT concat(name, " ", release_date) AS Albums_released_in_the_1990s
FROM albums
WHERE release_date >= 1990 AND release_date <= 1999;

SELECT concat(name, " ", release_date) AS Albums_released_in_the_1990s
FROM albums
WHERE release_date BETWEEN 1990 AND 1999;

SELECT name AS Albums_with_less_than_20_million_sales
FROM albums
WHERE sales < 20;

SELECT *
FROM albums
WHERE genre like '%Rock%'; -- like is case sensitve, % looks for anything with the word rock in it