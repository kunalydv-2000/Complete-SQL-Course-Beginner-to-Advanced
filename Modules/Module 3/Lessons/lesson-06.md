# Lesson 06: Using TOP

> Learn how to limit query results using the TOP clause and retrieve only the first N records from a table.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand the purpose of TOP
* Limit query results
* Retrieve the first N rows
* Combine TOP with ORDER BY
* Create Top-N reports
* Build efficient business queries
* Avoid common TOP mistakes

---

# Introduction

Many business reports do not require every row in a table.

Examples:

```text id="top001"
Show the newest 5 books

Display the first 10 members

Retrieve the top 3 reservations

List the latest borrow records
```

Returning thousands of rows can be unnecessary.

SQL Server provides the:

```sql id="top002"
TOP
```

clause to limit the number of rows returned.

---

# What is TOP?

TOP limits the number of rows returned by a query.

Basic idea:

```text id="top003"
Table
   ↓
TOP
   ↓
Limited Results
```

---

# Basic Syntax

```sql id="top004"
SELECT TOP N
    ColumnName
FROM TableName;
```

---

# Example

```sql id="top005"
SELECT TOP 5 *
FROM Books;
```

---

Result:

Only the first 5 rows are returned.

---

# Why Use TOP?

TOP helps:

✅ Limit result sets

✅ Improve readability

✅ Create reports

✅ Reduce unnecessary data

✅ Retrieve sample records

---

# Sample Data

### Books Table

| BookID | Title                |
| ------ | -------------------- |
| 1      | Learning SQL         |
| 2      | Clean Code           |
| 3      | Atomic Habits        |
| 4      | Sapiens              |
| 5      | The Shining          |
| 6      | Deep Learning Basics |

---

Query:

```sql id="top006"
SELECT TOP 3 *
FROM Books;
```

---

Result:

| BookID | Title         |
| ------ | ------------- |
| 1      | Learning SQL  |
| 2      | Clean Code    |
| 3      | Atomic Habits |

---

# TOP with Specific Columns

Example:

```sql id="top007"
SELECT TOP 5
    Title,
    PublicationYear
FROM Books;
```

---

Only selected columns are displayed.

---

# TOP and ORDER BY

TOP is most useful when combined with ORDER BY.

Without ORDER BY:

```sql id="top008"
SELECT TOP 5 *
FROM Books;
```

---

SQL Server returns:

```text id="top009"
First 5 available rows
```

Order is not guaranteed.

---

# Better Approach

```sql id="top010"
SELECT TOP 5 *
FROM Books
ORDER BY PublicationYear DESC;
```

---

Result:

```text id="top011"
Newest 5 books
```

---

# Query Execution Flow

```text id="top012"
FROM
 ↓
WHERE
 ↓
ORDER BY
 ↓
TOP
 ↓
Results
```

---

# Example: Newest Books

```sql id="top013"
SELECT TOP 3
    Title,
    PublicationYear
FROM Books
ORDER BY PublicationYear DESC;
```

---

Result:

| Title                | PublicationYear |
| -------------------- | --------------- |
| Deep Learning Basics | 2022            |
| Learning SQL         | 2020            |
| Atomic Habits        | 2018            |

---

# Example: Oldest Books

```sql id="top014"
SELECT TOP 3
    Title,
    PublicationYear
FROM Books
ORDER BY PublicationYear ASC;
```

---

Result:

| Title       | PublicationYear |
| ----------- | --------------- |
| The Shining | 1977            |
| Clean Code  | 2008            |
| Sapiens     | 2011            |

---

# TOP with WHERE

TOP can be combined with WHERE.

---

Example:

```sql id="top015"
SELECT TOP 5 *
FROM Books
WHERE CategoryID = 1;
```

---

Result:

Only the first 5 books from Category 1.

---

# TOP + WHERE + ORDER BY

Example:

```sql id="top016"
SELECT TOP 5
    Title,
    PublicationYear
FROM Books
WHERE CategoryID = 1
ORDER BY PublicationYear DESC;
```

---

Meaning:

```text id="top017"
Technology Books
↓
Newest First
↓
Top 5 Results
```

---

# Business Reporting Examples

---

## First 5 Members

```sql id="top018"
SELECT TOP 5 *
FROM Members;
```

---

## Latest Borrow Records

```sql id="top019"
SELECT TOP 10 *
FROM BorrowRecords
ORDER BY BorrowDate DESC;
```

---

## Newest Books

```sql id="top020"
SELECT TOP 5 *
FROM Books
ORDER BY PublicationYear DESC;
```

---

## Oldest Books

```sql id="top021"
SELECT TOP 5 *
FROM Books
ORDER BY PublicationYear ASC;
```

---

# TOP with Percentage

SQL Server supports percentages.

---

Example:

```sql id="top022"
SELECT TOP 50 PERCENT *
FROM Books;
```

---

Result:

Returns approximately half of the rows.

---

# TOP with TIES

Useful when values are equal.

---

Example:

```sql id="top023"
SELECT TOP 5 WITH TIES
    Title,
    PublicationYear
FROM Books
ORDER BY PublicationYear DESC;
```

---

SQL Server includes additional rows if they share the same ranking value.

---

# Real-World Scenario

Library manager asks:

```text id="top024"
Show the newest 5 books.
```

Query:

```sql id="top025"
SELECT TOP 5
    Title,
    PublicationYear
FROM Books
ORDER BY PublicationYear DESC;
```

---

Manager asks:

```text id="top026"
Show the oldest 3 books.
```

Query:

```sql id="top027"
SELECT TOP 3
    Title,
    PublicationYear
FROM Books
ORDER BY PublicationYear ASC;
```

---

# Common Beginner Mistakes

---

## Using TOP Without ORDER BY

Bad:

```sql id="top028"
SELECT TOP 5 *
FROM Books;
```

---

Problem:

```text id="top029"
Returned rows may not be meaningful
```

---

Better:

```sql id="top030"
SELECT TOP 5 *
FROM Books
ORDER BY PublicationYear DESC;
```

---

## Incorrect TOP Placement

Bad:

```sql id="top031"
SELECT *
TOP 5
FROM Books;
```

---

Correct:

```sql id="top032"
SELECT TOP 5 *
FROM Books;
```

---

## Assuming TOP Filters Data

Bad assumption:

```text id="top033"
TOP finds newest books automatically
```

---

Reality:

```text id="top034"
ORDER BY determines which rows are selected
```

---

# Performance Benefits

TOP helps:

* Reduce returned rows
* Improve reporting performance
* Simplify analysis
* Retrieve samples quickly

---

# Hands-On Practice

Run:

```sql id="top035"
SELECT TOP 5 *
FROM Books;
```

---

Run:

```sql id="top036"
SELECT TOP 3 *
FROM Books
ORDER BY PublicationYear DESC;
```

---

Run:

```sql id="top037"
SELECT TOP 5 *
FROM Members;
```

---

Run:

```sql id="top038"
SELECT TOP 10 *
FROM BorrowRecords
ORDER BY BorrowDate DESC;
```

---

# Mini Exercise

Write queries to:

### Task 1

Display the first 5 books.

---

### Task 2

Display the newest 3 books.

---

### Task 3

Display the first 10 members.

---

### Task 4

Display the oldest 5 books.

---

# Best Practices

✅ Always use ORDER BY with TOP

✅ Use TOP for reports and dashboards

✅ Limit large result sets

✅ Retrieve only necessary records

✅ Use meaningful sorting criteria

---

# Summary

In this lesson, you learned:

* What TOP does
* Basic TOP syntax
* TOP with ORDER BY
* TOP with WHERE
* TOP PERCENT
* TOP WITH TIES
* Business reporting scenarios
* Common mistakes

TOP is one of the most useful SQL features for creating focused reports and limiting large result sets.

---

# Knowledge Check

### Question 1

Which clause limits the number of rows returned?

A. WHERE

B. ORDER BY

C. TOP

D. DISTINCT

---

### Question 2

Which query returns the newest 5 books?

A.

```sql id="q1"
SELECT TOP 5 *
FROM Books;
```

B.

```sql id="q2"
SELECT TOP 5 *
FROM Books
ORDER BY PublicationYear DESC;
```

C.

```sql id="q3"
SELECT *
FROM Books
WHERE TOP 5;
```

D.

```sql id="q4"
SELECT NEWEST 5 *
FROM Books;
```

---

### Question 3

What does TOP 10 return?

A. All rows

B. First 10 rows

C. Last 10 rows

D. Unique rows

---

### Question 4

Which clause should usually accompany TOP?

A. DISTINCT

B. WHERE

C. ORDER BY

D. GROUP BY

---

# Next Lesson

➡️ 07-Column-Aliases.md

In the next lesson, you'll learn how to rename columns using aliases and create more professional, readable query outputs.
