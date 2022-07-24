## Queries Challenge
# Baby Names Introduction
# Code Challenge 1
Find the number of girls who were named <em>Lillian</em> for the full span of time of the database.<br />
Select only the `year` and `number` columns.<br />

    SELECT year, number 
    FROM babies
    WHERE name = "Lillian";
![image](https://user-images.githubusercontent.com/40252813/180666992-89ce8801-9f84-4309-82b6-3d9115e11efa.png)

# Code Challenge 2
Find 20 distinct names that start with ‘S’.<br />
Select only the `name` column. <br />

    SELECT DISTINCT name
    FROM babies
    WHERE name LIKE 'S%'
    LIMIT 20;
![image](https://user-images.githubusercontent.com/40252813/180667159-24d91f5a-f17d-4a43-b1ca-faa3d63170ba.png)

# Code Challenge 3
What are the top 10 names in 1880? <br />
Select `name`, `gender`, and `number` columns

    SELECT name, gender, number
    FROM babies
    WHERE year IS '1880'
    ORDER BY number DESC
    LIMIT 10;
![image](https://user-images.githubusercontent.com/40252813/180667324-6beaf0ef-4ab7-46f7-afcb-67c7ce9430a6.png)

# Restaurants Introduction
# Code Challenge 4
Suppose your friend Jaime wants to go out to Japanese, but you’re on a budget.<br />
Return all the restaurants that are `Japanese` and `$$`.<br />
Select all the columns.<br />

    SELECT *
    FROM nomnom
    WHERE cuisine = 'Japanese' AND price = '$$';
![image](https://user-images.githubusercontent.com/40252813/180667467-747fce9d-e095-4489-a26b-464d9c4ae9d8.png)

# Code Challenge 5
Your roomate Bevers can't remember the exact name of a restaurant he went to but knows it contains the word 'noodle' in it. <br />
Can you find it for him using a query? <br />
Select all columns. <br />

     SELECT *
     FROM nomnom
     WHERE name LIKE "%noodle%";
![image](https://user-images.githubusercontent.com/40252813/180667567-ffa244ba-2ac7-416e-aa70-fda874ebd177.png)

# Code Challenge 6
Some of the restaurants have not been inspected yet or are currently appealing their health grade score.<br />
Find the restaurants that have empty health values.<br />
Select all the columns.<br />

    SELECT * 
    FROM nomnom 
    WHERE health IS NULL;
![image](https://user-images.githubusercontent.com/40252813/180667616-f185960b-a68e-4e11-8341-fa37fafd8912.png)

# News Headlines Introduction
# Code Challenge 7
Order the table by `title` (from A-Z).<br />
Select only the `title` and `publisher` columns. <br />

    SELECT title, publisher
    FROM news
    ORDER BY title ASC;
![image](https://user-images.githubusercontent.com/40252813/180667688-ddbbc5fd-c572-4e9c-9a3f-54064f0cd3da.png)

# Code Challenge 8
Which article names have the word `'bitcoin'` in it? <br />
Select all the columns.<br />

    SELECT *
    FROM news
    WHERE title LIKE '%bitcoin%';
![image](https://user-images.githubusercontent.com/40252813/180667737-173a5ad2-eb58-4b03-ac9a-7fcd9947ade8.png)

# Code Challenge 9
The category column contains the article category:<br />
-   'b' stands for Business<br />
-   't' stands for Technology<br />
What are the 20 business articles published most recently?<br />

Select all the columns.<br />

    SELECT *
    FROM news
    WHERE category = 'b'
    ORDER BY timestamp DESC
    LIMIT 20;
![image](https://user-images.githubusercontent.com/40252813/180668031-3565fc18-3bbc-4630-ab8b-8851df7fe9db.png)















