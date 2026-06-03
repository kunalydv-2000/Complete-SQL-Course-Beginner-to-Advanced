# SQL Aggregate Functions & Grouping Cheat Sheet

> Quick reference guide for SQL Aggregate Functions, GROUP BY, and HAVING in SQL Server (SSMS).

---

# Aggregate Functions Overview

Aggregate functions summarize multiple rows into a single result.

| Function | Purpose                |
| -------- | ---------------------- |
| COUNT()  | Counts records         |
| SUM()    | Calculates totals      |
| AVG()    | Calculates averages    |
| MIN()    | Returns smallest value |
| MAX()    | Returns largest value  |

---

# COUNT()

Counts rows or values.

## Count All Rows

```sql
SELECT COUNT(*)
FROM Books;
```

---

## Count Non-NULL Values

```sql
SELECT COUNT(Email)
FROM Members;
```

---

## Count Unique Values

```sql
SELECT COUNT(DISTINCT CategoryID)
FROM Books;
```

---

## Count with Alias

```sql
SELECT
    COUNT(*) AS TotalBooks
FROM Books;
```

---

# SUM()

Calculates totals for numeric columns.

## Basic SUM

```sql
SELECT
    SUM(BookPrice)
FROM Books;
```

---

## SUM with Alias

```sql
SELECT
    SUM(BookPrice) AS TotalBookValue
FROM Books;
```

---

## SUM with WHERE

```sql
SELECT
    SUM(FineAmount) AS TotalFines
FROM BorrowRecords
WHERE Status = 'Approved';
```

---

# AVG()

Calculates average values.

## Basic AVG

```sql
SELECT
    AVG(BookPrice)
FROM Books;
```

---

## AVG with Alias

```sql
SELECT
    AVG(BookPrice) AS AverageBookPrice
FROM Books;
```

---

## AVG with WHERE

```sql
SELECT
    AVG(FineAmount) AS AverageFine
FROM BorrowRecords
WHERE Status = 'Approved';
```

---

# MIN()

Returns the smallest value.

## Oldest Publication Year

```sql
SELECT
    MIN(PublicationYear)
FROM Books;
```

---

## Earliest Membership Date

```sql
SELECT
    MIN(MembershipDate)
FROM Members;
```

---

# MAX()

Returns the largest value.

## Newest Publication Year

```sql
SELECT
    MAX(PublicationYear)
FROM Books;
```

---

## Latest Membership Date

```sql
SELECT
    MAX(MembershipDate)
FROM Members;
```

---

# Multiple Aggregate Functions

```sql
SELECT
    COUNT(*) AS TotalBooks,
    AVG(BookPrice) AS AverageBookPrice,
    MIN(PublicationYear) AS OldestBook,
    MAX(PublicationYear) AS NewestBook
FROM Books;
```

---

# GROUP BY

Groups rows and applies aggregate functions.

## Count Books by Category

```sql
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID;
```

---

## Average Price by Category

```sql
SELECT
    CategoryID,
    AVG(BookPrice) AS AveragePrice
FROM Books
GROUP BY CategoryID;
```

---

## Total Value by Category

```sql
SELECT
    CategoryID,
    SUM(BookPrice) AS TotalValue
FROM Books
GROUP BY CategoryID;
```

---

## Oldest and Newest Book by Category

```sql
SELECT
    CategoryID,
    MIN(PublicationYear) AS OldestBook,
    MAX(PublicationYear) AS NewestBook
FROM Books
GROUP BY CategoryID;
```

---

# Multiple Column GROUP BY

## Books by Category and Publisher

```sql
SELECT
    CategoryID,
    PublisherID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY
    CategoryID,
    PublisherID;
```

---

## Average Price by Category and Publisher

```sql
SELECT
    CategoryID,
    PublisherID,
    AVG(BookPrice) AS AveragePrice
FROM Books
GROUP BY
    CategoryID,
    PublisherID;
```

---

# HAVING Clause

Filters grouped results.

## Categories with More Than 5 Books

```sql
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID
HAVING COUNT(*) > 5;
```

---

## Publishers with More Than 3 Books

```sql
SELECT
    PublisherID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY PublisherID
HAVING COUNT(*) > 3;
```

---

## Categories with Average Price Greater Than 50

```sql
SELECT
    CategoryID,
    AVG(BookPrice) AS AveragePrice
FROM Books
GROUP BY CategoryID
HAVING AVG(BookPrice) > 50;
```

---

# WHERE vs HAVING

| WHERE                           | HAVING                       |
| ------------------------------- | ---------------------------- |
| Filters rows                    | Filters groups               |
| Executes before GROUP BY        | Executes after GROUP BY      |
| Cannot use aggregate conditions | Can use aggregate conditions |

---

## WHERE Example

```sql
SELECT *
FROM Books
WHERE PublicationYear > 2020;
```

---

## HAVING Example

```sql
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID
HAVING COUNT(*) > 5;
```

---

# GROUP BY + HAVING + ORDER BY

```sql
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID
HAVING COUNT(*) > 2
ORDER BY TotalBooks DESC;
```

---

# Query Execution Order

```text
FROM
 ↓
WHERE
 ↓
GROUP BY
 ↓
Aggregate Functions
 ↓
HAVING
 ↓
SELECT
 ↓
ORDER BY
```

---

# KPI Dashboard Query

```sql
SELECT
    COUNT(*) AS TotalBooks,
    AVG(BookPrice) AS AverageBookPrice,
    MIN(PublicationYear) AS OldestBookYear,
    MAX(PublicationYear) AS NewestBookYear
FROM Books;
```

---

# Business Reports

## Books by Category

```sql
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID
ORDER BY TotalBooks DESC;
```

---

## Reservations by Status

```sql
SELECT
    Status,
    COUNT(*) AS TotalReservations
FROM Reservations
GROUP BY Status
ORDER BY TotalReservations DESC;
```

---

## Borrow Records by Member

```sql
SELECT
    MemberID,
    COUNT(*) AS BorrowCount
FROM BorrowRecords
GROUP BY MemberID
ORDER BY BorrowCount DESC;
```

---

# Common Errors

## Missing GROUP BY

❌ Incorrect

```sql
SELECT
    CategoryID,
    COUNT(*)
FROM Books;
```

✅ Correct

```sql
SELECT
    CategoryID,
    COUNT(*)
FROM Books
GROUP BY CategoryID;
```

---

## Aggregate Function in WHERE

❌ Incorrect

```sql
SELECT
    CategoryID,
    COUNT(*)
FROM Books
WHERE COUNT(*) > 5
GROUP BY CategoryID;
```

✅ Correct

```sql
SELECT
    CategoryID,
    COUNT(*)
FROM Books
GROUP BY CategoryID
HAVING COUNT(*) > 5;
```

---

# Best Practices

✅ Use meaningful aliases

✅ Format queries consistently

✅ Use WHERE for row filtering

✅ Use HAVING for group filtering

✅ Use ORDER BY in reports

✅ Group only necessary columns

✅ Combine multiple aggregates when appropriate

✅ Add comments to large reports

---

# Module 04 Formula Summary

```text
COUNT() → Count Records

SUM() → Total Values

AVG() → Average Values

MIN() → Smallest Value

MAX() → Largest Value

GROUP BY → Create Groups

HAVING → Filter Groups

ORDER BY → Sort Results
```

---

# Module 04 Completion Checklist

| Skill                    | Completed |
| ------------------------ | --------- |
| COUNT()                  | □         |
| SUM()                    | □         |
| AVG()                    | □         |
| MIN()                    | □         |
| MAX()                    | □         |
| GROUP BY                 | □         |
| Multiple Column GROUP BY | □         |
| HAVING                   | □         |
| KPI Reports              | □         |
| Business Dashboards      | □         |

---

## Next Module

**Module 05: SQL Joins and Relationships**

Topics:

* INNER JOIN
* LEFT JOIN
* RIGHT JOIN
* FULL OUTER JOIN
* SELF JOIN
* Multi-Table Reporting
* Relational Analysis
