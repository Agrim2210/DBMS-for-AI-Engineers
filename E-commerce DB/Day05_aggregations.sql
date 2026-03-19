use e_commerce ;
-- BASIC AGGREGATION FUNCTIONS
SELECT COUNT(*) FROM orders ;

SELECT COUNT(*) FROM customers ;

SELECT SUM(total_amount) FROM orders;

SELECT SUM(stock) FROM products ;

SELECT AVG(price) FROM products ;

SELECT AVG(price) FROM order_items;

-- Group By
SELECT customer_id ,SUM(total_amount)
FROM orders
GROUP BY customer_id ;

SELECT customer_id,COUNT(*)
FROM orders
GROUP BY customer_id ;

-- GROUP BY+JOIN'S
SELECT c.name,SUM(o.total_amount)
FROM customers c JOIN orders o ON c.customer_id=o.customer_id
GROUP BY c.name ; 

SELECT c.name,COUNT(*) FROM customers c 
JOIN orders o ON c.customer_id=o.customer_id
GROUP BY c.name
-- GROUP BY+ HAVING 
SELECT customer_id,SUM(total_amount)
FROM orders GROUP BY customer_id               
HAVING SUM(total_amount)>50000 ;

SELECT customer_id,COUNT(*)
FROM orders GROUP BY customer_id HAVING COUNT(*)>1 ;
-- SHOW MOST EXPENSIVE PRODUCT
SELECT * FROM products ORDER BY price DESC LIMIT 1 ;
