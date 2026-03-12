# Day 2 — DBMS Architecture

## 1. What is DBMS Architecture?

DBMS architecture describes **how a database system is structured internally and how different components interact with each other**.

It defines how:

* Users interact with the database
* Queries are processed
* Data is stored and retrieved

A DBMS sits between the **user/application and the actual data stored on disk**.

---

## 2. Basic Flow of a Database System

When a user requests data, the following process typically happens:

User / Application → SQL Query → DBMS → Database → Result Returned

Example query:

```sql
SELECT * FROM customers;
```

The DBMS receives the query, processes it, retrieves the data from storage, and returns the result.

---

## 3. Main Components of a DBMS

A DBMS internally consists of several important components.

### Query Processor

The **query processor** interprets SQL queries and converts them into instructions that the database system can execute.

Responsibilities include:

* Parsing the SQL query
* Optimizing the query
* Generating an execution plan

Example:

```sql
SELECT name FROM customers WHERE city = 'Delhi';
```

The query processor determines **the most efficient way to retrieve this data**.

---

### Storage Manager

The **storage manager** handles how data is stored and retrieved from disk.

Responsibilities:

* Managing files
* Managing indexes
* Managing buffers (temporary memory for data)

This ensures that data access is **efficient even for very large datasets**.

---

### Transaction Manager

The transaction manager ensures that **database operations are safe and consistent**.

It manages:

* Commit operations
* Rollback operations
* Concurrency between multiple users

Example scenario:

Two users updating the same bank account simultaneously.
The transaction manager ensures the data remains **correct and consistent**.

---

### Security and Authorization Manager

This component ensures that only **authorized users** can access or modify certain data.

Example:

A customer support employee may view customer data but **cannot modify financial records**.

---

## 4. Three-Schema Architecture

To make databases more flexible and easier to manage, DBMS systems follow the **three-schema architecture**.

This architecture separates the database into **three levels of abstraction**.

---

### External Level (View Level)

This is the level that **end users interact with**.

Different users may see **different views of the same database**.

Example:

* A customer sees only their orders
* An admin sees all orders

Example view:

```sql
SELECT name, city
FROM customers;
```

The user does not see the entire database structure.

---

### Conceptual Level (Logical Level)

This level defines the **overall structure of the entire database**.

It includes:

* Tables
* Relationships
* Constraints

Example:

Customers Table
Orders Table
Relationship between customers and orders

This level describes **what data is stored and how different data is related**.

---

### Internal Level (Physical Level)

This level defines **how the data is actually stored on disk**.

It includes:

* Data files
* Indexes
* Storage structures

Example:

Data may be stored using **B-trees or other indexing techniques** to make queries faster.

Users and developers **do not directly interact with this level**.

---

## 5. Why Three-Schema Architecture is Important

This design provides **data independence**, meaning changes in one level do not affect others.

For example:

If the physical storage changes (internal level),
the application and users **do not need to change their queries**.

Benefits:

* Flexibility
* Better data security
* Easier system maintenance

---

## 6. Example in Real ML Workflow

In machine learning pipelines:

External Level
Data scientists query specific features.

Conceptual Level
Database schema defining tables such as:

* customers
* transactions
* products

Internal Level
The database engine stores and indexes millions of records efficiently.

Example SQL query used to extract training data:

```sql
SELECT customer_id, COUNT(order_id)
FROM orders
GROUP BY customer_id;
```

This extracted data may later be used to train a **machine learning model**.

---

## 7. Key Takeaways

* DBMS architecture defines how database systems are structured internally.
* Major components include the **query processor, storage manager, and transaction manager**.
* The **three-schema architecture** separates the system into external, conceptual, and internal levels.
* This separation improves flexibility, security, and maintainability.

---

