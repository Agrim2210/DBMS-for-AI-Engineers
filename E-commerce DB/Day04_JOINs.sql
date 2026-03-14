use e_commerce;
--INNER JOIN
SELECT c.name,o.order_id FROM customers c INNER JOIN orders o ON c.customer_id=o.customer_id;

SELECT c.name,o.total_amount FROM customers c INNER JOIN orders o on c.customer_id=o.customer_id ;

-- join three tables
SELECT c.name,oi.product_id from customers c JOIN orders o ON c.customer_id=o.customer_id
JOIN order_items oi on o.order_id=oi.order_id ;

--join 4 Tables
SELECT c.name,p.product_name FROM customers c join orders o on c.customer_id=o.customer_id JOIN
order_items oi on o.order_id=oi.order_id JOIN products p ON oi.product_id=p.product_id;
-- join products
SELECT o.order_id,p.product_name from orders o JOIN order_items oi on o.order_id=oi.order_id JOIN products p on oi.product_id=p.product_id;
SELECT p.product_name,oi.quantity FROM products p JOIN order_items oi ON p.product_id=oi.product_id;

--LEFT JOIN(Returns all rows from left table )
SELECT c.name,o.order_id FROM customers c LEFT JOIN orders o ON c.customer_id=o.customer_id;


