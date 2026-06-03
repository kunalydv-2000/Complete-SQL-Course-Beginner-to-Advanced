# Lesson 01: Introduction to SELECT

> Learn how to retrieve data from database tables using the SELECT statement, the most frequently used command in SQL.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand what a query is
* Understand the purpose of SELECT
* Retrieve all data from a table
* Read query results
* Understand result sets
* Execute basic SQL queries
* Verify data stored in tables

---

# Introduction

In Module 02, you learned how to:

* Create databases
* Create tables
* Insert records
* Update records
* Delete records

Now it's time to retrieve information from those tables.

The most important SQL statement for retrieving data is:

```sql
SELECT
```

Nearly every SQL report, dashboard, and application uses SELECT.

---

# What is a Query?

A query is a request for information from a database.

Think of a query as asking a question.

Examples:

```text
Show all books.

Show all members.

Show all reservations.
```

SQL translates these questions into commands.

---

# What is SELECT?

The SELECT statement retrieves data from one or more tables.

Basic idea:

```text
Database
    ↓
SELECT
    ↓
Results
```

---

# Basic Syntax

```sql
SELECT *
FROM TableName;
```

---

# Understanding the Syntax

### SELECT

Specifies what information you want.

---

### *

Means:

```text
All Columns
```

---

### FROM

Specifies where the data comes from.

---

### TableName

The table containing the data.

---

# First Query

Example:

```sql
SELECT *
FROM Members;
```

---

# What Happens?

SQL Server:

1. Finds the Members table
2. Reads all rows
3. Reads all columns
4. Returns the results

---

# Sample Data

### Members Table

| MemberID | FirstName | LastName |
| -------- | --------- | -------- |
| 1        | John      | Smith    |
| 2        | Sarah     | Wilson   |
| 3        | David     | Miller   |

---

Query:

```sql
SELECT *
FROM Members;
```

Result:

| MemberID | FirstName | LastName |
| -------- | --------- | -------- |
| 1        | John      | Smith    |
| 2        | Sarah     | Wilson   |
| 3        | David     | Miller   |

---

# Understanding Result Sets

The output of a SELECT statement is called a:

```text
Result Set
```

Example:

```sql
SELECT *
FROM Books;
```

Returns:

```text
Result Set
```

containing all matching rows.

---

# Query Execution Flow

```text
Table
   ↓
SELECT Query
   ↓
Result Set
```

---

# Querying Different Tables

---

## Books

```sql
SELECT *
FROM Books;
```

---

## Authors

```sql
SELECT *
FROM Authors;
```

---

## Categories

```sql
SELECT *
FROM Categories;
```

---

## Publishers

```sql
SELECT *
FROM Publishers;
```

---

# Using SELECT with Existing Data

Suppose the Books table contains:

| BookID | Title        |
| ------ | ------------ |
| 1      | Learning SQL |
| 2      | Clean Code   |

Query:

```sql
SELECT *
FROM Books;
```

Returns:

| BookID | Title        |
| ------ | ------------ |
| 1      | Learning SQL |
| 2      | Clean Code   |

---

# Why SELECT is Important

SELECT is used for:

* Reports
* Dashboards
* Business Analysis
* Data Validation
* Application Development

Almost every SQL task starts with SELECT.

---

# Real-World Examples

---

## Library

```sql
SELECT *
FROM Books;
```

Show all books.

---

## School

```sql
SELECT *
FROM Students;
```

Show all students.

---

## Company

```sql
SELECT *
FROM Employees;
```

Show all employees.

---

# Common Beginner Mistakes

---

## Misspelling SELECT

Bad:

```sql
SELET *
FROM Members;
```

---

Correct:

```sql
SELECT *
FROM Members;
```

---

## Missing FROM

Bad:

```sql
SELECT *;
```

---

Correct:

```sql
SELECT *
FROM Members;
```

---

## Wrong Table Name

Bad:

```sql
SELECT *
FROM Member;
```

If the table is actually:

```text
Members
```

SQL Server returns an error.

---

# Running Queries in SSMS

Step 1:

Open SQL Server Management Studio.

---

Step 2:

Select the database.

```sql
USE LibraryManagementSystem;
GO
```

---

Step 3:

Run:

```sql
SELECT *
FROM Members;
```

---

Step 4:

Review the result grid.

---

# Hands-On Practice

Run the following queries:

```sql
SELECT *
FROM Books;
```

```sql
SELECT *
FROM Authors;
```

```sql
SELECT *
FROM Members;
```

```sql
SELECT *
FROM Reservations;
```

Observe the results.

---

# Mini Exercise

Write queries to display:

* All categories
* All publishers
* All borrow records

---

# Summary

In this lesson, you learned:

* What a query is
* What SELECT does
* SELECT syntax
* Result sets
* Query execution basics
* Running queries in SSMS
* Common beginner mistakes

SELECT is the foundation of SQL querying and will be used throughout the rest of the course.

---

# Knowledge Check

### Question 1

Which statement retrieves data?

A. INSERT

B. UPDATE

C. DELETE

D. SELECT

---

### Question 2

What does * mean?

A. One Column

B. All Rows

C. All Columns

D. All Tables

---

### Question 3

Which clause specifies the table?

A. SELECT

B. WHERE

C. FROM

D. ORDER BY

---

### Question 4

What is the output of a query called?

A. Dataset

B. Result Set

C. Table Set

D. Data View

---

# Next Lesson

➡️ 02-Selecting-Specific-Columns.md

In the next lesson, you'll learn how to retrieve only the columns you need instead of using SELECT *.
