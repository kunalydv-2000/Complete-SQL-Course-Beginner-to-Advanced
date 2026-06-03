# Lesson 01: Introduction to Aggregate Functions

> Learn how SQL aggregate functions summarize data and transform thousands of records into meaningful business insights.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand what aggregate functions are
* Understand why aggregation is important
* Identify common aggregate functions
* Summarize data using SQL
* Build simple analytical reports
* Answer business questions using aggregation
* Prepare for GROUP BY and HAVING

---

# Introduction

So far, you've learned how to retrieve and filter data using:

```sql
SELECT
WHERE
ORDER BY
TOP
DISTINCT
```

These commands help retrieve records.

Example:

```sql
SELECT *
FROM Books;
```

Result:

| BookID | Title         | PublicationYear |
| ------ | ------------- | --------------- |
| 1      | Learning SQL  | 2020            |
| 2      | Clean Code    | 2008            |
| 3      | Atomic Habits | 2018            |

This shows individual rows.

However, managers rarely ask for every record.

Instead they ask questions such as:

```text
How many books exist?

How many members are registered?

What is the newest book?

What is the average book price?

Which category contains the most books?
```

These questions require aggregation.

---

# What is Aggregation?

Aggregation means combining multiple rows into a single summary value.

Example:

Books Table

| BookID |
| ------ |
| 1      |
| 2      |
| 3      |
| 4      |
| 5      |

Instead of displaying all rows:

```text
1
2
3
4
5
```

We can summarize them as:

```text
Total Books = 5
```

This process is called aggregation.

---

# What are Aggregate Functions?

Aggregate functions perform calculations across multiple rows and return a single value.

Basic idea:

```text
Many Rows
    ↓
Aggregate Function
    ↓
Single Result
```

---

# Common Aggregate Functions

| Function | Purpose              |
| -------- | -------------------- |
| COUNT()  | Counts records       |
| SUM()    | Calculates totals    |
| AVG()    | Calculates averages  |
| MIN()    | Finds smallest value |
| MAX()    | Finds largest value  |

---

# Aggregate Function Overview

```text
Raw Data
   ↓
COUNT()
SUM()
AVG()
MIN()
MAX()
   ↓
Business Insights
```

---

# Example: COUNT()

Suppose the Books table contains:

| BookID |
| ------ |
| 1      |
| 2      |
| 3      |
| 4      |

Query:

```sql
SELECT COUNT(*)
FROM Books;
```

Result:

```text
4
```

---

# Example: SUM()

Suppose fines exist:

| FineAmount |
| ---------- |
| 10         |
| 20         |
| 15         |

Query:

```sql
SELECT SUM(FineAmount)
FROM BorrowRecords;
```

Result:

```text
45
```

---

# Example: AVG()

Suppose prices are:

| BookPrice |
| --------- |
| 10        |
| 20        |
| 30        |

Query:

```sql
SELECT AVG(BookPrice)
FROM Books;
```

Result:

```text
20
```

---

# Example: MIN()

Query:

```sql
SELECT MIN(PublicationYear)
FROM Books;
```

Result:

```text
2008
```

Oldest publication year.

---

# Example: MAX()

Query:

```sql
SELECT MAX(PublicationYear)
FROM Books;
```

Result:

```text
2024
```

Newest publication year.

---

# Why Aggregate Functions Matter

Aggregate functions help answer business questions quickly.

Without aggregation:

```text
Thousands of records
```

With aggregation:

```text
One meaningful answer
```

---

# Business Examples

---

## Library Manager

Question:

```text
How many books are available?
```

Query:

```sql
SELECT COUNT(*)
FROM Books;
```

---

## Membership Report

Question:

```text
How many members exist?
```

Query:

```sql
SELECT COUNT(*)
FROM Members;
```

---

## Publication Analysis

Question:

```text
What is the newest publication year?
```

Query:

```sql
SELECT MAX(PublicationYear)
FROM Books;
```

---

## Historical Analysis

Question:

```text
What is the oldest publication year?
```

Query:

```sql
SELECT MIN(PublicationYear)
FROM Books;
```

---

# Aggregate Functions vs Normal Queries

Normal Query:

```sql
SELECT PublicationYear
FROM Books;
```

Result:

```text
2008
2012
2018
2020
2024
```

---

Aggregate Query:

```sql
SELECT MAX(PublicationYear)
FROM Books;
```

Result:

```text
2024
```

One summarized value.

---

# Understanding Analytical SQL

Analytical SQL focuses on:

```text
Summaries
Totals
Averages
Counts
Metrics
KPIs
```

Rather than individual records.

---

# Common Business Metrics

Examples:

---

## Total Books

```sql
SELECT COUNT(*)
FROM Books;
```

---

## Total Members

```sql
SELECT COUNT(*)
FROM Members;
```

---

## Total Reservations

```sql
SELECT COUNT(*)
FROM Reservations;
```

---

## Latest Publication

```sql
SELECT MAX(PublicationYear)
FROM Books;
```

---

## Earliest Membership

```sql
SELECT MIN(MembershipDate)
FROM Members;
```

---

# Aggregate Functions and NULL Values

Most aggregate functions ignore NULL values.

Example:

| BookPrice |
| --------- |
| 20        |
| 30        |
| NULL      |

Query:

```sql
SELECT AVG(BookPrice)
FROM Books;
```

Result:

```text
25
```

NULL is ignored.

---

# Query Execution Flow

```text
Rows
 ↓
Aggregate Function
 ↓
Summary Value
```

---

# Real-World Applications

Aggregate functions are used in:

### Business Intelligence

```text
Revenue Reports
Sales Reports
Customer Metrics
```

---

### Data Analytics

```text
Average Revenue
Total Customers
Monthly Trends
```

---

### Dashboards

```text
KPIs
Scorecards
Executive Reports
```

---

# Common Beginner Mistakes

---

## Expecting Multiple Rows

Bad assumption:

```sql
SELECT COUNT(*)
FROM Books;
```

returns all books.

---

Reality:

```text
Returns one value
```

---

## Using Wrong Function

Bad:

```sql
SELECT MAX(*)
FROM Books;
```

---

Correct:

```sql
SELECT MAX(PublicationYear)
FROM Books;
```

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
SELECT MIN(PublicationYear)
FROM Books;
```

---

Run:

```sql
SELECT MAX(PublicationYear)
FROM Books;
```

---

# Mini Exercise

Write queries to find:

### Task 1

Total authors.

---

### Task 2

Total reservations.

---

### Task 3

Earliest membership date.

---

### Task 4

Latest membership date.

---

# Best Practices

✅ Use meaningful aliases

✅ Understand the business question

✅ Choose the correct aggregate function

✅ Verify your results

✅ Use aggregates for summaries and KPIs

---

# Summary

In this lesson, you learned:

* What aggregation means
* What aggregate functions are
* COUNT()
* SUM()
* AVG()
* MIN()
* MAX()
* Business reporting concepts
* Analytical SQL basics

Aggregate functions are the foundation of data analysis and business reporting in SQL.

---

# Knowledge Check

### Question 1

What is aggregation?

A. Sorting data

B. Updating records

C. Summarizing multiple rows

D. Deleting rows

---

### Question 2

Which function counts rows?

A. SUM()

B. AVG()

C. COUNT()

D. MAX()

---

### Question 3

Which function finds the largest value?

A. MIN()

B. AVG()

C. SUM()

D. MAX()

---

### Question 4

Which function finds the smallest value?

A. COUNT()

B. MIN()

C. MAX()

D. AVG()

---

### Question 5

Which function calculates averages?

A. AVG()

B. COUNT()

C. SUM()

D. MAX()

---

# Next Lesson

➡️ 02-COUNT-Function.md

In the next lesson, you'll learn how to use COUNT() to measure records, build KPIs, and create business metrics from your data.
