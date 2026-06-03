# Keys and Relationships

> Learn how database tables are connected and how keys ensure data accuracy, consistency, and integrity.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand why keys are important
* Identify different types of keys
* Explain primary keys and foreign keys
* Understand candidate, alternate, and composite keys
* Design relationships between tables
* Implement one-to-one, one-to-many, and many-to-many relationships
* Understand referential integrity

---

# Introduction

Imagine a database containing millions of records.

How can we uniquely identify each record?

How do we connect related information stored in different tables?

The answer is through **keys** and **relationships**.

Keys help databases:

* Identify records
* Prevent duplication
* Connect tables
* Maintain data integrity

Without keys, relational databases would not function effectively.

---

# What is a Key?

A key is one or more columns used to identify rows and establish relationships between tables.

Think of a key as an identification card for data.

---

# Why Are Keys Important?

Keys help:

✅ Identify records uniquely

✅ Prevent duplicate data

✅ Establish table relationships

✅ Improve query performance

✅ Maintain data integrity

---

# Types of Keys

```text id="1c2v5g"
Database Keys
│
├── Primary Key
├── Foreign Key
├── Candidate Key
├── Alternate Key
├── Composite Key
└── Surrogate Key
```

---

# Primary Key

A primary key uniquely identifies every row in a table.

---

## Example

### Customers Table

| CustomerID | Name  |
| ---------- | ----- |
| 1          | John  |
| 2          | Sarah |
| 3          | David |

CustomerID is the primary key.

---

# Rules of a Primary Key

A primary key:

* Must be unique
* Cannot contain NULL values
* Should rarely change
* Must identify exactly one record

---

# Invalid Example

| CustomerID | Name  |
| ---------- | ----- |
| 1          | John  |
| 1          | Sarah |

Duplicate primary key values are not allowed.

---

# NULL Example

| CustomerID | Name |
| ---------- | ---- |
| NULL       | John |

Primary keys cannot be NULL.

---

# Candidate Key

A candidate key is any column that could uniquely identify a record.

---

## Example

### Employees Table

| EmployeeID | Email                                         |
| ---------- | --------------------------------------------- |
| 1          | [john@company.com](mailto:john@company.com)   |
| 2          | [sarah@company.com](mailto:sarah@company.com) |

Possible candidate keys:

```text id="34s5ki"
EmployeeID
Email
```

Both values are unique.

---

# Alternate Key

A candidate key that is not selected as the primary key becomes an alternate key.

---

## Example

```text id="k6r0da"
Primary Key:
EmployeeID

Alternate Key:
Email
```

---

# Composite Key

A composite key consists of multiple columns.

---

## Example

### StudentCourses Table

| StudentID | CourseID |
| --------- | -------- |
| 1         | 101      |
| 1         | 102      |
| 2         | 101      |

Neither column alone is unique.

Together they create a unique combination.

```text id="owu6xv"
(StudentID, CourseID)
```

This becomes the composite key.

---

# Surrogate Key

A surrogate key is an artificially generated identifier.

---

## Example

```text id="ew7p4j"
CustomerID
OrderID
ProductID
```

These values have no business meaning.

They exist only to uniquely identify records.

---

# Natural Key vs Surrogate Key

| Natural Key          | Surrogate Key  |
| -------------------- | -------------- |
| Has business meaning | Artificial     |
| Email Address        | CustomerID     |
| Passport Number      | OrderID        |
| Can change           | Usually stable |

---

# Foreign Key

A foreign key creates relationships between tables.

It references a primary key in another table.

---

# Example

### Customers Table

| CustomerID | Name  |
| ---------- | ----- |
| 1          | John  |
| 2          | Sarah |

---

### Orders Table

| OrderID | CustomerID |
| ------- | ---------- |
| 101     | 1          |
| 102     | 2          |

CustomerID in Orders is a foreign key.

---

# Relationship Visualization

```text id="6cxf7u"
Customers
---------
CustomerID (PK)

      │
      ▼

Orders
---------
OrderID
CustomerID (FK)
```

---

# Why Foreign Keys Matter

Foreign keys:

* Connect tables
* Prevent invalid references
* Maintain consistency
* Enable joins

---

# Referential Integrity

Referential integrity ensures that foreign key values always reference valid records.

---

## Valid Example

### Customers

| CustomerID |
| ---------- |
| 1          |
| 2          |

### Orders

| OrderID | CustomerID |
| ------- | ---------- |
| 101     | 1          |

The customer exists.

---

## Invalid Example

### Orders

| OrderID | CustomerID |
| ------- | ---------- |
| 101     | 99         |

Customer 99 does not exist.

This violates referential integrity.

---

# Relationships Between Tables

Relationships define how data connects across tables.

---

# One-to-One Relationship (1:1)

One record relates to exactly one record.

---

## Example

```text id="twx0zq"
Person
   │
   ▼
Passport
```

One person has one passport.

One passport belongs to one person.

---

# Table Example

### Persons

| PersonID | Name |
| -------- | ---- |
| 1        | John |

---

### Passports

| PassportID | PersonID |
| ---------- | -------- |
| P100       | 1        |

---

# One-to-Many Relationship (1:N)

The most common relationship type.

---

## Example

```text id="x9h4ef"
Customer
    │
    ├── Order 1
    ├── Order 2
    └── Order 3
```

One customer can place many orders.

---

# Table Example

### Customers

| CustomerID | Name |
| ---------- | ---- |
| 1          | John |

---

### Orders

| OrderID | CustomerID |
| ------- | ---------- |
| 101     | 1          |
| 102     | 1          |
| 103     | 1          |

---

# Many-to-Many Relationship (M:N)

Both entities can have multiple related records.

---

## Example

```text id="w2q1mk"
Students
      ↔
Courses
```

A student can enroll in many courses.

A course can contain many students.

---

# Why Many-to-Many Cannot Be Implemented Directly

Relational databases require a bridge table.

---

# Bridge Table Solution

```text id="0z7gxo"
Students
    │
    ▼

Enrollments

    ▲
    │

Courses
```

---

# Example

### Students

| StudentID | Name |
| --------- | ---- |
| 1         | John |

---

### Courses

| CourseID | Course |
| -------- | ------ |
| 101      | SQL    |

---

### Enrollments

| StudentID | CourseID |
| --------- | -------- |
| 1         | 101      |

---

# Relationship Cardinality

Cardinality defines how many records participate in a relationship.

---

## Examples

| Relationship      | Cardinality |
| ----------------- | ----------- |
| Person → Passport | 1:1         |
| Customer → Orders | 1:N         |
| Student ↔ Course  | M:N         |

---

# Common Database Design Mistakes

---

## Missing Primary Keys

Bad:

| Name |
| ---- |
| John |

Good:

| CustomerID | Name |
| ---------- | ---- |
| 1          | John |

---

## Duplicate Data

Bad:

| OrderID | CustomerName |
| ------- | ------------ |
| 1       | John         |
| 2       | John         |

Store customer data separately.

---

## Missing Foreign Keys

Without foreign keys:

```text id="lf4y7n"
Orders may reference
customers that do not exist.
```

---

# Real-World Example

Online Store Database

---

## Customers

| CustomerID | Name |
| ---------- | ---- |
| 1          | John |

---

## Orders

| OrderID | CustomerID |
| ------- | ---------- |
| 101     | 1          |

---

## Products

| ProductID | Product |
| --------- | ------- |
| P1        | Laptop  |

---

## OrderItems

| OrderID | ProductID |
| ------- | --------- |
| 101     | P1        |

---

# Relationship Diagram

```text id="zydrw9"
Customers
    │
    ▼
Orders
    │
    ▼
OrderItems
    ▲
    │
Products
```

---

# Summary

In this lesson, you learned:

* What keys are
* Primary keys
* Candidate keys
* Alternate keys
* Composite keys
* Surrogate keys
* Foreign keys
* Referential integrity
* One-to-one relationships
* One-to-many relationships
* Many-to-many relationships
* Database design best practices

These concepts form the backbone of relational database design and will be used extensively throughout SQL development.

---

# Knowledge Check

### Question 1

Which key uniquely identifies a record?

A. Foreign Key

B. Composite Key

C. Primary Key

D. Alternate Key

---

### Question 2

What does a foreign key do?

A. Stores passwords

B. Creates relationships between tables

C. Increases duplication

D. Removes records

---

### Question 3

Which relationship is most common?

A. One-to-One

B. One-to-Many

C. Many-to-Many

D. Circular

---

### Question 4

What is referential integrity?

A. Query optimization

B. Data backup

C. Valid foreign key relationships

D. Data encryption

---

# Next Lesson

➡️ 05-What-is-SQL.md

In the next lesson, you'll learn what SQL is, how it evolved, and how it became the universal language for relational databases.
