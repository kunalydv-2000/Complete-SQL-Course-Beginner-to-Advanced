# Lesson 05: LEFT JOIN

> Learn how to use LEFT JOIN to return all records from the left table and identify missing or unmatched data.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand LEFT JOIN
* Compare INNER JOIN and LEFT JOIN
* Return all records from the left table
* Identify missing relationships
* Find unmatched records
* Analyze incomplete data
* Build audit and exception reports

---

# Introduction

In previous lessons, you learned:

```sql id="lj001"
INNER JOIN
```

INNER JOIN returns:

```text id="lj002"
Only Matching Records
```

Example:

Books

| BookID | Title              |
| ------ | ------------------ |
| 1      | SQL Basics         |
| 2      | Python Guide       |
| 3      | Excel Fundamentals |

---

BorrowRecords

| BorrowID | BookID |
| -------- | ------ |
| 1        | 1      |
| 2        | 2      |

---

Question:

```text id="lj003"
Which books have never been borrowed?
```

INNER JOIN cannot answer this easily because unmatched rows are excluded.

SQL provides:

```sql id="lj004"
LEFT JOIN
```

---

# What is LEFT JOIN?

LEFT JOIN returns:

```text id="lj005"
All Rows From Left Table

+

Matching Rows From Right Table
```

If no match exists:

```text id="lj006"
NULL values are returned
```

---

# Visual Representation

```text id="lj007"
LEFT TABLE
     +
Matching Rows
```

---

# Basic Syntax

```sql id="lj008"
SELECT
    Columns
FROM TableA A
LEFT JOIN TableB B
    ON A.ID = B.ID;
```

---

# Understanding LEFT JOIN

Example:

Books

| BookID | Title              |
| ------ | ------------------ |
| 1      | SQL Basics         |
| 2      | Python Guide       |
| 3      | Excel Fundamentals |

---

BorrowRecords

| BorrowID | BookID |
| -------- | ------ |
| 1        | 1      |
| 2        | 2      |

---

Query:

```sql id="lj009"
SELECT
    B.Title,
    BR.BorrowID
FROM Books B
LEFT JOIN BorrowRecords BR
    ON B.BookID = BR.BookID;
```

---

# Result

| Title              | BorrowID |
| ------------------ | -------- |
| SQL Basics         | 1        |
| Python Guide       | 2        |
| Excel Fundamentals | NULL     |

---

Notice:

```text id="lj010"
Excel Fundamentals appears
even though it has never been borrowed.
```

---

# LEFT JOIN vs INNER JOIN

## INNER JOIN

```sql id="lj011"
SELECT
    B.Title,
    BR.BorrowID
FROM Books B
INNER JOIN BorrowRecords BR
    ON B.BookID = BR.BookID;
```

---

Result:

| Title        |
| ------------ |
| SQL Basics   |
| Python Guide |

---

Excel Fundamentals is excluded.

---

## LEFT JOIN

```sql id="lj012"
SELECT
    B.Title,
    BR.BorrowID
FROM Books B
LEFT JOIN BorrowRecords BR
    ON B.BookID = BR.BookID;
```

---

Result:

| Title              |
| ------------------ |
| SQL Basics         |
| Python Guide       |
| Excel Fundamentals |

---

# Finding Unmatched Records

This is the most common use of LEFT JOIN.

---

# Books Never Borrowed

```sql id="lj013"
SELECT
    B.Title
FROM Books B
LEFT JOIN BorrowRecords BR
    ON B.BookID = BR.BookID
WHERE BR.BorrowID IS NULL;
```

---

Result:

| Title              |
| ------------------ |
| Excel Fundamentals |

---

Explanation:

```text id="lj014"
No matching BorrowRecord exists.
```

---

# Members Without Borrow Records

Business Question:

```text id="lj015"
Which members never borrowed a book?
```

---

Query:

```sql id="lj016"
SELECT
    M.FirstName,
    M.LastName,
    M.Email
FROM Members M
LEFT JOIN BorrowRecords BR
    ON M.MemberID = BR.MemberID
WHERE BR.BorrowID IS NULL;
```

---

# Members Without Reservations

Business Question:

```text id="lj017"
Which members never reserved a book?
```

---

Query:

```sql id="lj018"
SELECT
    M.FirstName,
    M.LastName
FROM Members M
LEFT JOIN Reservations R
    ON M.MemberID = R.MemberID
WHERE R.ReservationID IS NULL;
```

---

# Categories Without Books

Business Question:

```text id="lj019"
Which categories contain no books?
```

---

Query:

```sql id="lj020"
SELECT
    C.CategoryName
FROM Categories C
LEFT JOIN Books B
    ON C.CategoryID = B.CategoryID
WHERE B.BookID IS NULL;
```

---

# Publishers Without Books

```sql id="lj021"
SELECT
    P.PublisherName
FROM Publishers P
LEFT JOIN Books B
    ON P.PublisherID = B.PublisherID
WHERE B.BookID IS NULL;
```

---

# LEFT JOIN with Multiple Tables

Example:

```sql id="lj022"
SELECT
    M.FirstName,
    B.Title,
    BR.BorrowDate
FROM Members M
LEFT JOIN BorrowRecords BR
    ON M.MemberID = BR.MemberID
LEFT JOIN Books B
    ON BR.BookID = B.BookID;
```

---

Purpose:

```text id="lj023"
Show all members,
including those who never borrowed books.
```

---

# Understanding NULL Values

When no match exists:

```text id="lj024"
SQL returns NULL
```

Example:

| Member | BorrowDate |
| ------ | ---------- |
| Alice  | 2025-01-01 |
| Bob    | NULL       |

---

Meaning:

```text id="lj025"
Bob never borrowed a book.
```

---

# Business Example 1

Unused Books Report

```sql id="lj026"
SELECT
    B.Title
FROM Books B
LEFT JOIN BorrowRecords BR
    ON B.BookID = BR.BookID
WHERE BR.BorrowID IS NULL;
```

---

# Business Example 2

Inactive Members Report

```sql id="lj027"
SELECT
    M.FirstName,
    M.LastName
FROM Members M
LEFT JOIN BorrowRecords BR
    ON M.MemberID = BR.MemberID
WHERE BR.BorrowID IS NULL;
```

---

# Business Example 3

Publishers Without Books

```sql id="lj028"
SELECT
    P.PublisherName
FROM Publishers P
LEFT JOIN Books B
    ON P.PublisherID = B.PublisherID
WHERE B.BookID IS NULL;
```

---

# Query Execution Flow

```text id="lj029"
FROM
 ↓
LEFT JOIN
 ↓
ON
 ↓
WHERE
 ↓
SELECT
 ↓
ORDER BY
```

---

# Common Beginner Mistakes

---

## Using INNER JOIN Instead of LEFT JOIN

Bad:

```sql id="lj030"
SELECT
    B.Title
FROM Books B
INNER JOIN BorrowRecords BR
    ON B.BookID = BR.BookID;
```

---

Problem:

```text id="lj031"
Unmatched books disappear.
```

---

## Forgetting IS NULL

Bad:

```sql id="lj032"
SELECT
    B.Title
FROM Books B
LEFT JOIN BorrowRecords BR
    ON B.BookID = BR.BookID;
```

---

Correct:

```sql id="lj033"
WHERE BR.BorrowID IS NULL
```

---

## Filtering Wrong Column

Bad:

```sql id="lj034"
WHERE B.BookID IS NULL
```

---

Correct:

```sql id="lj035"
WHERE BR.BorrowID IS NULL
```

---

# Hands-On Practice

Run:

```sql id="lj036"
SELECT
    B.Title,
    BR.BorrowID
FROM Books B
LEFT JOIN BorrowRecords BR
    ON B.BookID = BR.BookID;
```

---

Run:

```sql id="lj037"
SELECT
    B.Title
FROM Books B
LEFT JOIN BorrowRecords BR
    ON B.BookID = BR.BookID
WHERE BR.BorrowID IS NULL;
```

---

Run:

```sql id="lj038"
SELECT
    M.FirstName,
    M.LastName
FROM Members M
LEFT JOIN BorrowRecords BR
    ON M.MemberID = BR.MemberID
WHERE BR.BorrowID IS NULL;
```

---

# Mini Exercise

### Task 1

Display all books and borrow records.

---

### Task 2

Display books that were never borrowed.

---

### Task 3

Display members who never borrowed books.

---

### Task 4

Display members who never created reservations.

---

### Task 5

Display categories that contain no books.

---

# Best Practices

✅ Use LEFT JOIN for missing-data analysis

✅ Use IS NULL to find unmatched rows

✅ Use aliases consistently

✅ Join on PK ↔ FK relationships

✅ Verify business requirements carefully

---

# Summary

In this lesson, you learned:

* LEFT JOIN fundamentals
* Matching and non-matching records
* NULL values
* Finding missing relationships
* Books never borrowed
* Members without activity
* Categories without books

LEFT JOIN is one of the most useful tools for auditing data, finding gaps, and identifying business exceptions.

---

# Knowledge Check

### Question 1

What does LEFT JOIN return?

A. Matching rows only

B. All left rows and matching right rows

C. All right rows

D. No rows

---

### Question 2

What value appears when no match exists?

A. 0

B. Empty String

C. NULL

D. FALSE

---

### Question 3

Which query finds books never borrowed?

A.

```sql id="q1"
INNER JOIN
```

B.

```sql id="q2"
LEFT JOIN + IS NULL
```

---

### Question 4

Which table's rows are always returned?

```sql id="q3"
Books
LEFT JOIN BorrowRecords
```

A. Books

B. BorrowRecords

---

### Question 5

What is the most common use of LEFT JOIN?

A. Delete records

B. Find unmatched records

C. Update records

D. Create tables

---

# Next Lesson

➡️ 06-RIGHT-JOIN-and-FULL-OUTER-JOIN.md

In the next lesson, you'll learn how RIGHT JOIN and FULL OUTER JOIN help analyze complete datasets and identify unmatched records from both sides of a relationship.
