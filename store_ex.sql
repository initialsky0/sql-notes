-- Female customers in Oregon and New York
/* 
   select count(*) 
   from customers 
   where gender='F' and (state='NY' or state='OR'); 
*/

-- Customer age not 55
/* 
   select count(*) 
   from customers 
   where not age=55; 
*/

-- 3 Valued Logic --

-- adjust the following query to display the null values as "No Address"
-- SELECT coalesce(address2, 'No Address')
-- FROM customers;

-- Fix the following query to apply proper 3VL
-- SELECT *
-- FROM customers
-- WHERE address2 IS NOT null;

-- Fix the following query to apply proper 3VL
-- SELECT coalesce(lastName, 'Empty'), * from customers
-- where age is null;

/* Between And */
-- Who between the ages of 30 and 50 has an income less than 50 000?
-- (include 30 and 50 in the results)
-- SELECT * 
-- FROM customers 
-- WHERE income < 50000 AND age BETWEEN 30 AND 50;

-- What is the average income between the ages of 20 and 50? (Including 20 and 50) -> 59361.925908612832
-- SELECT AVG(income)
-- FROM customers 
-- WHERE age BETWEEN 20 AND 50;


/* In Like */
-- How many orders were made by customer 7888, 1082, 12808, 9623
-- SELECT COUNT(*) FROM orders 
-- WHERE customerid IN (7888, 1082, 12808, 9623);

-- How many people's zipcode have a 2 in it?.
-- SELECT COUNT(*) FROM customers 
-- WHERE zip::text LIKE '%2%';

-- How many people's zipcode start with 2 with the 3rd character being a 1
-- SELECT COUNT(*) FROM customers 
-- WHERE zip::text LIKE '2_1%';

--  Which states have phone numbers starting with 302?
--  Replace null values with "No State" 
-- SELECT COALESCE(state, 'No State') as "Result" FROM customers 
-- WHERE phone::text LIKE '302%';

-- How many orders were made in January 2004? -> 1000
-- SELECT count( * ) FROM orders 
-- WHERE date_trunc( 'month', orderdate ) = date('2004-1-1');

/* Inner Join */
-- Get all orders from customers who live in Ohio (OH), New York (NY) or Oregon (OR) state
-- ordered by orderid
-- SELECT ord.*, custs.firstname, custs.lastname, custs.state 
-- FROM orders AS ord 
-- INNER JOIN customers AS custs 
-- ON ord.customerid = custs.customerid 
-- WHERE custs.state IN ('OH', 'NY', 'OR')
-- ORDER BY orderid;

-- Show me the inventory for each product
-- SELECT prod.*, inv.quan_in_stock, inv.sales
-- FROM products AS prod 
-- INNER JOIN inventory AS inv 
-- ON prod.prod_id = inv.prod_id;

/* Conditional */
-- Create a case statement that's named "price class" where if a product is over 20 dollars you show 'expensive'
-- if it's between 10 and 20 you show 'average' 
-- and of is lower than or equal to 10 you show 'cheap'.
-- SELECT prod_id, 
--     price, 
--     CASE WHEN price > 20 THEN 'expensive' 
--          WHEN price BETWEEN 10 AND 20 THEN 'average' 
--          ELSE 'cheap' 
--     END AS "price class"
-- FROM products;

-- Show NULL when the product is not on special (0)
-- SELECT  prod_id, title, price, NULLIF(special, 0) AS "special"
-- FROM products;

/* Subqueries */
-- Get all orders from customers who live in Ohio (OH), New York (NY) or Oregon (OR) state
-- ordered by orderid
-- SELECT orders.*, matching.state
-- FROM orders 
-- JOIN (
--     SELECT customerid, state 
--     FROM customers 
--     WHERE state IN ('OH', 'NY', 'OR')
-- ) AS "matching" USING(customerid) 
-- ORDER BY orderid;
-- (Using WHERE only) --
-- SELECT orders.*
-- FROM orders 
-- WHERE orders.customerid IN (
--     SELECT customerid
--     FROM customers 
--     WHERE state IN ('OH', 'NY', 'OR')
-- )
-- ORDER BY orderid;
