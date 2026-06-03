# Lesson 04: INNER JOIN with Multiple Tables

> Learn how to join three or more tables to create complete business reports and retrieve information from complex relational databases.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Join multiple tables using INNER JOIN
* Understand multi-table relationships
* Build complete business reports
* Use multiple JOIN conditions
* Work with relational database structures
* Create inventory and activity reports
* Apply professional SQL join techniques

---

# Introduction

In the previous lesson, you learned how to join two tables.

Example:

```sql id="mtj001"
SELECT
    B.Title,
    C.CategoryName
FROM Books B
INNER JOIN Categories C
    ON B.CategoryID = C.CategoryID;
```

---

But real-world reports rarely use only two tables.

Management usually asks questions such as:

```text id="mtj002"
Show the book title.

Show the category.

Show the publisher.

Show the author.
```

This information exists in multiple tables.

To solve this, SQL allows multiple INNER JOINs.

---

# Library Database Structure

```text id="mtj003"
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

# What is a Multi-Table Join?

A multi-table join combines three or more related tables into one result set.

Visualization:

```text id="mtj004"
Table A
   │
Table B
   │
Table C
   │
Table D
```

↓

```text id="mtj005"
Single Report
```

---

# Basic Syntax

```sql id="mtj006"
SELECT
    Columns
FROM Table1 T1
INNER JOIN Table2 T2
    ON T1.ID = T2.ID
INNER JOIN Table3 T3
    ON T2.ID = T3.ID;
```

---

# Example 1: Books + Categories + Publishers

Business Question:

```text id="mtj007"
Show every book,
its category,
and its publisher.
```

---

Query:

```sql id="mtj008"
SELECT
    B.Title,
    C.CategoryName,
    P.PublisherName
FROM Books B
INNER JOIN Categories C
    ON B.CategoryID = C.CategoryID
INNER JOIN Publishers P
    ON B.PublisherID = P.PublisherID;
```

---

# Result

| Title        | Category    | Publisher |
| ------------ | ----------- | --------- |
| SQL Basics   | Technology  | TechPress |
| Python Guide | Programming | CodeBooks |

---

# Understanding the Join

Step 1

```text id="mtj009"
Books
+
Categories
```

↓

Step 2

```text id="mtj010"
Result
+
Publishers
```

↓

Final Report

---

# Example 2: Books + Authors

Books and Authors have a Many-to-Many relationship.

Therefore:

```text id="mtj011"
Books
   ↓
BookAuthors
   ↓
Authors
```

---

Query:

```sql id="mtj012"
SELECT
    B.Title,
    A.AuthorName
FROM Books B
INNER JOIN BookAuthors BA
    ON B.BookID = BA.BookID
INNER JOIN Authors A
    ON BA.AuthorID = A.AuthorID;
```

---

# Result

| Title      | Author     |
| ---------- | ---------- |
| SQL Basics | John Smith |
| SQL Basics | Jane Brown |

---

# Why BookAuthors?

Books and Authors cannot be connected directly.

BookAuthors acts as a junction table.

```text id="mtj013"
Books
   ↕
BookAuthors
   ↕
Authors
```

---

# Example 3: Complete Book Inventory

Business Question:

```text id="mtj014"
Show complete information
for every book.
```

---

Query:

```sql id="mtj015"
SELECT
    B.Title,
    C.CategoryName,
    P.PublisherName,
    A.AuthorName,
    B.BookPrice,
    B.PublicationYear
FROM Books B
INNER JOIN Categories C
    ON B.CategoryID = C.CategoryID
INNER JOIN Publishers P
    ON B.PublisherID = P.PublisherID
INNER JOIN BookAuthors BA
    ON B.BookID = BA.BookID
INNER JOIN Authors A
    ON BA.AuthorID = A.AuthorID;
```

---

# Tables Used

```text id="mtj016"
Books

Categories

Publishers

BookAuthors

Authors
```

---

# Example 4: Borrowing Activity Report

Business Question:

```text id="mtj017"
Which member borrowed which book?
```

---

Tables:

```text id="mtj018"
Members

BorrowRecords

Books
```

---

Query:

```sql id="mtj019"
SELECT
    M.FirstName,
    B.Title,
    BR.BorrowDate,
    BR.DueDate
FROM BorrowRecords BR
INNER JOIN Members M
    ON BR.MemberID = M.MemberID
INNER JOIN Books B
    ON BR.BookID = B.BookID;
```

---

# Result

| Member | Book         | BorrowDate |
| ------ | ------------ | ---------- |
| Alice  | SQL Basics   | 2025-01-01 |
| Bob    | Python Guide | 2025-01-05 |

---

# Example 5: Reservation Report

Business Question:

```text id="mtj020"
Which members reserved which books?
```

---

Query:

```sql id="mtj021"
SELECT
    M.FirstName,
    B.Title,
    R.ReservationDate,
    R.Status
FROM Reservations R
INNER JOIN Members M
    ON R.MemberID = M.MemberID
INNER JOIN Books B
    ON R.BookID = B.BookID;
```

---

# Example 6: Author + Book + Publisher

```sql id="mtj022"
SELECT
    A.AuthorName,
    B.Title,
    P.PublisherName
FROM Authors A
INNER JOIN BookAuthors BA
    ON A.AuthorID = BA.AuthorID
INNER JOIN Books B
    ON BA.BookID = B.BookID
INNER JOIN Publishers P
    ON B.PublisherID = P.PublisherID;
```

---

# Join Order

Although SQL optimizes joins internally, writing them logically improves readability.

Recommended:

```text id="mtj023"
Main Table
     ↓
Related Table
     ↓
Additional Table
     ↓
Further Tables
```

---

# Visual Flow

```text id="mtj024"
Books
  ↓
Categories
  ↓
Publishers
  ↓
Authors
```

↓

```text id="mtj025"
Single Report
```

---

# Multi-Table Reporting Example

Create a library inventory dashboard.

```sql id="mtj026"
SELECT
    B.BookID,
    B.Title,
    C.CategoryName,
    P.PublisherName,
    B.BookPrice
FROM Books B
INNER JOIN Categories C
    ON B.CategoryID = C.CategoryID
INNER JOIN Publishers P
    ON B.PublisherID = P.PublisherID
ORDER BY B.Title;
```

---

# Common Beginner Mistakes

---

## Missing Join Condition

Bad:

```sql id="mtj027"
INNER JOIN Authors A
```

Without:

```sql id="mtj028"
ON BA.AuthorID = A.AuthorID
```

---

## Wrong Join Sequence

Bad:

```sql id="mtj029"
Books
     ↓
Authors
```

Direct join impossible.

Use:

```text id="mtj030"
Books
     ↓
BookAuthors
     ↓
Authors
```

---

## Using Wrong Columns

Bad:

```sql id="mtj031"
ON Books.BookID =
   Authors.AuthorID
```

---

Correct:

```sql id="mtj032"
ON BA.AuthorID =
   Authors.AuthorID
```

---

## Ignoring Aliases

Aliases improve readability significantly.

---

# Hands-On Practice

Run:

```sql id="mtj033"
SELECT
    B.Title,
    C.CategoryName,
    P.PublisherName
FROM Books B
INNER JOIN Categories C
    ON B.CategoryID = C.CategoryID
INNER JOIN Publishers P
    ON B.PublisherID = P.PublisherID;
```

---

Run:

```sql id="mtj034"
SELECT
    B.Title,
    A.AuthorName
FROM Books B
INNER JOIN BookAuthors BA
    ON B.BookID = BA.BookID
INNER JOIN Authors A
    ON BA.AuthorID = A.AuthorID;
```

---

Run:

```sql id="mtj035"
SELECT
    M.FirstName,
    B.Title,
    BR.BorrowDate
FROM BorrowRecords BR
INNER JOIN Members M
    ON BR.MemberID = M.MemberID
INNER JOIN Books B
    ON BR.BookID = B.BookID;
```

---

# Mini Exercise

### Task 1

Display:

```text id="mtj036"
Book Title
Category Name
Publisher Name
```

---

### Task 2

Display:

```text id="mtj037"
Book Title
Author Name
```

---

### Task 3

Display:

```text id="mtj038"
Member Name
Book Title
Borrow Date
```

---

### Task 4

Display:

```text id="mtj039"
Member Name
Book Title
Reservation Date
```

---

### Task 5

Create a complete inventory report showing:

```text id="mtj040"
Book Title
Author
Category
Publisher
Price
```

---

# Best Practices

✅ Use table aliases

✅ Join through proper relationships

✅ Use junction tables for many-to-many relationships

✅ Format joins consistently

✅ Keep queries readable

✅ Verify join conditions carefully

---

# Summary

In this lesson, you learned:

* Multi-table INNER JOINs
* Joining three or more tables
* Junction tables
* Many-to-Many relationships
* Inventory reports
* Borrowing reports
* Reservation reports

Multi-table joins are essential for building real-world business reports and analytical dashboards.

---

# Knowledge Check

### Question 1

How many tables can INNER JOIN combine?

A. Two only

B. Three only

C. Unlimited (practical limits apply)

D. Four only

---

### Question 2

Which table connects Books and Authors?

A. BorrowRecords

B. Reservations

C. BookAuthors

D. Categories

---

### Question 3

What type of relationship exists between Books and Authors?

A. One-to-One

B. One-to-Many

C. Many-to-Many

D. None

---

### Question 4

Which clause defines the relationship between tables?

A. WHERE

B. ON

C. ORDER BY

D. GROUP BY

---

### Question 5

Should aliases be used in multi-table joins?

A. Yes

B. No

---

# Next Lesson

➡️ 05-LEFT-JOIN.md

In the next lesson, you'll learn how LEFT JOIN returns all records from the left table and helps identify missing or unmatched data.
