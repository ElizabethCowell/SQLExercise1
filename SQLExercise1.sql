-- find all products --
 SELECT * FROM PRODUCTS;
-- find all products that cost $1400
 SELECT * FROM PRODUCTS WHERE PRICE = 1400;
-- find all products that cost $11.99 or $13.99
 SELECT * FROM PRODUCTS WHERE PRICE = 11.99 OR PRICE = 13.99;
-- find all products that do NOT cost 11.99 - using NOT
 SELECT * FROM products WHERE NOT PRICE = 11.99; 
-- find  all products and sort them by price from greatest to least
 select * FROM PRODUCTS ORDER BY PRICE DESC;
-- find all employees who don't have a middle initial
 SELECT * FROM EMPLOYEES WHERE MIDDLEINITIAL IS NULL;
-- find distinct product prices
 SELECT DISTINCT PRICE FROM PRODUCTS;
-- find all employees whose first name starts with the letter ‘j’
 SELECT * FROM EMPLOYEES WHERE FIRSTNAME LIKE 'J%';
-- find all Macbooks --
 SELECT * FROM PRODUCTS WHERE NAME LIKE '%MACBOOK%';
-- find all products that are on sale
 SELECT * FROM PRODUCTS WHERE ONSALE = '1';
-- find the average price of all products --
 SELECT AVG(PRICE) FROM PRODUCTS;
-- find all Geek Squad employees who don't have a middle initial --
 SELECT * FROM EMPLOYEES WHERE TITLE = 'GEEK SQUAD' AND MIDDLEINITIAL IS NULL;
-- find all products from the products table whose stock level is in the range  -- of 500 to 1200. Order by Price from least to greatest. **Try this with the -- between keyword** 
SELECT * FROM PRODUCTS WHERE STOCKLEVEL BETWEEN 500 AND 1200 ORDER BY PRICE;