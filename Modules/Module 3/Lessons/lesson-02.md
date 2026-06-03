# Lesson 02: Selecting Specific Columns

> Learn how to retrieve only the data you need by selecting specific columns instead of using `SELECT *`.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Select specific columns from a table
* Understand why `SELECT *` is not always recommended
* Improve query readability
* Improve query performance
* Retrieve only relevant business information
* Write cleaner SQL queries

---

# Introduction

In the previous lesson, you learned how to retrieve all columns using:

```sql
SELECT *
FROM TableName;
```

While this is useful for exploring data, real-world applications rarely need every column.

Instead, professional SQL developers select only the columns required for a report or analysis.

---

# Why Select Specific Columns?

Suppose the Members table contains:

| MemberID | FirstName | LastName | Email                                   | Phone      |
| -------- | --------- | -------- | --------------------------------------- | ---------- |
| 1        | John      | Smith    | [john@email.com](mailto:john@email.com) | 9876543210 |

If you only need member names, retrieving every column is unnecessary.

---

# Better Approach

Instead of:

```sql
SELECT *
FROM Members;
```

Use:

```sql
SELECT
    FirstName,
    LastName
FROM Members;
```

---

# Basic Syntax

```sql
SELECT
    Column1,
    Column2,
    Column3
FROM TableName;
```

---

# Example 1

Retrieve member names.

```sql
SELECT
    FirstName,
    LastName
FROM Members;
```

---

# Result

| FirstName | LastName |
| --------- | -------- |
| John      | Smith    |
| Sarah     | Wilson   |
| David     | Miller   |

---

# Example 2

Retrieve book titles.

```sql
SELECT
    Title
FROM Books;
```

---

# Result

| Title         |
| ------------- |
| Learning SQL  |
| Clean Code    |
| Atomic Habits |

---

# Example 3

Retrieve author information.

```sql
SELECT
    FirstName,
    LastName
FROM Authors;
```

---

# Selecting Multiple Columns

You can retrieve as many columns as needed.

Example:

```sql
SELECT
    BookID,
    Title,
    PublicationYear
FROM Books;
```

---

# Result

| BookID | Title        | PublicationYear |
| ------ | ------------ | --------------- |
| 1      | Learning SQL | 2020            |
| 2      | Clean Code   | 2008            |

---

# Column Order Matters

SQL Server displays columns in the same order specified in the SELECT statement.

Example:

```sql
SELECT
    LastName,
    FirstName
FROM Members;
```

---

# Result

| LastName | FirstName |
| -------- | --------- |
| Smith    | John      |
| Wilson   | Sarah     |

---

# Selecting One Column

Example:

```sql
SELECT
    CategoryName
FROM Categories;
```

---

Result:

| CategoryName |
| ------------ |
| Technology   |
| Science      |
| Business     |

---

# Selecting Two Columns

Example:

```sql
SELECT
    PublisherName,
    Country
FROM Publishers;
```

---

Result:

| PublisherName    | Country |
| ---------------- | ------- |
| O'Reilly Media   | USA     |
| Packt Publishing | UK      |

---

# Real-World Reporting Examples

---

## Member Directory

```sql
SELECT
    FirstName,
    LastName
FROM Members;
```

---

## Book Catalog

```sql
SELECT
    Title,
    PublicationYear
FROM Books;
```

---

## Publisher List

```sql
SELECT
    PublisherName
FROM Publishers;
```

---

# Why Avoid SELECT *

Using:

```sql
SELECT *
FROM Books;
```

may retrieve:

```text
BookID
Title
ISBN
PublicationYear
CategoryID
PublisherID
```

Even if only the title is needed.

---

# Problems with SELECT *

### Unnecessary Data Retrieval

More columns means more data transferred.

---

### Slower Queries

Especially with large tables.

---

### Harder to Read

Example:

```sql
SELECT *
FROM Books;
```

Doesn't clearly show which data is required.

---

# Better Query

```sql
SELECT
    Title,
    PublicationYear
FROM Books;
```

The intent is immediately clear.

---

# Professional SQL Style

Preferred:

```sql
SELECT
    FirstName,
    LastName,
    Email
FROM Members;
```

Instead of:

```sql
SELECT FirstName, LastName, Email FROM Members;
```

Both work, but the first is easier to read.

---

# Using Column Selection for Reports

Suppose management requests:

```text
List all member names.
```

Bad:

```sql
SELECT *
FROM Members;
```

---

Better:

```sql
SELECT
    FirstName,
    LastName
FROM Members;
```

---

# Business Scenario

Library manager asks:

```text
Show all books and publication years.
```

Query:

```sql
SELECT
    Title,
    PublicationYear
FROM Books;
```

---

# Common Beginner Mistakes

---

## Misspelled Column Name

Bad:

```sql
SELECT
    Firstname
FROM Members;
```

If actual column is:

```text
FirstName
```

SQL Server returns an error.

---

## Missing Comma

Bad:

```sql
SELECT
    FirstName
    LastName
FROM Members;
```

---

Correct:

```sql
SELECT
    FirstName,
    LastName
FROM Members;
```

---

## Using Non-Existent Columns

Bad:

```sql
SELECT
    Salary
FROM Members;
```

If Salary does not exist.

---

# Query Execution Flow

```text
Table
   ↓
Select Columns
   ↓
Display Results
```

---

# Hands-On Practice

Run the following queries:

---

## Practice 1

```sql
SELECT
    FirstName,
    LastName
FROM Members;
```

---

## Practice 2

```sql
SELECT
    Title,
    PublicationYear
FROM Books;
```

---

## Practice 3

```sql
SELECT
    PublisherName,
    Country
FROM Publishers;
```

---

## Practice 4

```sql
SELECT
    CategoryName
FROM Categories;
```

---

# Mini Exercise

Write queries to display:

### Task 1

Book titles only.

---

### Task 2

Author first and last names.

---

### Task 3

Member names and email addresses.

---

### Task 4

Publisher names only.

---

# Best Practices

✅ Select only required columns

✅ Avoid unnecessary data retrieval

✅ Use readable formatting

✅ Verify column names

✅ Keep queries simple and focused

---

# Summary

In this lesson, you learned:

* How to select specific columns
* Why selecting specific columns is important
* Benefits over SELECT *
* Query readability improvements
* Basic reporting techniques
* Common mistakes to avoid

Selecting only the required columns is one of the simplest ways to write cleaner and more efficient SQL queries.

---

# Knowledge Check

### Question 1

Which query retrieves only member names?

A.

```sql
SELECT *
FROM Members;
```

B.

```sql
SELECT
    FirstName,
    LastName
FROM Members;
```

C.

```sql
SELECT Members;
```

D.

```sql
SHOW Members;
```

---

### Question 2

Why is SELECT * often discouraged?

A. It causes syntax errors

B. It retrieves unnecessary columns

C. It cannot be used in SQL Server

D. It only works on small tables

---

### Question 3

Which symbol separates column names?

A. ;

B. :

C. ,

D. *

---

### Question 4

Which clause specifies the table?

A. SELECT

B. FROM

C. WHERE

D. ORDER BY

---

# Next Lesson

➡️ 03-Using-DISTINCT.md

In the next lesson, you'll learn how to remove duplicate values from query results using the DISTINCT keyword.
