# Lesson 09: Building Business Queries

> Learn how to combine SELECT, WHERE, DISTINCT, ORDER BY, TOP, aliases, IN, BETWEEN, and LIKE to answer real-world business questions using SQL.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Combine multiple SQL clauses in a single query
* Build professional business reports
* Analyze business requirements
* Translate questions into SQL
* Create readable query outputs
* Design reporting queries
* Apply all Module 03 concepts together

---

# Introduction

So far, you have learned:

✅ SELECT

✅ Specific Columns

✅ DISTINCT

✅ WHERE

✅ ORDER BY

✅ TOP

✅ Aliases

✅ IN

✅ BETWEEN

✅ LIKE

In real-world environments, these clauses are rarely used alone.

Instead, they are combined to answer business questions.

Example:

```text id="bq001"
Show the newest 5 technology books
published after 2015.
```

This requires:

```text id="bq002"
SELECT
WHERE
ORDER BY
TOP
```

working together.

---

# Understanding Business Queries

A business query starts with a question.

Example:

```text id="bq003"
Which books were published after 2018?
```

Translate into SQL:

```sql id="bq004"
SELECT *
FROM Books
WHERE PublicationYear > 2018;
```

---

# Business Query Workflow

```text id="bq005"
Business Question
        ↓
Identify Table
        ↓
Identify Columns
        ↓
Apply Filters
        ↓
Sort Results
        ↓
Present Report
```

---

# Example 1: Recent Books

Business Question:

```text id="bq006"
Show books published after 2015.
```

SQL:

```sql id="bq007"
SELECT
    Title,
    PublicationYear
FROM Books
WHERE PublicationYear > 2015;
```

---

Result:

| Title         | PublicationYear |
| ------------- | --------------- |
| Learning SQL  | 2020            |
| Atomic Habits | 2018            |

---

# Example 2: Newest Books

Business Question:

```text id="bq008"
Show the newest 5 books.
```

SQL:

```sql id="bq009"
SELECT TOP 5
    Title,
    PublicationYear
FROM Books
ORDER BY PublicationYear DESC;
```

---

Explanation:

```text id="bq010"
TOP 5
↓
ORDER BY DESC
↓
Newest 5 Books
```

---

# Example 3: Technology Books

Business Question:

```text id="bq011"
Show technology books.
```

Assume:

```text id="bq012"
CategoryID = 1
```

Query:

```sql id="bq013"
SELECT
    Title,
    PublicationYear
FROM Books
WHERE CategoryID = 1;
```

---

# Example 4: Technology Books Published After 2015

Business Question:

```text id="bq014"
Show technology books published after 2015.
```

SQL:

```sql id="bq015"
SELECT
    Title,
    PublicationYear
FROM Books
WHERE CategoryID = 1
AND PublicationYear > 2015;
```

---

# Example 5: Professional Report

Business Question:

```text id="bq016"
Create a book report.
```

SQL:

```sql id="bq017"
SELECT
    BookID AS Book_ID,
    Title AS Book_Title,
    PublicationYear AS Published_Year
FROM Books;
```

---

Result:

| Book_ID | Book_Title   | Published_Year |
| ------- | ------------ | -------------- |
| 1       | Learning SQL | 2020           |

---

# Example 6: Name Search

Business Question:

```text id="bq018"
Find members whose names start with S.
```

SQL:

```sql id="bq019"
SELECT
    FirstName,
    LastName
FROM Members
WHERE FirstName LIKE 'S%';
```

---

Possible Result:

| FirstName | LastName |
| --------- | -------- |
| Sarah     | Wilson   |
| Sophia    | Davis    |

---

# Example 7: Books Within a Date Range

Business Question:

```text id="bq020"
Show books published between 2010 and 2020.
```

SQL:

```sql id="bq021"
SELECT
    Title,
    PublicationYear
FROM Books
WHERE PublicationYear
BETWEEN 2010 AND 2020;
```

---

# Example 8: Multiple Categories

Business Question:

```text id="bq022"
Show books from Technology,
Science, and Business categories.
```

SQL:

```sql id="bq023"
SELECT
    Title,
    CategoryID
FROM Books
WHERE CategoryID IN (1,2,3);
```

---

# Combining Multiple Concepts

Business Question:

```text id="bq024"
Show the newest 5 technology books
published after 2015.
```

SQL:

```sql id="bq025"
SELECT TOP 5
    Title AS Book_Title,
    PublicationYear AS Published_Year
FROM Books
WHERE CategoryID = 1
AND PublicationYear > 2015
ORDER BY PublicationYear DESC;
```

---

# Understanding Query Components

```sql id="bq026"
SELECT TOP 5
    Title,
    PublicationYear
FROM Books
WHERE CategoryID = 1
ORDER BY PublicationYear DESC;
```

Breakdown:

| Clause   | Purpose        |
| -------- | -------------- |
| SELECT   | Choose columns |
| TOP      | Limit rows     |
| FROM     | Specify table  |
| WHERE    | Filter data    |
| ORDER BY | Sort results   |

---

# Business Scenario 1

Library Manager asks:

```text id="bq027"
Show all approved reservations.
```

Query:

```sql id="bq028"
SELECT *
FROM Reservations
WHERE Status = 'Approved';
```

---

# Business Scenario 2

Library Manager asks:

```text id="bq029"
Show the newest books.
```

Query:

```sql id="bq030"
SELECT TOP 10
    Title,
    PublicationYear
FROM Books
ORDER BY PublicationYear DESC;
```

---

# Business Scenario 3

Library Manager asks:

```text id="bq031"
Show members whose names begin with J.
```

Query:

```sql id="bq032"
SELECT
    FirstName,
    LastName
FROM Members
WHERE FirstName LIKE 'J%';
```

---

# Business Scenario 4

Library Manager asks:

```text id="bq033"
Show books published between 2015 and 2025.
```

Query:

```sql id="bq034"
SELECT *
FROM Books
WHERE PublicationYear
BETWEEN 2015 AND 2025;
```

---

# Query Design Process

Whenever you receive a business request:

---

## Step 1

Identify the table.

Example:

```text id="bq035"
Books
```

---

## Step 2

Identify needed columns.

Example:

```text id="bq036"
Title
PublicationYear
```

---

## Step 3

Apply filters.

Example:

```text id="bq037"
PublicationYear > 2015
```

---

## Step 4

Sort results.

Example:

```text id="bq038"
Newest First
```

---

## Step 5

Limit rows if necessary.

Example:

```text id="bq039"
TOP 5
```

---

# Query Execution Order

SQL Server logically processes:

```text id="bq040"
FROM
 ↓
WHERE
 ↓
SELECT
 ↓
ORDER BY
 ↓
TOP Result
```

---

# Real-World Report Examples

---

## Book Catalog

```sql id="bq041"
SELECT
    Title,
    PublicationYear
FROM Books
ORDER BY Title;
```

---

## New Members

```sql id="bq042"
SELECT TOP 10
    FirstName,
    LastName
FROM Members;
```

---

## Publisher Directory

```sql id="bq043"
SELECT DISTINCT
    Country
FROM Publishers;
```

---

## Approved Reservations

```sql id="bq044"
SELECT *
FROM Reservations
WHERE Status = 'Approved';
```

---

# Common Beginner Mistakes

---

## Missing WHERE

Bad:

```sql id="bq045"
SELECT *
FROM Books;
```

Returns every book.

---

When requirement is:

```text id="bq046"
Books after 2015
```

Use:

```sql id="bq047"
SELECT *
FROM Books
WHERE PublicationYear > 2015;
```

---

## Missing ORDER BY

Bad:

```sql id="bq048"
SELECT TOP 5 *
FROM Books;
```

Not guaranteed to return newest books.

---

Correct:

```sql id="bq049"
SELECT TOP 5 *
FROM Books
ORDER BY PublicationYear DESC;
```

---

## Wrong LIKE Pattern

Bad:

```sql id="bq050"
WHERE FirstName LIKE 'J'
```

---

Correct:

```sql id="bq051"
WHERE FirstName LIKE 'J%'
```

---

# Hands-On Practice

Write queries for:

### Practice 1

Show books published after 2018.

---

### Practice 2

Show newest 3 books.

---

### Practice 3

Show members whose names start with S.

---

### Practice 4

Show books from categories 1 and 2.

---

### Practice 5

Show books published between 2010 and 2020.

---

# Mini Project

Create a report showing:

```text id="bq052"
Book_ID
Book_Title
Published_Year
```

Requirements:

* PublicationYear > 2015
* Sort newest first
* Return only 5 rows

---

Expected Solution:

```sql id="bq053"
SELECT TOP 5
    BookID AS Book_ID,
    Title AS Book_Title,
    PublicationYear AS Published_Year
FROM Books
WHERE PublicationYear > 2015
ORDER BY PublicationYear DESC;
```

---

# Best Practices

✅ Start with the business question

✅ Select only required columns

✅ Filter unnecessary rows

✅ Sort results logically

✅ Use aliases for reports

✅ Limit large result sets

---

# Summary

In this lesson, you learned how to combine:

* SELECT
* WHERE
* DISTINCT
* ORDER BY
* TOP
* IN
* BETWEEN
* LIKE
* Aliases

to answer real-world business questions and create professional SQL reports.

This lesson completes Module 03 and prepares you for analytical SQL queries in the next module.

---

# Knowledge Check

### Question 1

Which clause limits rows?

A. DISTINCT

B. WHERE

C. TOP

D. LIKE

---

### Question 2

Which operator searches patterns?

A. IN

B. LIKE

C. BETWEEN

D. TOP

---

### Question 3

Which clause sorts results?

A. ORDER BY

B. DISTINCT

C. WHERE

D. AS

---

### Question 4

Which clause filters rows?

A. SELECT

B. ORDER BY

C. TOP

D. WHERE

---

# Module 03 Completion

🎉 Congratulations!

You have completed **Module 03: Query Fundamentals**.

You can now:

✅ Retrieve data

✅ Filter records

✅ Sort results

✅ Search using patterns

✅ Remove duplicates

✅ Limit rows

✅ Create professional reports

✅ Answer business questions using SQL

---

# Next Module

➡️ **Module 04: Aggregate Functions and Grouping**

You will learn:

* COUNT()
* SUM()
* AVG()
* MIN()
* MAX()
* GROUP BY
* HAVING

and begin creating analytical reports and dashboards from your SQL data.
