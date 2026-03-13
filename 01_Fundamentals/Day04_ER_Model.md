# Day 4 — Entity Relationship (ER) Model

## 1. What is the ER Model?

The **Entity Relationship (ER) Model** is used to design the structure of a database before creating tables.

It helps us identify:

* entities
* attributes
* relationships between entities

It acts as a **blueprint for database design**.

Instead of directly writing SQL tables, we first design how the data should relate.

---

## 2. Entity

An **entity** represents a real-world object or concept.

Examples:

Customer
Product
Order

Each entity will later become a **table in the database**.

Example:

Customer entity → `customers` table

---

## 3. Attributes

Attributes describe the properties of an entity.

Example:

Customer entity attributes:

* customer_id
* name
* email
* city

These attributes become **columns in a table**.

Example table:

| customer_id | name | email | city |
| ----------- | ---- | ----- | ---- |

---

## 4. Relationship

A relationship shows how entities are connected.

Example:

Customer → places → Order

This means a customer can place orders.

Relationship diagram:

Customer ─── places ─── Order

---

## 5. Types of Relationships

### One-to-One (1:1)

One entity is related to exactly one other entity.

Example:

Person → Passport

One person has one passport.

---

### One-to-Many (1:N)

One entity relates to many records in another entity.

Example:

Customer → Orders

One customer can place multiple orders.

Example:

Customer 1 → Order 101
Customer 1 → Order 103

---

### Many-to-Many (M:N)

Many records relate to many records.

Example:

Orders ↔ Products

One order may contain multiple products.
One product may appear in many orders.

This relationship usually requires a **junction table**.

---

## 6. Example ER Design for E-commerce

Entities:

Customer
Order
Product

Relationships:

Customer → places → Order
Order → contains → Product

Simplified ER structure:

Customer
│
│ places
│
Order
│
│ contains
│
Product

---

## 7. Why ER Models Are Important

ER modeling helps:

* design databases before implementation
* avoid redundancy
* clearly define relationships
* make complex systems easier to manage

Most real-world systems are **designed using ER models before tables are created**.

---

