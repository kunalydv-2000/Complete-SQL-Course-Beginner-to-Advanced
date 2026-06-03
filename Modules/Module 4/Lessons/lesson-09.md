# Lesson 09: Business Aggregation Reports

> Learn how to combine aggregate functions, GROUP BY, HAVING, and ORDER BY to create professional KPI dashboards and business intelligence reports.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Build business reports using aggregate functions
* Create KPI dashboards
* Combine COUNT(), SUM(), AVG(), MIN(), and MAX()
* Use GROUP BY effectively
* Filter reports using HAVING
* Rank results using ORDER BY
* Answer real-world business questions

---

# Introduction

Businesses rarely need raw data.

Instead, managers ask questions such as:

```text id="bar001"
How many books do we have?

Which category contains the most books?

Which publisher publishes the most books?

How many reservations are approved?

What is the average book price?
```

These questions require analytical SQL.

---

# What is a Business Aggregation Report?

A business aggregation report summarizes data to provide meaningful insights.

Example:

Instead of:

```text id="bar002"
Thousands of book records
```

Management wants:

```text id="bar003"
Total Books = 250

Technology Books = 75

Average Book Price = 42.50
```

---

# Business Reporting Workflow

```text id="bar004"
Raw Data
    ↓
Aggregate Functions
    ↓
GROUP BY
    ↓
HAVING
    ↓
Business Insights
```

---

# Report 1: Total Books

Business Question:

```text id="bar005"
How many books exist?
```

Query:

```sql id="bar006"
SELECT
    COUNT(*) AS TotalBooks
FROM Books;
```

---

Result:

| TotalBooks |
| ---------- |
| 250        |

---

# Report 2: Total Members

Business Question:

```text id="bar007"
How many members are registered?
```

Query:

```sql id="bar008"
SELECT
    COUNT(*) AS TotalMembers
FROM Members;
```

---

# Report 3: Total Reservations

Business Question:

```text id="bar009"
How many reservations exist?
```

Query:

```sql id="bar010"
SELECT
    COUNT(*) AS TotalReservations
FROM Reservations;
```

---

# Report 4: Books by Category

Business Question:

```text id="bar011"
How many books are in each category?
```

Query:

```sql id="bar012"
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID;
```

---

Result:

| CategoryID | TotalBooks |
| ---------- | ---------- |
| 1          | 75         |
| 2          | 50         |
| 3          | 60         |

---

# Report 5: Books by Publisher

Query:

```sql id="bar013"
SELECT
    PublisherID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY PublisherID;
```

---

# Report 6: Reservations by Status

Business Question:

```text id="bar014"
How many reservations are approved,
pending, and cancelled?
```

Query:

```sql id="bar015"
SELECT
    Status,
    COUNT(*) AS TotalReservations
FROM Reservations
GROUP BY Status;
```

---

Result:

| Status    | TotalReservations |
| --------- | ----------------- |
| Approved  | 40                |
| Pending   | 15                |
| Cancelled | 5                 |

---

# Report 7: Average Book Price by Category

Query:

```sql id="bar016"
SELECT
    CategoryID,
    AVG(BookPrice) AS AveragePrice
FROM Books
GROUP BY CategoryID;
```

---

# Report 8: Category Value Report

Business Question:

```text id="bar017"
What is the total value of books
in each category?
```

Query:

```sql id="bar018"
SELECT
    CategoryID,
    SUM(BookPrice) AS TotalValue
FROM Books
GROUP BY CategoryID;
```

---

# Report 9: Publication Year Analysis

Query:

```sql id="bar019"
SELECT
    PublicationYear,
    COUNT(*) AS BooksPublished
FROM Books
GROUP BY PublicationYear
ORDER BY PublicationYear;
```

---

# Report 10: Publisher Performance

Query:

```sql id="bar020"
SELECT
    PublisherID,
    COUNT(*) AS TotalBooks,
    MIN(PublicationYear) AS OldestPublication,
    MAX(PublicationYear) AS LatestPublication
FROM Books
GROUP BY PublisherID;
```

---

# KPI Dashboard Example

A KPI dashboard summarizes key metrics.

Query:

```sql id="bar021"
SELECT
    COUNT(*) AS TotalBooks,
    MIN(PublicationYear) AS OldestBookYear,
    MAX(PublicationYear) AS NewestBookYear,
    AVG(BookPrice) AS AverageBookPrice
FROM Books;
```

---

Result:

| TotalBooks | OldestBookYear | NewestBookYear | AverageBookPrice |
| ---------- | -------------- | -------------- | ---------------- |
| 250        | 1998           | 2025           | 42.75            |

---

# Ranking Reports

Management often wants rankings.

---

## Top Categories

```sql id="bar022"
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID
ORDER BY TotalBooks DESC;
```

---

## Top Publishers

```sql id="bar023"
SELECT
    PublisherID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY PublisherID
ORDER BY TotalBooks DESC;
```

---

# Filtering Reports with HAVING

Business Question:

```text id="bar024"
Show categories
with more than 20 books.
```

Query:

```sql id="bar025"
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID
HAVING COUNT(*) > 20;
```

---

# Advanced KPI Report

Query:

```sql id="bar026"
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks,
    AVG(BookPrice) AS AveragePrice,
    SUM(BookPrice) AS TotalValue,
    MIN(PublicationYear) AS OldestBook,
    MAX(PublicationYear) AS NewestBook
FROM Books
GROUP BY CategoryID;
```

---

Result:

Provides:

```text id="bar027"
Book Count
Average Price
Total Value
Oldest Book
Newest Book
```

for every category.

---

# Borrowing Activity Dashboard

Query:

```sql id="bar028"
SELECT
    MemberID,
    COUNT(*) AS BorrowCount
FROM BorrowRecords
GROUP BY MemberID
ORDER BY BorrowCount DESC;
```

---

# Reservation Dashboard

Query:

```sql id="bar029"
SELECT
    Status,
    COUNT(*) AS TotalReservations
FROM Reservations
GROUP BY Status
ORDER BY TotalReservations DESC;
```

---

# Executive Summary Report

Management wants:

```text id="bar030"
Total Books
Total Members
Total Reservations
Oldest Publication Year
Newest Publication Year
```

Query:

```sql id="bar031"
SELECT
    (SELECT COUNT(*) FROM Books) AS TotalBooks,
    (SELECT COUNT(*) FROM Members) AS TotalMembers,
    (SELECT COUNT(*) FROM Reservations) AS TotalReservations,
    (SELECT MIN(PublicationYear) FROM Books) AS OldestBookYear,
    (SELECT MAX(PublicationYear) FROM Books) AS NewestBookYear;
```

---

# Query Execution Flow

```text id="bar032"
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

# Real-World Scenario

Library Director asks:

```text id="bar033"
Which categories should receive
more funding?
```

Query:

```sql id="bar034"
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID
ORDER BY TotalBooks ASC;
```

---

Interpretation:

```text id="bar035"
Categories with fewer books
may need additional investment.
```

---

# Common Beginner Mistakes

---

## Missing GROUP BY

Bad:

```sql id="bar036"
SELECT
    CategoryID,
    COUNT(*)
FROM Books;
```

---

Correct:

```sql id="bar037"
SELECT
    CategoryID,
    COUNT(*)
FROM Books
GROUP BY CategoryID;
```

---

## Missing Aliases

Bad:

```sql id="bar038"
SELECT
    COUNT(*)
FROM Books;
```

---

Better:

```sql id="bar039"
SELECT
    COUNT(*) AS TotalBooks
FROM Books;
```

---

## Not Sorting Reports

Bad:

```sql id="bar040"
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID;
```

---

Better:

```sql id="bar041"
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID
ORDER BY TotalBooks DESC;
```

---

# Hands-On Practice

Create reports for:

### Task 1

Books by category.

---

### Task 2

Books by publisher.

---

### Task 3

Reservations by status.

---

### Task 4

Average price by category.

---

### Task 5

Categories with more than 5 books.

---

### Task 6

Publisher ranking by total books.

---

# Mini Project

Build a dashboard containing:

```text id="bar042"
Total Books
Total Members
Total Reservations
Books by Category
Books by Publisher
Reservations by Status
```

Use:

```text id="bar043"
COUNT()
GROUP BY
HAVING
ORDER BY
```

---

# Best Practices

✅ Use aliases for KPIs

✅ Sort reports logically

✅ Use HAVING for filtered summaries

✅ Combine multiple aggregate functions

✅ Focus on business questions

---

# Summary

In this lesson, you learned:

* KPI reporting
* Business aggregation reports
* Dashboard queries
* Ranking reports
* Executive summaries
* Category analysis
* Publisher analysis
* Reservation analytics

You can now build professional business reports that transform raw data into actionable insights.

---

# Knowledge Check

### Question 1

Which function is most commonly used in KPI reports?

A. COUNT()

B. INSERT

C. UPDATE

D. DELETE

---

### Question 2

Which clause creates category-wise summaries?

A. ORDER BY

B. GROUP BY

C. DISTINCT

D. TOP

---

### Question 3

Which clause filters grouped results?

A. WHERE

B. HAVING

C. SELECT

D. FROM

---

### Question 4

Which clause ranks categories by book count?

A. HAVING

B. DISTINCT

C. ORDER BY

D. TOP

---

### Question 5

What is the primary purpose of a business aggregation report?

A. Delete records

B. Modify records

C. Summarize data for decision-making

D. Create tables

---

# Next Lesson

➡️ 10-Aggregation-Best-Practices.md

In the next lesson, you'll learn professional techniques, optimization strategies, and reporting standards for writing efficient aggregation queries.
