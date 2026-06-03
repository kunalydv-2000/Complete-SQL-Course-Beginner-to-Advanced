# Lesson 06: RIGHT JOIN and FULL OUTER JOIN

> Learn how RIGHT JOIN and FULL OUTER JOIN return unmatched records and help perform data reconciliation, audits, and completeness analysis.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand RIGHT JOIN
* Understand FULL OUTER JOIN
* Compare all major join types
* Identify unmatched records
* Analyze incomplete data
* Build reconciliation reports
* Perform data quality audits

---

# Introduction

So far, you have learned:

```text id="rjf001"
INNER JOIN

LEFT JOIN
```

Recall:

```text id="rjf002"
INNER JOIN
→ Matching Rows Only

LEFT JOIN
→ All Left Rows
  + Matching Right Rows
```

Now we will learn:

```sql id="rjf003"
RIGHT JOIN

FULL OUTER JOIN
```

These joins help us analyze complete datasets and identify missing relationships.

---

# Understanding RIGHT JOIN

RIGHT JOIN returns:

```text id="rjf004"
All Rows From Right Table

+

Matching Rows From Left Table
```

---

# Visual Representation

```text id="rjf005"
Matching Rows
      +
All Right Rows
```

---

# Basic Syntax

```sql id="rjf006"
SELECT
    Columns
FROM TableA A
RIGHT JOIN TableB B
    ON A.ID = B.ID;
```

---

# Example Data

Books

| BookID | Title        | PublisherID |
| ------ | ------------ | ----------- |
| 1      | SQL Basics   | 1           |
| 2      | Python Guide | 2           |

---

Publishers

| PublisherID | PublisherName |
| ----------- | ------------- |
| 1           | TechPress     |
| 2           | CodeBooks     |
| 3           | FutureBooks   |

---

Notice:

```text id="rjf007"
FutureBooks
has no books.
```

---

# RIGHT JOIN Example

```sql id="rjf008"
SELECT
    B.Title,
    P.PublisherName
FROM Books B
RIGHT JOIN Publishers P
    ON B.PublisherID = P.PublisherID;
```

---

# Result

| Title        | Publisher   |
| ------------ | ----------- |
| SQL Basics   | TechPress   |
| Python Guide | CodeBooks   |
| NULL         | FutureBooks |

---

Why?

Because:

```text id="rjf009"
RIGHT JOIN keeps all publishers.
```

Even if no books exist.

---

# LEFT JOIN vs RIGHT JOIN

### LEFT JOIN

```sql id="rjf010"
Books
LEFT JOIN Publishers
```

Returns:

```text id="rjf011"
All Books
```

---

### RIGHT JOIN

```sql id="rjf012"
Books
RIGHT JOIN Publishers
```

Returns:

```text id="rjf013"
All Publishers
```

---

# Equivalent Query

Many developers prefer LEFT JOIN.

This RIGHT JOIN:

```sql id="rjf014"
SELECT
    B.Title,
    P.PublisherName
FROM Books B
RIGHT JOIN Publishers P
    ON B.PublisherID = P.PublisherID;
```

can be rewritten as:

```sql id="rjf015"
SELECT
    B.Title,
    P.PublisherName
FROM Publishers P
LEFT JOIN Books B
    ON P.PublisherID = B.PublisherID;
```

---

# Understanding FULL OUTER JOIN

FULL OUTER JOIN returns:

```text id="rjf016"
All Rows From Left Table

+

All Rows From Right Table

+

Matching Rows
```

---

# Visual Representation

```text id="rjf017"
Table A
    +
Table B
```

Everything is included.

---

# Basic Syntax

```sql id="rjf018"
SELECT
    Columns
FROM TableA A
FULL OUTER JOIN TableB B
    ON A.ID = B.ID;
```

---

# Example

Books

| BookID | Title        | PublisherID |
| ------ | ------------ | ----------- |
| 1      | SQL Basics   | 1           |
| 2      | Python Guide | 2           |
| 3      | Unknown Book | NULL        |

---

Publishers

| PublisherID | PublisherName |
| ----------- | ------------- |
| 1           | TechPress     |
| 2           | CodeBooks     |
| 3           | FutureBooks   |

---

Query:

```sql id="rjf019"
SELECT
    B.Title,
    P.PublisherName
FROM Books B
FULL OUTER JOIN Publishers P
    ON B.PublisherID = P.PublisherID;
```

---

# Result

| Title        | Publisher   |
| ------------ | ----------- |
| SQL Basics   | TechPress   |
| Python Guide | CodeBooks   |
| Unknown Book | NULL        |
| NULL         | FutureBooks |

---

Notice:

```text id="rjf020"
All books included

All publishers included
```

---

# Why Use FULL OUTER JOIN?

Business Question:

```text id="rjf021"
Show all records,
even if relationships are missing.
```

---

Useful for:

```text id="rjf022"
Data Audits

Data Validation

Data Reconciliation

Completeness Checks
```

---

# Data Reconciliation Example

```sql id="rjf023"
SELECT
    B.Title,
    P.PublisherName
FROM Books B
FULL OUTER JOIN Publishers P
    ON B.PublisherID = P.PublisherID;
```

---

Goal:

```text id="rjf024"
Find missing relationships.
```

---

# Finding Unmatched Records

## Unmatched Books

```sql id="rjf025"
SELECT
    B.Title
FROM Books B
FULL OUTER JOIN Publishers P
    ON B.PublisherID = P.PublisherID
WHERE P.PublisherID IS NULL;
```

---

# Unmatched Publishers

```sql id="rjf026"
SELECT
    P.PublisherName
FROM Books B
FULL OUTER JOIN Publishers P
    ON B.PublisherID = P.PublisherID
WHERE B.BookID IS NULL;
```

---

# Categories and Books Example

```sql id="rjf027"
SELECT
    C.CategoryName,
    B.Title
FROM Categories C
FULL OUTER JOIN Books B
    ON C.CategoryID = B.CategoryID;
```

---

Result includes:

```text id="rjf028"
Categories With No Books

Books With No Categories

Matching Records
```

---

# Members and Reservations Example

```sql id="rjf029"
SELECT
    M.FirstName,
    R.ReservationID
FROM Members M
FULL OUTER JOIN Reservations R
    ON M.MemberID = R.MemberID;
```

---

Purpose:

```text id="rjf030"
Show all members
and all reservations.
```

---

# Join Comparison Summary

| Join Type       | Returns                   |
| --------------- | ------------------------- |
| INNER JOIN      | Matching Rows             |
| LEFT JOIN       | All Left + Matching Right |
| RIGHT JOIN      | All Right + Matching Left |
| FULL OUTER JOIN | All Rows                  |

---

# Business Example 1

Publishers Without Books

```sql id="rjf031"
SELECT
    P.PublisherName
FROM Books B
RIGHT JOIN Publishers P
    ON B.PublisherID = P.PublisherID
WHERE B.BookID IS NULL;
```

---

# Business Example 2

Categories Without Books

```sql id="rjf032"
SELECT
    C.CategoryName
FROM Books B
RIGHT JOIN Categories C
    ON B.CategoryID = C.CategoryID
WHERE B.BookID IS NULL;
```

---

# Business Example 3

Complete Data Audit

```sql id="rjf033"
SELECT
    B.Title,
    P.PublisherName
FROM Books B
FULL OUTER JOIN Publishers P
    ON B.PublisherID = P.PublisherID;
```

---

# Common Beginner Mistakes

---

## Using RIGHT JOIN When LEFT JOIN Is Easier

Bad:

```sql id="rjf034"
Books
RIGHT JOIN Publishers
```

---

Better:

```sql id="rjf035"
Publishers
LEFT JOIN Books
```

---

## Forgetting NULL Checks

Bad:

```sql id="rjf036"
FULL OUTER JOIN
```

without checking unmatched records.

---

Use:

```sql id="rjf037"
WHERE Column IS NULL
```

---

## Expecting Only Matching Rows

Remember:

```text id="rjf038"
FULL OUTER JOIN
returns everything.
```

---

# Hands-On Practice

Run:

```sql id="rjf039"
SELECT
    B.Title,
    P.PublisherName
FROM Books B
RIGHT JOIN Publishers P
    ON B.PublisherID = P.PublisherID;
```

---

Run:

```sql id="rjf040"
SELECT
    B.Title,
    P.PublisherName
FROM Books B
FULL OUTER JOIN Publishers P
    ON B.PublisherID = P.PublisherID;
```

---

Run:

```sql id="rjf041"
SELECT
    C.CategoryName,
    B.Title
FROM Categories C
FULL OUTER JOIN Books B
    ON C.CategoryID = B.CategoryID;
```

---

# Mini Exercise

### Task 1

Display all publishers, including those without books.

---

### Task 2

Display all categories, including those without books.

---

### Task 3

Display books without publishers.

---

### Task 4

Display publishers without books.

---

### Task 5

Create a FULL OUTER JOIN report showing all books and publishers.

---

# Best Practices

✅ Prefer LEFT JOIN when possible

✅ Use RIGHT JOIN when business logic requires it

✅ Use FULL OUTER JOIN for audits

✅ Check NULL values carefully

✅ Use aliases consistently

---

# Summary

In this lesson, you learned:

* RIGHT JOIN
* FULL OUTER JOIN
* Join comparisons
* Data reconciliation
* Missing relationship analysis
* Audit reporting
* Data quality checks

RIGHT JOIN and FULL OUTER JOIN are powerful tools for identifying missing data and validating database integrity.

---

# Knowledge Check

### Question 1

What does RIGHT JOIN return?

A. Matching rows only

B. All left rows

C. All right rows and matching left rows

D. All rows

---

### Question 2

What does FULL OUTER JOIN return?

A. Matching rows only

B. All left rows

C. All right rows

D. All rows from both tables

---

### Question 3

Which join is most useful for data audits?

A. INNER JOIN

B. LEFT JOIN

C. FULL OUTER JOIN

D. CROSS JOIN

---

### Question 4

Can FULL OUTER JOIN return unmatched rows from both tables?

A. Yes

B. No

---

### Question 5

Which condition is commonly used to find unmatched records?

A. ORDER BY

B. GROUP BY

C. IS NULL

D. DISTINCT

---

# Next Lesson

➡️ 07-SELF-JOIN.md

In the next lesson, you'll learn how a table can join to itself using SELF JOIN to model hierarchical relationships such as employee-manager structures.
