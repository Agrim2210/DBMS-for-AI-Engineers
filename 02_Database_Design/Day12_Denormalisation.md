# Day 12 — Denormalization

## 1. What is Denormalization?

**Denormalization** is the process of **intentionally adding redundant data** to a database to improve **query performance**.

In contrast to normalization (1NF → 3NF), which removes redundancy, denormalization may **reintroduce some redundancy** to reduce complex joins and speed up reads.

Why?

```text
Normalized databases → clean design but more JOINs
Denormalized databases → faster queries but some redundancy
```

---

## 2. Why Denormalization is Used

In large systems with millions of records, queries involving multiple joins can become slow.

Example normalized query:

```sql
SELECT c.name, p.product_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;
```

This requires **several joins**, which can slow down analytics or reporting.

Denormalization can store some information together to reduce these joins.

---

## 3. Example of Denormalization

Normalized design:

### Customers

| customer_id | name |
| ----------- | ---- |

### Orders

| order_id | customer_id |

To reduce joins, a denormalized table might store:

| order_id | customer_id | customer_name |
| -------- | ----------- | ------------- |

Now the system can fetch order information **without joining customers**.

---

## 4. Advantages of Denormalization

* Faster read queries
* Fewer joins
* Better performance for analytics
* Useful in reporting systems

---

## 5. Disadvantages of Denormalization

* Data redundancy increases
* Updates become more complex
* Risk of inconsistent data
* More storage usage

Example:

If customer name changes, multiple rows must be updated.

---

## 6. Where Denormalization is Common

Denormalization is often used in:

* Data warehouses
* Analytics systems
* Reporting databases
* Big data platforms

Example systems:

```text
Snowflake
BigQuery
Redshift
```

These systems prioritize **query speed over strict normalization**.

---

## 7. Normalization vs Denormalization

| Feature          | Normalization       | Denormalization |
| ---------------- | ------------------- | --------------- |
| Data redundancy  | Low                 | Higher          |
| Query complexity | Higher (more joins) | Lower           |
| Data consistency | Strong              | Slightly weaker |
| Performance      | Slower reads        | Faster reads    |

---

## 8. Practical Rule

Most production databases follow:

```text
OLTP systems → Normalized (3NF)
OLAP systems → Denormalized
```

OLTP = transactional systems (apps, websites)

OLAP = analytics systems (data analysis, dashboards)

---

