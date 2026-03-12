# Day 3 — Data Models in DBMS

## 1. What is a Data Model?

A **data model** defines how data is:

* structured
* stored
* organized
* related to other data

It provides a **blueprint for designing databases**.

Before creating tables in a database, we first decide **how the data should be structured** using a data model.

Example:

In an e-commerce system we may need data about:

* customers
* orders
* products
* payments

A data model helps define **how these entities relate to each other**.

---

## 2. Why Data Models Are Important

Without a proper structure, managing data becomes chaotic.

Data models help in:

* organizing large datasets
* defining relationships between data
* reducing redundancy
* making queries easier

For example, instead of storing customer information repeatedly in every order, we store it **once** and connect it using relationships.

---

## 3. Types of Data Models

DBMS mainly uses three types of data models.

### 1. Hierarchical Model

This model organizes data in a **tree-like structure**.

Each parent can have multiple children, but each child has **only one parent**.

Example structure:

Company
└── Department
  └── Employees

Limitations:

* Difficult to represent complex relationships
* Not flexible for modern applications

Because of these limitations, it is rarely used today.

---

### 2. Network Model

The network model improves the hierarchical model by allowing **many-to-many relationships**.

Example:

A student may enroll in **multiple courses**, and each course may have **multiple students**.

Structure:

Student ↔ Course

While more flexible than hierarchical models, the network model became complicated to maintain.

---

### 3. Relational Model (Most Important)

The **relational model** is the most widely used data model today.

It represents data in the form of **tables (relations)**.

Each table contains:

* rows (records)
* columns (attributes)

Example:

Customers Table

| customer_id | name  | city   |
| ----------- | ----- | ------ |
| 1           | Rahul | Delhi  |
| 2           | Ankit | Mumbai |

Orders Table

| order_id | customer_id | amount |
| -------- | ----------- | ------ |
| 101      | 1           | 1200   |
| 102      | 2           | 900    |

Here the **customer_id** links both tables.

This relationship allows databases to connect related data efficiently.

---

## 4. Key Concepts in the Relational Model

### Relation

A **relation** is simply a table.

Example:

Customers table.

---

### Tuple

A **tuple** represents a single row in a table.

Example:

1, Rahul, Delhi

---

### Attribute

An **attribute** represents a column in a table.

Example:

customer_id
name
city

---

## 5. Why the Relational Model Dominates Industry

Most modern databases use the relational model because it:

* is simple to understand
* organizes data in structured tables
* supports powerful queries using SQL
* maintains relationships between data

Examples of relational database systems:

* MySQL
* PostgreSQL
* Oracle Database
* Microsoft SQL Server

---

## 6. Example SQL Query in Relational Databases

Suppose we want to find customer orders.

Example query:

```sql id="2k6l9t"
SELECT customers.name, orders.amount
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id;
```

This query retrieves customer names along with their order amounts.

The relational model makes such queries possible by linking tables through common attributes.

---


## 7. Key Takeaways

* A data model defines how data is structured and related.
* Common data models include hierarchical, network, and relational models.
* The relational model is the most widely used model in modern databases.
* Relational databases organize data using tables with rows and columns.
* SQL is used to query relational databases.

---

