# Multiple Tables
` JOIN` will combine rows from different tables if the join condition is true.<br />
`LEFT JOIN` will return every row in the left table, and if the join condition is not met, NULL values are used to fill in the columns from the right table.<br />
`Primary key` is a column that serves a unique identifier for the rows in the table.<br />
`Foreign key` is a column that contains the primary key to another table.<br />
`CROSS JOIN` lets us combine all rows of one table with all rows of another table.<br />
`UNION` stacks one dataset on top of another.<br />
`WITH` allows us to define one or more temporary tables that can be used in the final query.<br />

## Combining Tables with SQL
##### Combine `orders` and `customers`, we would type:
    SELECT *
    FROM orders
    JOIN customers
      ON orders.customer_id = customers.customers_id;
      
#### Join orders table and subscriptions table and select all columns.
#### Make sure to join on the subscription_id column.

    SELECT *
    FROM orders
    JOIN subscriptions
      ON orders.subscription_id = subscriptions.subscription_id;
![image](https://user-images.githubusercontent.com/40252813/180629713-f7aa3740-1139-45c7-af51-3d2018430715.png)

#### Join orders table and subscriptions table and select all columns.
#### Make sure to join on the subscription_id column.

    SELECT *
    FROM orders
    JOIN subscriptions
      ON orders.subscription_id = subscriptions.subscription_id;

#### Don’t remove the previous query.
#### Add a second query after your first one that only selects rows from the join where description is equal to ‘Fashion Magazine’.

    SELECT *
    FROM orders
    JOIN subscriptions
      ON orders.subscription_id = subscriptions.subscription_id
    WHERE description = 'Fashion Magazine';
![image](https://user-images.githubusercontent.com/40252813/180630013-fb41d95b-d500-47a7-b90d-791628585309.png)

## Inner Joins
#### Suppose we are working for The Codecademy Times, a newspaper with two types of subscriptions:
- print newspaper
- online articles
#### Some users subscribe to just the newspaper, some subscribe to just the online edition, and some subscribe to both.
#### There is a newspaper table that contains information about the newspaper subscribers.
#### Count the number of subscribers who get a print newspaper using COUNT().

    SELECT COUNT(*)
    FROM newspaper;
    
#### Don’t remove your previous query.
#### There is also an online table that contains information about the online subscribers.
#### Count the number of subscribers who get an online newspaper using COUNT().

    SELECT COUNT(*)
    FROM online;

#### Don’t remove your previous queries.
#### Join newspaper table and online table on their id columns (the unique ID of the subscriber).
#### How many rows are in this table?

    SELECT COUNT(*)
    FROM newspaper
    JOIN online
      ON newspaper.id = online.id;
![image](https://user-images.githubusercontent.com/40252813/180630228-3ae9973b-b5c8-4a06-b75c-dd0c5f758d43.png)

## Left Joins
#### Let’s return to our newspaper and online subscribers.
#### Suppose we want to know how many users subscribe to the print newspaper, but not to the online.
#### Start by performing a left join of newspaper table and online table on their id columns and selecting all columns.

    SELECT *
    FROM newspaper
    LEFT JOIN online
      ON newspaper.id = online.id;
![image](https://user-images.githubusercontent.com/40252813/180630311-c7b31dfa-fc0b-46e1-8106-566f6170f3d4.png)

#### Don’t remove your previous query.
#### In order to find which users do not subscribe to the online edition, we need to add a WHERE clause.
#### Add a second query after your first one that adds the following WHERE clause and condition:
`WHERE online.id IS NULL`
#### This will select rows where there was no corresponding row from the online table.

    SELECT *
    FROM newspaper
    LEFT JOIN online
      ON newspaper.id = online.id
      WHERE online.id IS NULL;
![image](https://user-images.githubusercontent.com/40252813/180630348-4b25b0fa-e488-4aa4-9a92-8b4b1c36a151.png)


#### Primary Key vs Foreign Key
#### Suppose Columbia University has two tables in their database:
- The classes table contains information on the classes that the school offers. Its primary key is id.
- The students table contains information on all students in the school. Its primary key is id. It contains the foreign key class_id, which corresponds to the primary key of classes.
#### Perform an inner join of classes and students using the primary and foreign keys described above, and select all the columns.

    SELECT *
    FROM classes
    JOIN students
      ON classes.id = students.class_id;
![image](https://user-images.githubusercontent.com/40252813/180630873-42ec3bfe-8122-45c8-b7ab-957c97e63415.png)

## Cross Join

#### Eventually, we’ll use a cross join to help us, but first, let’s try a simpler problem.
#### Let’s start by counting the number of customers who were subscribed to the `newspaper` during March.
#### Use `COUNT(*)` to count the number of rows and a `WHERE` clause to restrict to two conditions:
    start_month <= 3
    end_month >= 3
    
#### Don’t remove the previous query.
#### The previous query lets us investigate one month at a time. In order to check across all months, we’re going to need to use a cross join.
#### Our database contains another table called `months` which contains the numbers between 1 and 12.
#### Select all columns from the cross join of `newspaper` and `months`.

    SELECT *
    FROM newspaper
    CROSS JOIN months;
    
#### Don’t remove your previous queries.
#### Create a third query where you add a WHERE statement to your cross join to restrict to two conditions:
- start_month <= month
- end_month >= month
#### This will select all months where a user was subscribed.

    SELECT month, COUNT(*)
    FROM newspaper
    CROSS JOIN months
    WHERE start_month <= month AND end_month >= month
    GROUP BY 1;
    
###### I Limited the Output to 5 rows in order to get a screenshot that will fit
![image](https://user-images.githubusercontent.com/40252813/180631096-78a3de96-5005-44c3-8517-eacfccb37e04.png)

## Union
#### Let’s return to our `newspaper` and `online` subscriptions. We’d like to create one big table with both sets of data.
#### Use `UNION` to stack the `newspaper` table on top of the `online` table.

    SELECT *
    FROM newspaper
    UNION
    SELECT *
    FROM online;
![image](https://user-images.githubusercontent.com/40252813/180631155-ff38f2c1-3313-491c-bda9-f377810ac40f.png)

## With
#### Place the whole query below into a WITH statement, inside parentheses (), and give it name previous_query:
    SELECT customer_id,
       COUNT(subscription_id) AS 'subscriptions'
    FROM orders
    GROUP BY customer_id
#### Join the temporary table previous_query with customers table and select the following columns:
- customers.customer_name
- previous_query.subscriptions
#### Check the answer in the hint below.

    WITH previous_query AS (
       SELECT customer_id,
          COUNT(subscription_id) AS 'subscriptions'
       FROM orders
       GROUP BY customer_id
    )
    SELECT customers.customer_name, 
       previous_query.subscriptions
    FROM previous_query
    JOIN customers
      ON previous_query.customer_id = customers.customer_id;
![image](https://user-images.githubusercontent.com/40252813/180631476-b7239df9-55bb-41c7-9b3a-6df823713040.png)
