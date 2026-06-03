# Exercise 03: Keys and Relationships

## Objective

Practice identifying primary keys, foreign keys, and relationship types.

---

# Part A: Primary Key Identification

Identify the best primary key for each table.

### Table 1: Customers

| CustomerID | Name | Email |
| ---------- | ---- | ----- |

Primary Key: ____________

---

### Table 2: Products

| ProductCode | ProductName | Price |
| ----------- | ----------- | ----- |

Primary Key: ____________

---

### Table 3: Employees

| EmployeeID | Email | Phone |
| ---------- | ----- | ----- |

List all possible candidate keys.

---

# Part B: Foreign Key Identification

### Customers

| CustomerID | Name  |
| ---------- | ----- |
| 1          | John  |
| 2          | Sarah |

### Orders

| OrderID | CustomerID |
| ------- | ---------- |
| 101     | 1          |
| 102     | 2          |

Questions:

1. What is the primary key in Customers?
2. What is the primary key in Orders?
3. What is the foreign key?
4. Which table is the parent table?

---

# Part C: Relationship Identification

Identify the relationship type.

### Scenario 1

One customer can place many orders.

Answer:

* One-to-One
* One-to-Many
* Many-to-Many

---

### Scenario 2

One student can enroll in many courses and one course can have many students.

Answer:

* One-to-One
* One-to-Many
* Many-to-Many

---

### Scenario 3

One person can have one passport.

Answer:

* One-to-One
* One-to-Many
* Many-to-Many

---

# Part D: Draw Relationships

Draw relationship diagrams for:

### 1. Customer → Orders

### 2. Department → Employees

### 3. Students ↔ Courses

Use simple text diagrams.

Example:

```text
Customer
   │
   ▼
Orders
```

---

# Part E: Referential Integrity

Given:

### Customers

| CustomerID |
| ---------- |
| 1          |
| 2          |

### Orders

| OrderID | CustomerID |
| ------- | ---------- |
| 101     | 1          |
| 102     | 5          |

Questions:

1. Is there a referential integrity violation?
2. Why?
3. How can it be fixed?

---

# Mini Design Challenge

Design a database for a Gym Management System.

Include:

* Members
* Trainers
* Membership Plans

Tasks:

* Identify Primary Keys
* Identify Foreign Keys
* Define Relationships

---

# Reflection

Explain the importance of primary keys and foreign keys in maintaining data integrity.