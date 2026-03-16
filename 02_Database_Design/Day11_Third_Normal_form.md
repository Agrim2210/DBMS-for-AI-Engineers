# Day 11 — Third Normal Form (3NF)

## 1. What is Third Normal Form (3NF)?

A table is in **Third Normal Form (3NF)** if:

1. It is already in **Second Normal Form (2NF)**
2. There is **no transitive dependency**

In simple terms:

```text id="r4m8k1"
Non-key attributes must depend only on the primary key,
not on other non-key attributes.
```

---

## 2. What is Transitive Dependency?

A **transitive dependency** happens when:

```text id="f9t2q7"
Primary Key → Non-key attribute → Another non-key attribute
```

This means a column indirectly depends on the primary key through another column.

---

## 3. Example Table NOT in 3NF

Consider this table:

| order_id | customer_id | customer_city |
| -------- | ----------- | ------------- |
| 101      | 1           | Delhi         |
| 102      | 2           | Mumbai        |
| 103      | 1           | Delhi         |

Primary key:

```text id="d0s3p5"
order_id
```

Dependency chain:

```text id="h7n6v1"
order_id → customer_id
customer_id → customer_city
```

So:

```text id="x3k9b4"
order_id → customer_city (transitive dependency)
```

This violates **3NF**.

---

## 4. Why Transitive Dependency is Bad

Problems caused:

* **Data redundancy**
* **Update anomalies**
* **Data inconsistency**

Example:

If customer 1 moves from **Delhi → Mumbai**, we must update every order row.

If we miss one row → incorrect data.

---

## 5. Convert to 3NF

We split the table.

### Customers Table

| customer_id | city   |
| ----------- | ------ |
| 1           | Delhi  |
| 2           | Mumbai |

### Orders Table

| order_id | customer_id |
| -------- | ----------- |
| 101      | 1           |
| 102      | 2           |

Now:

```text id="n6c8v2"
city depends on customer_id
```

and:

```text id="k2q1j9"
customer_id depends on order_id
```

No transitive dependency remains.

---

## 6. Example in  E-commerce Database

Our schema already follows **3NF**.

Tables:

```text id="z4p1h6"
customers
orders
products
order_items
payments
```

Example:

Customers table

| customer_id | name | city |

Orders table

| order_id | customer_id |

This ensures:

```text id="t1m5r8"
Customer information is stored only once.
```

Orders only reference customers through **foreign keys**.

---

## 7. Simple Rule for 3NF

Bad design:

```text id="q0n3x7"
order_id | customer_id | customer_city
```

Good design:

```text id="g8y2w4"
customers(customer_id, city)

orders(order_id, customer_id)
```

---

## 8. Summary of Normalization So Far

| Normal Form | Fixes                         |
| ----------- | ----------------------------- |
| **1NF**     | Removes repeating groups      |
| **2NF**     | Removes partial dependency    |
| **3NF**     | Removes transitive dependency |

---

 
