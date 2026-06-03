# Module 06: SQL Subqueries and Nested Queries

> Learn how to write powerful SQL queries using subqueries, nested queries, correlated subqueries, EXISTS, NOT EXISTS, and advanced filtering techniques.

---

# 📖 Module Overview

So far, you have learned:

```text
SELECT
WHERE
ORDER BY
GROUP BY
HAVING
JOINS
```

These commands allow you to retrieve and combine data.

However, real-world business questions often require:

```text
A query inside another query
```

Example:

```text
Find books that cost more than the average book price.

Find members who borrowed more books than the average member.

Find authors who wrote the most books.

Find books that have never been borrowed.
```

These types of problems are solved using:

```text
Subqueries
```

Subqueries are one of the most powerful features of SQL and are heavily used in:

* Data Analytics
* Business Intelligence
* Financial Reporting
* Data Engineering
* Database Administration

---

# 🎯 Learning Objectives

After completing this module, you will be able to:

* Understand Subqueries
* Write Scalar Subqueries
* Write Multi-Row Subqueries
* Write Correlated Subqueries
* Use IN
* Use EXISTS
* Use NOT EXISTS
* Compare IN vs EXISTS
* Use Subqueries in SELECT
* Use Subqueries in FROM
* Build advanced business reports

---

# 🗺️ Module Roadmap

```text
Introduction to Subqueries
          ↓
Scalar Subqueries
          ↓
Multi-Row Subqueries
          ↓
Subqueries in WHERE
          ↓
Subqueries in SELECT
          ↓
Subqueries in FROM
          ↓
Correlated Subqueries
          ↓
EXISTS
          ↓
NOT EXISTS
          ↓
IN vs EXISTS
          ↓
Business Reporting
```

---

# 📚 Lessons

---

## Lesson 01: Introduction to Subqueries

### Topics Covered

* What is a Subquery?
* Why Subqueries Matter
* Query Nesting
* Real-world Use Cases

### Skills Gained

* Understanding nested queries
* Query decomposition

---

## Lesson 02: Scalar Subqueries

### Topics Covered

* Single-value subqueries
* Aggregate functions inside subqueries
* Comparison operators

### Example

```sql
SELECT *
FROM Books
WHERE BookPrice >
(
    SELECT AVG(BookPrice)
    FROM Books
);
```

### Skills Gained

* Business comparisons
* Threshold analysis

---

## Lesson 03: Multi-Row Subqueries

### Topics Covered

* IN operator
* Multiple-row results
* Set-based filtering

### Example

```sql
SELECT *
FROM Books
WHERE CategoryID IN
(
    SELECT CategoryID
    FROM Categories
);
```

### Skills Gained

* Filtering from dynamic lists

---

## Lesson 04: Subqueries in WHERE Clause

### Topics Covered

* Dynamic filtering
* Nested conditions
* Business rules

### Skills Gained

* Advanced filtering

---

## Lesson 05: Subqueries in SELECT Clause

### Topics Covered

* Derived columns
* Inline calculations
* KPI reporting

### Skills Gained

* Dashboard development

---

## Lesson 06: Subqueries in FROM Clause

### Topics Covered

* Derived tables
* Virtual tables
* Temporary result sets

### Skills Gained

* Report building

---

## Lesson 07: Correlated Subqueries

### Topics Covered

* Row-by-row execution
* Outer query references
* Advanced logic

### Skills Gained

* Complex analytical queries

---

## Lesson 08: EXISTS and NOT EXISTS

### Topics Covered

* Existence checking
* Missing data analysis
* Relationship validation

### Skills Gained

* Data auditing

---

## Lesson 09: IN vs EXISTS

### Topics Covered

* Performance considerations
* Query optimization
* Best practices

### Skills Gained

* Efficient query writing

---

## Lesson 10: Business Reports with Subqueries

### Topics Covered

* Executive dashboards
* KPI calculations
* Analytical reports

### Skills Gained

* Professional reporting

---

# 📊 Sample Database

Continue using:

```text
LibraryManagementSystem
```

---

# Tables Used

```text
Categories
Publishers
Authors
Books
BookAuthors
Members
BorrowRecords
Reservations
```

---

# 💼 Business Questions You'll Answer

---

## Books Above Average Price

```sql
SELECT *
FROM Books
WHERE BookPrice >
(
    SELECT AVG(BookPrice)
    FROM Books
);
```

---

## Members With Reservations

```sql
SELECT *
FROM Members M
WHERE EXISTS
(
    SELECT 1
    FROM Reservations R
    WHERE R.MemberID = M.MemberID
);
```

---

## Books Never Borrowed

```sql
SELECT *
FROM Books B
WHERE NOT EXISTS
(
    SELECT 1
    FROM BorrowRecords BR
    WHERE BR.BookID = B.BookID
);
```

---

## Most Active Members

```sql
SELECT *
FROM Members
WHERE MemberID IN
(
    SELECT MemberID
    FROM BorrowRecords
);
```

---

# 🔍 Types of Subqueries

---

## Scalar Subquery

Returns:

```text
Single Value
```

Example:

```sql
SELECT AVG(BookPrice)
FROM Books;
```

---

## Multi-Row Subquery

Returns:

```text
Multiple Rows
```

Example:

```sql
SELECT CategoryID
FROM Categories;
```

---

## Correlated Subquery

Depends on:

```text
Outer Query
```

Example:

```sql
SELECT *
FROM Members M
WHERE EXISTS
(
    SELECT 1
    FROM BorrowRecords BR
    WHERE BR.MemberID = M.MemberID
);
```

---

# 📂 Module Structure

```text
Module-06-SQL-Subqueries-and-Nested-Queries/
│
├── README.md
│
├── lessons/
│   ├── 01-Introduction-to-Subqueries.md
│   ├── 02-Scalar-Subqueries.md
│   ├── 03-Multi-Row-Subqueries.md
│   ├── 04-Subqueries-in-WHERE-Clause.md
│   ├── 05-Subqueries-in-SELECT-Clause.md
│   ├── 06-Subqueries-in-FROM-Clause.md
│   ├── 07-Correlated-Subqueries.md
│   ├── 08-EXISTS-and-NOT-EXISTS.md
│   ├── 09-IN-vs-EXISTS.md
│   └── 10-Business-Reports-with-Subqueries.md
│
├── exercises/
├── solutions/
├── projects/
├── cheatsheets/
├── datasets/
└── assets/
```

---

# 📝 Exercises

This module includes:

### Exercise 01

Introduction to Subqueries

### Exercise 02

Scalar Subqueries

### Exercise 03

Multi-Row Subqueries

### Exercise 04

Subqueries in WHERE

### Exercise 05

Subqueries in SELECT

### Exercise 06

Subqueries in FROM

### Exercise 07

Correlated Subqueries

### Exercise 08

EXISTS and NOT EXISTS

### Exercise 09

Business Reporting

### Exercise 10

Module Assessment

---

# 🚀 Project

## Library Analytics System

Build advanced reports such as:

* Books Above Average Price
* Most Active Members
* Books Never Borrowed
* Members With Reservations
* Publisher Performance
* Author Productivity
* Executive KPI Dashboard

Using:

```text
Scalar Subqueries

Correlated Subqueries

EXISTS

NOT EXISTS

IN

Derived Tables
```

---

# 📚 Prerequisites

Before starting this module, you should understand:

```text
SELECT

WHERE

ORDER BY

Aggregate Functions

GROUP BY

HAVING

JOINS
```

These concepts were covered in Modules 01–05.

---

# 🌍 Real-World Applications

Subqueries are used in:

### Business Intelligence

```text
KPI Dashboards

Performance Reports

Executive Summaries
```

---

### Data Analytics

```text
Customer Segmentation

Behavior Analysis

Trend Reporting
```

---

### Enterprise Systems

```text
ERP Systems

CRM Systems

Inventory Management

Financial Systems
```

---

# 🎓 Expected Outcome

After completing this module, you will be able to:

✅ Write Scalar Subqueries

✅ Write Multi-Row Subqueries

✅ Use Correlated Subqueries

✅ Use EXISTS and NOT EXISTS

✅ Build KPI Dashboards

✅ Create Analytical Reports

✅ Solve Complex SQL Problems

---

# 🔜 What's Next?

After Module 06, you'll move to:

# Module 07: SQL Views and Stored Procedures

Topics include:

* Views
* Indexed Views
* Stored Procedures
* Parameters
* Output Parameters
* Dynamic SQL
* Reusable Database Objects

---

# 🏁 Module Goal

By the end of Module 06, you will be able to solve complex business problems using nested SQL queries, dynamic filtering, correlated logic, and advanced reporting techniques commonly used in professional data analytics and business intelligence environments.
