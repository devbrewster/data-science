-- Returns the first 10 rows from orders
SELECT *
FROM orders
LIMIT 10;

-- Returns the order_date removing any duplicates and descending from highest to lowest
SELECT DISTINCT order_date
FROM orders
ORDER BY order_date DESC;

-- Returns the first 20 rows from special_instructions since there is missing values we will need to clean this data up to exclude the NULL values
SELECT special_instructions
FROM orders
LIMIT 20;

-- Returns the same results as above but without the null values giving us a cleaner output
SELECT DISTINCT special_instructions
FROM orders
WHERE special_instructions IS NOT NULL
LIMIT 20;

-- Returns the special instructions in alphabetical order (A-Z).
SELECT DISTINCT special_instructions
FROM orders
WHERE special_instructions IS NOT NULL
ORDER BY 1 ASC;

-- Returns special instructions that have the word ‘sauce’.
SELECT special_instructions
FROM orders
WHERE special_instructions LIKE '%sauce%'
ORDER BY 1 ASC;


-- Returns special instructions that have the word ‘door’
SELECT special_instructions
FROM orders
WHERE special_instructions LIKE '%door%'
ORDER BY 1 ASC;


-- Returns special instructions that have the word ‘box’
SELECT DISTINCT special_instructions
FROM orders
WHERE special_instructions LIKE '%box%'
ORDER BY 1 ASC;

-- Change special_instructions AS 'NOTES' and id AS '#'

SELECT DISTINCT special_instructions AS 'NOTES', id AS '#'
FROM orders
WHERE special_instructions LIKE '%box%'
ORDER BY 1 ASC;


-- Challenge
-- They have asked you to query the customer who made the phrase. <br />
-- Return the item_name restaurant_id, and user_id for the person created the phrase.<br />

SELECT DISTINCT item_name, restaurant_id, user_id
FROM orders
WHERE special_instructions = 'super hungover. let yourself in pass the fridge turn left and double doors my bedroom. im in my pajamas watching james bond 1love';