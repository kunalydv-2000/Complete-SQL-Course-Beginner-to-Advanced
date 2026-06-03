# Lesson 09: IN vs EXISTS

> Learn the differences between IN and EXISTS, understand performance considerations, and determine which approach is best for different business scenarios.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand IN
* Understand EXISTS
* Compare IN and EXISTS
* Identify performance differences
* Choose the appropriate operator
* Optimize subquery performance
* Build efficient business reports

---

# Introduction

In previous lessons, you learned:

```text id="ive001"
IN

NOT IN

EXISTS

NOT EXISTS
```

Often, these operators can solve the same problem.

Example:

```text id="ive002"
Find members who borrowed books.
```

Can be written using:

```text id="ive003"
IN

or

EXISTS
```

The result may be the same, but the execution method can differ.

---

# Understanding IN

IN compares a value against a list of values returned by a subquery.

---

# Syntax

```sql id="ive004"
SELECT *
FROM Members
WHERE MemberID IN
(
    SELECT MemberID
    FROM BorrowRecords
);
```

---

# Execution Process

Step 1

```sql id="ive005"
SELECT MemberID
FROM BorrowRecords;
```

---

Result:

```text id="ive006"
1
2
3
4
5
```

---

Step 2

Outer Query:

```sql id="ive007"
WHERE MemberID IN
(
    1,2,3,4,5
)
```

---

SQL compares values against the returned list.

---

# Understanding EXISTS

EXISTS checks whether matching rows exist.

---

# Syntax

```sql id="ive008"
SELECT *
FROM Members M
WHERE EXISTS
(
    SELECT 1
    FROM BorrowRecords BR
    WHERE BR.MemberID = M.MemberID
);
```

---

# Execution Process

For each member:

```text id="ive009"
Check BorrowRecords

Match Found?

YES → Return Row

NO → Ignore Row
```

---

# Same Business Question

Question:

```text id="ive010"
Which members borrowed books?
```

---

# IN Solution

```sql id="ive011"
SELECT *
FROM Members
WHERE MemberID IN
(
    SELECT MemberID
    FROM BorrowRecords
);
```

---

# EXISTS Solution

```sql id="ive012"
SELECT *
FROM Members M
WHERE EXISTS
(
    SELECT 1
    FROM BorrowRecords BR
    WHERE BR.MemberID = M.MemberID
);
```

---

# Result

Both return:

```text id="ive013"
Members With Borrow Activity
```

---

# Key Difference

IN:

```text id="ive014"
Compares Values
```

---

EXISTS:

```text id="ive015"
Checks Row Existence
```

---

# Visual Comparison

IN

```text id="ive016"
Value
  ↓
Compare Against List
```

---

EXISTS

```text id="ive017"
Row
 ↓
Check Match Exists
```

---

# Performance Comparison

---

## Small Datasets

IN performs well.

Example:

```text id="ive018"
10 Rows

100 Rows

1000 Rows
```

---

Difference is usually negligible.

---

## Large Datasets

EXISTS often performs better.

Example:

```text id="ive019"
Millions of Rows
```

---

Reason:

```text id="ive020"
EXISTS stops
after first match.
```

---

IN may need to process:

```text id="ive021"
Entire Result Set
```

---

# Example: Books With Borrow Records

Using IN

```sql id="ive022"
SELECT *
FROM Books
WHERE BookID IN
(
    SELECT BookID
    FROM BorrowRecords
);
```

---

Using EXISTS

```sql id="ive023"
SELECT *
FROM Books B
WHERE EXISTS
(
    SELECT 1
    FROM BorrowRecords BR
    WHERE BR.BookID = B.BookID
);
```

---

# Example: Members With Reservations

Using IN

```sql id="ive024"
SELECT *
FROM Members
WHERE MemberID IN
(
    SELECT MemberID
    FROM Reservations
);
```

---

Using EXISTS

```sql id="ive025"
SELECT *
FROM Members M
WHERE EXISTS
(
    SELECT 1
    FROM Reservations R
    WHERE R.MemberID = M.MemberID
);
```

---

# NOT IN vs NOT EXISTS

Finding missing records.

---

Using NOT IN

```sql id="ive026"
SELECT *
FROM Books
WHERE BookID NOT IN
(
    SELECT BookID
    FROM BorrowRecords
);
```

---

Using NOT EXISTS

```sql id="ive027"
SELECT *
FROM Books B
WHERE NOT EXISTS
(
    SELECT 1
    FROM BorrowRecords BR
    WHERE BR.BookID = B.BookID
);
```

---

# Important NULL Issue

Suppose:

```text id="ive028"
BorrowRecords
contains NULL values.
```

---

NOT IN may produce:

```text id="ive029"
Unexpected Results
```

---

Example:

```sql id="ive030"
WHERE BookID NOT IN
(
    1,
    2,
    NULL
)
```

---

SQL cannot evaluate correctly.

---

Safer:

```sql id="ive031"
NOT EXISTS
```

---

# Comparison Table

| Feature                   | IN                 | EXISTS           |
| ------------------------- | ------------------ | ---------------- |
| Compares Values           | Yes                | No               |
| Checks Row Existence      | No                 | Yes              |
| Supports Correlation      | Limited            | Yes              |
| Large Dataset Performance | Moderate           | Better           |
| NULL Handling             | Can Be Problematic | Safer            |
| Common Use                | List Filtering     | Existence Checks |

---

# When to Use IN

Use IN when:

```text id="ive032"
Small Datasets

Simple Filtering

Known Value Lists

Readable Queries
```

---

Example:

```sql id="ive033"
SELECT *
FROM Books
WHERE CategoryID IN
(
    SELECT CategoryID
    FROM Categories
);
```

---

# When to Use EXISTS

Use EXISTS when:

```text id="ive034"
Large Datasets

Relationship Checks

Data Audits

Correlated Subqueries
```

---

Example:

```sql id="ive035"
SELECT *
FROM Members M
WHERE EXISTS
(
    SELECT 1
    FROM BorrowRecords BR
    WHERE BR.MemberID = M.MemberID
);
```

---

# Business Example 1

Find Active Members

Preferred:

```sql id="ive036"
EXISTS
```

because:

```text id="ive037"
Relationship Check
```

---

# Business Example 2

Find Books in Certain Categories

Preferred:

```sql id="ive038"
IN
```

because:

```text id="ive039"
List Comparison
```

---

# Business Example 3

Find Unused Inventory

Preferred:

```sql id="ive040"
NOT EXISTS
```

because:

```text id="ive041"
Safer NULL Handling
```

---

# Query Optimization Tips

---

## Index Correlated Columns

Example:

```sql id="ive042"
CREATE INDEX IX_BorrowRecords_MemberID
ON BorrowRecords(MemberID);
```

---

## Use EXISTS for Large Tables

```text id="ive043"
Faster Match Detection
```

---

## Avoid NOT IN with NULLs

Use:

```sql id="ive044"
NOT EXISTS
```

---

## Test Execution Plans

For large databases:

```text id="ive045"
Compare Query Plans
```

---

# Common Beginner Mistakes

---

## Using IN for Huge Datasets

May reduce performance.

Consider:

```sql id="ive046"
EXISTS
```

---

## Ignoring NULL Issues

Problem:

```sql id="ive047"
NOT IN
```

with NULL values.

---

## Using EXISTS Without Correlation

Bad:

```sql id="ive048"
SELECT *
FROM Members
WHERE EXISTS
(
    SELECT *
    FROM BorrowRecords
);
```

---

Correct:

```sql id="ive049"
WHERE BR.MemberID =
      M.MemberID
```

---

# Hands-On Practice

Run:

```sql id="ive050"
SELECT *
FROM Members
WHERE MemberID IN
(
    SELECT MemberID
    FROM BorrowRecords
);
```

---

Run:

```sql id="ive051"
SELECT *
FROM Members M
WHERE EXISTS
(
    SELECT 1
    FROM BorrowRecords BR
    WHERE BR.MemberID = M.MemberID
);
```

---

Run:

```sql id="ive052"
SELECT *
FROM Books B
WHERE NOT EXISTS
(
    SELECT 1
    FROM BorrowRecords BR
    WHERE BR.BookID = B.BookID
);
```

---

# Mini Exercise

### Task 1

Write a query using IN to find members with reservations.

---

### Task 2

Write the same query using EXISTS.

---

### Task 3

Find books never borrowed using NOT EXISTS.

---

### Task 4

Explain why NOT EXISTS is safer than NOT IN.

---

### Task 5

List three situations where EXISTS is preferred.

---

# Best Practices

✅ Use IN for simple list comparisons

✅ Use EXISTS for relationship checks

✅ Prefer NOT EXISTS over NOT IN

✅ Index correlated columns

✅ Test performance on large datasets

---

# Summary

In this lesson, you learned:

* IN
* EXISTS
* NOT IN
* NOT EXISTS
* Performance Differences
* NULL Handling
* Query Optimization

Choosing between IN and EXISTS is an important SQL optimization skill that can significantly improve query reliability and performance.

---

# Knowledge Check

### Question 1

What does IN do?

A. Checks Row Existence

B. Compares Values Against a List

C. Creates Tables

D. Deletes Records

---

### Question 2

What does EXISTS do?

A. Compares Values

B. Checks Row Existence

C. Sorts Data

D. Groups Data

---

### Question 3

Which usually performs better on large datasets?

A. IN

B. EXISTS

---

### Question 4

Which is safer when NULL values may exist?

A. NOT IN

B. NOT EXISTS

---

### Question 5

Which operator is best for relationship validation?

A. EXISTS

B. IN

C. TOP

D. DISTINCT

---

# Next Lesson

➡️ 10-Business-Reports-with-Subqueries.md

In the final lesson of this module, you'll combine scalar subqueries, derived tables, EXISTS, and correlated subqueries to build professional business reports, KPI dashboards, and analytical solutions.
