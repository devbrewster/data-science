# RPA Customer Segmentation
    SELECT *
    FROM users
    LIMIT 20;

What are the column names?<br />
`id`, `email`, `campaign`, `test`, `created_at`, `birthday`
![image](https://user-images.githubusercontent.com/40252813/180669952-cf0d3838-f599-46a3-9054-eceb49572dad.png)
 

Find the email addresses and birthdays of users whose birthday is between 1980-01-01 and 1989-12-31.<br />

    SELECT email, birthday
    FROM users
    WHERE birthday BETWEEN '1980-01-01' AND '1989-12-31'
    ORDER BY birthday ASC;
![image](https://user-images.githubusercontent.com/40252813/180670282-0a736799-451a-4e6d-bc2a-a00adeb40235.png)

Find the emails and creation date of users whose created_at date matches this condition.<br />

    SELECT email, created_at
    FROM users
    WHERE created_at < '2017-05-01'
    ORDER BY created_at DESC;
![image](https://user-images.githubusercontent.com/40252813/180670347-40e8e6cc-4b94-4089-b0c3-da63b80fc47d.png)

Find the emails of the users who received the ‘bears’ test.<br />

    SELECT email
    FROM users
    WHERE test = 'bears';
![image](https://user-images.githubusercontent.com/40252813/180670484-e4094244-4d46-473f-aeb1-b69201b6243b.png)

Find all the emails of all users who received a campaign on website BBB.<br />

    SELECT email
    FROM users
    WHERE campaign LIKE 'BBB-%';
![image](https://user-images.githubusercontent.com/40252813/180670657-18bbbb7a-3c63-497c-be38-3766dc9d93e0.png)

Find all the emails of all users who received ad copy 2 in their campaign.<br />

    SELECT email
    FROM users
    WHERE campaign LIKE '%-2';
![image](https://user-images.githubusercontent.com/40252813/180670685-0b55d39d-cc0c-42e2-823a-3a24380b5f27.png)

Find the emails for all users who received both a campaign and a test. <br />
These users will have non-empty entries in the <br />
campaign and test columns.<br />

    SELECT email
    FROM users
    WHERE campaign IS NOT NULL 
     AND test IS NOT NULL;
![image](https://user-images.githubusercontent.com/40252813/180670759-5488616f-1bd6-4e06-91d5-7bd00a1e16f0.png)

Challenge<br />
One of the members of the marketing team had an idea of calculating<br />
how old users were when they signed up.<br />

    SELECT email, created_at-birthday AS "Age at Sign-up"
    FROM users;
    
![image](https://user-images.githubusercontent.com/40252813/180671108-e3bc4185-0d02-40f9-8748-b8555f589744.png)
