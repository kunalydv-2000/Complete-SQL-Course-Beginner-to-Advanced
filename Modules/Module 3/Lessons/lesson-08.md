# Lesson 08: Filtering with IN, BETWEEN, and LIKE

> Learn advanced filtering techniques using IN, BETWEEN, and LIKE to create flexible, powerful, and user-friendly SQL queries.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand the IN operator
* Use BETWEEN for range filtering
* Use LIKE for pattern matching
* Apply wildcards effectively
* Build advanced search queries
* Improve report flexibility
* Avoid common filtering mistakes

---

# Introduction

In the previous lesson, you learned how to filter records using:

```sql
WHERE
```

and comparison operators such as:

```sql
=
>
<
>=
<=
<>
```

While these operators are useful, SQL provides more advanced filtering tools.

Examples:

```text
Find books in categories 1, 2, and 3

Find books published between 2010 and 2020

Find members whose names start with J
```

To answer these questions efficiently, SQL provides:

```text
IN
BETWEEN
LIKE
```

---

# The IN Operator

IN allows you to match multiple values without using multiple OR conditions.

---

# Basic Syntax

```sql
SELECT *
FROM TableName
WHERE ColumnName IN (Value1, Value2, Value3);
```

---

# Example

Without IN:

```sql
SELECT *
FROM Books
WHERE CategoryID = 1
OR CategoryID = 2
OR CategoryID = 3;
```

---

With IN:

```sql
SELECT *
FROM Books
WHERE CategoryID IN (1,2,3);
```

---

Both queries return the same result.

The IN version is cleaner and easier to read.

---

# How IN Works

```text
CategoryID
    ↓
Check List
    ↓
Match Found?
    ↓
Return Row
```

---

# Example Data

| BookID | Title         | CategoryID |
| ------ | ------------- | ---------- |
| 1      | Learning SQL  | 1          |
| 2      | Clean Code    | 1          |
| 3      | Sapiens       | 4          |
| 4      | Atomic Habits | 3          |

---

Query:

```sql
SELECT *
FROM Books
WHERE CategoryID IN (1,3);
```

---

Result:

| BookID | Title         |
| ------ | ------------- |
| 1      | Learning SQL  |
| 2      | Clean Code    |
| 4      | Atomic Habits |

---

# IN with Text Values

Text values must use quotes.

Example:

```sql
SELECT *
FROM Reservations
WHERE Status IN
(
    'Approved',
    'Pending'
);
```

---

Result:

Returns reservations that are either:

```text
Approved
Pending
```

---

# Real-World Uses of IN

---

## Selected Categories

```sql
SELECT *
FROM Books
WHERE CategoryID IN (1,2,3);
```

---

## Selected Members

```sql
SELECT *
FROM Members
WHERE MemberID IN (1,3,5,7);
```

---

## Selected Publishers

```sql
SELECT *
FROM Publishers
WHERE Country IN ('USA','UK');
```

---

# The BETWEEN Operator

BETWEEN filters values within a range.

---

# Basic Syntax

```sql
SELECT *
FROM TableName
WHERE ColumnName
BETWEEN Value1 AND Value2;
```

---

# Example

```sql
SELECT *
FROM Books
WHERE PublicationYear
BETWEEN 2010 AND 2020;
```

---

# Understanding BETWEEN

```text
2010 ≤ Value ≤ 2020
```

Both endpoints are included.

---

# Example Data

| Title         | PublicationYear |
| ------------- | --------------- |
| Clean Code    | 2008            |
| Atomic Habits | 2018            |
| Learning SQL  | 2020            |
| Deep Learning | 2022            |

---

Query:

```sql
SELECT *
FROM Books
WHERE PublicationYear
BETWEEN 2010 AND 2020;
```

---

Result:

| Title         |
| ------------- |
| Atomic Habits |
| Learning SQL  |

---

# BETWEEN with Dates

Example:

```sql
SELECT *
FROM BorrowRecords
WHERE BorrowDate
BETWEEN '2025-01-01'
AND '2025-12-31';
```

---

Result:

Returns borrow records within the specified year.

---

# BETWEEN with IDs

Example:

```sql
SELECT *
FROM Members
WHERE MemberID
BETWEEN 1 AND 10;
```

---

Returns members:

```text
1 through 10
```

---

# Real-World Uses of BETWEEN

---

## Books Published in a Decade

```sql
SELECT *
FROM Books
WHERE PublicationYear
BETWEEN 2010 AND 2020;
```

---

## Members by ID Range

```sql
SELECT *
FROM Members
WHERE MemberID
BETWEEN 1 AND 20;
```

---

## Borrow Records for a Month

```sql
SELECT *
FROM BorrowRecords
WHERE BorrowDate
BETWEEN '2025-06-01'
AND '2025-06-30';
```

---

# The LIKE Operator

LIKE searches for patterns in text values.

---

# Basic Syntax

```sql
SELECT *
FROM TableName
WHERE ColumnName LIKE Pattern;
```

---

# Wildcards

LIKE uses special wildcard characters.

| Wildcard | Meaning                  |
| -------- | ------------------------ |
| %        | Any number of characters |
| _        | Single character         |

---

# Starts With

Find members whose names start with J.

```sql
SELECT *
FROM Members
WHERE FirstName LIKE 'J%';
```

---

Result:

```text
John
James
Jennifer
```

---

# Ends With

Find authors whose last name ends with n.

```sql
SELECT *
FROM Authors
WHERE LastName LIKE '%n';
```

---

Result:

```text
Martin
Brown
Wilson
```

---

# Contains

Find publishers containing:

```text
Media
```

---

Query:

```sql
SELECT *
FROM Publishers
WHERE PublisherName LIKE '%Media%';
```

---

Result:

```text
O'Reilly Media
```

---

# Single Character Wildcard

Find names with exactly four characters beginning with J.

```sql
SELECT *
FROM Members
WHERE FirstName LIKE 'J___';
```

---

Possible results:

```text
John
Jake
```

---

# LIKE Visualization

```text
J%
│
├── John
├── James
├── Jennifer
└── Jack
```

---

# Combining Operators

Example:

```sql
SELECT *
FROM Books
WHERE CategoryID IN (1,2,3)
AND PublicationYear BETWEEN 2010 AND 2025;
```

---

SQL Server:

1. Checks CategoryID
2. Checks PublicationYear
3. Returns matching rows

---

# Business Scenario

Library manager asks:

```text
Show technology and science books
published between 2015 and 2025.
```

Query:

```sql
SELECT *
FROM Books
WHERE CategoryID IN (1,2)
AND PublicationYear BETWEEN 2015 AND 2025;
```

---

# Query Execution Flow

```text
FROM
 ↓
WHERE
 ↓
IN / BETWEEN / LIKE
 ↓
Results
```

---

# Common Beginner Mistakes

---

## Missing Quotes in LIKE

Bad:

```sql
WHERE FirstName LIKE J%
```

---

Correct:

```sql
WHERE FirstName LIKE 'J%'
```

---

## Reversing BETWEEN Values

Bad:

```sql
WHERE PublicationYear
BETWEEN 2025 AND 2010
```

---

Correct:

```sql
WHERE PublicationYear
BETWEEN 2010 AND 2025
```

---

## Using OR Instead of IN

Bad:

```sql
WHERE CategoryID = 1
OR CategoryID = 2
OR CategoryID = 3
OR CategoryID = 4
```

---

Better:

```sql
WHERE CategoryID IN (1,2,3,4)
```

---

## Forgetting Wildcards

Bad:

```sql
WHERE FirstName LIKE 'J'
```

---

Correct:

```sql
WHERE FirstName LIKE 'J%'
```

---

# Hands-On Practice

Run:

```sql
SELECT *
FROM Books
WHERE CategoryID IN (1,2,3);
```

---

Run:

```sql
SELECT *
FROM Books
WHERE PublicationYear
BETWEEN 2010 AND 2020;
```

---

Run:

```sql
SELECT *
FROM Members
WHERE FirstName LIKE 'J%';
```

---

Run:

```sql
SELECT *
FROM Publishers
WHERE PublisherName LIKE '%Media%';
```

---

# Mini Exercise

Write queries to:

### Task 1

Display books in CategoryID:

```text
1
3
5
```

---

### Task 2

Display books published between:

```text
2005 and 2015
```

---

### Task 3

Display members whose names start with:

```text
S
```

---

### Task 4

Display publishers containing:

```text
Publishing
```

---

# Best Practices

✅ Use IN for multiple values

✅ Use BETWEEN for ranges

✅ Use LIKE for searches

✅ Use meaningful wildcards

✅ Combine operators carefully

---

# Summary

In this lesson, you learned:

* IN operator
* BETWEEN operator
* LIKE operator
* Wildcards
* Pattern matching
* Range filtering
* Multi-value filtering
* Advanced business queries

These operators make SQL queries significantly more flexible and are used extensively in reporting, analytics, and application development.

---

# Knowledge Check

### Question 1

Which operator matches multiple specific values?

A. LIKE

B. BETWEEN

C. IN

D. TOP

---

### Question 2

Which operator filters a range?

A. DISTINCT

B. BETWEEN

C. ORDER BY

D. TOP

---

### Question 3

Which wildcard matches any number of characters?

A. _

B. %

C. *

D. #

---

### Question 4

Which query finds names starting with J?

A.

```sql
WHERE FirstName = 'J'
```

B.

```sql
WHERE FirstName LIKE 'J%'
```

C.

```sql
WHERE FirstName BETWEEN 'J'
```

D.

```sql
WHERE FirstName IN ('J')
```

---

# Next Lesson

➡️ 09-Building-Business-Queries.md

In the next lesson, you'll combine SELECT, WHERE, DISTINCT, ORDER BY, TOP, IN, BETWEEN, LIKE, and aliases to build complete business reports and answer real-world questions using SQL.
