# Exercise 02: Relational Model

## Objective

Practice understanding tables, entities, attributes, rows, columns, and normalization concepts.

---

# Part A: Identify Entities

For an Online Shopping System, identify possible entities.

Example:

```text
Customer
Product
Order
```

List at least 5 entities.

---

# Part B: Identify Attributes

For the Customer entity, list appropriate attributes.

Example:

| Attribute  |
| ---------- |
| CustomerID |

Add at least 5 more attributes.

---

# Part C: Tables, Rows, and Columns

Given the table:

| ProductID | ProductName | Price |
| --------- | ----------- | ----- |
| P101      | Laptop      | 800   |
| P102      | Mouse       | 20    |
| P103      | Keyboard    | 50    |

Answer:

1. How many columns exist?
2. How many rows exist?
3. What is the entity?
4. Which column could serve as a primary key?

---

# Part D: Data Redundancy

Consider the following table:

| OrderID | CustomerName |
| ------- | ------------ |
| 101     | John         |
| 102     | John         |
| 103     | John         |

Questions:

1. What problem exists?
2. Why is this design inefficient?
3. How would you improve it?

---

# Part E: Normalization Exercise

Design separate tables for:

* Customers
* Orders

Required fields:

Customers:

* CustomerID
* CustomerName

Orders:

* OrderID
* CustomerID

Draw the relationship between the tables.

---

# Challenge Activity

Design a simple relational model for:

### Library Management System

Include:

* Books
* Members
* Borrow Records

Draw a table structure and identify relationships.

---

# Reflection

Why is normalization important?

Write a short explanation (100–150 words).
