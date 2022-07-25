# The Metropolitan Museum of Art
Start by getting a feel for the met table:<br />

     SELECT *
     FROM met
     LIMIT 10;
![image](https://user-images.githubusercontent.com/40252813/180700755-508c4971-c7ff-4e35-8563-5dc7f4a93b52.png)

How many pieces are in the 'American Decorative Arts' collection? `3948` <br />

![image](https://user-images.githubusercontent.com/40252813/180701039-f0a64616-1d56-41a1-b964-e17530086c14.png)

Count the number of pieces where the category includes ‘celery’.<br />

    SELECT DISTINCT category, COUNT(*) AS 'Count'
    FROM met
    WHERE category LIKE '%celery%';

![image](https://user-images.githubusercontent.com/40252813/180701838-c52cf426-a993-4533-9298-5d6e9fcc2216.png)

Find the `title` and `medium` of the oldest pieces(s) in the collect<br />

    SELECT title AS 'Title', 
      medium AS 'Medium', 
      date AS 'Oldest'
    FROM met
    GROUP BY 1
    ORDER BY 3 ASC;

![image](https://user-images.githubusercontent.com/40252813/180703019-d262dce0-99db-4286-88f7-6b2a91793f1b.png)

Not every American decoration is from the Americas… where are they are coming from?<br />
Find the top 10 countries with the most pieces in the collection. <br />

    SELECT country AS 'Country', COUNT(country) AS 'Count'
    FROM met
    GROUP BY 1
    ORDER BY 2 DESC
    LIMIT 10;
![image](https://user-images.githubusercontent.com/40252813/180704111-1ad737b9-e6d8-4965-93a0-a71b125dd5a3.png)

There are all kinds of American decorative art in the Met’s collection.<br />
Find the categories HAVING more than 100 pieces.<br />

    SELECT category AS 'Category', COUNT(*) AS 'Count'
    FROM met
    WHERE category IS NOT NULL
    GROUP BY 1
    HAVING COUNT(*) > 100;
![image](https://user-images.githubusercontent.com/40252813/180704708-131cc655-5253-410d-8a8d-bf155cbd0ef2.png)

Lastly, let’s look at some bling! <br />
Count the number of pieces where the medium contains ‘gold’ or ‘silver’. <br />
And sort in descending order.<br />

    SELECT CASE
        WHEN medium LIKE '%gold%' THEN 'Gold'
        WHEN medium like '%silver%' THEN 'Silver'
        ELSE NULL
      END AS 'Material',
      COUNT(*) AS 'Count'
    FROM met
    WHERE Material IS NOT NULL
    GROUP BY 1
    ORDER BY 2 DESC;
![image](https://user-images.githubusercontent.com/40252813/180705727-90471288-dcaa-4936-ad6d-bf9a020470db.png)
