    CREATE TABLE friends (
      id INTEGER,
      name TEXT,
      birthday DATE
    );

    INSERT INTO friends (id, name, birthday)
    VALUES (1, 'Ororo Munroe', '1940-05-30');

    SELECT * FROM friends;

    INSERT INTO friends (id, name, birthday)
    VALUES (2, 'Trina Montoya', '1958-12-23');

    INSERT INTO friends (id, name, birthday)
    VALUES (3, 'Jason Teske', '1975-02-02');

    UPDATE friends
    SET name = 'Storm'
    WHERE name = 'Ororo Munroe';

    ALTER TABLE friends
    ADD COLUMN email TEXT;

    UPDATE friends
    SET email = 'storm@codecademy.com'
    WHERE id = 1;

    UPDATE friends
    SET email = 'trina.montoya@codecademy.com'
    WHERE id = 2;

    UPDATE friends
    SET email = 'jason.teske@codecademy.com'
    WHERE id = 3;

    DELETE FROM friends
    WHERE id IS 1;

    SELECT * FROM friends;
    
![image](https://user-images.githubusercontent.com/40252813/180620006-7037d5db-70e3-4f88-8f52-133bd71f20ac.png)

    
