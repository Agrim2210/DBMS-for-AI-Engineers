# Day 1 — Introduction to DBMS

## 1. The Problem Before Databases

Before databases existed, data was usually stored in **files**.

Example:

customers.txt

1, Rahul, Delhi
2, Ankit, Mumbai
3, Priya, Bangalore

While this works for small systems, it becomes problematic when:

* Data size grows to millions of records
* Multiple applications access the same data
* Updates happen frequently
* Data relationships become complex

Common issues with file systems:

* Data redundancy (duplicate data)
* Data inconsistency
* Difficult data retrieval
* Poor security
* No concurrency control

To solve these problems, **Database Management Systems (DBMS)** were introduced.

---

## 2. What is DBMS?

A **Database Management System (DBMS)** is software that allows users to:

* Store data
* Retrieve data
* Update data
* Manage large datasets efficiently

It acts as an **interface between the user/application and the database**.

Instead of manually searching files, we use **queries** to access data.

Examples of popular DBMS:

* MySQL
* PostgreSQL
* Oracle Database
* Microsoft SQL Server

---

## 3. What is a Database?

A **database** is an organized collection of related data.

Example:
An **e-commerce database** may contain tables like:

* Customers
* Orders
* Products
* Payments

Each table stores a specific type of information.

---

## 4. Basic Components of a Database

### Table

A table stores structured data in rows and columns.

Example:

| customer_id | name  | city      |
| ----------- | ----- | --------- |
| 1           | Rahul | Delhi     |
| 2           | Ankit | Mumbai    |
| 3           | Priya | Bangalore |

---

### Row (Tuple)

A row represents **one record**.

Example:

1, Rahul, Delhi

---

### Column (Attribute)

A column represents a **property of the data**.

Examples:

* customer_id
* name
* city

---

## 5. DBMS vs File System

| Feature          | File System | DBMS           |
| ---------------- | ----------- | -------------- |
| Data redundancy  | High        | Low            |
| Data consistency | Poor        | Good           |
| Data security    | Weak        | Strong         |
| Data querying    | Difficult   | Easy using SQL |

DBMS provides structured and reliable data management.

---

## 6. Role of DBMS in Machine Learning Systems

In most real-world ML systems, data is stored inside databases.

Typical ML workflow:

Database → SQL Query → Data Processing → Feature Engineering → Machine Learning Model


This aggregated data can later be used as **features for training machine learning models**.

Understanding databases helps ML engineers:

* Retrieve datasets efficiently
* Handle large-scale data
* Build data pipelines
* Optimize data queries

---

## 7. Key Takeaways

* DBMS is software used to manage structured data.
* Databases store data in **tables made of rows and columns**.
* DBMS solves problems like redundancy, inconsistency, and inefficient data retrieval.
* In machine learning workflows, databases are commonly used to **store and extract training data**.

---

