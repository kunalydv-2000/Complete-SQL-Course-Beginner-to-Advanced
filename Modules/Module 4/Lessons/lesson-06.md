# Lesson 06: Introduction to GROUP BY

> Learn how to group records and create summary reports using the GROUP BY clause.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand the purpose of GROUP BY
* Group rows into categories
* Create summary reports
* Combine GROUP BY with aggregate functions
* Build category-wise business reports
* Analyze grouped data
* Avoid common GROUP BY mistakes

---

# Introduction

So far, you have learned aggregate functions such as:

```sql id="grp001"
COUNT()
SUM()
AVG()
MIN()
MAX()
```

These functions summarize an entire table.

Example:

```sql id="grp002"
SELECT COUNT(*)
FROM Books;
```

Result:

```text id="grp003"
25
```

This tells us:

```text id="grp004"
Total Books = 25
```

But what if management asks:

```text id="grp005"
How many books are in each category?
```

One total value is no longer enough.

We need to divide the data into groups.

SQL provides:

```sql id="grp006"
GROUP BY
```

---

# What is GROUP BY?

GROUP BY divides rows into groups and then performs aggregate calculations on each group.

Basic idea:

```text id="grp007"
Rows
 ↓
GROUP BY
 ↓
Groups
 ↓
Aggregate Function
 ↓
Summary Results
```

---

# Example Data

Books Table

| BookID | CategoryID |
| ------ | ---------- |
| 1      | 1          |
| 2      | 1          |
| 3      | 2          |
| 4      | 3          |
| 5      | 3          |

---

Question:

```text id="grp008"
How many books are in each category?
```

---

# Basic Syntax

```sql id="grp009"
SELECT
    ColumnName,
    AggregateFunction(ColumnName)
FROM TableName
GROUP BY ColumnName;
```

---

# First GROUP BY Query

```sql id="grp010"
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
| 1          | 2          |
| 2          | 1          |
| 3          | 2          |

---

# Understanding the Process

Step 1:

Books are divided by CategoryID.

```text id="grp011"
Category 1
Category 2
Category 3
```

---

Step 2:

COUNT() runs within each category.

---

Step 3:

Results are returned.

```text id="grp012"
CategoryID | TotalBooks
-----------|-----------
1          | 2
2          | 1
3          | 2
```

---

# Why GROUP BY Matters

Without GROUP BY:

```sql id="grp013"
SELECT COUNT(*)
FROM Books;
```

Result:

```text id="grp014"
5
```

---

With GROUP BY:

```sql id="grp015"
SELECT
    CategoryID,
    COUNT(*)
FROM Books
GROUP BY CategoryID;
```

Result:

```text id="grp016"
Multiple category summaries
```

---

# GROUP BY with COUNT()

Count books by category.

```sql id="grp017"
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID;
```

---

# GROUP BY with SUM()

Calculate total book value by category.

```sql id="grp018"
SELECT
    CategoryID,
    SUM(BookPrice) AS TotalValue
FROM Books
GROUP BY CategoryID;
```

---

Result:

| CategoryID | TotalValue |
| ---------- | ---------- |
| 1          | 250        |
| 2          | 400        |
| 3          | 180        |

---

# GROUP BY with AVG()

Calculate average book price.

```sql id="grp019"
SELECT
    CategoryID,
    AVG(BookPrice) AS AveragePrice
FROM Books
GROUP BY CategoryID;
```

---

Result:

| CategoryID | AveragePrice |
| ---------- | ------------ |
| 1          | 35.50        |
| 2          | 42.75        |
| 3          | 28.25        |

---

# GROUP BY with MIN()

Find oldest publication year per category.

```sql id="grp020"
SELECT
    CategoryID,
    MIN(PublicationYear) AS OldestBook
FROM Books
GROUP BY CategoryID;
```

---

# GROUP BY with MAX()

Find newest publication year per category.

```sql id="grp021"
SELECT
    CategoryID,
    MAX(PublicationYear) AS NewestBook
FROM Books
GROUP BY CategoryID;
```

---

# Business Example

Management asks:

```text id="grp022"
How many books are published by each publisher?
```

Query:

```sql id="grp023"
SELECT
    PublisherID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY PublisherID;
```

---

Result:

| PublisherID | TotalBooks |
| ----------- | ---------- |
| 1           | 12         |
| 2           | 8          |
| 3           | 5          |

---

# Reservations by Status

Question:

```text id="grp024"
How many reservations exist for each status?
```

Query:

```sql id="grp025"
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
| Approved  | 15                |
| Pending   | 8                 |
| Cancelled | 3                 |

---

# Borrow Activity by Member

Query:

```sql id="grp026"
SELECT
    MemberID,
    COUNT(*) AS TotalBorrows
FROM BorrowRecords
GROUP BY MemberID;
```

---

Result:

Member-wise borrowing statistics.

---

# GROUP BY with ORDER BY

Results can be sorted.

Example:

```sql id="grp027"
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID
ORDER BY TotalBooks DESC;
```

---

Result:

Largest categories appear first.

---

# Query Execution Flow

```text id="grp028"
FROM
 ↓
WHERE
 ↓
GROUP BY
 ↓
Aggregate Function
 ↓
SELECT
 ↓
ORDER BY
```

---

# GROUP BY Rules

Every selected column must:

```text id="grp029"
1. Be inside GROUP BY

OR

2. Be used in an aggregate function
```

---

Correct:

```sql id="grp030"
SELECT
    CategoryID,
    COUNT(*)
FROM Books
GROUP BY CategoryID;
```

---

Incorrect:

```sql id="grp031"
SELECT
    CategoryID,
    Title,
    COUNT(*)
FROM Books
GROUP BY CategoryID;
```

---

Problem:

```text id="grp032"
Title is not grouped
and not aggregated
```

---

# Real-World KPI Examples

---

## Books by Category

```sql id="grp033"
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID;
```

---

## Books by Publisher

```sql id="grp034"
SELECT
    PublisherID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY PublisherID;
```

---

## Reservations by Status

```sql id="grp035"
SELECT
    Status,
    COUNT(*) AS TotalReservations
FROM Reservations
GROUP BY Status;
```

---

## Average Book Price by Category

```sql id="grp036"
SELECT
    CategoryID,
    AVG(BookPrice) AS AveragePrice
FROM Books
GROUP BY CategoryID;
```

---

# Common Beginner Mistakes

---

## Forgetting GROUP BY

Bad:

```sql id="grp037"
SELECT
    CategoryID,
    COUNT(*)
FROM Books;
```

---

SQL Server error:

```text id="grp038"
CategoryID is invalid
```

---

Correct:

```sql id="grp039"
SELECT
    CategoryID,
    COUNT(*)
FROM Books
GROUP BY CategoryID;
```

---

## Selecting Non-Grouped Columns

Bad:

```sql id="grp040"
SELECT
    CategoryID,
    Title,
    COUNT(*)
FROM Books
GROUP BY CategoryID;
```

---

Correct:

```sql id="grp041"
SELECT
    CategoryID,
    COUNT(*)
FROM Books
GROUP BY CategoryID;
```

---

## Confusing WHERE and GROUP BY

WHERE:

```text id="grp042"
Filters rows
```

GROUP BY:

```text id="grp043"
Creates groups
```

---

# Hands-On Practice

Run:

```sql id="grp044"
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID;
```

---

Run:

```sql id="grp045"
SELECT
    PublisherID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY PublisherID;
```

---

Run:

```sql id="grp046"
SELECT
    Status,
    COUNT(*) AS TotalReservations
FROM Reservations
GROUP BY Status;
```

---

Run:

```sql id="grp047"
SELECT
    CategoryID,
    AVG(BookPrice) AS AveragePrice
FROM Books
GROUP BY CategoryID;
```

---

# Mini Exercise

Write queries to find:

### Task 1

Number of books per category.

---

### Task 2

Number of books per publisher.

---

### Task 3

Reservations per status.

---

### Task 4

Average book price per category.

---

### Task 5

Newest publication year per category.

---

# Best Practices

✅ Always group non-aggregated columns

✅ Use aliases for readability

✅ Combine GROUP BY with aggregate functions

✅ Sort reports using ORDER BY

✅ Build KPI-focused reports

---

# Summary

In this lesson, you learned:

* What GROUP BY does
* Creating groups
* GROUP BY with COUNT()
* GROUP BY with SUM()
* GROUP BY with AVG()
* GROUP BY with MIN()
* GROUP BY with MAX()
* Business reporting
* Common mistakes

GROUP BY is one of the most important SQL features because it transforms raw data into meaningful business summaries and analytical reports.

---

# Knowledge Check

### Question 1

What does GROUP BY do?

A. Deletes rows

B. Sorts rows

C. Creates groups

D. Updates rows

---

### Question 2

Which query counts books by category?

A.

```sql id="q1"
SELECT COUNT(*)
FROM Books;
```

B.

```sql id="q2"
SELECT
    CategoryID,
    COUNT(*)
FROM Books
GROUP BY CategoryID;
```

---

### Question 3

Can GROUP BY be combined with AVG()?

A. Yes

B. No

---

### Question 4

Which clause usually comes after GROUP BY?

A. INSERT

B. UPDATE

C. ORDER BY

D. CREATE

---

### Question 5

Which statement is true?

A. Every selected column must be grouped or aggregated.

B. Any column can be selected without grouping.

---

# Next Lesson

➡️ 07-Multiple-Column-GROUP-BY.md

In the next lesson, you'll learn how to group data by multiple columns and create more detailed business reports and analytical summaries.
