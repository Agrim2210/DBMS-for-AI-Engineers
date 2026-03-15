# Day 7 — Constraints in DBMS

## 1. What are Constraints?

**Constraints** are rules applied to table columns that **restrict the type of data that can be stored**.

They help maintain:

* data integrity
* accuracy
* reliability of the database

Example: preventing a product from having a negative price.

Constraints are defined when **creating or modifying tables**.

---

# 2. Types of Constraints

## NOT NULL

Ensures that a column **cannot store NULL values**.

Example:

```sql id="notnull1"
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    city VARCHAR(100)
);
```

Here:

```
name cannot be empty
```

---

## UNIQUE

Ensures that **all values in a column are different**.

Example:

```sql id="unique1"
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE
);
```

Now the database will **reject duplicate emails**.

---

## PRIMARY KEY

A primary key is a **combination of two constraints**:

```
UNIQUE + NOT NULL
```

Example:

```sql id="pk1"
customer_id INT PRIMARY KEY
```

This ensures every record has a **unique identifier**.

---

## FOREIGN KEY

Maintains **relationships between tables**.

Example:

```sql id="fk1"
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id)
```

This ensures:

```
An order cannot exist without a valid customer
```

---

## CHECK

Ensures values satisfy a **specific condition**.

Example:

```sql id="check1"
price DECIMAL(10,2) CHECK (price > 0)
```

This prevents:

```
price = -500
```

---

## DEFAULT

Assigns a **default value if none is provided**.

Example:

```sql id="default1"
payment_status VARCHAR(50) DEFAULT 'Pending'
```

If no status is inserted, the value automatically becomes:

```
Pending
```

---

# 3. Example Using Multiple Constraints

Example product table:

```sql id="constraintstable"
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    price DECIMAL(10,2) CHECK (price > 0),
    stock INT DEFAULT 0
);
```

Rules enforced:

* product name cannot be empty
* price must be positive
* stock defaults to 0

---

# 4. Why Constraints Are Important

Constraints protect the database from **invalid data**.

Without constraints:

* duplicate IDs could appear
* orders might reference non-existent customers
* negative prices might be stored

Constraints ensure the database remains **consistent and reliable**.

---

# 5. Constraints in Your E-commerce Schema

Examples:

Customers table:

```
customer_id → PRIMARY KEY
email → UNIQUE
name → NOT NULL
```

Products table:

```
price → CHECK(price > 0)
stock → DEFAULT 0
```

Orders table:

```
customer_id → FOREIGN KEY
```

---

