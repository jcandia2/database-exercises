USE codeup_test_db;

TRUNCATE quotes;

INSERT INTO quotes (first_name, last_name, content)
VALUES ('Douglas', 'Adams', 'Time is an illusion. Lunchtime doubly so.'),
  ('Mark', 'Twain', 'Clothes make the man. Naked people have little or no influence on society.'),
  ('Kurt', 'Vonnegut', 'The universe is a big place, perhaps the biggest.'),
  ('Daffy', 'Duck', 'It''s rabbit season'),
  ('Buggs', 'Bunny', 'it''s duck season');