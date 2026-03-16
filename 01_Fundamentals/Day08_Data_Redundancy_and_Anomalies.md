# Day 8 — Data Redundancy and Anomalies

## 1. What is Data Redundancy?

**Data redundancy** occurs when the same data is stored multiple times in a database.

Example table (bad design):

| order_id | customer_name | city  | product_name | price |
| -------- | ------------- | ----- | ------------ | ----- |
| 101      | Rahul         | Delhi | Laptop       | 75000 |
| 102      | Rahul         | Delhi | Mouse        | 800   |
| 103      | Rahul         | Delhi | Keyboard     | 1500  |

Notice something:

```
Rahul and Delhi are repeated multiple times
```

This is **redundant data**.

---

# 2. Why Data Redundancy is Bad

Problems caused by redundancy:

* Wastes storage space
* Increases database size
* Causes data inconsistency
* Makes updates difficult

Example:

If Rahul moves to **Mumbai**, you must update **every row**.

If one row is missed → inconsistent data.

---

# 3. Types of Anomalies

Poor database design causes **anomalies**.

There are three main types.

---

# 3.1 Update Anomaly

Occurs when updating data requires **multiple changes**.

Example:

Rahul changes city to Mumbai.

You must update:

```
Row 1
Row 2
Row 3
```

If one row is not updated → inconsistent data.

---

# 3.2 Insert Anomaly

Occurs when you **cannot insert data without other unrelated data**.

Example table:

| order_id | customer_name | product_name |
| -------- | ------------- | ------------ |

Suppose a **new customer registers but has not placed an order yet**.

You cannot insert them because **order_id is required**.

---

# 3.3 Delete Anomaly

Occurs when deleting data accidentally removes important information.

Example:

| order_id | customer_name | product_name |
| -------- | ------------- | ------------ |
| 101      | Rahul         | Laptop       |

If we delete the order:

```
DELETE FROM orders WHERE order_id = 101;
```

We lose **all information about Rahul**.

---

# 4. Solution to These Problems

The solution is **Normalization**.

Normalization splits data into **multiple related tables** to remove redundancy.

Example improved design:

Customers table

| customer_id | name  | city  |
| ----------- | ----- | ----- |
| 1           | Rahul | Delhi |

Orders table

| order_id | customer_id |
| -------- | ----------- |
| 101      | 1           |

Products table

| product_id | product_name | price |
| ---------- | ------------ | ----- |

Now:

```
Customer data stored once
Product data stored once
Orders reference them using IDs
```

This eliminates redundancy.

---

# 5. Example from  E-commerce Database

Our database already follows this design.

Tables:

```
customers
orders
products
order_items
payments
```

This structure avoids redundancy.

Example:

Rahul appears **once in customers table**, not in every order row.

---

# 6. Key Idea

Bad database design:

```
one big table with repeated data
```

Good database design:

```
multiple related tables connected by keys
```

---

