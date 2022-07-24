# **Queries**
Queries allow us to communicate with the database by asking questions and returning a result set with data relevant to the question.<br />
We should get acquainted with the movies table<br />
| Keywords  | Description   |
| ----- | ----- |
| `SELECT` | is the clause we use every time we want to query information from a database. |
| `AS` | renames a column or table. |
| `DISTINCT` | return unique values. |
| `WHERE` | is a popular command that lets you filter the results of the query based on conditions that you specify. |
| `LIKE` | and BETWEEN are special operators. |
| `AND` and `OR` | combines multiple conditions. |
| `ORDER BY` | sorts the result. |
| `LIMIT` | specifies the maximum number of rows that the query will return. |
| `CASE` | creates different outputs. |



    SELECT * FROM movies;

What are the column names?
`id, name, genre, year, imdb_rating`

![image](https://user-images.githubusercontent.com/40252813/180620952-86f8a2ee-1def-4f33-8ae5-bcd2eb6e5adc.png)

## **Select**
Returns information about the `name` and `genre` columns of the table `movies`.<br />

    SELECT name, genre 
    FROM movies;
    
Edit your query so that it returns the name, genre, and year columns of the table.<br />

    SELECT name, genre, year
    FROM movies;
    
 ## AS
 `AS` keyword in SQL that allows you to rename a column or table using an alias.<br />
 
    SELECT imdb_rating AS 'IMDb'
    FROM movies;

## DISTINCT
`DISTINCT` is used to return unique values in the output. It filters out all duplicate values in the specified column(s).<br />
    
    SELECT DISTINCT year
    FROM movies;
 
## WHERE
`WHERE` clause filters the result set to only include rows where the following condition is true.<br />

-    `=` equal to
-    `!=` not equal to
-    `>` greater than
-    `<` less than
-    `>=` greater than or equal to
-    `<=` less than or equal to


    SELECT *
    FROM movies
    WHERE year > 2014;
    
## LIKE I
`LIKE` is a special operator used with the `WHERE` clause to search for a specific pattern in a column. <br />

    SELECT *
    FROM movies
    WHERE name LIKE 'Se_en';

## LIKE II
`%` is a wildcard character that matches zero or more missing letters in the pattern. For example:<br />

    SELECT *
    FROM movies
    WHERE name LIKE 'The %';

## IS NULL
`NULL` values with comparison operators, such as `=` and `!=`.<br />

- `IS NULL`
- `IS NOT NULL`

    SELECT name
    FROM movies
    WHERE imdb_rating IS NULL;

## BETWEEN
`BETWEEN` operator is used in a `WHERE` clause to filter the result set within a certain range.<br />

    SELECT *
    FROM movies
    WHERE year BETWEEN 1970 and 1979;
    
## AND
`AND` sometimes we want to combine multiple conditions in a `WHERE` clause to make the result set more specific and useful. <br />

    SELECT *
    FROM movies
    WHERE year < 1985 AND genre = 'horror';
    
## OR
`OR` operator can also be used to combine multiple conditions in `WHERE`, but there is a fundamental difference: <br />

    SELECT *
    FROM movies
    WHERE genre = 'romance' OR genre = 'comedy';
    
## ORDER BY
`ORDER BY` sort the results, either alphabetically or numerically. <br />

- `DESC` is a keyword used in `ORDER BY` to sort the results in descending order (high to low or Z-A).<br />
- `ASC` is a keyword used in `ORDER BY` to sort the results in ascending order (low to high or A-Z).<br />

    SELECT name, year, imdb_rating
    FROM movies
    ORDER BY imdb_rating DESC;

## LIMIT
`LIMIT` is a clause that lets you specify the maximum number of rows the result set will have.<br />

    SELECT *
    FROM movies
    ORDER BY imdb_rating DESC
    LIMIT 3;

## CASE
`CASE` statement allows us to create different outputs (usually in the SELECT statement)<br />
- Each `WHEN` tests a condition and the following `THEN` gives us the string if the condition is true.<br />
- The `ELSE` gives us the string if all the above conditions are false.<br /> 
- The `CASE` statement must end with `END`. <br />

      SELECT name,
        CASE
          WHEN genre = 'romance' THEN 'Chill'
          WHEN genre = 'comedy' THEN 'Chill'
          ELSE 'Intense'
        END AS 'Mood'
      FROM movies;

