# Lesson 05: MIN() and MAX() Functions

> Learn how to find the smallest and largest values in a dataset using MIN() and MAX() to answer business questions and generate analytical insights.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand MIN() and MAX()
* Find lowest values in a dataset
* Find highest values in a dataset
* Use MIN() and MAX() with dates
* Use MIN() and MAX() with filters
* Build KPI reports
* Avoid common mistakes

---

# Introduction

Businesses frequently need to identify extremes in their data.

Examples:

```text id="minmax001"
What is the oldest book?

What is the newest book?

What is the highest fine amount?

What is the earliest membership date?

What is the latest reservation date?
```

To answer these questions, SQL provides:

```sql id="minmax002"
MIN()
MAX()
```

These functions help identify the smallest and largest values in a column.

---

# What is MIN()?

MIN() returns the smallest value in a column.

Basic idea:

```text id="minmax003"
Values
 ↓
MIN()
 ↓
Smallest Value
```

---

# Basic Syntax

```sql id="minmax004"
SELECT MIN(ColumnName)
FROM TableName;
```

---

# Example

Books Table:

| PublicationYear |
| --------------- |
| 2008            |
| 2012            |
| 2018            |
| 2020            |

---

Query:

```sql id="minmax005"
SELECT MIN(PublicationYear)
FROM Books;
```

---

Result:

```text id="minmax006"
2008
```

---

# What is MAX()?

MAX() returns the largest value in a column.

Basic idea:

```text id="minmax007"
Values
 ↓
MAX()
 ↓
Largest Value
```

---

# Basic Syntax

```sql id="minmax008"
SELECT MAX(ColumnName)
FROM TableName;
```

---

# Example

```sql id="minmax009"
SELECT MAX(PublicationYear)
FROM Books;
```

---

Result:

```text id="minmax010"
2020
```

---

# Understanding MIN and MAX

Example values:

```text id="minmax011"
10
25
40
15
30
```

MIN():

```text id="minmax012"
10
```

MAX():

```text id="minmax013"
40
```

---

# Using Aliases

Professional reports should use aliases.

---

## MIN Example

```sql id="minmax014"
SELECT
    MIN(PublicationYear) AS OldestPublicationYear
FROM Books;
```

---

## MAX Example

```sql id="minmax015"
SELECT
    MAX(PublicationYear) AS NewestPublicationYear
FROM Books;
```

---

# MIN and MAX with Dates

Dates can also be analyzed.

---

# Earliest Membership

```sql id="minmax016"
SELECT
    MIN(MembershipDate) AS EarliestMembership
FROM Members;
```

---

Result:

```text id="minmax017"
2021-01-15
```

---

# Latest Membership

```sql id="minmax018"
SELECT
    MAX(MembershipDate) AS LatestMembership
FROM Members;
```

---

Result:

```text id="minmax019"
2025-06-10
```

---

# MIN and MAX with Monetary Values

Example:

BorrowRecords

| FineAmount |
| ---------- |
| 10         |
| 25         |
| 5          |
| 40         |

---

Lowest Fine:

```sql id="minmax020"
SELECT
    MIN(FineAmount) AS LowestFine
FROM BorrowRecords;
```

---

Result:

```text id="minmax021"
5
```

---

Highest Fine:

```sql id="minmax022"
SELECT
    MAX(FineAmount) AS HighestFine
FROM BorrowRecords;
```

---

Result:

```text id="minmax023"
40
```

---

# MIN and MAX Ignore NULL Values

Example:

| FineAmount |
| ---------- |
| 10         |
| 20         |
| NULL       |
| 40         |

---

Query:

```sql id="minmax024"
SELECT
    MIN(FineAmount),
    MAX(FineAmount)
FROM BorrowRecords;
```

---

Result:

```text id="minmax025"
10
40
```

NULL values are ignored.

---

# MIN with WHERE

Find the oldest modern book.

```sql id="minmax026"
SELECT
    MIN(PublicationYear) AS OldestModernBook
FROM Books
WHERE PublicationYear >= 2015;
```

---

Result:

Oldest book published after 2015.

---

# MAX with WHERE

Find the newest technology book.

```sql id="minmax027"
SELECT
    MAX(PublicationYear) AS NewestTechnologyBook
FROM Books
WHERE CategoryID = 1;
```

---

# Business KPI Examples

---

## Oldest Publication Year

```sql id="minmax028"
SELECT
    MIN(PublicationYear) AS OldestBookYear
FROM Books;
```

---

## Newest Publication Year

```sql id="minmax029"
SELECT
    MAX(PublicationYear) AS NewestBookYear
FROM Books;
```

---

## Earliest Membership

```sql id="minmax030"
SELECT
    MIN(MembershipDate) AS EarliestMember
FROM Members;
```

---

## Latest Membership

```sql id="minmax031"
SELECT
    MAX(MembershipDate) AS LatestMember
FROM Members;
```

---

## Highest Fine Amount

```sql id="minmax032"
SELECT
    MAX(FineAmount) AS HighestFine
FROM BorrowRecords;
```

---

## Lowest Fine Amount

```sql id="minmax033"
SELECT
    MIN(FineAmount) AS LowestFine
FROM BorrowRecords;
```

---

# MIN and MAX with GROUP BY Preview

MIN and MAX become more powerful when combined with GROUP BY.

Example:

```sql id="minmax034"
SELECT
    CategoryID,
    MIN(PublicationYear) AS OldestBook,
    MAX(PublicationYear) AS NewestBook
FROM Books
GROUP BY CategoryID;
```

---

Result:

| CategoryID | OldestBook | NewestBook |
| ---------- | ---------- | ---------- |
| 1          | 2010       | 2024       |
| 2          | 2008       | 2023       |
| 3          | 2015       | 2025       |

---

# Query Execution Flow

```text id="minmax035"
Rows
 ↓
WHERE
 ↓
MIN() / MAX()
 ↓
Result
```

---

# Real-World Scenario

Library manager asks:

```text id="minmax036"
What is the oldest book publication year?
```

Query:

```sql id="minmax037"
SELECT
    MIN(PublicationYear) AS OldestBookYear
FROM Books;
```

---

Manager asks:

```text id="minmax038"
What is the newest book publication year?
```

Query:

```sql id="minmax039"
SELECT
    MAX(PublicationYear) AS NewestBookYear
FROM Books;
```

---

Manager asks:

```text id="minmax040"
What is the highest fine ever charged?
```

Query:

```sql id="minmax041"
SELECT
    MAX(FineAmount) AS HighestFine
FROM BorrowRecords;
```

---

# MIN vs MAX

| Function | Returns        |
| -------- | -------------- |
| MIN()    | Smallest Value |
| MAX()    | Largest Value  |

---

Example:

```sql id="minmax042"
SELECT MIN(PublicationYear)
FROM Books;
```

Returns:

```text id="minmax043"
Oldest Year
```

---

```sql id="minmax044"
SELECT MAX(PublicationYear)
FROM Books;
```

Returns:

```text id="minmax045"
Newest Year
```

---

# Common Beginner Mistakes

---

## Forgetting Aliases

Bad:

```sql id="minmax046"
SELECT MAX(PublicationYear)
FROM Books;
```

---

Better:

```sql id="minmax047"
SELECT
    MAX(PublicationYear) AS NewestBookYear
FROM Books;
```

---

## Confusing MIN and MAX

Bad:

```sql id="minmax048"
SELECT MIN(PublicationYear)
FROM Books;
```

when looking for newest books.

---

Correct:

```sql id="minmax049"
SELECT MAX(PublicationYear)
FROM Books;
```

---

## Assuming NULL is Included

Bad assumption:

```text id="minmax050"
NULL affects MIN/MAX calculations
```

---

Reality:

```text id="minmax051"
NULL values are ignored
```

---

# Performance Note

MIN() and MAX() are highly optimized and perform efficiently even on large datasets.

Example:

```sql id="minmax052"
SELECT MAX(PublicationYear)
FROM Books;
```

---

# Hands-On Practice

Run:

```sql id="minmax053"
SELECT MIN(PublicationYear)
FROM Books;
```

---

Run:

```sql id="minmax054"
SELECT MAX(PublicationYear)
FROM Books;
```

---

Run:

```sql id="minmax055"
SELECT MIN(MembershipDate)
FROM Members;
```

---

Run:

```sql id="minmax056"
SELECT MAX(MembershipDate)
FROM Members;
```

---

Run:

```sql id="minmax057"
SELECT MAX(FineAmount)
FROM BorrowRecords;
```

---

# Mini Exercise

Write queries to find:

### Task 1

Oldest publication year.

---

### Task 2

Newest publication year.

---

### Task 3

Earliest membership date.

---

### Task 4

Latest membership date.

---

### Task 5

Highest fine amount.

---

### Task 6

Lowest fine amount.

---

# Best Practices

✅ Use aliases for reports

✅ Use MIN for lowest values

✅ Use MAX for highest values

✅ Understand NULL handling

✅ Combine with WHERE when filtering data

---

# Summary

In this lesson, you learned:

* MIN() syntax
* MAX() syntax
* Working with dates
* Working with numbers
* NULL handling
* KPI reporting
* Business analytics

MIN() and MAX() are essential analytical functions for identifying trends, boundaries, and extreme values within business data.

---

# Knowledge Check

### Question 1

Which function returns the smallest value?

A. AVG()

B. SUM()

C. MIN()

D. MAX()

---

### Question 2

Which function returns the largest value?

A. MIN()

B. MAX()

C. COUNT()

D. AVG()

---

### Question 3

Which query finds the newest publication year?

A.

```sql id="q1"
SELECT MIN(PublicationYear)
FROM Books;
```

B.

```sql id="q2"
SELECT MAX(PublicationYear)
FROM Books;
```

---

### Question 4

Do MIN() and MAX() ignore NULL values?

A. Yes

B. No

---

### Question 5

Which query creates a professional KPI report?

```sql id="q3"
SELECT
    MAX(PublicationYear) AS NewestBookYear
FROM Books;
```

A. Correct

B. Incorrect

---

# Next Lesson

➡️ 06-Introduction-to-GROUP-BY.md

In the next lesson, you'll learn how to group records using GROUP BY and create category-wise, publisher-wise, and business summary reports.
