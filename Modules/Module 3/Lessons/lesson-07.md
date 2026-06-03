# Lesson 07: Column Aliases

> Learn how to rename columns in query results using aliases and create professional, readable reports.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand what aliases are
* Rename columns using the AS keyword
* Create user-friendly report headers
* Improve query readability
* Use aliases with calculations
* Build professional business reports
* Avoid common alias mistakes

---

# Introduction

When SQL Server returns query results, column names are displayed exactly as they exist in the database.

Example:

```sql id="alias001"
SELECT
    FirstName,
    LastName
FROM Members;
```

Result:

| FirstName | LastName |
| --------- | -------- |
| John      | Smith    |
| Sarah     | Wilson   |

While this is acceptable, business users often prefer more readable column names.

Examples:

```text id="alias002"
First Name
Last Name
Published Year
Book Title
Member Email
```

To customize column names, SQL uses:

```sql id="alias003"
AS
```

---

# What is an Alias?

An alias is a temporary name assigned to a column or expression in a query result.

Important:

```text id="alias004"
Alias changes output only.

Database structure remains unchanged.
```

---

# Basic Syntax

```sql id="alias005"
SELECT
    ColumnName AS AliasName
FROM TableName;
```

---

# Example

```sql id="alias006"
SELECT
    FirstName AS First_Name
FROM Members;
```

---

Result:

| First_Name |
| ---------- |
| John       |
| Sarah      |
| David      |

---

# Why Use Aliases?

Aliases help:

✅ Create readable reports

✅ Improve presentation

✅ Simplify long column names

✅ Support business reporting

✅ Improve query clarity

---

# Multiple Aliases

Example:

```sql id="alias007"
SELECT
    FirstName AS First_Name,
    LastName AS Last_Name
FROM Members;
```

---

Result:

| First_Name | Last_Name |
| ---------- | --------- |
| John       | Smith     |
| Sarah      | Wilson    |

---

# Alias Without AS

SQL Server allows aliases without AS.

Example:

```sql id="alias008"
SELECT
    FirstName First_Name
FROM Members;
```

---

Result:

```text id="alias009"
Same Output
```

---

# Recommended Style

Preferred:

```sql id="alias010"
SELECT
    FirstName AS First_Name
FROM Members;
```

Because it is clearer and easier to read.

---

# Renaming Book Columns

Example:

```sql id="alias011"
SELECT
    Title AS Book_Title,
    PublicationYear AS Published_Year
FROM Books;
```

---

Result:

| Book_Title   | Published_Year |
| ------------ | -------------- |
| Learning SQL | 2020           |
| Clean Code   | 2008           |

---

# Renaming Publisher Information

Example:

```sql id="alias012"
SELECT
    PublisherName AS Publisher
FROM Publishers;
```

---

Result:

| Publisher      |
| -------------- |
| O'Reilly Media |
| Pearson        |

---

# Using Spaces in Aliases

Aliases can contain spaces.

Use square brackets:

```sql id="alias013"
SELECT
    FirstName AS [First Name]
FROM Members;
```

---

Result:

| First Name |
| ---------- |
| John       |
| Sarah      |

---

# Alternative Syntax

Single quotes can also work in SQL Server.

```sql id="alias014"
SELECT
    FirstName AS 'First Name'
FROM Members;
```

---

Recommended:

```sql id="alias015"
[First Name]
```

because it is more widely used.

---

# Aliases with Calculations

Aliases become very useful when working with calculated values.

Example:

```sql id="alias016"
SELECT
    PublicationYear + 1 AS Next_Year
FROM Books;
```

---

Result:

| Next_Year |
| --------- |
| 2021      |
| 2009      |

---

# Business Reporting Example

Library manager requests:

```text id="alias017"
Book ID
Book Title
Published Year
```

Query:

```sql id="alias018"
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
| 2       | Clean Code   | 2008           |

---

# Alias Naming Conventions

Common styles:

---

## Underscores

```sql id="alias019"
SELECT
    FirstName AS First_Name
FROM Members;
```

---

## Spaces

```sql id="alias020"
SELECT
    FirstName AS [First Name]
FROM Members;
```

---

## Pascal Case

```sql id="alias021"
SELECT
    FirstName AS FirstName
FROM Members;
```

---

Choose one style and remain consistent.

---

# Aliases with WHERE

Example:

```sql id="alias022"
SELECT
    Title AS Book_Title,
    PublicationYear AS Published_Year
FROM Books
WHERE PublicationYear > 2015;
```

---

Result:

Only matching rows are returned.

---

# Aliases with ORDER BY

Example:

```sql id="alias023"
SELECT
    Title AS Book_Title,
    PublicationYear AS Published_Year
FROM Books
ORDER BY PublicationYear DESC;
```

---

Result:

Books sorted from newest to oldest.

---

# Real-World Examples

---

## Member Directory

```sql id="alias024"
SELECT
    FirstName AS First_Name,
    LastName AS Last_Name,
    Email AS Email_Address
FROM Members;
```

---

## Book Catalog

```sql id="alias025"
SELECT
    BookID AS Book_ID,
    Title AS Book_Title
FROM Books;
```

---

## Publisher Report

```sql id="alias026"
SELECT
    PublisherName AS Publisher,
    Country AS Country_Name
FROM Publishers;
```

---

# Query Execution Flow

```text id="alias027"
Table
   ↓
SELECT Columns
   ↓
Apply Aliases
   ↓
Display Results
```

---

# Common Beginner Mistakes

---

## Misspelling Alias

Bad:

```sql id="alias028"
SELECT
    FirstName AS
FROM Members;
```

Alias name missing.

---

Correct:

```sql id="alias029"
SELECT
    FirstName AS First_Name
FROM Members;
```

---

## Using Reserved Keywords

Bad:

```sql id="alias030"
SELECT
    FirstName AS SELECT
FROM Members;
```

---

Avoid SQL keywords.

---

## Confusing Alias with Column Rename

Bad assumption:

```text id="alias031"
Alias changes database structure
```

Reality:

```text id="alias032"
Alias affects query output only
```

---

# Hands-On Practice

Run:

```sql id="alias033"
SELECT
    FirstName AS First_Name,
    LastName AS Last_Name
FROM Members;
```

---

Run:

```sql id="alias034"
SELECT
    Title AS Book_Title,
    PublicationYear AS Published_Year
FROM Books;
```

---

Run:

```sql id="alias035"
SELECT
    PublisherName AS Publisher
FROM Publishers;
```

---

Run:

```sql id="alias036"
SELECT
    CategoryName AS Category
FROM Categories;
```

---

# Mini Exercise

Write queries to:

### Task 1

Rename:

```text id="alias037"
Title → Book_Title
```

---

### Task 2

Rename:

```text id="alias038"
FirstName → First_Name
```

---

### Task 3

Rename:

```text id="alias039"
LastName → Last_Name
```

---

### Task 4

Rename:

```text id="alias040"
PublicationYear → Published_Year
```

---

# Best Practices

✅ Use aliases for reports

✅ Use meaningful names

✅ Keep naming consistent

✅ Prefer AS for readability

✅ Use square brackets when spaces are needed

---

# Summary

In this lesson, you learned:

* What aliases are
* Using the AS keyword
* Renaming columns
* Using spaces in aliases
* Aliases with calculations
* Business reporting examples
* Common mistakes

Aliases make query results easier to read and help create professional-looking reports for business users.

---

# Knowledge Check

### Question 1

What does an alias do?

A. Deletes a column

B. Renames a table permanently

C. Temporarily renames output

D. Creates a table

---

### Question 2

Which keyword is commonly used for aliases?

A. WHERE

B. ORDER BY

C. AS

D. DISTINCT

---

### Question 3

Which query creates an alias?

A.

```sql id="q1"
SELECT FirstName
FROM Members;
```

B.

```sql id="q2"
SELECT
    FirstName AS First_Name
FROM Members;
```

C.

```sql id="q3"
ALTER FirstName;
```

D.

```sql id="q4"
SHOW First_Name;
```

---

### Question 4

Do aliases change the database structure?

A. Yes

B. No

---

# Next Lesson

➡️ 08-Filtering-with-IN-BETWEEN-LIKE.md

In the next lesson, you'll learn advanced filtering techniques using IN, BETWEEN, and LIKE to create more powerful and flexible SQL queries.
