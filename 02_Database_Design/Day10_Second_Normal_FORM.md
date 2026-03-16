

# Day 10 — Second Normal Form (2NF)

## 1. What is Second Normal Form (2NF)?

A table is in **Second Normal Form (2NF)** if:

1. The table is already in **First Normal Form (1NF)**
2. **No partial dependency exists**

This means:

```text id="flv4qt"
Every non-key attribute must depend on the entire primary key
```

---

# 2. What is Partial Dependency?

A **partial dependency** occurs when a column depends on **only part of a composite primary key**, instead of the full key.

Example table:

| order_id | product_id | product_name | price |
| -------- | ---------- | ------------ | ----- |
| 101      | 1          | Laptop       | 75000 |
| 101      | 2          | Mouse        | 800   |
| 102      | 1          | Laptop       | 75000 |

Primary key:

```text id="2f1s33"
(order_id, product_id)
```

Problem:

```text id="p9jvyg"
product_name and price depend only on product_id
```

They do **not depend on order_id**.

This is a **partial dependency**, which violates 2NF.

---

# 3. Why Partial Dependency is Bad

Problems caused:

* Data redundancy
* Difficult updates
* Inconsistent data

Example:

Laptop price changes from **75000 → 72000**.

You must update **every row where product_id = 1**.

If one row is missed → incorrect data.

---

# 4. Convert to Second Normal Form

Solution: **split the table**.

### Orders_Items Table

| order_id | product_id | quantity |
| -------- | ---------- | -------- |

### Products Table

| product_id | product_name | price |
| ---------- | ------------ | ----- |

Now:

```text id="lg1g6o"
product_name depends on product_id
quantity depends on order_id + product_id
```

No partial dependency remains.

---

# 5. Example in  E-commerce Database

 schema already follows **2NF**.

Tables:

```text id="mwodfg"
products
order_items
orders
customers
```

Example:

Products table

| product_id | product_name | price |
| ---------- | ------------ | ----- |

Order Items table

| order_id | product_id | quantity |

This separation ensures **product data is stored only once**.

---

# 6. Key Idea

Bad design:

```text id="6ox65v"
order_id | product_id | product_name | price
```

Good design:

```text id="14cwiv"
products(product_id, product_name, price)

order_items(order_id, product_id, quantity)
```

---

# 7. When 2NF Matters

2NF mainly applies when:

```text id="x3ulkk"
tables have composite keys
```

If a table has **only one primary key column**, it is automatically in **2NF**.

---


