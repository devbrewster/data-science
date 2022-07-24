# Aggregate Functions
- `COUNT()`: count the number of rows
- `SUM()`: the sum of the values in a column
- `MAX()/MIN()`: the largest/smallest value
- `AVG()`: the average of the values in a column
- `ROUND()`: round the values in the column

## Introduction
What are the column names?<br />

![image](https://user-images.githubusercontent.com/40252813/180625745-0461e032-e81a-4fcd-ae39-3c3debadac6f.png)

## Count
`COUNT()` function that takes the name of a column as an agrument and counts the number of non-empty values in that column.<br />

#### Let's count how many apps are in the table.

    SELECT COUNT(*)
    FROM fake_apps;
![image](https://user-images.githubusercontent.com/40252813/180625695-b5ab1c80-ee78-4752-97e8-e54a165f4a51.png)

#### Add a `WHERE` clause in the previous query to count how many <em>free</em>

    SELECT COUNT(*)
    FROM fake_apps
    WHERE price <= 0.0;
![image](https://user-images.githubusercontent.com/40252813/180625852-6f50f029-1602-42fb-bfee-37e9f5327585.png)

## SUM
`SUM()` function that takes the name of a column as an argument and returns the sum of all the values in that column
#### Let's find out the answer!

    SELECT SUM(downloads)
    FROM fake_apps;
![image](https://user-images.githubusercontent.com/40252813/180625960-368c86c7-5669-4673-8a5e-b21a542775b0.png)

## Max / Min
`MAX()` and `MIN()` functions return the highest and lowest values in a column, respectively.

#### What is the least number of times an app has been downloaded?

    SELECT MIN(downloads)
    FROM fake_apps;
![image](https://user-images.githubusercontent.com/40252813/180626016-674a533f-73aa-4b1e-9e8e-73b4c102de9a.png)

#### Delete the previous query. Write a new query that returns the price of the most expensive app.

    SELECT max(price)
    FROM fake_apps;
![image](https://user-images.githubusercontent.com/40252813/180626051-4b9e3208-aa98-43b8-9960-16fca009dd51.png)

## Average
`AVG()` function to quickly calculate the average value of a particular column.

#### Calculate the average number of downloads for all the apps in the table.

    SELECT AVG(downloads)
    FROM fake_apps;
![image](https://user-images.githubusercontent.com/40252813/180626119-7ba3e876-db51-422b-be70-613baa45bf3e.png)

#### Write a new query that calculates the average price for all the apps in the table.

    SELECT AVG(price)
    FROM fake_apps;
![image](https://user-images.githubusercontent.com/40252813/180626135-4c441252-e523-4be1-af0b-79b29d431ca7.png)

## Round
`ROUND()` function takes two arguments inside the parenthesis: (column_name, integer)

#### Let's return the `name` column and a rounded `price` column.

    SELECT name, ROUND(price, 0)
    FROM fake_apps;
![image](https://user-images.githubusercontent.com/40252813/180626191-342ede86-bf76-4ed3-a7ca-efc524780d83.png)

#### In the last exercise, we were able to get the average price of an app ($2.02365) using this query:
    SELECT ROUND(AVG(price), 2)
    FROM fake_apps;
![image](https://user-images.githubusercontent.com/40252813/180626339-ca3934c0-3af4-4008-9e97-84654ad24930.png)

## Group By I

    SELECT price, COUNT(*) 
    FROM fake_apps
    GROUP BY price;
![image](https://user-images.githubusercontent.com/40252813/180626383-4c5eae03-2f17-4cc2-9d09-47c0ee504377.png)

#### In the previous query, add a WHERE clause to count the total number of apps that have been downloaded more than 20,000 times, at each price.
    SELECT price, COUNT(*) 
    FROM fake_apps
    WHERE downloads >= 20000
    GROUP BY price;
![image](https://user-images.githubusercontent.com/40252813/180626448-994b6a14-122f-41a0-8e32-4b81b0b2f959.png)

#### Write a new query that calculates the total number of downloads for each category. Select `category` and `SUM(downloads)`.
    SELECT category, SUM(downloads)
    FROM fake_apps
    GROUP BY category;
![image](https://user-images.githubusercontent.com/40252813/180626499-58e0102c-824d-4260-977b-77f282b69455.png)

## Group By II

    SELECT category, 
       price,
       AVG(downloads)
    FROM fake_apps
    GROUP BY category, price;
![image](https://user-images.githubusercontent.com/40252813/180626558-0f94e283-f129-41d3-b5e2-c3f09f9318a3.png)

## Having

#### It returns the average downloads (rounded) and the number of apps – at each price point.
#### However, certain price points don’t have very many apps, so their average downloads are less meaningful.
#### Add a HAVING clause to restrict the query to price points that have more than 10 apps.

    SELECT price, 
       ROUND(AVG(downloads)),
       COUNT(*)
    FROM fake_apps
    GROUP BY price
    HAVING COUNT(price) > 10;
