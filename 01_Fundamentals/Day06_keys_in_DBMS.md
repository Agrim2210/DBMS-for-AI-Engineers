# Day 6 — Keys in DBMS

## 1. What is a Key?

A **key** is an attribute (or set of attributes) used to **uniquely identify a record** in a table and/or **create relationships** between tables.

Keys help with:

* Uniqueness (no duplicate rows)
* Data integrity
* Table relationships (via foreign keys)
* Efficient querying

Example table:

| customer_id | name         | email                                     | city   |
| ----------- | ------------ | ----------------------------------------- | ------ |
| 1           | Rahul Sharma | [rahul@gmail.com](mailto:rahul@gmail.com) | Delhi  |
| 2           | Ankit Verma  | [ankit@gmail.com](mailto:ankit@gmail.com) | Mumbai |

Here, `customer_id` uniquely identifies each row.

---

## 2. Super Key

A **super key** is **any set of attributes that uniquely identifies a row**.

Examples in `customers` table:

* `customer_id`
* `email`
* `(customer_id, name)`
* `(email, city)`

All of these can uniquely identify a record, so they are **super keys**.

However, some super keys contain **extra attributes** that are not necessary.

---

## 3. Candidate Key

A **candidate key** is a **minimal super key**.

Minimal means:

* It uniquely identifies rows
* Removing any attribute would break uniqueness

Example candidate keys in `customers`:

* `customer_id`
* `email` (if emails are unique)

These are the **best choices for uniquely identifying records**.

---

## 4. Primary Key

A **primary key** is the **candidate key chosen to identify records in a table**.

Characteristics:

* Must be **unique**
* Cannot be **NULL**
* Only **one primary key per table**

Example:

```sql
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(100)
);
```

Here, `customer_id` is the **primary key**.

---

## 5. Composite Key

A **composite key** is a **primary key made of multiple columns**.

Example: `order_items` table.

| order_id | product_id | quantity |
| -------- | ---------- | -------- |
| 1        | 3          | 2        |
| 1        | 5          | 1        |

Neither `order_id` nor `product_id` alone uniquely identifies the row.

But together:

```
(order_id, product_id)
```

they uniquely identify each record.

Example SQL:

```sql
CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id)
);
```

---

## 6. Foreign Key

A **foreign key** links one table to another.

It references the **primary key of another table**.

Example:

Orders table referencing customers:

```sql
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
```

Relationship:

```
orders.customer_id → customers.customer_id
```

This ensures that **every order belongs to a valid customer**.

---

## 7. Keys in  E-commerce Database

| Table       | Primary Key            |
| ----------- | ---------------------- |
| customers   | customer_id            |
| products    | product_id             |
| orders      | order_id               |
| order_items | order_items_id, |
| payments    | payment_id             |

Foreign keys:

```
orders.customer_id → customers.customer_id
order_items.order_id → orders.order_id
order_items.product_id → products.product_id
payments.order_id → orders.order_id
```

---

## 8. Why Keys Matter

Keys ensure:

* No duplicate records
* Accurate relationships between tables
* Data consistency
* Faster indexing and queries

Without keys, relational databases would become **unstructured and unreliable**.

---


