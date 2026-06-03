# Lesson 09: Business Reports with Joins

> Learn how to combine SQL JOINs, aggregate functions, sorting, and grouping techniques to create professional business reports and dashboards.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Build business reports using JOINs
* Create management dashboards
* Combine multiple tables
* Use aggregate functions with JOINs
* Use GROUP BY and ORDER BY
* Analyze business performance
* Create real-world SQL reporting solutions

---

# Introduction

Organizations collect large amounts of data.

However:

```text id="br001"
Raw data alone has little value.
```

Businesses need reports.

Examples:

```text id="br002"
Which books are most popular?

Which members borrow the most books?

Which categories perform best?

Which publishers contribute most books?

Which authors are most productive?
```

To answer these questions, we combine:

```text id="br003"
JOINs

COUNT()

SUM()

AVG()

GROUP BY

ORDER BY
```

---

# Business Reporting Workflow

```text id="br004"
Tables
   ↓
Relationships
   ↓
JOINs
   ↓
Aggregations
   ↓
Reports
   ↓
Business Decisions
```

---

# Report 1: Book Catalog Report

Business Question:

```text id="br005"
Show complete information
about every book.
```

---

Query:

```sql id="br006"
SELECT
    B.BookID,
    B.Title,
    C.CategoryName,
    P.PublisherName,
    B.PublicationYear,
    B.BookPrice
FROM Books B
INNER JOIN Categories C
    ON B.CategoryID = C.CategoryID
INNER JOIN Publishers P
    ON B.PublisherID = P.PublisherID;
```

---

# Sample Output

| BookID | Title            | Category   | Publisher |
| ------ | ---------------- | ---------- | --------- |
| 1      | SQL Fundamentals | Technology | TechPress |

---

# Report 2: Author Catalog

Business Question:

```text id="br007"
Which authors wrote which books?
```

---

Query:

```sql id="br008"
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

# Report 3: Borrowing Activity Report

Business Question:

```text id="br009"
Which members borrowed which books?
```

---

Query:

```sql id="br010"
SELECT
    M.FirstName + ' ' + M.LastName AS MemberName,
    B.Title,
    BR.BorrowDate,
    BR.DueDate,
    BR.ReturnDate
FROM BorrowRecords BR
INNER JOIN Members M
    ON BR.MemberID = M.MemberID
INNER JOIN Books B
    ON BR.BookID = B.BookID;
```

---

# Report 4: Reservation Activity Report

Business Question:

```text id="br011"
Which books are reserved?
```

---

Query:

```sql id="br012"
SELECT
    M.FirstName + ' ' + M.LastName AS MemberName,
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

# Aggregate Functions with JOINs

Reports become more valuable when combined with:

```text id="br013"
COUNT()

SUM()

AVG()

MIN()

MAX()
```

---

# Report 5: Most Borrowed Books

Business Question:

```text id="br014"
Which books are borrowed most often?
```

---

Query:

```sql id="br015"
SELECT
    B.Title,
    COUNT(*) AS BorrowCount
FROM BorrowRecords BR
INNER JOIN Books B
    ON BR.BookID = B.BookID
GROUP BY B.Title
ORDER BY BorrowCount DESC;
```

---

# Sample Output

| Title              | BorrowCount |
| ------------------ | ----------- |
| SQL Fundamentals   | 15          |
| Power BI Analytics | 12          |

---

# Report 6: Most Active Members

Business Question:

```text id="br016"
Which members borrow the most books?
```

---

Query:

```sql id="br017"
SELECT
    M.FirstName + ' ' + M.LastName AS MemberName,
    COUNT(*) AS BorrowCount
FROM BorrowRecords BR
INNER JOIN Members M
    ON BR.MemberID = M.MemberID
GROUP BY
    M.FirstName,
    M.LastName
ORDER BY BorrowCount DESC;
```

---

# Report 7: Most Popular Categories

Business Question:

```text id="br018"
Which categories are most popular?
```

---

Query:

```sql id="br019"
SELECT
    C.CategoryName,
    COUNT(*) AS BorrowCount
FROM BorrowRecords BR
INNER JOIN Books B
    ON BR.BookID = B.BookID
INNER JOIN Categories C
    ON B.CategoryID = C.CategoryID
GROUP BY C.CategoryName
ORDER BY BorrowCount DESC;
```

---

# Report 8: Publisher Performance

Business Question:

```text id="br020"
How many books has each publisher published?
```

---

Query:

```sql id="br021"
SELECT
    P.PublisherName,
    COUNT(B.BookID) AS TotalBooks
FROM Publishers P
LEFT JOIN Books B
    ON P.PublisherID = B.PublisherID
GROUP BY P.PublisherName
ORDER BY TotalBooks DESC;
```

---

# Report 9: Average Book Price by Publisher

Business Question:

```text id="br022"
What is the average price of books from each publisher?
```

---

Query:

```sql id="br023"
SELECT
    P.PublisherName,
    AVG(B.BookPrice) AS AveragePrice
FROM Publishers P
INNER JOIN Books B
    ON P.PublisherID = B.PublisherID
GROUP BY P.PublisherName;
```

---

# Report 10: Author Productivity

Business Question:

```text id="br024"
How many books has each author written?
```

---

Query:

```sql id="br025"
SELECT
    A.AuthorName,
    COUNT(*) AS TotalBooksWritten
FROM Authors A
INNER JOIN BookAuthors BA
    ON A.AuthorID = BA.AuthorID
GROUP BY A.AuthorName
ORDER BY TotalBooksWritten DESC;
```

---

# Dashboard Reporting

Management often needs summary reports.

Example:

```text id="br026"
Total Books

Total Members

Total Authors

Total Reservations

Total Borrow Records
```

---

# Executive Dashboard Query

```sql id="br027"
SELECT
    (SELECT COUNT(*) FROM Books) AS TotalBooks,
    (SELECT COUNT(*) FROM Members) AS TotalMembers,
    (SELECT COUNT(*) FROM Authors) AS TotalAuthors,
    (SELECT COUNT(*) FROM Reservations) AS TotalReservations,
    (SELECT COUNT(*) FROM BorrowRecords) AS TotalBorrows;
```

---

# KPI Reporting

Key Performance Indicators (KPIs)

---

Examples:

```text id="br028"
Total Books

Average Book Price

Most Borrowed Book

Most Active Member

Most Popular Category
```

---

# Top 5 Most Borrowed Books

```sql id="br029"
SELECT TOP 5
    B.Title,
    COUNT(*) AS BorrowCount
FROM BorrowRecords BR
INNER JOIN Books B
    ON BR.BookID = B.BookID
GROUP BY B.Title
ORDER BY BorrowCount DESC;
```

---

# Top 5 Most Active Members

```sql id="br030"
SELECT TOP 5
    M.FirstName + ' ' + M.LastName AS MemberName,
    COUNT(*) AS BorrowCount
FROM BorrowRecords BR
INNER JOIN Members M
    ON BR.MemberID = M.MemberID
GROUP BY
    M.FirstName,
    M.LastName
ORDER BY BorrowCount DESC;
```

---

# Business Intelligence Example

Question:

```text id="br031"
Which category generates the most borrowing activity?
```

---

Query:

```sql id="br032"
SELECT TOP 1
    C.CategoryName,
    COUNT(*) AS BorrowCount
FROM BorrowRecords BR
INNER JOIN Books B
    ON BR.BookID = B.BookID
INNER JOIN Categories C
    ON B.CategoryID = C.CategoryID
GROUP BY C.CategoryName
ORDER BY BorrowCount DESC;
```

---

# Multi-Table Dashboard Example

```sql id="br033"
SELECT
    B.Title,
    A.AuthorName,
    C.CategoryName,
    P.PublisherName
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

# Common Beginner Mistakes

---

## Missing GROUP BY

Bad:

```sql id="br034"
SELECT
    CategoryName,
    COUNT(*)
FROM Categories;
```

---

Correct:

```sql id="br035"
GROUP BY CategoryName;
```

---

## Wrong Join Order

Always follow relationships.

Bad:

```text id="br036"
Books
 ↓
Authors
```

---

Correct:

```text id="br037"
Books
 ↓
BookAuthors
 ↓
Authors
```

---

## Ignoring Aliases

Aliases improve readability and maintenance.

---

# Reporting Best Practices

✅ Use aliases

✅ Format SQL consistently

✅ Use descriptive column names

✅ Sort important reports

✅ Use aggregate functions appropriately

✅ Verify business requirements

✅ Optimize joins

---

# Hands-On Practice

Create:

### Book Catalog Report

### Borrowing Report

### Reservation Report

### Most Borrowed Books Report

### Most Active Members Report

### Publisher Performance Report

### Executive Dashboard

---

# Mini Exercise

### Task 1

Display books and categories.

---

### Task 2

Display books and authors.

---

### Task 3

Find the most borrowed book.

---

### Task 4

Find the most active member.

---

### Task 5

Build a dashboard showing:

```text id="br038"
Total Books

Total Members

Total Authors
```

---

# Summary

In this lesson, you learned:

* Business reporting with JOINs
* Aggregate reporting
* KPI dashboards
* Borrowing analysis
* Category analysis
* Publisher analysis
* Author productivity reporting

These techniques form the foundation of Business Intelligence (BI), reporting systems, and analytics solutions.

---

# Knowledge Check

### Question 1

Which function counts records?

A. SUM()

B. AVG()

C. COUNT()

D. MAX()

---

### Question 2

Which clause groups records?

A. ORDER BY

B. GROUP BY

C. WHERE

D. JOIN

---

### Question 3

Which clause sorts records?

A. GROUP BY

B. HAVING

C. ORDER BY

D. SELECT

---

### Question 4

Which report identifies popular books?

A. Borrowing Report

B. Most Borrowed Books Report

C. Publisher Report

D. Author Report

---

### Question 5

What does KPI stand for?

A. Key Performance Indicator

B. Key Process Integration

C. Knowledge Performance Index

D. Key Program Information

---

# Next Lesson

➡️ 10-Join-Best-Practices.md

In the final lesson of this module, you'll learn professional SQL JOIN techniques, performance optimization strategies, formatting standards, and industry best practices.
