# Aggregate Functions Challenge
# Code Challenge 1
Use `COUNT()` and a `LIKE` operator to determine the number of users that have an email ending in ‘.com’.<br />

    SELECT COUNT(email)
    FROM users
    WHERE email LIKE '%.com';
![image](https://user-images.githubusercontent.com/40252813/180693712-db2f9538-9822-430d-b5c3-840ce26c224a.png)

# Code Challenge 2

What are the most popular first names on Codeflix?<br />
Use `COUNT()`, `GROUP BY`, and `ORDER BY` to create a list of first names and occurrences within the `users` table.<br />
Order the data so that the most popular names are displayed first.<br />

    SELECT first_name,
      COUNT(*)
    FROM users
    GROUP BY first_name
    ORDER BY COUNT(*) DESC;
![image](https://user-images.githubusercontent.com/40252813/180694491-dbc86f75-55e9-4461-991f-24e200459d49.png)

# Code Challenge 3
The UX Research team wants to see a distribution of watch durations. They want the result to contain:<br />
  - `duration`, which is the watch event duration, rounded to the closest minute<br />
  - `count`, the number of watch events falling into this “bucket”<br />
 
Use `COUNT()`, `GROUP BY`, and `ORDER BY` to create this result and order this data by increasing `duration`.<br />
     
     SELECT ROUND(watch_duration_in_minutes) AS 'duration', 
      COUNT(watch_date) AS 'count'
     FROM watch_history
     GROUP BY 1
     ORDER BY 1;
![image](https://user-images.githubusercontent.com/40252813/180695384-ae24b114-c9c7-4b08-81c3-097d955ef3cf.png)
   
# Code Challenge 4
Find all the users that have successfully made a payment to Codeflix and find their total amount paid.<br />
Sort them by their total payments (from high to low).<br />
Use `SUM()`, `WHERE`, `GROUP BY`, and `ORDER BY`.<br />

    SELECT user_id, SUM(amount)
    FROM payments
    WHERE status = 'paid'
    GROUP BY 1
    ORDER BY 2 DESC;
![image](https://user-images.githubusercontent.com/40252813/180696166-b205f88c-2f15-48ff-9906-999c89d29083.png)

# Code Challenge 5
Generate a table of user ids and total watch duration for users who watched more than 400 minutes of content.<br />
Use `SUM()`, `GROUP BY`, and `HAVING` to achieve this.<br />

    SELECT user_id, SUM(watch_duration_in_minutes)
    FROM watch_history
    GROUP BY 1
    HAVING SUM(watch_duration_in_minutes) > 400;

![image](https://user-images.githubusercontent.com/40252813/180696704-a0cff31b-45e2-4ae0-9444-d110e93766ce.png)

# Code Challenge 6
To the nearest minute, how many minutes of content were streamed on Codeflix?<br />

    SELECT ROUND(SUM(watch_duration_in_minutes), 0)
    FROM watch_history;
![image](https://user-images.githubusercontent.com/40252813/180697172-10737b18-591d-428e-957a-03cccc3a13da.png)

# Code Challenge 7
Which days in this period did Codeflix collect the most money?<br />
Your result should have two columns, `pay_date` and total `amount`, sorted by the latter descending.<br />
This should only include successful payments (`status = 'paid'`).<br />
Use `SUM()`, `GROUP BY`, and `ORDER BY`.<br />

    SELECT pay_date, SUM(amount) AS 'amount'
    FROM payments
    WHERE status = 'paid'
    GROUP BY 1
    ORDER by 2 DESC;
![image](https://user-images.githubusercontent.com/40252813/180697520-05492002-54c8-46f3-a38b-247a0a624506.png)

# Code Challenge 8
When users successfully pay Codeflix (status = 'paid'), what is the average payment amount?<br />

    SELECT AVG(amount)
    FROM payments
    WHERE status = 'paid';
![image](https://user-images.githubusercontent.com/40252813/180697712-79a79c18-20d1-49fc-94cb-009fa7804fb1.png)

# Code Challenge 9
Of all the events in the watch_history table, what is the duration of the longest individual watch event? What is the duration of the shortest?<br />
Use one query and rename the results to max and min.<br />

    SELECT MAX(watch_duration_in_minutes) AS 'max', 
      MIN(watch_duration_in_minutes) AS 'min'
    FROM watch_history;
    









