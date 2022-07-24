## Getting started, take a look at the startups table:

    SELECT *
    FROM startups;

#### How many columns are there?

`10` 

![image](https://user-images.githubusercontent.com/40252813/180626854-840c1151-8954-48ae-9682-640cd796c2ae.png)

#### Calculate the total number of companies in the table.

    SELECT COUNT(name)
    FROM startups;

![image](https://user-images.githubusercontent.com/40252813/180626914-cc338ea2-4ea0-47b1-a653-9ec83a6c12c1.png)

#### We want to know the total value of all companies in this table. Calculate this by getting the `SUM()` of the `valuation` column.

    SELECT SUM(valuation)
    FROM startups;
![image](https://user-images.githubusercontent.com/40252813/180626974-e7c93e38-a1da-461c-a341-b18780bd9257.png)

#### What is the highest amount raised by a startup? Return the maximum amount of money `raised`.

    SELECT MAX(raised)
    FROM startups;
![image](https://user-images.githubusercontent.com/40252813/180627029-8ac83ac8-a395-47a3-b20c-f4f3b011d1d3.png)

#### Edit the query so that is returns the maximum amount of money `raised`, during 'Seed' stage.

    SELECT MAX(raised)
    FROM startups
    WHERE stage = 'Seed';
![image](https://user-images.githubusercontent.com/40252813/180627112-2f91f83d-0055-4e28-8a3d-a0f561d0c225.png)

#### In what year was the oldest company on the list founded?

    SELECT MIN(founded)
    FROM startups;
![image](https://user-images.githubusercontent.com/40252813/180627157-026c7157-fcd2-47e8-ac74-6de8aa6aafc3.png)

## Let's find out the valuations among different sectors:
#### Return the average valuation.

    SELECT AVG(valuation)
    FROM startups;
![image](https://user-images.githubusercontent.com/40252813/180627295-c8c6a7f2-34c1-4d4f-98b6-d085111ae90a.png)

#### Return the average `valuation`, in each `category`.

    SELECT category, AVG(valuation)
    FROM startups
    GROUP BY category;
![image](https://user-images.githubusercontent.com/40252813/180627265-16c66abd-9163-4946-a19c-9c2870536dcd.png)

#### Return the average `valuation`, in each `category`. Round the averages to two decimal places.

    SELECT category, ROUND(AVG(valuation), 2)
    FROM startups
    GROUP BY category;
![image](https://user-images.githubusercontent.com/40252813/180627334-ef93f18b-e2cf-45a3-8a37-4f97f82ad86d.png)

#### Return the average `valuation`, in each `category`. Round the averages to two decimal places. Lastly, order the list from highest averages to lowest.

    SELECT category, ROUND(AVG(valuation), 2)
    FROM startups
    GROUP BY 1
    ORDER BY 2 DESC;
![image](https://user-images.githubusercontent.com/40252813/180627472-1083b39b-660c-4ff0-859f-c0f9904d9556.png)

#### First, return the name of each `category` with the total number of companies that belong to it.

    SELECT category, COUNT(*)
    FROM startups
    GROUP BY category;
![image](https://user-images.githubusercontent.com/40252813/180627550-93c3e41b-203e-4748-8724-e135ab601ce3.png)

#### Next, filter the result to only include categories that have more than three companies in them. What are the most competitive markets?

    SELECT category, COUNT(*)
    FROM startups
    GROUP BY category
    HAVING COUNT(*) > 3
    ORDER BY 2 DESC;
![image](https://user-images.githubusercontent.com/40252813/180627587-f78b3e53-dad9-47b0-8976-3b4d53765eea.png)

#### What is the average size of a startup in each location?

    SELECT location, AVG(employees)
    FROM startups
    GROUP BY location;
    
#### What is the average size of a startup in each location, with average sizes above 500?

    SELECT location, AVG(employees)
    FROM startups
    GROUP BY location
    HAVING AVG(employees) > 500
    ORDER BY 2 DESC;
![image](https://user-images.githubusercontent.com/40252813/180627661-ea8d0588-b4e8-4d8e-a77b-59f33fec880d.png)
