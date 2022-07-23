# **Queries**
Queries allow us to communicate with the database by asking questions and returning a result set with data relevant to the question.<br />
We should get acquainted with the movies table<br />

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
    

 
