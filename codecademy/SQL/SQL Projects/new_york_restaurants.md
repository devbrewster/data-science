# New York Restaurants
#### Start by getting a feel for the nomnom table:

    SELECT * 
    FROM nomnom;
    
#### What are the column names?
![image](https://user-images.githubusercontent.com/40252813/180623237-e19b03c6-bccd-43c9-b8c3-8cacd0ae9474.png)

#### What are the distinct `neighborhood`s?

    SELECT DISTINCT neighborhood
    FROM nomnom;
![image](https://user-images.githubusercontent.com/40252813/180623348-b9b91854-2977-46a5-8f17-24b7acbac4ce.png)
    
#### What are the distinct `cuisine` types?

    SELECT DISTINCT cuisine
    FROM nomnom;
![image](https://user-images.githubusercontent.com/40252813/180623416-607aeaa3-e40c-4471-a9af-c68a7aba4cd9.png)

#### Suppose we would like some `Chinese` takeout. What are our options?

    SELECT *
    FROM nomnom
    WHERE cuisine = 'Chinese';
![image](https://user-images.githubusercontent.com/40252813/180623502-ebfc169d-cbff-436a-b84d-74197e31a19d.png)

#### Return all the restaurants with `review`s of 4 and above.

    SELECT *
    FROM nomnom
    WHERE review >= 4
![image](https://user-images.githubusercontent.com/40252813/180624288-4bc51f0d-81e2-462d-bf70-5809c007e4c6.png)

#### Suppose Abbi and IIana want to have a fancy dinner date. Return all the restaurants that are `Italian` and `$$$`.

    SELECT *
    FROM nomnom
    WHERE cuisine = 'Italian' AND price LIKE '%$$$%';
![image](https://user-images.githubusercontent.com/40252813/180624419-57c04453-03c1-4302-a46f-94af5c447770.png)

#### Your coworker Trey can't remember the exact name of a restaurant he went to but he knows it contains the word `meatball` in it.

    SELECT *
    FROM nomnom
    WHERE name LIKE '%meatball%';
![image](https://user-images.githubusercontent.com/40252813/180624511-bf7d61bb-0a9d-476f-b990-0e40365a704c.png)

#### Let's order delivery to the house! Find all the close by spots in `Midtown`, `Downtown`, or `Chinatown`.

    SELECT *
    FROM nomnom
    WHERE neighborhood = 'Midtown' 
      OR neighborhood = 'Downtown' 
      OR neighborhood = 'Chinatown'
![image](https://user-images.githubusercontent.com/40252813/180624612-ee9c32d8-40aa-4e7e-b6d4-9fd97eb05630.png)

#### Find all the `health` grade pending restaurants (empty values).

    SELECT *
    FROM nomnom
    WHERE health IS NULL;
![image](https://user-images.githubusercontent.com/40252813/180624894-2e200442-94e6-4634-bb8a-82cc4eff0a43.png)

#### Create a Top 10 Restaurants Ranking based on `review`s.

    SELECT *
    FROM nomnom
    ORDER BY review DESC
    LIMIT 10;
![image](https://user-images.githubusercontent.com/40252813/180624940-e11e6e23-87f1-4ac3-b100-921bd2eb1bb9.png)

#### Use a `CASE` statement to change the rating system to:\
   - `review > 4.5` is Extraordinary
   - `review > 4` is Excellent
   - `review > 3` is Good
   - `review > 2` is Fair
   - Everything else is Poor

    SELECT name AS 'Name',
      CASE
        WHEN review > 4.5 THEN 'Extraordinary'
        WHEN review > 4 THEN 'Excellent'
        WHEN review > 3 THEN 'Good'
        WHEN review > 2 THEN 'Fair'
        ELSE 'Poor'
      END AS 'Review'
    FROM nomnom;
![image](https://user-images.githubusercontent.com/40252813/180625368-906c466d-24cf-464e-b806-cd219edf56ad.png)
