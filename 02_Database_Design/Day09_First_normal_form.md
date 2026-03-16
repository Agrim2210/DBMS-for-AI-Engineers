# Day 9 — First Normal Form (1NF)

## 1. What is First Normal Form (1NF)?

A table is in **First Normal Form (1NF)** if:

1. Each column contains **atomic (single) values**
2. There are **no repeating groups or arrays in a column**
3. Each record can be **uniquely identified (has a primary key)**

In simple terms: **one cell = one value**.

---

## 2. Example of a Table NOT in 1NF

| order_id | customer_name | products                 |
| -------- | ------------- | ------------------------ |
| 101      | Rahul         | Laptop, Mouse            |
| 102      | Ankit         | Smartphone               |
| 103      | Priya         | Keyboard, Monitor, Mouse |

Problem:

```text
products column contains multiple values
```

This violates **1NF** because a column should not store **lists**.

---

## 3. Convert to 1NF

We split repeating values into **separate rows**.

| order_id | customer_name | product_name |
| -------- | ------------- | ------------ |
| 101      | Rahul         | Laptop       |
| 101      | Rahul         | Mouse        |
| 102      | Ankit         | Smartphone   |
| 103      | Priya         | Keyboard     |
| 103      | Priya         | Monitor      |
| 103      | Priya         | Mouse        |

Now:

* Each cell has **one value**
* No repeating groups
* Data follows **1NF**

---

## 4. Primary Key in 1NF

Once we split rows, we often need a **composite key**.

Example:

```text
(order_id, product_name)
```

This uniquely identifies each row.

---

## 5. Real Example in  E-commerce Database

our **order_items table** is already in 1NF.

| order_id | product_id | quantity | price |
| -------- | ---------- | -------- | ----- |
| 1        | 3          | 1        | 2000  |
| 1        | 5          | 1        | 12000 |

Notice:

* Each cell contains **one value**
* No column stores multiple products
* Rows represent **individual order items**

This is proper **1NF design**.

---

## 6. Why 1NF is Important

Without 1NF:

* querying becomes difficult
* updating values becomes messy
* indexing becomes inefficient

1NF ensures **clean and structured tables**.

---

## 7. Simple Rule to Remember

Bad design:

```text
products = "Laptop, Mouse"
```

Good design:

```text
Laptop
Mouse
```

Stored as **separate rows**.

---


