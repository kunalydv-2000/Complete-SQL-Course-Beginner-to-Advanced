# Lesson 02: COUNT() Function

> Learn how to count records in a database using the COUNT() function and create meaningful business metrics and KPI reports.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand the COUNT() function
* Count rows in a table
* Count non-NULL values
* Use COUNT(*) and COUNT(column)
* Create KPI reports
* Build management metrics
* Avoid common COUNT() mistakes

---

# Introduction

One of the most common business questions is:

```text
How many?
```

Examples:

```text
How many books exist?

How many members are registered?

How many reservations are active?

How many authors are in the database?
```

To answer these questions, SQL provides:

```sql
COUNT()
```

COUNT() is the most frequently used aggregate function in reporting and analytics.

---

# What is COUNT()?

COUNT() counts records.

Basic idea:

```text
Rows
 ↓
COUNT()
 ↓
Total Records
```

---

# Basic Syntax

```sql
SELECT COUNT(*)
FROM TableName;
```

---

# Example

```sql
SELECT COUNT(*)
FROM Books;
```

---

# Sample Data

| BookID |
| ------ |
| 1      |
| 2      |
| 3      |
| 4      |
| 5      |

---

Result:

```text
5
```

COUNT() returns the total number of rows.

---

# Understanding COUNT(*)

The asterisk means:

```text
Count Every Row
```

Example:

```sql
SELECT COUNT(*)
FROM Members;
```

Result:

```text
Total Members
```

---

# Why COUNT(*) is Useful

COUNT(*) helps answer:

```text
How many records exist?
```

Examples:

* Total books
* Total members
* Total authors
* Total reservations
* Total borrow records

---

# COUNT(column)

COUNT() can count values in a specific column.

Syntax:

```sql
SELECT COUNT(ColumnName)
FROM TableName;
```

---

# Example

```sql
SELECT COUNT(Email)
FROM Members;
```

Counts only rows where Email is NOT NULL.

---

# Sample Data

| MemberID | Email                                     |
| -------- | ----------------------------------------- |
| 1        | [john@email.com](mailto:john@email.com)   |
| 2        | NULL                                      |
| 3        | [sarah@email.com](mailto:sarah@email.com) |

---

Query:

```sql
SELECT COUNT(Email)
FROM Members;
```

---

Result:

```text
2
```

NULL values are ignored.

---

# COUNT(*) vs COUNT(column)

Sample Data:

| ID | Email |
| -- | ----- |
| 1  | A     |
| 2  | NULL  |
| 3  | B     |

---

COUNT(*)

```sql
SELECT COUNT(*)
FROM Members;
```

Result:

```text
3
```

---

COUNT(Email)

```sql
SELECT COUNT(Email)
FROM Members;
```

Result:

```text
2
```

---

# COUNT(DISTINCT)

COUNT can also count unique values.

---

# Syntax

```sql
SELECT COUNT(DISTINCT ColumnName)
FROM TableName;
```

---

# Example

Books Table:

| CategoryID |
| ---------- |
| 1          |
| 1          |
| 2          |
| 3          |
| 3          |

---

Query:

```sql
SELECT COUNT(DISTINCT CategoryID)
FROM Books;
```

---

Result:

```text
3
```

Unique categories only.

---

# Business Example

Question:

```text
How many categories exist?
```

Query:

```sql
SELECT COUNT(DISTINCT CategoryID)
FROM Books;
```

---

# COUNT with Aliases

Use aliases to create readable reports.

Example:

```sql
SELECT
    COUNT(*) AS TotalBooks
FROM Books;
```

---

Result:

| TotalBooks |
| ---------- |
| 25         |

---

# KPI Reporting Examples

---

## Total Books

```sql
SELECT
    COUNT(*) AS TotalBooks
FROM Books;
```

---

## Total Members

```sql
SELECT
    COUNT(*) AS TotalMembers
FROM Members;
```

---

## Total Authors

```sql
SELECT
    COUNT(*) AS TotalAuthors
FROM Authors;
```

---

## Total Reservations

```sql
SELECT
    COUNT(*) AS TotalReservations
FROM Reservations;
```

---

## Total Borrow Records

```sql
SELECT
    COUNT(*) AS TotalBorrows
FROM BorrowRecords;
```

---

# COUNT with WHERE

COUNT() can count filtered records.

---

Example:

```sql
SELECT
    COUNT(*) AS ApprovedReservations
FROM Reservations
WHERE Status = 'Approved';
```

---

Result:

Only approved reservations are counted.

---

# COUNT with Multiple Conditions

Example:

```sql
SELECT
    COUNT(*) AS RecentBooks
FROM Books
WHERE PublicationYear > 2020;
```

---

Result:

Counts books published after 2020.

---

# Query Execution Flow

```text
Table
  ↓
WHERE
  ↓
COUNT()
  ↓
Result
```

---

# Real-World Scenario

Library manager asks:

```text
How many books are available?
```

Query:

```sql
SELECT
    COUNT(*) AS TotalBooks
FROM Books;
```

---

Manager asks:

```text
How many approved reservations exist?
```

Query:

```sql
SELECT
    COUNT(*) AS ApprovedReservations
FROM Reservations
WHERE Status = 'Approved';
```

---

# Common Beginner Mistakes

---

## Forgetting Parentheses

Bad:

```sql
SELECT COUNT
FROM Books;
```

---

Correct:

```sql
SELECT COUNT(*)
FROM Books;
```

---

## Confusing COUNT(*) with COUNT(column)

Bad assumption:

```text
Both always return the same value
```

Not true when NULL values exist.

---

## Missing Alias

Bad:

```sql
SELECT COUNT(*)
FROM Books;
```

Works, but report column name may be unclear.

---

Better:

```sql
SELECT
    COUNT(*) AS TotalBooks
FROM Books;
```

---

# Performance Note

COUNT(*) is optimized by SQL Server and should be preferred when counting rows.

Example:

```sql
SELECT COUNT(*)
FROM Books;
```

---

# Hands-On Practice

Run:

```sql
SELECT COUNT(*)
FROM Books;
```

---

Run:

```sql
SELECT COUNT(*)
FROM Members;
```

---

Run:

```sql
SELECT COUNT(*)
FROM Reservations;
```

---

Run:

```sql
SELECT COUNT(DISTINCT CategoryID)
FROM Books;
```

---

# Mini Exercise

Write queries to find:

### Task 1

Total authors.

---

### Task 2

Total publishers.

---

### Task 3

Total categories.

---

### Task 4

Total approved reservations.

---

### Task 5

Number of unique publication years.

---

# Best Practices

✅ Use COUNT(*) for row counts

✅ Use aliases in reports

✅ Use COUNT(DISTINCT) when uniqueness matters

✅ Combine COUNT with WHERE for KPIs

✅ Understand NULL handling

---

# Summary

In this lesson, you learned:

* COUNT(*)
* COUNT(column)
* COUNT(DISTINCT)
* Counting filtered records
* KPI reporting
* NULL handling
* Business metrics

COUNT() is the foundation of reporting and one of the most commonly used functions in SQL analytics.

---

# Knowledge Check

### Question 1

Which function counts rows?

A. SUM()

B. AVG()

C. COUNT()

D. MAX()

---

### Question 2

Which query counts all rows?

A.

```sql
SELECT COUNT(Name)
FROM Members;
```

B.

```sql
SELECT COUNT(*)
FROM Members;
```

C.

```sql
SELECT SUM(*)
FROM Members;
```

D.

```sql
SELECT AVG(*)
FROM Members;
```

---

### Question 3

Does COUNT(column) include NULL values?

A. Yes

B. No

---

### Question 4

Which keyword counts unique values?

A. UNIQUE

B. TOP

C. DISTINCT

D. HAVING

---

### Question 5

Which query counts unique categories?

```sql
SELECT COUNT(DISTINCT CategoryID)
FROM Books;
```

A. Correct

B. Incorrect

---

# Next Lesson

➡️ 03-SUM-Function.md

In the next lesson, you'll learn how to calculate totals using SUM() and build financial and operational reports from your database.
