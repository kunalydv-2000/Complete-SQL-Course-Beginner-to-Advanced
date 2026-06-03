# Lesson 08: HAVING Clause

> Learn how to filter grouped data using the HAVING clause and understand the difference between WHERE and HAVING.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand the purpose of HAVING
* Filter grouped results
* Understand HAVING vs WHERE
* Use aggregate functions in conditions
* Build advanced analytical reports
* Create KPI-based filters
* Avoid common HAVING mistakes

---

# Introduction

In the previous lessons, you learned:

```sql id="hav001"
COUNT()
SUM()
AVG()
MIN()
MAX()
GROUP BY
```

GROUP BY creates summary reports.

Example:

```sql id="hav002"
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
| 1          | 12         |
| 2          | 4          |
| 3          | 8          |

---

Suppose management asks:

```text id="hav003"
Show only categories
that contain more than 5 books.
```

GROUP BY creates the groups.

But how do we filter those groups?

SQL provides:

```sql id="hav004"
HAVING
```

---

# What is HAVING?

HAVING filters groups after aggregation.

Basic idea:

```text id="hav005"
Rows
 ↓
GROUP BY
 ↓
Aggregate Function
 ↓
HAVING
 ↓
Filtered Groups
```

---

# Basic Syntax

```sql id="hav006"
SELECT
    ColumnName,
    AggregateFunction(ColumnName)
FROM TableName
GROUP BY ColumnName
HAVING Condition;
```

---

# First HAVING Query

```sql id="hav007"
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID
HAVING COUNT(*) > 5;
```

---

Result:

| CategoryID | TotalBooks |
| ---------- | ---------- |
| 1          | 12         |
| 3          | 8          |

---

Category 2 is excluded because:

```text id="hav008"
4 is not greater than 5
```

---

# Understanding HAVING

Step 1:

GROUP BY creates groups.

```text id="hav009"
Category 1
Category 2
Category 3
```

---

Step 2:

COUNT() calculates totals.

```text id="hav010"
12
4
8
```

---

Step 3:

HAVING filters groups.

```text id="hav011"
Keep groups > 5
```

---

Final Result:

```text id="hav012"
Category 1
Category 3
```

---

# HAVING vs WHERE

This is one of the most important SQL concepts.

| WHERE                 | HAVING                   |
| --------------------- | ------------------------ |
| Filters rows          | Filters groups           |
| Before GROUP BY       | After GROUP BY           |
| Cannot use aggregates | Can use aggregates       |
| Works on raw data     | Works on summarized data |

---

# WHERE Example

Filter books published after 2015.

```sql id="hav013"
SELECT *
FROM Books
WHERE PublicationYear > 2015;
```

---

Result:

Filtered rows.

---

# HAVING Example

Filter categories containing more than 5 books.

```sql id="hav014"
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID
HAVING COUNT(*) > 5;
```

---

Result:

Filtered groups.

---

# COUNT with HAVING

Example:

```sql id="hav015"
SELECT
    PublisherID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY PublisherID
HAVING COUNT(*) >= 3;
```

---

Result:

Publishers with at least 3 books.

---

# SUM with HAVING

Example:

```sql id="hav016"
SELECT
    CategoryID,
    SUM(BookPrice) AS TotalValue
FROM Books
GROUP BY CategoryID
HAVING SUM(BookPrice) > 500;
```

---

Result:

Only categories whose total value exceeds 500.

---

# AVG with HAVING

Example:

```sql id="hav017"
SELECT
    CategoryID,
    AVG(BookPrice) AS AveragePrice
FROM Books
GROUP BY CategoryID
HAVING AVG(BookPrice) > 30;
```

---

Result:

Categories with average price above 30.

---

# MIN with HAVING

Example:

```sql id="hav018"
SELECT
    CategoryID,
    MIN(PublicationYear) AS OldestBook
FROM Books
GROUP BY CategoryID
HAVING MIN(PublicationYear) > 2010;
```

---

Result:

Categories where the oldest book is newer than 2010.

---

# MAX with HAVING

Example:

```sql id="hav019"
SELECT
    CategoryID,
    MAX(PublicationYear) AS NewestBook
FROM Books
GROUP BY CategoryID
HAVING MAX(PublicationYear) >= 2023;
```

---

Result:

Categories containing very recent books.

---

# Combining WHERE and HAVING

WHERE and HAVING often work together.

Example:

```sql id="hav020"
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
WHERE PublicationYear > 2015
GROUP BY CategoryID
HAVING COUNT(*) > 2;
```

---

Execution Flow:

```text id="hav021"
WHERE
 ↓
GROUP BY
 ↓
COUNT()
 ↓
HAVING
 ↓
Results
```

---

Meaning:

```text id="hav022"
Filter Books
 ↓
Create Groups
 ↓
Keep Large Groups
```

---

# Business Example 1

Management asks:

```text id="hav023"
Show categories
with more than 5 books.
```

Query:

```sql id="hav024"
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID
HAVING COUNT(*) > 5;
```

---

# Business Example 2

Management asks:

```text id="hav025"
Show publishers
with more than 3 books.
```

Query:

```sql id="hav026"
SELECT
    PublisherID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY PublisherID
HAVING COUNT(*) > 3;
```

---

# Business Example 3

Management asks:

```text id="hav027"
Show members
who borrowed more than 2 books.
```

Query:

```sql id="hav028"
SELECT
    MemberID,
    COUNT(*) AS BorrowCount
FROM BorrowRecords
GROUP BY MemberID
HAVING COUNT(*) > 2;
```

---

# Business Example 4

Management asks:

```text id="hav029"
Show categories
with average book price above 40.
```

Query:

```sql id="hav030"
SELECT
    CategoryID,
    AVG(BookPrice) AS AveragePrice
FROM Books
GROUP BY CategoryID
HAVING AVG(BookPrice) > 40;
```

---

# Query Execution Order

```text id="hav031"
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

# Common Beginner Mistakes

---

## Using Aggregate Functions in WHERE

Bad:

```sql id="hav032"
SELECT
    CategoryID,
    COUNT(*)
FROM Books
WHERE COUNT(*) > 5
GROUP BY CategoryID;
```

---

Problem:

```text id="hav033"
Aggregate functions cannot be used in WHERE
```

---

Correct:

```sql id="hav034"
SELECT
    CategoryID,
    COUNT(*)
FROM Books
GROUP BY CategoryID
HAVING COUNT(*) > 5;
```

---

## Forgetting GROUP BY

Bad:

```sql id="hav035"
SELECT
    CategoryID,
    COUNT(*)
FROM Books
HAVING COUNT(*) > 5;
```

---

Correct:

```sql id="hav036"
SELECT
    CategoryID,
    COUNT(*)
FROM Books
GROUP BY CategoryID
HAVING COUNT(*) > 5;
```

---

## Confusing WHERE and HAVING

Bad assumption:

```text id="hav037"
WHERE and HAVING do the same thing
```

---

Reality:

```text id="hav038"
WHERE filters rows

HAVING filters groups
```

---

# Hands-On Practice

Run:

```sql id="hav039"
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID
HAVING COUNT(*) > 2;
```

---

Run:

```sql id="hav040"
SELECT
    PublisherID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY PublisherID
HAVING COUNT(*) > 1;
```

---

Run:

```sql id="hav041"
SELECT
    MemberID,
    COUNT(*) AS BorrowCount
FROM BorrowRecords
GROUP BY MemberID
HAVING COUNT(*) > 2;
```

---

Run:

```sql id="hav042"
SELECT
    CategoryID,
    AVG(BookPrice) AS AveragePrice
FROM Books
GROUP BY CategoryID
HAVING AVG(BookPrice) > 30;
```

---

# Mini Exercise

Write queries to find:

### Task 1

Categories with more than 3 books.

---

### Task 2

Publishers with more than 2 books.

---

### Task 3

Members with more than 1 borrow record.

---

### Task 4

Categories with average book price greater than 30.

---

### Task 5

Publishers with total book value greater than 500.

---

# Best Practices

✅ Use WHERE for row filtering

✅ Use HAVING for group filtering

✅ Use meaningful aliases

✅ Keep aggregate conditions in HAVING

✅ Build KPI-driven reports

---

# Summary

In this lesson, you learned:

* HAVING clause
* HAVING vs WHERE
* Filtering grouped data
* COUNT with HAVING
* SUM with HAVING
* AVG with HAVING
* MIN/MAX with HAVING
* Business reporting techniques

HAVING is essential for advanced analytics because it allows you to filter summarized data and focus on the most meaningful groups.

---

# Knowledge Check

### Question 1

Which clause filters groups?

A. WHERE

B. HAVING

C. ORDER BY

D. DISTINCT

---

### Question 2

Which clause can use aggregate functions in conditions?

A. WHERE

B. HAVING

C. FROM

D. SELECT

---

### Question 3

Which query is correct?

```sql id="q1"
SELECT
    CategoryID,
    COUNT(*)
FROM Books
GROUP BY CategoryID
HAVING COUNT(*) > 5;
```

A. Correct

B. Incorrect

---

### Question 4

When does HAVING execute?

A. Before GROUP BY

B. After GROUP BY

---

### Question 5

Which statement is true?

A. WHERE filters groups

B. HAVING filters groups

---

# Next Lesson

➡️ 09-Business-Aggregation-Reports.md

In the next lesson, you'll combine aggregate functions, GROUP BY, and HAVING to create professional KPI dashboards and business intelligence reports.
