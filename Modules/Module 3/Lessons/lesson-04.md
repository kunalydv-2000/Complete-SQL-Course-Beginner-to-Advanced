# Lesson 04: Filtering with WHERE

> Learn how to filter data using the WHERE clause and retrieve only the records that meet specific conditions.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand the purpose of the WHERE clause
* Filter records using conditions
* Use comparison operators
* Apply multiple conditions
* Retrieve targeted data
* Build meaningful business reports
* Avoid common filtering mistakes

---

# Introduction

In previous lessons, you learned how to:

* Retrieve data using SELECT
* Select specific columns
* Remove duplicates using DISTINCT

However, most business questions require only a subset of data.

For example:

```text id="where001"
Show books published after 2020.

Show active reservations.

Show members with MemberID greater than 10.
```

To answer these questions, SQL uses the:

```sql id="where002"
WHERE
```

clause.

---

# What is WHERE?

The WHERE clause filters records.

Instead of returning every row, SQL Server returns only rows that match a condition.

---

# Basic Concept

```text id="where003"
Table
   ↓
WHERE Condition
   ↓
Filtered Results
```

---

# Basic Syntax

```sql id="where004"
SELECT
    ColumnName
FROM TableName
WHERE Condition;
```

---

# Example

Display books published after 2015.

```sql id="where005"
SELECT *
FROM Books
WHERE PublicationYear > 2015;
```

---

# Understanding the Query

```sql id="where006"
SELECT *
FROM Books
WHERE PublicationYear > 2015;
```

SQL Server:

1. Reads Books table
2. Evaluates PublicationYear
3. Returns matching rows

---

# Sample Data

| BookID | Title         | PublicationYear |
| ------ | ------------- | --------------- |
| 1      | Learning SQL  | 2020            |
| 2      | Clean Code    | 2008            |
| 3      | Atomic Habits | 2018            |

---

Query:

```sql id="where007"
SELECT *
FROM Books
WHERE PublicationYear > 2015;
```

Result:

| BookID | Title         | PublicationYear |
| ------ | ------------- | --------------- |
| 1      | Learning SQL  | 2020            |
| 3      | Atomic Habits | 2018            |

---

# Comparison Operators

WHERE commonly uses comparison operators.

---

# Equal To (=)

Retrieve a specific category.

```sql id="where008"
SELECT *
FROM Books
WHERE CategoryID = 1;
```

---

# Not Equal To (<>)

Retrieve books not in Category 1.

```sql id="where009"
SELECT *
FROM Books
WHERE CategoryID <> 1;
```

---

# Greater Than (>)

```sql id="where010"
SELECT *
FROM Books
WHERE PublicationYear > 2020;
```

---

# Less Than (<)

```sql id="where011"
SELECT *
FROM Books
WHERE PublicationYear < 2010;
```

---

# Greater Than or Equal To (>=)

```sql id="where012"
SELECT *
FROM Books
WHERE PublicationYear >= 2020;
```

---

# Less Than or Equal To (<=)

```sql id="where013"
SELECT *
FROM Books
WHERE PublicationYear <= 2015;
```

---

# Working with Text Values

Text values must be enclosed in single quotes.

---

Example:

```sql id="where014"
SELECT *
FROM Reservations
WHERE Status = 'Approved';
```

---

Result:

| ReservationID | Status   |
| ------------- | -------- |
| 1             | Approved |
| 4             | Approved |

---

# Working with Numeric Values

Numbers do not require quotes.

---

Example:

```sql id="where015"
SELECT *
FROM Members
WHERE MemberID = 5;
```

---

# Filtering Dates

Example:

```sql id="where016"
SELECT *
FROM BorrowRecords
WHERE BorrowDate > '2025-01-01';
```

---

Recommended format:

```text id="where017"
YYYY-MM-DD
```

---

# Multiple Conditions with AND

AND requires all conditions to be true.

---

Example:

```sql id="where018"
SELECT *
FROM Books
WHERE CategoryID = 1
AND PublicationYear > 2015;
```

---

Result:

Only books that satisfy both conditions.

---

# AND Visualization

```text id="where019"
Condition A = True
AND
Condition B = True

Result = Returned
```

---

# Multiple Conditions with OR

OR requires at least one condition to be true.

---

Example:

```sql id="where020"
SELECT *
FROM Books
WHERE CategoryID = 1
OR CategoryID = 2;
```

---

Result:

Books from Category 1 or Category 2.

---

# OR Visualization

```text id="where021"
Condition A = True

OR

Condition B = True

Result = Returned
```

---

# Combining AND and OR

Example:

```sql id="where022"
SELECT *
FROM Books
WHERE
(
    CategoryID = 1
    OR CategoryID = 2
)
AND PublicationYear > 2015;
```

---

Always use parentheses for clarity.

---

# Real-World Examples

---

## Find Technology Books

```sql id="where023"
SELECT *
FROM Books
WHERE CategoryID = 1;
```

---

## Find Approved Reservations

```sql id="where024"
SELECT *
FROM Reservations
WHERE Status = 'Approved';
```

---

## Find Recent Books

```sql id="where025"
SELECT *
FROM Books
WHERE PublicationYear > 2020;
```

---

## Find Specific Member

```sql id="where026"
SELECT *
FROM Members
WHERE MemberID = 3;
```

---

# Query Execution Flow

```text id="where027"
FROM
 ↓
WHERE
 ↓
SELECT
 ↓
Results
```

---

# Using WHERE with Selected Columns

Example:

```sql id="where028"
SELECT
    Title,
    PublicationYear
FROM Books
WHERE PublicationYear > 2015;
```

---

Result:

Only required columns are returned.

---

# Common Beginner Mistakes

---

## Missing Quotes Around Text

Bad:

```sql id="where029"
SELECT *
FROM Reservations
WHERE Status = Approved;
```

---

Correct:

```sql id="where030"
SELECT *
FROM Reservations
WHERE Status = 'Approved';
```

---

## Using Wrong Operator

Bad:

```sql id="where031"
WHERE PublicationYear = > 2020
```

---

Correct:

```sql id="where032"
WHERE PublicationYear >= 2020
```

---

## Misspelled Column Name

Bad:

```sql id="where033"
SELECT *
FROM Members
WHERE FristName = 'John';
```

---

Correct:

```sql id="where034"
SELECT *
FROM Members
WHERE FirstName = 'John';
```

---

## Incorrect Data Type

Bad:

```sql id="where035"
WHERE MemberID = 'ABC'
```

If MemberID is numeric.

---

# Performance Tip

Filtering reduces the amount of data returned.

Good:

```sql id="where036"
SELECT *
FROM Books
WHERE PublicationYear > 2020;
```

Instead of retrieving every row.

---

# Hands-On Practice

Run:

```sql id="where037"
SELECT *
FROM Books
WHERE PublicationYear > 2015;
```

---

Run:

```sql id="where038"
SELECT *
FROM Members
WHERE MemberID > 5;
```

---

Run:

```sql id="where039"
SELECT *
FROM Reservations
WHERE Status = 'Pending';
```

---

Run:

```sql id="where040"
SELECT *
FROM Books
WHERE CategoryID = 1;
```

---

# Mini Exercise

Write queries to:

### Task 1

Display books published before 2010.

---

### Task 2

Display members with MemberID less than 10.

---

### Task 3

Display approved reservations.

---

### Task 4

Display books in CategoryID 2.

---

# Best Practices

✅ Use WHERE whenever filtering is needed

✅ Use appropriate operators

✅ Use quotes for text values

✅ Verify column names

✅ Use parentheses with complex conditions

---

# Summary

In this lesson, you learned:

* What WHERE does
* Basic filtering
* Comparison operators
* Text filtering
* Numeric filtering
* Date filtering
* AND conditions
* OR conditions
* Common mistakes

The WHERE clause is one of the most important SQL features because it allows you to retrieve only the data relevant to a business question.

---

# Knowledge Check

### Question 1

Which clause filters rows?

A. SELECT

B. DISTINCT

C. WHERE

D. ORDER BY

---

### Question 2

Which operator means "greater than"?

A. <

B. >

C. =

D. <>

---

### Question 3

Which query finds approved reservations?

A.

```sql id="q1"
SELECT *
FROM Reservations;
```

B.

```sql id="q2"
SELECT *
FROM Reservations
WHERE Status = 'Approved';
```

C.

```sql id="q3"
SELECT Approved
FROM Reservations;
```

D.

```sql id="q4"
SHOW Approved;
```

---

### Question 4

Which keyword requires all conditions to be true?

A. OR

B. DISTINCT

C. AND

D. TOP

---

# Next Lesson

➡️ 05-Sorting-with-ORDER-BY.md

In the next lesson, you'll learn how to sort query results in ascending and descending order using the ORDER BY clause.
