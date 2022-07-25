# Cryptocurrency Exchange

Let’s start by checking out the whole transactions table:<br />

    SELECT *
    FROM transactions;

What are the column names?<br />

![image](https://user-images.githubusercontent.com/40252813/180706090-fc3ec094-1095-42bc-9087-43abbff27974.png)

The money_in column records the amount (in USD) the user bought.<br />
What is the total money_in in the table?<br />

    SELECT SUM(money_in)
    FROM transactions;

![image](https://user-images.githubusercontent.com/40252813/180706457-bad6e181-1a02-42c5-83e5-58f28f9e220c.png)


The money_out column records the amount (in USD) the user sold.<br />
What is the total money_out in the table?<br />

    SELECT SUM(money_out)
    FROM transactions;

![image](https://user-images.githubusercontent.com/40252813/180706513-534c64e8-bf1a-4aac-bff7-a4663da90e8c.png)



It was reported that Bitcoin dominates Fiddy Cent’s exchange. Let’s see if it is true within these dates by answering two questions:<br />
-    How many money_in transactions are in this table?<br />
![image](https://user-images.githubusercontent.com/40252813/180706873-d4440c78-a4b9-42d3-b1cd-f2234aece28b.png)
-    How many money_in transactions are in this table where ‘BIT’ is the currency?<br />
![image](https://user-images.githubusercontent.com/40252813/180707038-789f5130-f189-4383-988f-e8e0e9b715db.png)


What was the largest transaction in this whole table?<br />
![image](https://user-images.githubusercontent.com/40252813/180708480-47f5ff7f-780c-439f-bf95-ce7442141b89.png)

Was it money_in or money_out?<br />
`Money_out` $15,047.00<br />

What is the average money_in in the table for the currency Ethereum (‘ETH’)?<br />

    SELECT ROUND(AVG(money_in), 2) AS 'AVG ETH TRANSACTION'
    FROM transactions
    WHERE currency = 'ETH';
![image](https://user-images.githubusercontent.com/40252813/180708835-acdd7433-e651-400c-91b1-64c3fa3cdff2.png)

Let’s build a ledger for the different dates.<br />
Select `date`, average `money_in`, and average `money_out` from the table.<br />
And group everything by date.<br />

    SELECT date AS 'DATE', 
      ROUND(AVG(money_in)) AS 'Money In',
      ROUND(AVG(money_out)) AS 'Money Out'
    FROM transactions
    GROUP BY 1;


To make the previous query easier to read, round the averages to 2 decimal places. <br />
Give the column aliases using AS for readability.<br />


