# Lesson 01: Introduction to Database Relationships

> Learn how tables are connected in relational databases and why relationships are the foundation of modern database systems.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand database relationships
* Understand relational databases
* Identify related tables
* Understand why relationships exist
* Recognize relationship types
* Interpret relationship diagrams
* Prepare for SQL JOIN operations

---

# Introduction

Real-world data is interconnected.

Consider a library.

A book belongs to a category.

A book has a publisher.

A book can have one or more authors.

A member can borrow many books.

A member can reserve many books.

All of these pieces of information are related.

---

# Why Not Store Everything in One Table?

Imagine a table like this:

| BookTitle  | AuthorName | Category   | Publisher | Member |
| ---------- | ---------- | ---------- | --------- | ------ |
| SQL Basics | John Smith | Technology | TechPress | Alice  |
| SQL Basics | John Smith | Technology | TechPress | Bob    |

Problems:

```text id="1"
Duplicate Data

Wasted Storage

Hard Updates

Poor Performance
```

---

# Database Normalization

Instead of storing everything in one table, databases divide information into multiple tables.

Example:

```text id="2"
Books

Authors

Publishers

Categories

Members

BorrowRecords

Reservations
```

Each table stores one type of information.

---

# What is a Relationship?

A relationship is a connection between two tables.

Example:

```text id="3"
Categories
    ↓
Books
```

Each book belongs to a category.

Therefore:

```text id="4"
Books and Categories are related.
```

---

# Real-World Library Relationships

```text id="5"
Categories
    ↓
Books

Publishers
    ↓
Books

Books
    ↓
BorrowRecords

Books
    ↓
Reservations

Members
    ↓
BorrowRecords

Members
    ↓
Reservations
```

---

# Why Relationships Matter

Without relationships:

```text id="6"
Data becomes duplicated.

Reports become difficult.

Data integrity is lost.
```

With relationships:

```text id="7"
Data remains organized.

Storage is reduced.

Reporting becomes easier.

Data integrity improves.
```

---

# Relationship Example

Categories Table

| CategoryID | CategoryName |
| ---------- | ------------ |
| 1          | Technology   |
| 2          | Science      |

---

Books Table

| BookID | Title       | CategoryID |
| ------ | ----------- | ---------- |
| 1      | SQL Basics  | 1          |
| 2      | Physics 101 | 2          |

---

Relationship:

```text id="8"
Books.CategoryID
       ↓
Categories.CategoryID
```

---

# Relationship Types

There are three major relationship types.

---

# One-to-One (1:1)

One record in Table A relates to one record in Table B.

Example:

```text id="9"
Employee
     ↔
EmployeeProfile
```

One employee has one profile.

One profile belongs to one employee.

---

# One-to-Many (1:M)

Most common relationship type.

Example:

```text id="10"
Category
    ↓
Books
```

One category can contain many books.

---

Example:

| Category   |
| ---------- |
| Technology |

Contains:

```text id="11"
SQL Basics

Python Guide

Power BI Fundamentals
```

---

# Many-to-Many (M:N)

A record in Table A can relate to many records in Table B.

A record in Table B can relate to many records in Table A.

---

Example:

```text id="12"
Books
   ↕
Authors
```

A book can have multiple authors.

An author can write multiple books.

---

Example:

```text id="13"
Book A
 ├─ Author 1
 └─ Author 2

Author 1
 ├─ Book A
 └─ Book B
```

---

# Relationship Diagram

Library Database:

```text id="14"
Categories
    │
    └── Books
            │
            ├── BorrowRecords
            │
            ├── Reservations
            │
            └── BookAuthors
                    │
                    └── Authors

Publishers
    │
    └── Books

Members
    │
    ├── BorrowRecords
    │
    └── Reservations
```

---

# Understanding Parent and Child Tables

Example:

```text id="15"
Categories
      ↓
Books
```

Categories = Parent

Books = Child

---

Why?

Because:

```text id="16"
Books depends on Categories.
```

A book belongs to a category.

A category does not depend on a book.

---

# Business Benefits

Relationships enable:

### Better Reporting

```text id="17"
Books by Category

Books by Publisher

Books by Author
```

---

### Better Analytics

```text id="18"
Most Borrowed Books

Most Active Members

Popular Categories
```

---

### Better Data Integrity

```text id="19"
Prevent Invalid Records

Prevent Orphaned Records

Maintain Consistency
```

---

# Preparing for Joins

Relationships allow SQL to combine tables.

Example:

```sql
SELECT
    B.Title,
    C.CategoryName
FROM Books B
INNER JOIN Categories C
    ON B.CategoryID = C.CategoryID;
```

---

Result:

| Title       | CategoryName |
| ----------- | ------------ |
| SQL Basics  | Technology   |
| Physics 101 | Science      |

---

# Common Beginner Mistakes

---

## Thinking Relationships Are Optional

Bad assumption:

```text id="20"
Relationships are only for large databases.
```

Reality:

```text id="21"
Relationships are required in nearly every relational database.
```

---

## Confusing Tables and Relationships

A table stores data.

A relationship connects tables.

---

## Ignoring Relationship Design

Poor relationship design causes:

```text id="22"
Duplicate Data

Poor Reports

Data Inconsistency
```

---

# Hands-On Practice

Identify the relationship type:

### Categories → Books

Answer:

```text id="23"
One-to-Many
```

---

### Publishers → Books

Answer:

```text id="24"
One-to-Many
```

---

### Members → BorrowRecords

Answer:

```text id="25"
One-to-Many
```

---

### Books ↔ Authors

Answer:

```text id="26"
Many-to-Many
```

---

# Mini Exercise

Identify:

### Task 1

Parent table between Books and Categories.

---

### Task 2

Child table between Books and Categories.

---

### Task 3

Relationship between Members and Reservations.

---

### Task 4

Relationship between Books and Authors.

---

### Task 5

Why relationships are important.

---

# Best Practices

✅ Design relationships before creating tables

✅ Avoid duplicate data

✅ Use relationship diagrams

✅ Understand parent-child relationships

✅ Normalize data properly

---

# Summary

In this lesson, you learned:

* What relationships are
* Why relationships exist
* One-to-One relationships
* One-to-Many relationships
* Many-to-Many relationships
* Parent and Child tables
* Relationship diagrams
* Business value of relationships

Relationships are the foundation of relational databases and make SQL JOINs possible.

---

# Knowledge Check

### Question 1

What is a relationship?

A. A column

B. A connection between tables

C. A query

D. A database

---

### Question 2

Which relationship is most common?

A. One-to-One

B. One-to-Many

C. Many-to-Many

D. Recursive

---

### Question 3

Books and Authors have which relationship?

A. One-to-One

B. One-to-Many

C. Many-to-Many

D. None

---

### Question 4

Why are relationships important?

A. Reduce duplication

B. Improve reporting

C. Improve integrity

D. All of the Above

---

### Question 5

Which table is the parent?

```text
Categories
    ↓
Books
```

A. Categories

B. Books

---

# Next Lesson

➡️ 02-Primary-Keys-and-Foreign-Keys.md

In the next lesson, you'll learn how Primary Keys and Foreign Keys create and enforce relationships between tables.
