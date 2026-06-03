# Module 06 Cheat Sheet

# SQL Subqueries and Nested Queries

> Quick reference guide for Scalar Subqueries, Multi-Row Subqueries, Correlated Subqueries, EXISTS, NOT EXISTS, IN, Derived Tables, and Business Reporting.

---

# What is a Subquery?

A subquery is:

```sql
A query inside another query
```

General Structure:

```sql
SELECT *
FROM TableName
WHERE ColumnName =
(
    SELECT ColumnName
    FROM AnotherTable
);
```

---

# Subquery Execution Order

```text
Subquery Executes
        ↓
Returns Result
        ↓
Outer Query Executes
        ↓
Final Output
```

---

# Types of Subqueries

| Type                | Returns                |
| ------------------- | ---------------------- |
| Scalar Subquery     | Single Value           |
| Multi-Row Subquery  | Multiple Rows          |
| Correlated Subquery | Depends on Outer Query |
| Derived Table       | Temporary Table        |

---

# Scalar Subqueries

Returns:

```text
One Value
```

---

## Average Book Price

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

## Most Expensive Book

```sql
SELECT *
FROM Books
WHERE BookPrice =
(
    SELECT MAX(BookPrice)
    FROM Books
);
```

---

## Least Expensive Book

```sql
SELECT *
FROM Books
WHERE BookPrice =
(
    SELECT MIN(BookPrice)
    FROM Books
);
```

---

## Newest Book

```sql
SELECT *
FROM Books
WHERE PublicationYear =
(
    SELECT MAX(PublicationYear)
    FROM Books
);
```

---

# Common Aggregate Functions

| Function | Purpose    |
| -------- | ---------- |
| COUNT()  | Count Rows |
| SUM()    | Total      |
| AVG()    | Average    |
| MAX()    | Highest    |
| MIN()    | Lowest     |

---

# Multi-Row Subqueries

Returns:

```text
Multiple Values
```

---

## IN Operator

```sql
SELECT *
FROM Members
WHERE MemberID IN
(
    SELECT MemberID
    FROM Reservations
);
```

---

## NOT IN Operator

```sql
SELECT *
FROM Books
WHERE BookID NOT IN
(
    SELECT BookID
    FROM BorrowRecords
);
```

---

## ANY Operator

```sql
SELECT *
FROM Books
WHERE BookPrice > ANY
(
    SELECT BookPrice
    FROM Books
);
```

---

## ALL Operator

```sql
SELECT *
FROM Books
WHERE BookPrice > ALL
(
    SELECT BookPrice
    FROM Books
    WHERE CategoryID = 1
);
```

---

# IN vs NOT IN

| Operator | Purpose                 |
| -------- | ----------------------- |
| IN       | Include Matching Values |
| NOT IN   | Exclude Matching Values |

---

# Subqueries in WHERE Clause

Most common use of subqueries.

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
FROM Members
WHERE MemberID IN
(
    SELECT MemberID
    FROM Reservations
);
```

---

## Books Never Borrowed

```sql
SELECT *
FROM Books
WHERE BookID NOT IN
(
    SELECT BookID
    FROM BorrowRecords
);
```

---

# Subqueries in SELECT Clause

Used for:

```text
KPIs

Dashboards

Calculated Columns
```

---

## Average Book Price Column

```sql
SELECT
    Title,
    BookPrice,
    (
        SELECT AVG(BookPrice)
        FROM Books
    ) AS AveragePrice
FROM Books;
```

---

## Total Books KPI

```sql
SELECT
(
    SELECT COUNT(*)
    FROM Books
) AS TotalBooks;
```

---

## Inventory Value KPI

```sql
SELECT
(
    SELECT SUM(BookPrice)
    FROM Books
) AS InventoryValue;
```

---

# Subqueries in FROM Clause

Creates:

```text
Derived Tables
```

---

## Borrow Summary

```sql
SELECT *
FROM
(
    SELECT
        MemberID,
        COUNT(*) AS BorrowCount
    FROM BorrowRecords
    GROUP BY MemberID
) AS BorrowSummary;
```

---

## Category Statistics

```sql
SELECT *
FROM
(
    SELECT
        CategoryID,
        COUNT(*) AS TotalBooks,
        AVG(BookPrice) AS AveragePrice
    FROM Books
    GROUP BY CategoryID
) AS CategoryStats;
```

---

# Derived Tables

Structure:

```sql
SELECT *
FROM
(
    SELECT ...
) AS AliasName;
```

---

Rules:

✅ Must Have Alias

✅ Temporary Result Set

✅ Exists Only During Query

---

# Correlated Subqueries

Definition:

```text
References Outer Query Values
```

---

## Members Who Borrowed Books

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

# Correlated Subquery Flow

```text
Outer Row
     ↓
Subquery Executes
     ↓
Result Returned
     ↓
Next Row
```

---

# EXISTS

Checks:

```text
Does A Matching Row Exist?
```

---

## Syntax

```sql
SELECT *
FROM TableA A
WHERE EXISTS
(
    SELECT 1
    FROM TableB B
    WHERE B.ID = A.ID
);
```

---

## Members With Borrow Activity

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

# NOT EXISTS

Checks:

```text
Does NO Matching Row Exist?
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

## Authors Without Books

```sql
SELECT *
FROM Authors A
WHERE NOT EXISTS
(
    SELECT 1
    FROM BookAuthors BA
    WHERE BA.AuthorID = A.AuthorID
);
```

---

# EXISTS vs NOT EXISTS

| Operator   | Returns          |
| ---------- | ---------------- |
| EXISTS     | Matching Records |
| NOT EXISTS | Missing Records  |

---

# IN vs EXISTS

| Feature                   | IN       | EXISTS |
| ------------------------- | -------- | ------ |
| Compares Values           | Yes      | No     |
| Checks Row Existence      | No       | Yes    |
| Correlated Queries        | Limited  | Yes    |
| Large Dataset Performance | Moderate | Better |
| NULL Safety               | Lower    | Higher |

---

# When to Use IN

Use when:

```text
Small Datasets

List Comparisons

Simple Filtering
```

Example:

```sql
SELECT *
FROM Members
WHERE MemberID IN
(
    SELECT MemberID
    FROM Reservations
);
```

---

# When to Use EXISTS

Use when:

```text
Relationship Checks

Data Audits

Large Tables

Correlated Logic
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

# KPI Dashboard Queries

## Executive Dashboard

```sql
SELECT
(
    SELECT COUNT(*)
    FROM Books
) AS TotalBooks,

(
    SELECT COUNT(*)
    FROM Members
) AS TotalMembers,

(
    SELECT COUNT(*)
    FROM Authors
) AS TotalAuthors,

(
    SELECT COUNT(*)
    FROM BorrowRecords
) AS TotalBorrows,

(
    SELECT COUNT(*)
    FROM Reservations
) AS TotalReservations;
```

---

# Inventory Dashboard

```sql
SELECT
(
    SELECT COUNT(*)
    FROM Books
) AS TotalBooks,

(
    SELECT SUM(BookPrice)
    FROM Books
) AS InventoryValue,

(
    SELECT AVG(BookPrice)
    FROM Books
) AS AveragePrice,

(
    SELECT MAX(BookPrice)
    FROM Books
) AS HighestPrice;
```

---

# Common Errors

## Scalar Subquery Returns Multiple Rows

❌ Bad

```sql
WHERE CategoryID =
(
    SELECT CategoryID
    FROM Categories
);
```

✅ Good

```sql
WHERE CategoryID IN
(
    SELECT CategoryID
    FROM Categories
);
```

---

## Missing Derived Table Alias

❌ Bad

```sql
SELECT *
FROM
(
    SELECT *
    FROM Books
);
```

✅ Good

```sql
SELECT *
FROM
(
    SELECT *
    FROM Books
) AS BookData;
```

---

## NOT IN With NULL Values

Avoid:

```sql
NOT IN
```

Prefer:

```sql
NOT EXISTS
```

---

# Performance Tips

✅ Use EXISTS for large datasets

✅ Index correlated columns

✅ Avoid unnecessary nesting

✅ Test subqueries independently

✅ Use aliases consistently

✅ Select only required columns

---

# Module 06 Formula Sheet

## Above Average

```sql
WHERE Value >
(
    SELECT AVG(Value)
    FROM Table
)
```

---

## Highest Value

```sql
WHERE Value =
(
    SELECT MAX(Value)
    FROM Table
)
```

---

## Exists Relationship

```sql
WHERE EXISTS
(
    SELECT 1
    FROM ChildTable
    WHERE ChildTable.ID = ParentTable.ID
)
```

---

## Missing Relationship

```sql
WHERE NOT EXISTS
(
    SELECT 1
    FROM ChildTable
    WHERE ChildTable.ID = ParentTable.ID
)
```

---

## Derived Table

```sql
FROM
(
    SELECT ...
) AS AliasName
```

---

# Module 06 Completion Checklist

```text
✓ Scalar Subqueries

✓ Multi-Row Subqueries

✓ WHERE Subqueries

✓ SELECT Subqueries

✓ FROM Subqueries

✓ Derived Tables

✓ Correlated Subqueries

✓ EXISTS

✓ NOT EXISTS

✓ IN vs EXISTS

✓ KPI Dashboards

✓ Business Reports
```
