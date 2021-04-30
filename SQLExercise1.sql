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
-- joins: select all the computers from the products table:using the products table and the categories table, return the product name and the category name
 SELECT P.NAME, C.NAME FROM PRODUCTS AS P
 INNER JOIN categories AS C ON P.CategoryID = C.CategoryID
 WHERE P.CategoryID =1;
-- joins: find all product names, product prices, and products ratings that have a rating of 5
 SELECT P.NAME, P.PRICE, R.RATING FROM PRODUCTS AS P
 INNER JOIN REVIEWS AS R ON P.PRODUCTID = R.PRODUCTID
 WHERE R.RATING = 5;
 
-- joins: find the employee with the most total quantity sold.  use the sum() function and group by
SELECT E.FirstName, E.LastName, E.EmployeeID, SUM(S.QUANTITY) AS QUANTITY_SOLD FROM employees AS E
INNER JOIN SALES AS S ON E.EmployeeID = S.EmployeeID
GROUP BY E.EmployeeID
ORDER BY QUANTITY_SOLD DESC;
-- joins: find the name of the department, and the name of the category for Appliances and Games
SELECT C.NAME AS CAT, D.NAME AS DEPT FROM categories AS C
INNER JOIN departments AS D ON C.DepartmentID = D.DepartmentID
WHERE C.CategoryID = 2 OR C.CategoryID = 8;
-- joins: find the product name, total # sold, and total price sold, for Eagles: Hotel California --You may need to use SUM()
SELECT P.NAME, SUM(S.QUANTITY) AS NUM_SOLD, SUM(S.QUANTITY * S.PRICEPERUNIT) AS TOTAL_PRICE FROM products AS P
INNER JOIN SALES AS S ON P.ProductID = S.ProductID
WHERE P.ProductID = 97;
-- joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!)
SELECT P.NAME, R.REVIEWER, MIN(R.RATING), R.COMMENT FROM REVIEWS AS R
INNER JOIN products AS P ON P.ProductID = R.ProductID
WHERE P.NAME LIKE '%VISIO%'; 




-- Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT E.EMPLOYEEID, E.FIRSTNAME, E.LASTNAME, P.NAME, S.QUANTITY FROM employees AS E
INNER JOIN SALES AS S ON E.EmployeeID = S.EmployeeID
INNER JOIN products AS P ON S.ProductID = P.ProductID
