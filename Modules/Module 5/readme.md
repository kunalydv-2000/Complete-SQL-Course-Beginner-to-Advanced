# Module 05: SQL Joins and Relationships

> Learn how to combine data from multiple tables using SQL JOIN operations and build real-world relational database reports.

---

# 📖 Module Overview

So far, you've worked primarily with single tables.

Examples:

```sql
SELECT *
FROM Books;

SELECT *
FROM Members;
```

However, real-world databases store information across multiple related tables.

For example:

```text
Books
Authors
Publishers
Categories
Members
BorrowRecords
Reservations
```

To answer business questions, data from these tables must be combined.

Examples:

```text
Which author wrote a specific book?

Which publisher published a book?

Which members borrowed books?

Which books are currently borrowed?

Which categories contain the most borrowed books?
```

SQL solves these problems using:

```text
JOINS
```

Joins are one of the most important concepts in relational databases and are used extensively in:

* Data Analysis
* Business Intelligence
* Reporting
* Dashboard Development
* Database Administration
* Data Engineering

---

# 🎯 Learning Objectives

After completing this module, you will be able to:

* Understand table relationships
* Understand Primary Keys and Foreign Keys
* Use INNER JOIN
* Use LEFT JOIN
* Use RIGHT JOIN
* Use FULL OUTER JOIN
* Use SELF JOIN
* Join multiple tables
* Build relational reports
* Create business intelligence queries

---

# 🗺️ Module Roadmap

```text
Database Relationships
          ↓
Primary Keys
          ↓
Foreign Keys
          ↓
INNER JOIN
          ↓
LEFT JOIN
          ↓
RIGHT JOIN
          ↓
FULL OUTER JOIN
          ↓
SELF JOIN
          ↓
Multiple Table Joins
          ↓
Business Reports
```

---

# 📚 Lessons

---

## Lesson 01: Introduction to Database Relationships

### Topics Covered

* What are relationships?
* Why relationships matter
* One-to-One relationships
* One-to-Many relationships
* Many-to-Many relationships

### Skills Gained

* Understanding relational databases
* Relationship modeling

---

## Lesson 02: Primary Keys and Foreign Keys

### Topics Covered

* Primary Key concepts
* Foreign Key concepts
* Referential integrity
* Relationship creation

### Skills Gained

* Understanding table connections
* Database design fundamentals

---

## Lesson 03: Introduction to INNER JOIN

### Topics Covered

* INNER JOIN syntax
* Matching records
* Combining tables

### Example

```sql
SELECT
    B.Title,
    C.CategoryName
FROM Books B
INNER JOIN Categories C
    ON B.CategoryID = C.CategoryID;
```

### Skills Gained

* Basic table joins
* Data combination

---

## Lesson 04: INNER JOIN with Multiple Tables

### Topics Covered

* Joining three tables
* Joining four tables
* Complex reports

### Skills Gained

* Multi-table analysis
* Business reporting

---

## Lesson 05: LEFT JOIN

### Topics Covered

* Left-side record retention
* Missing data analysis
* Optional relationships

### Skills Gained

* Data completeness analysis
* Audit reporting

---

## Lesson 06: RIGHT JOIN and FULL OUTER JOIN

### Topics Covered

* RIGHT JOIN
* FULL OUTER JOIN
* Unmatched records

### Skills Gained

* Advanced relational analysis
* Data reconciliation

---

## Lesson 07: SELF JOIN

### Topics Covered

* Self-referencing tables
* Hierarchical relationships
* Employee-manager structures

### Skills Gained

* Recursive relationship analysis

---

## Lesson 08: Many-to-Many Relationships

### Topics Covered

* Junction tables
* BookAuthors table
* Relationship mapping

### Skills Gained

* Advanced database modeling

---

## Lesson 09: Business Reports with Joins

### Topics Covered

* Borrowing reports
* Book inventory reports
* Reservation reports
* Management dashboards

### Skills Gained

* Real-world reporting

---

## Lesson 10: Join Best Practices

### Topics Covered

* Query optimization
* Aliases
* Readability
* Performance

### Skills Gained

* Professional SQL development

---

# 🔗 Relationship Overview

Library Database Relationships:

```text
Categories
    │
    └──── Books
              │
              ├──── BorrowRecords
              │
              ├──── Reservations
              │
              └──── BookAuthors
                        │
                        └──── Authors

Publishers
    │
    └──── Books

Members
    │
    ├──── BorrowRecords
    │
    └──── Reservations
```

---

# 📊 Sample Database

Continue using:

```text
LibraryManagementSystem
```

---

## Tables Used

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

## Which books belong to each category?

```sql
SELECT
    B.Title,
    C.CategoryName
FROM Books B
INNER JOIN Categories C
    ON B.CategoryID = C.CategoryID;
```

---

## Which publisher published each book?

```sql
SELECT
    B.Title,
    P.PublisherName
FROM Books B
INNER JOIN Publishers P
    ON B.PublisherID = P.PublisherID;
```

---

## Which member borrowed which book?

```sql
SELECT
    M.FirstName,
    B.Title
FROM BorrowRecords BR
INNER JOIN Members M
    ON BR.MemberID = M.MemberID
INNER JOIN Books B
    ON BR.BookID = B.BookID;
```

---

## Which books have never been borrowed?

```sql
SELECT
    B.Title
FROM Books B
LEFT JOIN BorrowRecords BR
    ON B.BookID = BR.BookID
WHERE BR.BorrowID IS NULL;
```

---

# 📂 Module Structure

```text
Module-05-SQL-Joins-and-Relationships/
│
├── README.md
│
├── lessons/
│   ├── 01-Introduction-to-Database-Relationships.md
│   ├── 02-Primary-Keys-and-Foreign-Keys.md
│   ├── 03-Introduction-to-INNER-JOIN.md
│   ├── 04-INNER-JOIN-with-Multiple-Tables.md
│   ├── 05-LEFT-JOIN.md
│   ├── 06-RIGHT-and-FULL-OUTER-JOIN.md
│   ├── 07-SELF-JOIN.md
│   ├── 08-Many-to-Many-Relationships.md
│   ├── 09-Business-Reports-with-Joins.md
│   └── 10-Join-Best-Practices.md
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

Database Relationships

### Exercise 02

Primary & Foreign Keys

### Exercise 03

INNER JOIN

### Exercise 04

Multiple Table Joins

### Exercise 05

LEFT JOIN

### Exercise 06

OUTER JOINs

### Exercise 07

Business Reporting

### Exercise 08

Module Assessment

---

# 🚀 Project

## Library Reporting System

Build reports such as:

* Books with Categories
* Books with Publishers
* Books with Authors
* Borrowing Reports
* Reservation Reports
* Inventory Reports
* Executive Dashboards

Using:

```text
INNER JOIN
LEFT JOIN
RIGHT JOIN
FULL OUTER JOIN
SELF JOIN
```

---

# 📚 Prerequisites

Before starting this module, you should understand:

* SELECT
* WHERE
* ORDER BY
* Aggregate Functions
* GROUP BY
* HAVING

These concepts were covered in Modules 03 and 04.

---

# 🌍 Real-World Applications

Joins are used in:

### Business Intelligence

```text
Sales Reports
Customer Analytics
Financial Dashboards
```

### Data Analytics

```text
Customer Orders
Product Performance
Operational Reports
```

### Enterprise Applications

```text
ERP Systems
CRM Systems
HR Systems
Inventory Systems
```

---

# 🎓 Expected Outcome

After completing this module, you will be able to:

✅ Combine multiple tables

✅ Understand relationships

✅ Write INNER JOIN queries

✅ Write OUTER JOIN queries

✅ Create relational reports

✅ Build real-world dashboards

✅ Analyze connected business data

---

# 🔜 What's Next?

After Module 05, you'll move to:

# Module 06: SQL Subqueries and Nested Queries

Topics include:

* Scalar Subqueries
* Correlated Subqueries
* Nested Queries
* EXISTS
* NOT EXISTS
* IN vs EXISTS

---

# 🏁 Module Goal

By the end of Module 05, you will understand how relational databases connect information across tables and how to use SQL joins to build professional business reports and analytical solutions.
