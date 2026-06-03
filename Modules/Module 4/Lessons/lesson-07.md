# Lesson 07: Multiple Column GROUP BY

> Learn how to group data using multiple columns and create more detailed business reports and analytical summaries.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand multi-column grouping
* Group records using multiple fields
* Create detailed business reports
* Analyze segmented data
* Combine GROUP BY with aggregate functions
* Build advanced summaries
* Avoid common grouping mistakes

---

# Introduction

In the previous lesson, you learned how to use:

```sql
GROUP BY
```

with a single column.

Example:

```sql
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID;
```

Result:

| CategoryID | TotalBooks |
| ---------- | ---------- |
| 1          | 10         |
| 2          | 8          |
| 3          | 5          |

This summarizes books by category.

However, business users often require more detailed reporting.

Example:

```text
How many books exist in each category
for each publisher?
```

This requires grouping by multiple columns.

---

# What is Multiple Column GROUP BY?

Multiple-column grouping creates groups based on combinations of values from two or more columns.

Visualization:

```text
Books
  ↓
CategoryID + PublisherID
  ↓
Smaller Groups
  ↓
Aggregate Functions
  ↓
Detailed Report
```

---

# Basic Syntax

```sql
SELECT
    Column1,
    Column2,
    AggregateFunction(Column3)
FROM TableName
GROUP BY
    Column1,
    Column2;
```

---

# Sample Data

| BookID | CategoryID | PublisherID |
| ------ | ---------- | ----------- |
| 1      | 1          | 1           |
| 2      | 1          | 1           |
| 3      | 1          | 2           |
| 4      | 2          | 1           |
| 5      | 2          | 2           |

---

# Example: Category and Publisher Analysis

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

Result:

| CategoryID | PublisherID | TotalBooks |
| ---------- | ----------- | ---------- |
| 1          | 1           | 2          |
| 1          | 2           | 1          |
| 2          | 1           | 1          |
| 2          | 2           | 1          |

---

# Understanding the Groups

SQL creates separate groups for every unique combination.

```text
Category 1 + Publisher 1
Category 1 + Publisher 2
Category 2 + Publisher 1
Category 2 + Publisher 2
```

Each combination becomes its own summary row.

---

# COUNT with Multiple Columns

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

# SUM with Multiple Columns

Calculate total inventory value by category and publisher.

```sql
SELECT
    CategoryID,
    PublisherID,
    SUM(BookPrice) AS TotalBookValue
FROM Books
GROUP BY
    CategoryID,
    PublisherID;
```

---

# AVG with Multiple Columns

Calculate average price by category and publisher.

```sql
SELECT
    CategoryID,
    PublisherID,
    AVG(BookPrice) AS AverageBookPrice
FROM Books
GROUP BY
    CategoryID,
    PublisherID;
```

---

# MIN and MAX with Multiple Columns

Find oldest and newest publication years.

```sql
SELECT
    CategoryID,
    PublisherID,
    MIN(PublicationYear) AS OldestBook,
    MAX(PublicationYear) AS NewestBook
FROM Books
GROUP BY
    CategoryID,
    PublisherID;
```

---

# Business Example 1

Management asks:

```text
Show the number of books
for each publisher within each category.
```

Query:

```sql
SELECT
    CategoryID,
    PublisherID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY
    CategoryID,
    PublisherID
ORDER BY
    CategoryID,
    PublisherID;
```

---

# Business Example 2

Reservation Analysis

```sql
SELECT
    MemberID,
    Status,
    COUNT(*) AS TotalReservations
FROM Reservations
GROUP BY
    MemberID,
    Status;
```

---

Result:

| MemberID | Status   | TotalReservations |
| -------- | -------- | ----------------- |
| 1        | Approved | 3                 |
| 1        | Pending  | 1                 |
| 2        | Approved | 2                 |

---

# Business Example 3

Borrow Analysis

```sql
SELECT
    MemberID,
    BookID,
    COUNT(*) AS BorrowCount
FROM BorrowRecords
GROUP BY
    MemberID,
    BookID;
```

---

This report shows how many times each member borrowed each book.

---

# Three-Column GROUP BY

GROUP BY can use three or more columns.

Example:

```sql
SELECT
    CategoryID,
    PublisherID,
    PublicationYear,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY
    CategoryID,
    PublisherID,
    PublicationYear;
```

---

# Query Execution Flow

```text
FROM
 ↓
WHERE
 ↓
GROUP BY
(CategoryID + PublisherID)
 ↓
Aggregate Function
 ↓
SELECT
 ↓
ORDER BY
```

---

# Sorting Grouped Results

```sql
SELECT
    CategoryID,
    PublisherID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY
    CategoryID,
    PublisherID
ORDER BY
    TotalBooks DESC;
```

---

Largest groups appear first.

---

# GROUP BY Rules

Every selected column must:

```text
1. Appear in GROUP BY

OR

2. Be inside an aggregate function
```

---

Correct:

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

Incorrect:

```sql
SELECT
    CategoryID,
    PublisherID,
    Title,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY
    CategoryID,
    PublisherID;
```

---

Problem:

```text
Title is neither grouped
nor aggregated.
```

---

# Real-World KPI Reports

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

## Publication Analysis

```sql
SELECT
    CategoryID,
    PublisherID,
    MIN(PublicationYear) AS OldestBook,
    MAX(PublicationYear) AS NewestBook
FROM Books
GROUP BY
    CategoryID,
    PublisherID;
```

---

# Common Beginner Mistakes

## Missing Columns in GROUP BY

Bad:

```sql
SELECT
    CategoryID,
    PublisherID,
    COUNT(*)
FROM Books
GROUP BY CategoryID;
```

---

Correct:

```sql
SELECT
    CategoryID,
    PublisherID,
    COUNT(*)
FROM Books
GROUP BY
    CategoryID,
    PublisherID;
```

---

## Selecting Non-Grouped Columns

Bad:

```sql
SELECT
    CategoryID,
    PublisherID,
    Title,
    COUNT(*)
FROM Books
GROUP BY
    CategoryID,
    PublisherID;
```

---

Title must be grouped or aggregated.

---

## Over-Grouping

Adding unnecessary columns can create too many groups.

Example:

```sql
GROUP BY
CategoryID,
PublisherID,
Title
```

This may produce one row per book.

---

# Hands-On Practice

Run:

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

Run:

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

Run:

```sql
SELECT
    MemberID,
    Status,
    COUNT(*) AS TotalReservations
FROM Reservations
GROUP BY
    MemberID,
    Status;
```

---

# Mini Exercise

Write queries to find:

### Task 1

Books by Category and Publisher.

---

### Task 2

Average Book Price by Category and Publisher.

---

### Task 3

Reservations by Member and Status.

---

### Task 4

Books by Category, Publisher, and PublicationYear.

---

### Task 5

Oldest and newest publication year by Category and Publisher.

---

# Best Practices

✅ Group only necessary columns

✅ Use meaningful aliases

✅ Verify grouping logic

✅ Sort grouped reports

✅ Build reports around business questions

---

# Summary

In this lesson, you learned:

* Multi-column GROUP BY
* Grouping combinations
* COUNT with multiple groups
* SUM with multiple groups
* AVG with multiple groups
* MIN/MAX with multiple groups
* Business segmentation reporting

Multiple-column GROUP BY is a powerful reporting technique that enables detailed business analysis across multiple dimensions.

---

# Knowledge Check

### Question 1

Can GROUP BY use more than one column?

A. No

B. Yes

---

### Question 2

Which query correctly groups by CategoryID and PublisherID?

```sql
SELECT
    CategoryID,
    PublisherID,
    COUNT(*)
FROM Books
GROUP BY
    CategoryID,
    PublisherID;
```

A. Correct

B. Incorrect

---

### Question 3

Which aggregate function calculates averages?

A. COUNT()

B. SUM()

C. AVG()

D. MAX()

---

### Question 4

Must all selected non-aggregated columns appear in GROUP BY?

A. Yes

B. No

---

# Next Lesson

➡️ 08-HAVING-Clause.md

In the next lesson, you'll learn how to filter grouped results using HAVING and build advanced analytical reports.
