# Day 5 — Mapping ER Model to Relational Tables & Keys

## 1. Why ER-to-Relational Mapping is Important

After designing an **ER diagram**, the next step is converting it into **relational tables** that a DBMS can implement.

This process is called **ER-to-Relational Mapping**.

It ensures that:

* entities become tables
* attributes become columns
* relationships become foreign keys or junction tables

This is how conceptual database design becomes an **actual SQL schema**.

---

# 2. Mapping Rules

## Rule 1 — Entity → Table

Each **entity** becomes a **table**.

Example ER entity:

Customer

Relational table:

```text
customers
```

Example structure:

| customer_id | name | email | city |
| ----------- | ---- | ----- | ---- |

---

## Rule 2 — Attribute → Column

Attributes of an entity become **columns in the table**.

Example:

Customer entity attributes:

* customer_id
* name
* email
* city

Converted to SQL table:

```sql
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(100)
);
```

---

## Rule 3 — Primary Key

Every table must have a **primary key**.

A primary key:

* uniquely identifies each record
* cannot contain duplicate values
* cannot be NULL

Example:

```text
customers.customer_id
products.product_id
orders.order_id
```

---

## Rule 4 — One-to-Many Relationship → Foreign Key

Example ER relationship:

Customer → places → Order

Mapping rule:

Add the **primary key of the parent table** as a **foreign key** in the child table.

Implementation:

```text
orders.customer_id → customers.customer_id
```

Example SQL:

```sql
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
```

---

## Rule 5 — Many-to-Many Relationship → Junction Table

Example relationship:

Orders ↔ Products

One order can contain many products, and one product can appear in many orders.

This is implemented using an **intermediate table**.

Example:

```text
order_items
```

Columns:

| order_id | product_id | quantity | price |

Example SQL:

```sql
CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    PRIMARY KEY (order_id, product_id)
);
```

---

# 3. Example Mapping for E-commerce Database

ER entities:

Customers
Orders
Products
Payments

Mapped relational tables:

```
customers
products
orders
order_items
payments
```

Relationship structure:

```
customers → orders
orders → order_items
products → order_items
orders → payments
```

---

# 4. Why This Mapping Works

This structure ensures:

* no redundant data
* clear relationships
* efficient queries
* scalable system design

This is the same design pattern used in **real e-commerce systems**.

---

# 5. Real System Perspective

Example query enabled by this design:

```sql
SELECT c.name, p.product_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;
```

This query retrieves **which customer purchased which product**.

Without proper ER-to-relational mapping, such queries would be difficult or inefficient.

---

