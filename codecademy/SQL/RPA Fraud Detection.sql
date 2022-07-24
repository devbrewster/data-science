-- RPA Fraud Detection
-- 1 

SELECT *
FROM transaction_data
LIMIT 10;

-- What are the column names?
-- id, full_name, email, zip, ip_address

-- 2

SELECT full_name, email
FROM transaction_data
WHERE zip = 20252;

-- Find the full_names and emails
-- of the transactions listing 20252 as the zip code.
/*
  full_name 	              email                              zip
  Grantham Keat 	      gkeat2h@ucla.edu                  20252
  Francesca Braban 	      fbraban4z@free.fr                 20252
  Winnah Spiring 	      wspiring63@huffingtonpost.com     20252
  Jenn Matzel 	              jmatzel70@cmu.edu                 20252
  Chance Pinare 	      cpinare7p@examiner.com            20252
  Milli Bovingdon 	      mbovingdon8c@wix.com              20252
  Ernie Levermore 	      elevermoreqw@cocolog-nifty.com    20252
*/

-- 3
-- Use a query to find the names 
SELECT full_name, email
FROM transaction_data
WHERE full_name = 'Art Vandelay' 
  OR full_name LIKE '% der %';
-- and emails associated with these transactions.
/* 
  full_name 	            email
Parrnell Van der Mark 	pvan4q@craigslist.org
Art Vandelay 	        tloyb6@un.org
Art Vandelay 	        bstreightdp@example.com
Art Vandelay    	bduvalfh@cpanel.net
Art Vandelay 	        acastgo@hibu.com
Art Vandelay      	maimableia@hhs.gov
Art Vandelay    	nmcnicklemw@springer.com
Art Vandelay 	        aiacomopx@ed.gov

*/
-- 4
-- Find the ip_addresses and emails listed with these transactions.
SELECT ip_address, email
FROM transaction_data
WHERE ip_address LIKE '10.%';

/*
ip_address 	email
10.1.2.7 	dlindmarkb8@utexas.edu
10.176.214.47 	pnekrewsbd@reference.com
10.1.78.70 	egligoracid6@hao123.com
10.84.225.46 	eminchindenmk@google.com.br
10.1.2.3 	spesicqp@google.it
10.1.2.4 	lansettre@usgs.gov
*/

-- 5
-- Find the emails in transaction_data with
-- ‘temp_email.com’ as a domain.
SELECT full_name, email
FROM transaction_data
WHERE email LIKE '%temp_email.com';

/*
full_name 	          email
Olwen Bemwell     	obemwellw@temp_email.com
Homere Mc Combe 	hmchm@temp_email.com
Sherwood Fessions 	sfessionsll@temp_email.com
Bellina Tibald 	        btibaldnd@temp_email.com
*/

-- 6
-- The finance department is looking for a specific transaction. 
-- They know that the transaction occurred from an ip address starting 
-- with ‘120.’ and their full name starts with ‘John’.
SELECT * 
FROM transaction_data
WHERE ip_address LIKE '120.%' AND full_name LIKE 'John%';
-- Can you find the transaction?
-- id 	full_name 	          email 	                zip 	ip_address
-- 672 	Johnathan Brilleman 	jbrillemanin@tinypic.com 	8922 	120.66.58.128


-- 7
-- Challenge
-- Return only those customers residing in GA. Use the list of ZIP CODE prefixes
-- (https://en.wikipedia.org/wiki/List_of_ZIP_Code_prefixes)
-- to determine the best query for zip codes belonging to Georgia(GA).
SELECT * 
FROM transaction_data
WHERE zip BETWEEN 30000 and 31999
ORDER BY zip ASC;
