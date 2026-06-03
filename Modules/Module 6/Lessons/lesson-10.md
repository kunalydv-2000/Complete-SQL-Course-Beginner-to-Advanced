# Lesson 10: Business Reports with Subqueries

> Learn how to combine scalar subqueries, correlated subqueries, EXISTS, NOT EXISTS, IN, and derived tables to build professional business reports, KPI dashboards, and analytical solutions.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Build business reports using subqueries
* Create KPI dashboards
* Combine multiple subquery techniques
* Use scalar subqueries for metrics
* Use EXISTS for activity analysis
* Use derived tables for summaries
* Create executive reporting solutions

---

# Introduction

Throughout this module, you learned:

```text id="brs001"
Scalar Subqueries

Multi-Row Subqueries

Subqueries in WHERE

Subqueries in SELECT

Derived Tables

Correlated Subqueries

EXISTS

NOT EXISTS

IN vs EXISTS
```

Now it's time to combine everything.

---

# Business Reporting Workflow

```text id="brs002"
Raw Data
    ↓
Subqueries
    ↓
Filtering
    ↓
Aggregation
    ↓
Business Reports
    ↓
Decision Making
```

---

# Sample Library Database

Tables Used:

```text id="brs003"
Books

Authors

BookAuthors

Categories

Publishers

Members

BorrowRecords

Reservations
```

---

# Report 1: Books Above Average Price

Business Question:

```text id="brs004"
Which books cost more than average?
```

---

Query:

```sql id="brs005"
SELECT
    BookID,
    Title,
    BookPrice
FROM Books
WHERE BookPrice >
(
    SELECT AVG(BookPrice)
    FROM Books
);
```

---

Business Insight:

```text id="brs006"
Premium Books
```

---

# Report 2: Books Below Average Price

```sql id="brs007"
SELECT
    BookID,
    Title,
    BookPrice
FROM Books
WHERE BookPrice <
(
    SELECT AVG(BookPrice)
    FROM Books
);
```

---

Business Insight:

```text id="brs008"
Budget-Friendly Books
```

---

# Report 3: Most Expensive Books

```sql id="brs009"
SELECT *
FROM Books
WHERE BookPrice =
(
    SELECT MAX(BookPrice)
    FROM Books
);
```

---

# Report 4: Newest Books

```sql id="brs010"
SELECT *
FROM Books
WHERE PublicationYear =
(
    SELECT MAX(PublicationYear)
    FROM Books
);
```

---

# Report 5: Members With Borrow Activity

Using EXISTS:

```sql id="brs011"
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

Business Value:

```text id="brs012"
Active Members
```

---

# Report 6: Members Without Borrow Activity

Using NOT EXISTS:

```sql id="brs013"
SELECT *
FROM Members M
WHERE NOT EXISTS
(
    SELECT 1
    FROM BorrowRecords BR
    WHERE BR.MemberID = M.MemberID
);
```

---

Business Value:

```text id="brs014"
Inactive Members
```

---

# Report 7: Books Never Borrowed

```sql id="brs015"
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

Business Value:

```text id="brs016"
Unused Inventory
```

---

# Report 8: Members With Reservations

```sql id="brs017"
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

Business Insight:

```text id="brs018"
High Demand Users
```

---

# Report 9: Books With Reservations

```sql id="brs019"
SELECT *
FROM Books B
WHERE EXISTS
(
    SELECT 1
    FROM Reservations R
    WHERE R.BookID = B.BookID
);
```

---

# Report 10: Authors With Published Books

```sql id="brs020"
SELECT *
FROM Authors A
WHERE EXISTS
(
    SELECT 1
    FROM BookAuthors BA
    WHERE BA.AuthorID = A.AuthorID
);
```

---

# Derived Table Reporting

Sometimes we need summarized data before analysis.

---

# Report 11: Borrow Count by Member

Derived Table:

```sql id="brs021"
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

# Report 12: Member Borrow Performance

```sql id="brs022"
SELECT
    M.FirstName,
    M.LastName,
    BS.BorrowCount
FROM Members M
INNER JOIN
(
    SELECT
        MemberID,
        COUNT(*) AS BorrowCount
    FROM BorrowRecords
    GROUP BY MemberID
) BS
ON M.MemberID = BS.MemberID;
```

---

# Report 13: Category Performance

```sql id="brs023"
SELECT
    C.CategoryName,
    Stats.TotalBooks
FROM Categories C
INNER JOIN
(
    SELECT
        CategoryID,
        COUNT(*) AS TotalBooks
    FROM Books
    GROUP BY CategoryID
) Stats
ON C.CategoryID = Stats.CategoryID;
```

---

# Report 14: Publisher Performance

```sql id="brs024"
SELECT
    P.PublisherName,
    Stats.TotalBooks
FROM Publishers P
INNER JOIN
(
    SELECT
        PublisherID,
        COUNT(*) AS TotalBooks
    FROM Books
    GROUP BY PublisherID
) Stats
ON P.PublisherID = Stats.PublisherID;
```

---

# KPI Dashboard Reporting

Executive dashboards often use SELECT subqueries.

---

# Report 15: Executive KPI Dashboard

```sql id="brs025"
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

# Sample Result

| KPI               | Value |
| ----------------- | ----- |
| TotalBooks        | 150   |
| TotalMembers      | 75    |
| TotalAuthors      | 30    |
| TotalBorrows      | 950   |
| TotalReservations | 120   |

---

# Report 16: Inventory Dashboard

```sql id="brs026"
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
) AS AverageBookPrice,

(
    SELECT MAX(BookPrice)
    FROM Books
) AS HighestBookPrice;
```

---

# Report 17: Average Borrow Activity

```sql id="brs027"
SELECT AVG(BorrowCount)
FROM
(
    SELECT
        COUNT(*) AS BorrowCount
    FROM BorrowRecords
    GROUP BY MemberID
) AS BorrowStats;
```

---

# Report 18: Members Above Average Activity

```sql id="brs028"
SELECT
    M.MemberID,
    M.FirstName,
    M.LastName
FROM Members M
WHERE
(
    SELECT COUNT(*)
    FROM BorrowRecords BR
    WHERE BR.MemberID = M.MemberID
)
>
(
    SELECT AVG(BorrowCount)
    FROM
    (
        SELECT
            COUNT(*) AS BorrowCount
        FROM BorrowRecords
        GROUP BY MemberID
    ) AS BorrowStats
);
```

---

# Report 19: Categories With Borrow Activity

```sql id="brs029"
SELECT *
FROM Categories C
WHERE EXISTS
(
    SELECT 1
    FROM Books B
    WHERE B.CategoryID = C.CategoryID
    AND EXISTS
    (
        SELECT 1
        FROM BorrowRecords BR
        WHERE BR.BookID = B.BookID
    )
);
```

---

# Report 20: Authors Without Books

```sql id="brs030"
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

# Business Intelligence Example

Question:

```text id="brs031"
Which members are most engaged?
```

---

Metrics:

```text id="brs032"
Borrow Activity

Reservations

Membership Status

Reading Frequency
```

---

SQL can combine:

```text id="brs033"
Derived Tables

EXISTS

Correlated Subqueries

Aggregations
```

---

# Dashboard Architecture

```text id="brs034"
Books
   ↓

BorrowRecords
   ↓

Subqueries
   ↓

KPIs
   ↓

Dashboard
```

---

# Real-World Applications

---

## Library Analytics

```text id="brs035"
Most Popular Books

Inactive Members

Inventory Analysis
```

---

## E-Commerce

```text id="brs036"
Top Customers

High-Value Products

Sales KPIs
```

---

## Banking

```text id="brs037"
Active Accounts

Transaction Monitoring

Risk Analysis
```

---

## Human Resources

```text id="brs038"
Employee Performance

Attendance Metrics

Department KPIs
```

---

# Common Beginner Mistakes

---

## Overusing Nested Queries

Bad:

```text id="brs039"
Deeply nested subqueries
```

---

Keep logic manageable.

---

## Ignoring Performance

Correlated subqueries may require:

```text id="brs040"
Indexes
```

---

## Forgetting Aliases

Derived tables require aliases.

---

## Returning Too Much Data

Avoid:

```sql id="brs041"
SELECT *
```

for production reports.

---

# Hands-On Practice

Create:

### Books Above Average Price Report

### Active Members Report

### Inactive Members Report

### Publisher Performance Report

### Category Performance Report

### Executive KPI Dashboard

---

# Mini Exercise

### Task 1

Find books above average price.

---

### Task 2

Find books never borrowed.

---

### Task 3

Find members with reservations.

---

### Task 4

Create a borrow count summary using a derived table.

---

### Task 5

Build an executive dashboard showing:

```text id="brs042"
Total Books

Total Members

Total Authors

Total Borrows

Total Reservations
```

---

# Best Practices

✅ Use scalar subqueries for KPIs

✅ Use EXISTS for relationship checks

✅ Use NOT EXISTS for exception reports

✅ Use derived tables for summaries

✅ Index correlated columns

✅ Keep reports readable

---

# Summary

In this lesson, you learned:

* Business Reporting with Subqueries
* KPI Dashboards
* Scalar Subqueries
* Correlated Subqueries
* EXISTS and NOT EXISTS
* Derived Tables
* Executive Reporting

These techniques are widely used in Business Intelligence, Analytics, Reporting Systems, Data Warehousing, and Enterprise SQL Development.

---

# Knowledge Check

### Question 1

Which subquery type is commonly used for KPI metrics?

A. Scalar Subquery

B. Correlated Subquery

C. Multi-Row Subquery

D. Recursive Query

---

### Question 2

Which operator is best for finding missing records?

A. EXISTS

B. NOT EXISTS

C. IN

D. TOP

---

### Question 3

What is a derived table?

A. Physical Table

B. Temporary Result Set

C. View

D. Index

---

### Question 4

Which report identifies inactive members?

A.

```sql
WHERE EXISTS (...)
```

B.

```sql
WHERE NOT EXISTS (...)
```

---

### Question 5

Which reporting solution combines multiple KPIs into one query?

A. Dashboard Query

B. DELETE Query

C. INSERT Query

D. UPDATE Query

---

# Module 06 Completion

Congratulations. You have completed:

✅ Introduction to Subqueries

✅ Scalar Subqueries

✅ Multi-Row Subqueries

✅ Subqueries in WHERE

✅ Subqueries in SELECT

✅ Subqueries in FROM

✅ Correlated Subqueries

✅ EXISTS and NOT EXISTS

✅ IN vs EXISTS

✅ Business Reports with Subqueries

You can now build advanced SQL reports using nested queries, derived tables, correlated subqueries, and KPI-driven analytics.

---

# Next Module

➡️ Module 07: SQL Views and Stored Procedures

Topics include:

* Views
* Indexed Views
* Stored Procedures
* Parameters
* Output Parameters
* Dynamic SQL
* Reusable Database Objects
