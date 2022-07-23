/* 
Create a table named 'friends' with three columns:
    - 'id' that stores 'INTEGER'
    - 'name' that stores 'TEXT'
    - 'birthday that stores 'DATE'
*/

CREATE TABLE friends (
  id INTEGER,
  name TEXT,
  birthday DATE
);

/*
Beneath your current code, add Ororo Munroe to friends.
Her birthday is May 30th, 1940
*/

INSERT INTO friends (id, name, birthday)
VALUES (1, 'Ororo Munroe', '1940-05-30');

--Let’s make sure that Ororo has been added to the database:

SELECT * FROM friends;

--Add two of your friends to the table.

INSERT INTO friends (id, name, birthday)
VALUES (2, 'Trina Montoya', '1958-12-23');

INSERT INTO friends (id, name, birthday)
VALUES (3, 'Jason Teske', '1975-02-02');

--Change Ororo name to Storm 
UPDATE friends
SET name = 'Storm'
WHERE name = 'Ororo Munroe';

--Add a new column named email
ALTER TABLE friends
ADD COLUMN email TEXT;

--Update the email address for everyone in your table

UPDATE friends
SET email = 'storm@codecademy.com'
WHERE id = 1;

UPDATE friends
SET email = 'trina.montoya@codecademy.com'
WHERE id = 2;

UPDATE friends
SET email = 'jason.teske@codecademy.com'
WHERE id = 3;

--Wait, Storm is fictional… Remove her from friends.

DELETE FROM friends
WHERE id IS 1;

--Great job! Let’s take a look at the result one last time:

SELECT * FROM friends;




















