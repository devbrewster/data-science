# Lyft Trip Data

#### Let’s examine the three tables.

    SELECT * FROM trips;
    SELECT * FROM riders;
    SELECT * FROM cars;
![image](https://user-images.githubusercontent.com/40252813/180631581-c8a81dc4-2a17-4e08-ae06-1131395a9e75.png)

#### What’s the primary key of trips? `id`
#### What’s the primary key of riders? `id`
#### What’s the primary key of cars? `id`


#### Try out a simple cross join between riders and cars.
#### Is the result useful? `NO - The information from the below query search is not useful.`

    SELECT *
    FROM riders
    CROSS JOIN cars;
![image](https://user-images.githubusercontent.com/40252813/180631691-88a7cc60-f53a-4dc5-8318-e53f558beaaf.png)

#### Suppose we want to create a Trip Log with the trips and its users.
#### Find the columns to join between `trips` and `riders` and combine the two tables using a `LEFT JOIN`.
#### Let `trips` be the left table.

    SELECT *
    FROM trips
    LEFT JOIN riders 
      ON trips.rider_id = riders.id;
![image](https://user-images.githubusercontent.com/40252813/180631927-a53b1cff-2b74-4651-b3da-1db598862553.png)

#### Suppose we want to create a link between the `trips` and the `cars` used during those trips.
#### Find the columns to join on and combine the `trips` and `cars` table using an `INNER JOIN`.

    SELECT *
    FROM trips
    JOIN cars
      ON trips.car_id = cars.id;
![image](https://user-images.githubusercontent.com/40252813/180632057-07785f71-da01-4385-bbc9-bdd309660627.png)

#### The new riders data are in! There are three new users this month.
#### Stack the riders table on top of the new table named riders2.

    SELECT *
    FROM riders
    UNION
    SELECT *
    FROM riders2;
![image](https://user-images.githubusercontent.com/40252813/180632147-10b8cfcc-6b06-41b5-a91e-6b66d6b4f937.png)

#### What is the average cost for a trip?

SELECT ROUND(AVG(cost), 2) AS 'Average Cost'
FROM trips;
![image](https://user-images.githubusercontent.com/40252813/180632208-adcf5063-c285-4f48-b608-142e38d3532a.png)

#### Lyft is looking to do an email campaign for all the irregular users.
#### Find all the riders who have used Lyft less than 500 times!
    SELECT *
    FROM riders
    WHERE total_trips < 500;
![image](https://user-images.githubusercontent.com/40252813/180632252-d12fd81f-6abd-4761-ab41-8dda40df1e72.png)

#### Calculate the number of cars that are `active`.

    SELECT COUNT(*)
    FROM cars
    WHERE status = 'active';
![image](https://user-images.githubusercontent.com/40252813/180632285-83bc0185-cd6f-4bdb-9344-a45261a89ed2.png)

#### It’s safety recall time for cars that have been on the road for a while.
#### Write a query that finds the two cars that have the highest trips_completed.

    SELECT *
    FROM cars
    ORDER BY trips_completed DESC
    LIMIT 2;
![image](https://user-images.githubusercontent.com/40252813/180632500-c953e159-943c-47c5-b725-ff491107f1d3.png)
