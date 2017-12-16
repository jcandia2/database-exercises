USE adlister_db;

DROP TABLE IF EXISTS ad_category;
DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS users;

CREATE TABLE categories
(
  id       INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  category VARCHAR(255),
  PRIMARY KEY (id)
);

CREATE TABLE users
(
  id         INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(30),
  last_name  VARCHAR(30),
  email      VARCHAR(30),
  password   VARCHAR(30),
  PRIMARY KEY (id)
);

CREATE TABLE ads
(
  id          INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  title       VARCHAR(255),
  description VARCHAR(255),
  user_id     INT UNSIGNED     NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE ad_category (
  ads_id INTEGER UNSIGNED NOT NULL,
  cat_id INTEGER UNSIGNED NOT NULL,
  FOREIGN KEY (ads_id) REFERENCES ads (id),
  FOREIGN KEY (cat_id) REFERENCES categories (id)
);

INSERT INTO users (first_name, last_name, email, password)
VALUES ('joe', 'joe', 'joe@example.com', 'joe1'),
  ('sally', 'sally', 'sally@example.com', 'sally1'),
  ('adam', 'adam', 'adam@example.com', 'adam1'),
  ('jane', 'jane', 'jane@example.com', 'jane1'),
  ('mike', 'mike', 'mike@example.com', 'mike1');

INSERT INTO categories (category)
VALUES ('appliances'),
  ('arts+crafts'),
  ('atv/utv/sno'),
  ('auto parts'),
  ('baby+kid'),
  ('barter'),
  ('beauty+hlth'),
  ('bikes'),
  ('boats'),
  ('books'),
  ('business'),
  ('cars+trucks'),
  ('cds/dvd/vhs'),
  ('cell phones'),
  ('clothes+acc'),
  ('collectibles'),
  ('computers'),
  ('electronics'),
  ('farm+garden'),
  ('free'),
  ('furniture'),
  ('garage sale'),
  ('general'),
  ('heavy equip'),
  ('household'),
  ('jewelry'),
  ('materials'),
  ('motorcycles'),
  ('music instr'),
  ('photo+video'),
  ('rvs+camp'),
  ('sporting'),
  ('tickets'),
  ('tools'),
  ('toys+games'),
  ('trailers'),
  ('video gaming'),
  ('wanted');

INSERT INTO ads (title, description, user_id)
VALUES ('Photo Session', 'Get your Christmas pictures with us', 1),
  ('PlayStation', 'PS2 in great condition', 1),
  ('Mini Photo Session', 'Family pictures for everyone', 2),
  ('Web Developer', 'Work with us for free and get a lot of experience', 3),
  ('SawTable101', 'like new, you can get it toda!', 4),
  ('Pillow', 'Silk fabric and 2 accent pillows', 5),
  ('Arcade', 'ARCADE BOXING MACHINE $2800 Medial Center', 5);

TRUNCATE ad_category;

INSERT INTO ad_category (ads_id, cat_id) VALUES
  (1, 30),
  (1, 26),
  (1, 28),
  (1, 2),
  (2, 35),
  (2, 15),
  (2, 38),
  (2, 1),
  (3, 25),
  (3, 27),
  (3, 21),
  (3, 24),
  (4, 38),
  (4, 33),
  (4, 2),
  (4, 7),
  (5, 34),
  (5, 35),
  (5, 37),
  (5, 38),
  (5, 22);


SELECT *
FROM users;

SELECT *
FROM ads;

SELECT *
FROM categories;

# show all categories for all ads
SELECT
  a.title,
  a.description,
  c.category
FROM categories c
  JOIN ad_category ad ON ad.cat_id = c.id
  JOIN ads a ON a.id = ad.ads_id
GROUP BY a.title, a.description, c.category
ORDER BY c.category;

# For a given ad = PlayStation, what is the email address of the user that created it?
SELECT
  u.email,
  a.title,
  a.description
FROM users u
  JOIN ads a ON a.user_id = u.id
WHERE a.title = 'PlayStation';

# For a given ad  = PlayStation, what category, or categories, does it belong to?
SELECT c.category AS 'Categories_for_Playstation'
FROM categories c
  JOIN ad_category ad ON ad.cat_id = c.id
  JOIN ads a ON a.id = ad.ads_id
WHERE a.title = 'PlayStation';

# For a given category = wanted, show all the ads that are in that category.
SELECT a.title
FROM ads a
  JOIN ad_category ad ON ad.ads_id = a.id
  JOIN categories c ON c.id = ad.cat_id
WHERE c.category = 'wanted';

# For a given user = mike, show all the ads they have posted.
SELECT
  u.first_name,
  u.last_name,
  a.title,
  a.description
FROM ads a
  JOIN users u ON u.id = a.user_id
WHERE u.first_name = 'mike';
