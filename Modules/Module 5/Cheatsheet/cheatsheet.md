# SQL Joins and Relationships Cheat Sheet

> Quick reference guide for SQL Relationships, Primary Keys, Foreign Keys, and SQL Joins in SQL Server (SSMS).

---

# Database Relationship Fundamentals

Relational databases store data across multiple related tables.

Example:

```text
Books
Authors
Publishers
Members
BorrowRecords
Reservations
```

Relationships connect these tables.

---

# Relationship Types

## One-to-One (1:1)

One record in Table A matches one record in Table B.

Example:

```text
Employee
    ↔
EmployeeProfile
```

---

## One-to-Many (1:M)

One record in Table A matches many records in Table B.

Example:

```text
Category
    ↓
Books
```

One Category → Many Books

---

## Many-to-Many (M:N)

Many records in Table A match many records in Table B.

Example:

```text
Books
   ↕
Authors
```

Implemented using a junction table:

```text
BookAuthors
```

---

# Primary Key (PK)

A Primary Key uniquely identifies a row.

Example:

```sql
CREATE TABLE Books
(
    BookID INT PRIMARY KEY,
    Title VARCHAR(100)
);
```

---

# Primary Key Rules

✅ Unique

✅ Cannot be NULL

✅ One Primary Key per table

---

# Foreign Key (FK)

A Foreign Key creates a relationship between tables.

Example:

```sql
CREATE TABLE Books
(
    BookID INT PRIMARY KEY,
    CategoryID INT,

    FOREIGN KEY (CategoryID)
        REFERENCES Categories(CategoryID)
);
```

---

# Relationship Example

```text
Categories
-----------
CategoryID (PK)

Books
-----------
BookID (PK)
CategoryID (FK)
```

---

# Table Aliases

Aliases make joins easier to read.

Example:

```sql
SELECT *
FROM Books B;
```

Alias:

```text
Books → B
```

---

# INNER JOIN

Returns matching records from both tables.

---

## Syntax

```sql
SELECT
    ColumnList
FROM TableA A
INNER JOIN TableB B
    ON A.ID = B.ID;
```

---

## Example

```sql
SELECT
    B.Title,
    C.CategoryName
FROM Books B
INNER JOIN Categories C
    ON B.CategoryID = C.CategoryID;
```

---

## Result

```text
Only Matching Rows
```

---

# INNER JOIN Diagram

```text
Table A   ∩   Table B
```

---

# LEFT JOIN

Returns:

```text
All Rows From Left Table
+
Matching Rows From Right Table
```

---

## Syntax

```sql
SELECT
    ColumnList
FROM TableA A
LEFT JOIN TableB B
    ON A.ID = B.ID;
```

---

## Example

```sql
SELECT
    B.Title,
    BR.BorrowID
FROM Books B
LEFT JOIN BorrowRecords BR
    ON B.BookID = BR.BookID;
```

---

## Result

```text
All Books

Borrow Data When Available
```

---

# LEFT JOIN Diagram

```text
All Left
+
Matching Right
```

---

# Finding Unmatched Records

Books never borrowed:

```sql
SELECT
    B.Title
FROM Books B
LEFT JOIN BorrowRecords BR
    ON B.BookID = BR.BookID
WHERE BR.BorrowID IS NULL;
```

---

# RIGHT JOIN

Returns:

```text
All Rows From Right Table
+
Matching Rows From Left Table
```

---

## Syntax

```sql
SELECT
    ColumnList
FROM TableA A
RIGHT JOIN TableB B
    ON A.ID = B.ID;
```

---

## Example

```sql
SELECT
    B.Title,
    P.PublisherName
FROM Books B
RIGHT JOIN Publishers P
    ON B.PublisherID = P.PublisherID;
```

---

# RIGHT JOIN Diagram

```text
Matching Left
+
All Right
```

---

# FULL OUTER JOIN

Returns:

```text
All Rows From Both Tables
```

Including unmatched records.

---

## Syntax

```sql
SELECT
    ColumnList
FROM TableA A
FULL OUTER JOIN TableB B
    ON A.ID = B.ID;
```

---

## Example

```sql
SELECT
    B.Title,
    P.PublisherName
FROM Books B
FULL OUTER JOIN Publishers P
    ON B.PublisherID = P.PublisherID;
```

---

# FULL OUTER JOIN Diagram

```text
Table A
+
Table B
```

---

# SELF JOIN

A table joined to itself.

---

## Syntax

```sql
SELECT
    E1.EmployeeName,
    E2.EmployeeName
FROM Employees E1
INNER JOIN Employees E2
    ON E1.ManagerID = E2.EmployeeID;
```

---

## Example

```text
Employee → Manager
```

---

# Many-to-Many Relationship

Example:

```text
Books
   ↕
BookAuthors
   ↕
Authors
```

---

## Junction Table

```sql
CREATE TABLE BookAuthors
(
    BookID INT,
    AuthorID INT,

    PRIMARY KEY(BookID, AuthorID)
);
```

---

# Multi-Table Join

## Books + Categories

```sql
SELECT
    B.Title,
    C.CategoryName
FROM Books B
INNER JOIN Categories C
    ON B.CategoryID = C.CategoryID;
```

---

## Books + Publishers

```sql
SELECT
    B.Title,
    P.PublisherName
FROM Books B
INNER JOIN Publishers P
    ON B.PublisherID = P.PublisherID;
```

---

## Books + Categories + Publishers

```sql
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

# Borrowing Report

```sql
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

# Reservation Report

```sql
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

# Books with Authors

```sql
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

# Join Execution Order

```text
FROM
 ↓
JOIN
 ↓
ON
 ↓
WHERE
 ↓
GROUP BY
 ↓
HAVING
 ↓
SELECT
 ↓
ORDER BY
```

---

# Common Join Errors

## Missing ON Clause

❌ Incorrect

```sql
SELECT *
FROM Books
INNER JOIN Categories;
```

---

✅ Correct

```sql
SELECT *
FROM Books B
INNER JOIN Categories C
    ON B.CategoryID = C.CategoryID;
```

---

## Wrong Join Columns

❌ Incorrect

```sql
ON B.BookID = C.CategoryID
```

---

✅ Correct

```sql
ON B.CategoryID = C.CategoryID
```

---

## Ambiguous Column Names

❌ Incorrect

```sql
SELECT CategoryID
FROM Books
INNER JOIN Categories
    ON Books.CategoryID = Categories.CategoryID;
```

---

✅ Correct

```sql
SELECT B.CategoryID
FROM Books B
INNER JOIN Categories C
    ON B.CategoryID = C.CategoryID;
```

---

# Join Best Practices

✅ Always use table aliases

✅ Use meaningful aliases

✅ Join using PK ↔ FK relationships

✅ Format joins consistently

✅ Use LEFT JOIN for missing data analysis

✅ Use INNER JOIN for matching records

✅ Avoid unnecessary joins

✅ Comment complex join queries

---

# Join Selection Guide

| Requirement               | Join Type       |
| ------------------------- | --------------- |
| Matching rows only        | INNER JOIN      |
| All left rows             | LEFT JOIN       |
| All right rows            | RIGHT JOIN      |
| All rows from both tables | FULL OUTER JOIN |
| Same table relationship   | SELF JOIN       |

---

# Module 05 Quick Reference

```text
PK = Primary Key

FK = Foreign Key

INNER JOIN
→ Matching Rows

LEFT JOIN
→ All Left Rows

RIGHT JOIN
→ All Right Rows

FULL OUTER JOIN
→ All Rows

SELF JOIN
→ Table Joined To Itself

BookAuthors
→ Many-to-Many Relationship
```

---

# Module 05 Completion Checklist

| Skill             | Completed |
| ----------------- | --------- |
| Relationships     | □         |
| Primary Keys      | □         |
| Foreign Keys      | □         |
| INNER JOIN        | □         |
| LEFT JOIN         | □         |
| RIGHT JOIN        | □         |
| FULL OUTER JOIN   | □         |
| SELF JOIN         | □         |
| Multi-Table Joins | □         |
| Business Reports  | □         |

---

# Next Module

## Module 06: SQL Subqueries and Nested Queries

Topics:

* Scalar Subqueries
* Correlated Subqueries
* Nested Queries
* EXISTS
* NOT EXISTS
* IN vs EXISTS
* Advanced SQL Logic
