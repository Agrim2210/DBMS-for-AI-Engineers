

/* =====================================================
   Day 06 — Advanced Aggregations + Multi-Table JOIN
   Database: ecommerce_db
   ===================================================== */


/* -----------------------------------------------------
1. Customer Name and Number of Orders
----------------------------------------------------- */

-- COUNT() → counts number of rows
-- JOIN → connects customers with orders
-- GROUP BY → groups rows by customer

SELECT c.name, COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.name;


/* -----------------------------------------------------
2. Top 3 Most Sold Products
----------------------------------------------------- */

-- SUM() → total quantity sold
-- GROUP BY → per product
-- ORDER BY DESC → highest first
-- LIMIT 3 → top 3 results

SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 3;


/* -----------------------------------------------------
3. Product Generating Highest Revenue
----------------------------------------------------- */

-- Revenue = quantity × price
-- SUM() → total revenue per product

SELECT p.product_name, SUM(oi.quantity * oi.price) AS revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 1;


/* -----------------------------------------------------
4. City with Highest Number of Orders
----------------------------------------------------- */

-- JOIN customers + orders
-- COUNT orders per city

SELECT c.city, COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY total_orders DESC
LIMIT 1;


/* -----------------------------------------------------
5. Top 2 Customers by Spending
----------------------------------------------------- */

-- SUM(total_amount) → total spending
-- ORDER BY DESC → highest spenders first

SELECT c.name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 2;


/* -----------------------------------------------------
6. Product Performance (Quantity + Revenue)
----------------------------------------------------- */

-- SUM(quantity) → total units sold
-- SUM(quantity * price) → total revenue

SELECT p.product_name,
       SUM(oi.quantity) AS total_quantity,
       SUM(oi.quantity * oi.price) AS total_revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name;