# Lesson 05: Sorting with ORDER BY

> Learn how to sort query results in ascending and descending order using the ORDER BY clause and create professional, easy-to-read reports.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand the purpose of ORDER BY
* Sort query results in ascending order
* Sort query results in descending order
* Sort text, numeric, and date data
* Sort by multiple columns
* Create organized reports
* Avoid common sorting mistakes

---

# Introduction

When retrieving data from a database, records are not guaranteed to appear in any specific order.

For example:

```sql
SELECT *
FROM Books;
```

SQL Server may return rows in any order.

For business reporting, we often need organized results.

Examples:

```text
Sort books alphabetically

Show newest books first

List members by last name

Display highest scores first
```

To control result order, SQL uses:

```sql
ORDER BY
```

---

# What is ORDER BY?

ORDER BY sorts the rows returned by a query.

Basic idea:

```text
Table Data
     ↓
 ORDER BY
     ↓
 Sorted Results
```

---

# Basic Syntax

```sql
SELECT
    ColumnName
FROM TableName
ORDER BY ColumnName;
```

---

# Example

```sql
SELECT *
FROM Books
ORDER BY Title;
```

---

# Sample Data

| BookID | Title         |
| ------ | ------------- |
| 3      | Atomic Habits |
| 1      | Learning SQL  |
| 2      | Clean Code    |

---

# Result

```text
Atomic Habits
Clean Code
Learning SQL
```

Sorted alphabetically.

---

# Ascending Order (ASC)

Ascending order means:

```text
A → Z

0 → 9

Oldest → Newest
```

ASC is the default sorting direction.

---

# Example

```sql
SELECT *
FROM Books
ORDER BY Title ASC;
```

---

# Result

| Title         |
| ------------- |
| Atomic Habits |
| Clean Code    |
| Learning SQL  |

---

# Descending Order (DESC)

Descending order means:

```text
Z → A

9 → 0

Newest → Oldest
```

---

# Example

```sql
SELECT *
FROM Books
ORDER BY Title DESC;
```

---

# Result

| Title         |
| ------------- |
| Learning SQL  |
| Clean Code    |
| Atomic Habits |

---

# Sorting Numeric Values

Example:

| BookID | PublicationYear |
| ------ | --------------- |
| 1      | 2020            |
| 2      | 2008            |
| 3      | 2018            |

---

Query:

```sql
SELECT *
FROM Books
ORDER BY PublicationYear;
```

---

Result:

```text
2008
2018
2020
```

---

# Sorting Highest Values First

Example:

```sql
SELECT *
FROM Books
ORDER BY PublicationYear DESC;
```

---

Result:

```text
2020
2018
2008
```

Newest books first.

---

# Sorting Dates

Example:

```sql
SELECT *
FROM BorrowRecords
ORDER BY BorrowDate;
```

---

Result:

Oldest borrow records appear first.

---

# Newest Dates First

```sql
SELECT *
FROM BorrowRecords
ORDER BY BorrowDate DESC;
```

---

Result:

Most recent borrow records appear first.

---

# Sorting Selected Columns

Example:

```sql
SELECT
    Title,
    PublicationYear
FROM Books
ORDER BY PublicationYear DESC;
```

---

Result:

| Title         | PublicationYear |
| ------------- | --------------- |
| Learning SQL  | 2020            |
| Atomic Habits | 2018            |
| Clean Code    | 2008            |

---

# Sorting by Multiple Columns

ORDER BY can sort using multiple columns.

---

# Example

```sql
SELECT *
FROM Members
ORDER BY
    LastName,
    FirstName;
```

---

SQL Server:

1. Sorts by LastName
2. If LastName matches, sorts by FirstName

---

# Example Data

| FirstName | LastName |
| --------- | -------- |
| John      | Smith    |
| Sarah     | Brown    |
| Adam      | Brown    |

---

Result:

| FirstName | LastName |
| --------- | -------- |
| Adam      | Brown    |
| Sarah     | Brown    |
| John      | Smith    |

---

# Mixed Sorting

Different sort directions can be combined.

Example:

```sql
SELECT *
FROM Books
ORDER BY
    CategoryID ASC,
    PublicationYear DESC;
```

---

Meaning:

```text
Category 1 First
Newest Books First Within Category
```

---

# Real-World Examples

---

## Alphabetical Book Catalog

```sql
SELECT *
FROM Books
ORDER BY Title;
```

---

## Newest Books

```sql
SELECT *
FROM Books
ORDER BY PublicationYear DESC;
```

---

## Member Directory

```sql
SELECT *
FROM Members
ORDER BY LastName;
```

---

## Publisher List

```sql
SELECT *
FROM Publishers
ORDER BY PublisherName;
```

---

# Query Execution Flow

```text
FROM
 ↓
WHERE
 ↓
SELECT
 ↓
ORDER BY
 ↓
Results
```

---

# Combining WHERE and ORDER BY

Example:

```sql
SELECT *
FROM Books
WHERE PublicationYear > 2010
ORDER BY PublicationYear DESC;
```

---

SQL Server:

1. Filters rows
2. Sorts remaining rows

---

# Business Scenario

Library manager asks:

```text
Show all books published after 2010,
starting with the newest.
```

Query:

```sql
SELECT *
FROM Books
WHERE PublicationYear > 2010
ORDER BY PublicationYear DESC;
```

---

# Common Beginner Mistakes

---

## Misspelling ORDER BY

Bad:

```sql
ORDERBY Title
```

---

Correct:

```sql
ORDER BY Title
```

---

## Using ORDER BY Before WHERE

Bad:

```sql
SELECT *
FROM Books
ORDER BY Title
WHERE PublicationYear > 2010;
```

---

Correct:

```sql
SELECT *
FROM Books
WHERE PublicationYear > 2010
ORDER BY Title;
```

---

## Sorting Non-Existent Columns

Bad:

```sql
SELECT *
FROM Books
ORDER BY Price;
```

If Price does not exist.

---

## Assuming Results Are Automatically Sorted

Bad assumption:

```sql
SELECT *
FROM Books;
```

No guaranteed order.

Always use ORDER BY when order matters.

---

# Performance Considerations

Sorting requires SQL Server to arrange rows.

Small tables:

```text
Minimal impact
```

Large tables:

```text
Additional processing required
```

Sort only when necessary.

---

# Hands-On Practice

Run:

```sql
SELECT *
FROM Books
ORDER BY Title;
```

---

Run:

```sql
SELECT *
FROM Books
ORDER BY PublicationYear DESC;
```

---

Run:

```sql
SELECT *
FROM Members
ORDER BY LastName;
```

---

Run:

```sql
SELECT *
FROM Publishers
ORDER BY PublisherName;
```

---

# Mini Exercise

Write queries to:

### Task 1

Display books sorted by PublicationYear ascending.

---

### Task 2

Display books sorted by PublicationYear descending.

---

### Task 3

Display members sorted by FirstName.

---

### Task 4

Display publishers sorted by Country.

---

# Best Practices

✅ Always use ORDER BY when report order matters

✅ Specify ASC or DESC explicitly

✅ Sort on meaningful columns

✅ Combine with WHERE for filtered reports

✅ Use multiple columns when needed

---

# Summary

In this lesson, you learned:

* What ORDER BY does
* Ascending sorting
* Descending sorting
* Sorting numbers
* Sorting text
* Sorting dates
* Multiple-column sorting
* Combining WHERE and ORDER BY
* Common mistakes

ORDER BY is essential for creating professional reports and presenting information in a meaningful order.

---

# Knowledge Check

### Question 1

Which clause sorts query results?

A. WHERE

B. DISTINCT

C. ORDER BY

D. TOP

---

### Question 2

What does ASC mean?

A. Descending

B. Ascending

C. Distinct

D. Filtered

---

### Question 3

Which query shows newest books first?

A.

```sql
SELECT *
FROM Books
ORDER BY PublicationYear;
```

B.

```sql
SELECT *
FROM Books
ORDER BY PublicationYear DESC;
```

C.

```sql
SELECT *
FROM Books
WHERE PublicationYear DESC;
```

D.

```sql
SELECT DESC *
FROM Books;
```

---

### Question 4

Can ORDER BY sort multiple columns?

A. No

B. Yes

---

# Next Lesson

➡️ 06-Using-TOP.md

In the next lesson, you'll learn how to limit query results using the TOP clause and retrieve only the first N records from a table.
