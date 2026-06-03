# Lesson 03: Introduction to INNER JOIN

> Learn how to combine data from related tables using INNER JOIN, the most commonly used SQL join operation.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand INNER JOIN
* Combine data from multiple tables
* Use JOIN conditions
* Retrieve related information
* Understand matching records
* Use table aliases
* Build relational reports

---

# Introduction

In previous lessons, you learned:

```text id="ij001"
Relationships

Primary Keys

Foreign Keys
```

Relationships connect tables.

However, the data is still stored separately.

Example:

### Books Table

| BookID | Title        | CategoryID |
| ------ | ------------ | ---------- |
| 1      | SQL Basics   | 1          |
| 2      | Python Guide | 2          |

---

### Categories Table

| CategoryID | CategoryName |
| ---------- | ------------ |
| 1          | Technology   |
| 2          | Programming  |

---

Question:

```text id="ij002"
How can we display:

Book Title
Category Name
```

in one result?

SQL uses:

```sql id="ij003"
INNER JOIN
```

---

# What is INNER JOIN?

INNER JOIN combines rows from two tables when matching values exist in both tables.

Visualization:

```text id="ij004"
Table A
    ∩
Table B

Only Matching Rows
```

---

# Basic Syntax

```sql id="ij005"
SELECT
    ColumnList
FROM TableA
INNER JOIN TableB
    ON TableA.Column = TableB.Column;
```

---

# Understanding the ON Clause

The ON clause defines how tables are connected.

Example:

```sql id="ij006"
ON Books.CategoryID = Categories.CategoryID
```

Meaning:

```text id="ij007"
Match books to categories
using CategoryID
```

---

# First INNER JOIN Example

```sql id="ij008"
SELECT
    Books.Title,
    Categories.CategoryName
FROM Books
INNER JOIN Categories
    ON Books.CategoryID = Categories.CategoryID;
```

---

# Result

| Title        | CategoryName |
| ------------ | ------------ |
| SQL Basics   | Technology   |
| Python Guide | Programming  |

---

SQL combines rows where:

```text id="ij009"
CategoryID matches
```

---

# Using Table Aliases

Aliases make queries shorter and easier to read.

---

Without Aliases

```sql id="ij010"
SELECT
    Books.Title,
    Categories.CategoryName
FROM Books
INNER JOIN Categories
    ON Books.CategoryID = Categories.CategoryID;
```

---

With Aliases

```sql id="ij011"
SELECT
    B.Title,
    C.CategoryName
FROM Books B
INNER JOIN Categories C
    ON B.CategoryID = C.CategoryID;
```

---

Alias Meaning:

```text id="ij012"
Books → B

Categories → C
```

---

# Books and Publishers

Books Table

| BookID | Title        | PublisherID |
| ------ | ------------ | ----------- |
| 1      | SQL Basics   | 1           |
| 2      | Python Guide | 2           |

---

Publishers Table

| PublisherID | PublisherName |
| ----------- | ------------- |
| 1           | TechPress     |
| 2           | CodeBooks     |

---

Query:

```sql id="ij013"
SELECT
    B.Title,
    P.PublisherName
FROM Books B
INNER JOIN Publishers P
    ON B.PublisherID = P.PublisherID;
```

---

Result:

| Title        | PublisherName |
| ------------ | ------------- |
| SQL Basics   | TechPress     |
| Python Guide | CodeBooks     |

---

# INNER JOIN with Borrow Records

Question:

```text id="ij014"
Which members borrowed which books?
```

---

Tables:

```text id="ij015"
Members

BorrowRecords

Books
```

---

Query:

```sql id="ij016"
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

# Result

| Member | Book         | BorrowDate |
| ------ | ------------ | ---------- |
| Alice  | SQL Basics   | 2025-01-01 |
| Bob    | Python Guide | 2025-01-03 |

---

# How INNER JOIN Works

Example:

### Categories

| CategoryID | CategoryName |
| ---------- | ------------ |
| 1          | Technology   |
| 2          | Science      |
| 3          | History      |

---

### Books

| Title       | CategoryID |
| ----------- | ---------- |
| SQL Basics  | 1          |
| Physics 101 | 2          |

---

Query:

```sql id="ij017"
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

Notice:

```text id="ij018"
History does not appear.
```

Why?

Because:

```text id="ij019"
No matching book exists.
```

---

# Matching Records Only

INNER JOIN returns:

```text id="ij020"
Matching Records Only
```

Unmatched rows are excluded.

---

# Business Example 1

Create a Book Catalog.

```sql id="ij021"
SELECT
    B.Title,
    C.CategoryName
FROM Books B
INNER JOIN Categories C
    ON B.CategoryID = C.CategoryID;
```

---

# Business Example 2

Books and Publishers.

```sql id="ij022"
SELECT
    B.Title,
    P.PublisherName
FROM Books B
INNER JOIN Publishers P
    ON B.PublisherID = P.PublisherID;
```

---

# Business Example 3

Reservations Report.

```sql id="ij023"
SELECT
    M.FirstName,
    B.Title,
    R.ReservationDate
FROM Reservations R
INNER JOIN Members M
    ON R.MemberID = M.MemberID
INNER JOIN Books B
    ON R.BookID = B.BookID;
```

---

# INNER JOIN Execution Flow

```text id="ij024"
FROM
 ↓
INNER JOIN
 ↓
ON
 ↓
SELECT
 ↓
ORDER BY
```

---

# Common Beginner Mistakes

---

## Missing ON Clause

Bad:

```sql id="ij025"
SELECT *
FROM Books
INNER JOIN Categories;
```

---

Correct:

```sql id="ij026"
SELECT *
FROM Books
INNER JOIN Categories
    ON Books.CategoryID =
       Categories.CategoryID;
```

---

## Wrong Join Columns

Bad:

```sql id="ij027"
ON Books.BookID =
   Categories.CategoryID
```

---

Correct:

```sql id="ij028"
ON Books.CategoryID =
   Categories.CategoryID
```

---

## Forgetting Aliases

Bad:

```sql id="ij029"
SELECT
    Books.Title,
    Categories.CategoryName
FROM Books
INNER JOIN Categories
    ON Books.CategoryID =
       Categories.CategoryID;
```

---

Better:

```sql id="ij030"
SELECT
    B.Title,
    C.CategoryName
FROM Books B
INNER JOIN Categories C
    ON B.CategoryID =
       C.CategoryID;
```

---

# Hands-On Practice

Run:

```sql id="ij031"
SELECT
    B.Title,
    C.CategoryName
FROM Books B
INNER JOIN Categories C
    ON B.CategoryID = C.CategoryID;
```

---

Run:

```sql id="ij032"
SELECT
    B.Title,
    P.PublisherName
FROM Books B
INNER JOIN Publishers P
    ON B.PublisherID = P.PublisherID;
```

---

Run:

```sql id="ij033"
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

```text id="ij034"
Book Title
Category Name
```

---

### Task 2

Display:

```text id="ij035"
Book Title
Publisher Name
```

---

### Task 3

Display:

```text id="ij036"
Member Name
Book Title
Borrow Date
```

---

### Task 4

Display:

```text id="ij037"
Member Name
Book Title
Reservation Date
```

---

### Task 5

Explain why INNER JOIN excludes unmatched records.

---

# Best Practices

✅ Use aliases

✅ Join on Primary Key ↔ Foreign Key

✅ Format joins consistently

✅ Use meaningful column names

✅ Verify join conditions

---

# Summary

In this lesson, you learned:

* INNER JOIN fundamentals
* Matching records
* ON clause
* Table aliases
* Combining tables
* Business reporting

INNER JOIN is the foundation of relational querying and is the most commonly used join type in SQL.

---

# Knowledge Check

### Question 1

What does INNER JOIN return?

A. All rows

B. Matching rows only

C. Left rows only

D. Right rows only

---

### Question 2

Which clause defines the join condition?

A. WHERE

B. GROUP BY

C. ON

D. HAVING

---

### Question 3

Which query is correct?

```sql id="q1"
SELECT
    B.Title,
    C.CategoryName
FROM Books B
INNER JOIN Categories C
    ON B.CategoryID = C.CategoryID;
```

A. Correct

B. Incorrect

---

### Question 4

What is the purpose of aliases?

A. Delete rows

B. Shorten table names

C. Create tables

D. Sort results

---

### Question 5

Does INNER JOIN return unmatched records?

A. Yes

B. No

---

# Next Lesson

➡️ 04-INNER-JOIN-with-Multiple-Tables.md

In the next lesson, you'll learn how to join three or more tables to create complete business reports and real-world analytical queries.
