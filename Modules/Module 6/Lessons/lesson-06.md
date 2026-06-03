# Lesson 06: Subqueries in FROM Clause

> Learn how to use subqueries inside the FROM clause to create derived tables, virtual datasets, and advanced analytical reports.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand Derived Tables
* Use Subqueries in the FROM clause
* Create Virtual Tables
* Build Advanced Reports
* Aggregate Data Before Analysis
* Simplify Complex Queries
* Prepare for Correlated Subqueries

---

# Introduction

So far, you've used subqueries inside:

```text id="sfc001"
WHERE Clause

SELECT Clause
```

Example:

```sql id="sfc002"
SELECT *
FROM Books
WHERE BookPrice >
(
    SELECT AVG(BookPrice)
    FROM Books
);
```

---

However, subqueries can also appear inside:

```sql id="sfc003"
FROM Clause
```

This creates a:

```text id="sfc004"
Derived Table

Virtual Table

Temporary Result Set
```

---

# What is a Derived Table?

A Derived Table is a temporary table created by a subquery inside the FROM clause.

General Structure:

```sql id="sfc005"
SELECT *
FROM
(
    SELECT ...
    FROM ...
) AS DerivedTable;
```

---

# Why Use Derived Tables?

Derived tables help:

```text id="sfc006"
Break complex problems into steps

Improve readability

Simplify reporting

Reuse calculations

Create temporary datasets
```

---

# Visual Representation

```text id="sfc007"
Base Tables
      ↓
Subquery
      ↓
Derived Table
      ↓
Outer Query
      ↓
Final Report
```

---

# Example 1: Average Book Price Report

Business Question:

```text id="sfc008"
Display books that cost more than
the average book price.
```

---

Without Derived Table:

```sql id="sfc009"
SELECT *
FROM Books
WHERE BookPrice >
(
    SELECT AVG(BookPrice)
    FROM Books
);
```

---

With Derived Table:

```sql id="sfc010"
SELECT *
FROM
(
    SELECT
        BookID,
        Title,
        BookPrice
    FROM Books
) AS BookData;
```

---

Here:

```text id="sfc011"
BookData
```

acts like a temporary table.

---

# Example 2: Borrow Count Per Member

Business Question:

```text id="sfc012"
How many books has each member borrowed?
```

---

Step 1

Create summary table.

```sql id="sfc013"
SELECT
    MemberID,
    COUNT(*) AS BorrowCount
FROM BorrowRecords
GROUP BY MemberID;
```

---

Step 2

Use it as a derived table.

```sql id="sfc014"
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

# Result

| MemberID | BorrowCount |
| -------- | ----------- |
| 1        | 12          |
| 2        | 8           |
| 3        | 15          |

---

# Example 3: Join a Derived Table

Question:

```text id="sfc015"
Show member names and borrow counts.
```

---

Query:

```sql id="sfc016"
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

# Execution Flow

```text id="sfc017"
BorrowRecords
      ↓
Grouped
      ↓
BorrowSummary
      ↓
Joined With Members
      ↓
Final Result
```

---

# Example 4: Average Price by Category

Business Question:

```text id="sfc018"
What is the average book price per category?
```

---

Derived Table:

```sql id="sfc019"
SELECT *
FROM
(
    SELECT
        CategoryID,
        AVG(BookPrice) AS AveragePrice
    FROM Books
    GROUP BY CategoryID
) AS CategoryPrices;
```

---

# Example 5: Category Analysis

Join derived table with Categories.

```sql id="sfc020"
SELECT
    C.CategoryName,
    CP.AveragePrice
FROM Categories C
INNER JOIN
(
    SELECT
        CategoryID,
        AVG(BookPrice) AS AveragePrice
    FROM Books
    GROUP BY CategoryID
) CP
ON C.CategoryID = CP.CategoryID;
```

---

# Example 6: Publisher Performance

Business Question:

```text id="sfc021"
How many books has each publisher published?
```

---

Query:

```sql id="sfc022"
SELECT
    P.PublisherName,
    PB.TotalBooks
FROM Publishers P
INNER JOIN
(
    SELECT
        PublisherID,
        COUNT(*) AS TotalBooks
    FROM Books
    GROUP BY PublisherID
) PB
ON P.PublisherID = PB.PublisherID;
```

---

# Derived Tables with Multiple Aggregations

Example:

```sql id="sfc023"
SELECT *
FROM
(
    SELECT
        CategoryID,
        COUNT(*) AS TotalBooks,
        AVG(BookPrice) AS AveragePrice,
        MAX(BookPrice) AS HighestPrice
    FROM Books
    GROUP BY CategoryID
) AS CategoryStatistics;
```

---

# Business Dashboard Example

```sql id="sfc024"
SELECT
    CategoryName,
    TotalBooks,
    AveragePrice
FROM Categories C
INNER JOIN
(
    SELECT
        CategoryID,
        COUNT(*) AS TotalBooks,
        AVG(BookPrice) AS AveragePrice
    FROM Books
    GROUP BY CategoryID
) AS Stats
ON C.CategoryID = Stats.CategoryID;
```

---

# Nested Derived Tables

Derived tables can contain subqueries.

Example:

```sql id="sfc025"
SELECT *
FROM
(
    SELECT
        BookID,
        Title,
        BookPrice
    FROM Books
    WHERE BookPrice >
    (
        SELECT AVG(BookPrice)
        FROM Books
    )
) AS PremiumBooks;
```

---

# Derived Table vs Physical Table

| Derived Table       | Physical Table     |
| ------------------- | ------------------ |
| Temporary           | Permanent          |
| Exists During Query | Stored in Database |
| No Storage Required | Uses Storage       |
| Created Dynamically | Created Explicitly |

---

# Real Business Example

Question:

```text id="sfc026"
Which members borrow more books than average?
```

---

Step 1

Create member borrow summary.

---

Step 2

Analyze results.

---

Example:

```sql id="sfc027"
SELECT *
FROM
(
    SELECT
        MemberID,
        COUNT(*) AS BorrowCount
    FROM BorrowRecords
    GROUP BY MemberID
) AS MemberStats;
```

---

# Why Derived Tables Matter

They allow SQL developers to:

```text id="sfc028"
Break Problems Into Smaller Steps

Improve Query Readability

Simplify Complex Logic

Create Reporting Layers
```

---

# Common Beginner Mistakes

---

## Missing Alias

Bad:

```sql id="sfc029"
SELECT *
FROM
(
    SELECT *
    FROM Books
);
```

---

Error:

```text id="sfc030"
Derived table requires an alias.
```

---

Correct:

```sql id="sfc031"
SELECT *
FROM
(
    SELECT *
    FROM Books
) AS BookData;
```

---

## Returning Unnecessary Columns

Bad:

```sql id="sfc032"
SELECT *
```

inside large derived tables.

---

Better:

```sql id="sfc033"
Select only required columns.
```

---

## Over-Nesting

Bad:

```text id="sfc034"
Multiple unnecessary layers
of subqueries.
```

---

Keep queries readable.

---

# Hands-On Practice

Run:

```sql id="sfc035"
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

Run:

```sql id="sfc036"
SELECT
    C.CategoryName,
    CP.AveragePrice
FROM Categories C
INNER JOIN
(
    SELECT
        CategoryID,
        AVG(BookPrice) AS AveragePrice
    FROM Books
    GROUP BY CategoryID
) CP
ON C.CategoryID = CP.CategoryID;
```

---

Run:

```sql id="sfc037"
SELECT
    P.PublisherName,
    PB.TotalBooks
FROM Publishers P
INNER JOIN
(
    SELECT
        PublisherID,
        COUNT(*) AS TotalBooks
    FROM Books
    GROUP BY PublisherID
) PB
ON P.PublisherID = PB.PublisherID;
```

---

# Mini Exercise

### Task 1

Create a derived table showing borrow counts by member.

---

### Task 2

Create a derived table showing average price by category.

---

### Task 3

Join a derived table with Members.

---

### Task 4

Join a derived table with Categories.

---

### Task 5

Create a publisher performance report using a derived table.

---

# Best Practices

✅ Always use aliases

✅ Keep derived tables focused

✅ Select only required columns

✅ Use derived tables for summaries

✅ Avoid excessive nesting

---

# Summary

In this lesson, you learned:

* Subqueries in FROM
* Derived Tables
* Virtual Tables
* Summary Reporting
* Multi-Step Analysis
* Business Dashboards
* Advanced SQL Design

Derived tables are a powerful technique for organizing complex SQL logic into manageable and readable reporting layers.

---

# Knowledge Check

### Question 1

What is a subquery in the FROM clause called?

A. View

B. Derived Table

C. Stored Procedure

D. Trigger

---

### Question 2

Must a derived table have an alias?

A. Yes

B. No

---

### Question 3

When does a derived table exist?

A. Permanently

B. During Query Execution

C. Until Server Restart

D. Forever

---

### Question 4

What is a common use of derived tables?

A. Summary Reporting

B. Dashboard Creation

C. Aggregation

D. All of the Above

---

### Question 5

Can a derived table be joined with other tables?

A. Yes

B. No

---

# Next Lesson

➡️ 07-Correlated-Subqueries.md

In the next lesson, you'll learn how correlated subqueries reference values from the outer query and perform row-by-row analysis for advanced business logic.
