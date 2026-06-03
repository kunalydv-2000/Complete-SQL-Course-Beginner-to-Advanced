# Lesson 05: Subqueries in SELECT Clause

> Learn how to use subqueries inside the SELECT clause to create calculated columns, KPIs, dashboard metrics, and executive reports.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Use subqueries in the SELECT clause
* Create calculated columns
* Build KPI reports
* Display summary metrics
* Compare row values against overall values
* Create dashboard-ready queries
* Build executive reporting solutions

---

# Introduction

So far, you've used subqueries inside:

```text id="ssc001"
WHERE Clause
```

Example:

```sql id="ssc002"
SELECT *
FROM Books
WHERE BookPrice >
(
    SELECT AVG(BookPrice)
    FROM Books
);
```

---

However, subqueries can also be placed directly inside:

```sql id="ssc003"
SELECT Clause
```

This allows SQL to display additional calculated information alongside regular columns.

---

# What is a SELECT Clause Subquery?

A SELECT clause subquery returns a value that becomes a column in the result set.

General Structure:

```sql id="ssc004"
SELECT
    Column1,
    Column2,
    (
        SELECT ...
    ) AS NewColumn
FROM TableName;
```

---

# Why Use SELECT Subqueries?

They are commonly used for:

```text id="ssc005"
KPIs

Dashboards

Summary Metrics

Business Reports

Comparative Analysis
```

---

# Example 1: Display Average Book Price

Business Question:

```text id="ssc006"
Show each book
along with the average book price.
```

---

Query:

```sql id="ssc007"
SELECT
    Title,
    BookPrice,
    (
        SELECT AVG(BookPrice)
        FROM Books
    ) AS AverageBookPrice
FROM Books;
```

---

# Result

| Title              | BookPrice | AverageBookPrice |
| ------------------ | --------- | ---------------- |
| SQL Fundamentals   | 500       | 425.50           |
| Power BI Analytics | 600       | 425.50           |
| Excel Basics       | 250       | 425.50           |

---

Notice:

```text id="ssc008"
AverageBookPrice
appears for every row.
```

---

# Execution Flow

```text id="ssc009"
Subquery Executes
        ↓
Returns Single Value
        ↓
Value Added As Column
        ↓
Result Displayed
```

---

# Example 2: Display Total Books

Business Question:

```text id="ssc010"
Show all books
and total number of books.
```

---

Query:

```sql id="ssc011"
SELECT
    Title,
    (
        SELECT COUNT(*)
        FROM Books
    ) AS TotalBooks
FROM Books;
```

---

# Result

| Title              | TotalBooks |
| ------------------ | ---------- |
| SQL Fundamentals   | 150        |
| Power BI Analytics | 150        |

---

# Example 3: Show Maximum Book Price

```sql id="ssc012"
SELECT
    Title,
    BookPrice,
    (
        SELECT MAX(BookPrice)
        FROM Books
    ) AS HighestBookPrice
FROM Books;
```

---

Business Insight:

```text id="ssc013"
Compare every book
to the highest priced book.
```

---

# Example 4: Show Latest Publication Year

```sql id="ssc014"
SELECT
    Title,
    PublicationYear,
    (
        SELECT MAX(PublicationYear)
        FROM Books
    ) AS LatestYear
FROM Books;
```

---

# KPI Reporting Example

Business Question:

```text id="ssc015"
Show books and compare them against average price.
```

---

Query:

```sql id="ssc016"
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

Dashboard Style Output

| Book             | Price | Average |
| ---------------- | ----- | ------- |
| SQL Fundamentals | 500   | 425.50  |
| Excel Basics     | 250   | 425.50  |

---

# Example 5: Total Inventory Value

```sql id="ssc017"
SELECT
    Title,
    BookPrice,
    (
        SELECT SUM(BookPrice)
        FROM Books
    ) AS TotalInventoryValue
FROM Books;
```

---

Business Use:

```text id="ssc018"
Inventory Valuation Dashboard
```

---

# Example 6: Total Members

```sql id="ssc019"
SELECT
    FirstName,
    LastName,
    (
        SELECT COUNT(*)
        FROM Members
    ) AS TotalMembers
FROM Members;
```

---

# Executive Dashboard Example

Question:

```text id="ssc020"
Show key metrics in one query.
```

---

Query:

```sql id="ssc021"
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
) AS TotalBorrows;
```

---

# Sample Result

| TotalBooks | TotalMembers | TotalAuthors | TotalBorrows |
| ---------- | ------------ | ------------ | ------------ |
| 150        | 75           | 35           | 950          |

---

# Multiple SELECT Subqueries

You can use several subqueries together.

---

Example:

```sql id="ssc022"
SELECT
(
    SELECT COUNT(*)
    FROM Books
) AS TotalBooks,

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

# Business KPI Dashboard

```sql id="ssc023"
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
) AS AveragePrice;
```

---

# Combining SELECT Subqueries with JOINs

Example:

```sql id="ssc024"
SELECT
    B.Title,
    C.CategoryName,
    (
        SELECT AVG(BookPrice)
        FROM Books
    ) AS AverageBookPrice
FROM Books B
INNER JOIN Categories C
    ON B.CategoryID = C.CategoryID;
```

---

# Comparing Values

Question:

```text id="ssc025"
How far is each book from the average price?
```

---

Query:

```sql id="ssc026"
SELECT
    Title,
    BookPrice,
    (
        SELECT AVG(BookPrice)
        FROM Books
    ) AS AveragePrice,
    BookPrice -
    (
        SELECT AVG(BookPrice)
        FROM Books
    ) AS PriceDifference
FROM Books;
```

---

# Common Aggregate Functions

| Function | Purpose       |
| -------- | ------------- |
| COUNT()  | Count Records |
| SUM()    | Total Value   |
| AVG()    | Average Value |
| MAX()    | Highest Value |
| MIN()    | Lowest Value  |

---

# Business Examples

---

## Inventory Dashboard

```sql id="ssc027"
SELECT
(
    SELECT COUNT(*)
    FROM Books
) AS TotalBooks;
```

---

## Author Dashboard

```sql id="ssc028"
SELECT
(
    SELECT COUNT(*)
    FROM Authors
) AS TotalAuthors;
```

---

## Borrow Dashboard

```sql id="ssc029"
SELECT
(
    SELECT COUNT(*)
    FROM BorrowRecords
) AS TotalBorrows;
```

---

# Common Beginner Mistakes

---

## Returning Multiple Rows

Bad:

```sql id="ssc030"
SELECT
(
    SELECT CategoryID
    FROM Categories
)
FROM Books;
```

---

Problem:

```text id="ssc031"
Multiple rows returned.
```

---

SELECT subqueries should return:

```text id="ssc032"
One Value
```

---

## Missing Alias

Bad:

```sql id="ssc033"
SELECT
(
    SELECT COUNT(*)
    FROM Books
)
```

---

Better:

```sql id="ssc034"
SELECT
(
    SELECT COUNT(*)
    FROM Books
) AS TotalBooks
```

---

## Too Many Repeated Subqueries

Avoid excessive duplication.

Consider:

```text id="ssc035"
CTEs

Derived Tables

Variables
```

for larger projects.

---

# Hands-On Practice

Run:

```sql id="ssc036"
SELECT
    Title,
    (
        SELECT AVG(BookPrice)
        FROM Books
    ) AS AveragePrice
FROM Books;
```

---

Run:

```sql id="ssc037"
SELECT
(
    SELECT COUNT(*)
    FROM Books
) AS TotalBooks;
```

---

Run:

```sql id="ssc038"
SELECT
(
    SELECT SUM(BookPrice)
    FROM Books
) AS InventoryValue;
```

---

# Mini Exercise

### Task 1

Display all books with average book price.

---

### Task 2

Display all books with highest book price.

---

### Task 3

Display total members using a subquery.

---

### Task 4

Display total authors using a subquery.

---

### Task 5

Build a dashboard showing:

```text id="ssc039"
Total Books

Total Members

Total Authors
```

---

# Best Practices

✅ Ensure SELECT subqueries return one value

✅ Use meaningful aliases

✅ Use aggregate functions

✅ Keep dashboard queries readable

✅ Test subqueries independently

---

# Summary

In this lesson, you learned:

* Subqueries in SELECT
* Calculated columns
* KPI reporting
* Dashboard metrics
* Aggregate calculations
* Comparative analysis

SELECT clause subqueries are widely used in executive dashboards, reporting systems, and business intelligence solutions.

---

# Knowledge Check

### Question 1

Where is the subquery placed in this lesson?

A. WHERE

B. SELECT

C. FROM

D. HAVING

---

### Question 2

What should a SELECT subquery return?

A. One Value

B. Multiple Rows

C. Multiple Tables

D. Views

---

### Question 3

Which function can be used inside a SELECT subquery?

A. COUNT()

B. AVG()

C. SUM()

D. All of the Above

---

### Question 4

Why use SELECT subqueries?

A. KPI Reporting

B. Dashboards

C. Calculated Columns

D. All of the Above

---

### Question 5

What should always be added to a SELECT subquery result?

A. WHERE

B. Alias

C. ORDER BY

D. HAVING

---

# Next Lesson

➡️ 06-Subqueries-in-FROM-Clause.md

In the next lesson, you'll learn how to use subqueries inside the FROM clause to create derived tables and build advanced reporting solutions.
