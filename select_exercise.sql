USE codeup_test_db;

select name from albums where artist = 'Pink Floyd';

select release_date from albums where name = 'Sgt. Pepper''s Lonely Hearts Club Band';

select genre from albums where name = 'Nevermind';

select name from albums where release_date >= 1990 and release_date <= 2000;

SELECT name from albums where release_date BETWEEN 1990 and 2000;

select name from albums where sales < 20;

select name from albums where genre = 'Rock';

select name as Albums_by_Pink_Floyd from albums where artist = 'Pink Floyd';

select release_date as Release_date_for_Sgt_Peppers_Lonely_Hearts_Club_Band from albums where name = 'Sgt. Pepper''s Lonely Hearts Club Band';

select genre as Genre_for_Nevermind from albums where name = 'Nevermind';

select concat(name, " ",release_date) as Albums_released_in_the_1990s from albums where release_date >= 1990 and release_date <= 2000;

SELECT concat(name, " ",release_date) as Albums_released_in_the_1990s from albums where release_date BETWEEN 1990 and 2000;

select name as Albums_with_less_than_20_million_sales from albums where sales < 20;

select name as Albums_with_a_Genre_of_Rock from albums where genre = 'Rock';