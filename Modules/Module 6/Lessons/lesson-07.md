            # Lesson 07: Correlated Subqueries

> Learn how correlated subqueries reference values from the outer query and perform row-by-row analysis for advanced business logic and analytical reporting.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand Correlated Subqueries
* Reference outer query values
* Perform row-by-row analysis
* Use EXISTS effectively
* Build advanced filtering logic
* Solve analytical business problems
* Compare correlated and non-correlated subqueries

---

# Introduction

In previous lessons, you learned:

```text id="cs001"
Scalar Subqueries

Multi-Row Subqueries

Derived Tables
```

These subqueries execute independently.

Example:

```sql id="cs002"
SELECT *
FROM Books
WHERE BookPrice >
(
    SELECT AVG(BookPrice)
    FROM Books
);
```

---

The subquery runs:

```text id="cs003"
Once
```

Then returns a value.

---

However, some business problems require SQL to evaluate:

```text id="cs004"
Each Row Individually
```

For these situations, SQL uses:

```text id="cs005"
Correlated Subqueries
```

---

# What is a Correlated Subquery?

A Correlated Subquery is a subquery that references columns from the outer query.

Because of this dependency:

```text id="cs006"
It cannot execute independently.
```

---

# General Structure

```sql id="cs007"
SELECT *
FROM OuterTable O
WHERE EXISTS
(
    SELECT 1
    FROM InnerTable I
    WHERE I.Column = O.Column
);
```

---

Notice:

```text id="cs008"
O.Column
```

inside the subquery.

The subquery depends on the outer query.

---

# How Correlated Subqueries Work

Normal Subquery:

```text id="cs009"
Runs Once
```

---

Correlated Subquery:

```text id="cs010"
Runs For Every Row
```

---

Execution Flow

```text id="cs011"
Row 1
  ↓
Subquery Executes

Row 2
  ↓
Subquery Executes

Row 3
  ↓
Subquery Executes

...
```

---

# Example 1: Members Who Borrowed Books

Business Question:

```text id="cs012"
Which members have borrowed at least one book?
```

---

Query:

```sql id="cs013"
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

Explanation

Outer Query:

```text id="cs014"
Current Member
```

---

Subquery:

```text id="cs015"
Check if borrow record exists
for that member.
```

---

If found:

```text id="cs016"
Member Returned
```

---

# Visualization

```text id="cs017"
Member 1
    ↓
Borrow Record Exists?
    ↓
Yes → Return

Member 2
    ↓
Borrow Record Exists?
    ↓
No → Ignore
```

---

# Example 2: Books That Were Borrowed

Business Question:

```text id="cs018"
Which books have been borrowed?
```

---

Query:

```sql id="cs019"
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

# Example 3: Members With Reservations

```sql id="cs020"
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

# Example 4: Books Never Borrowed

Using NOT EXISTS

```sql id="cs021"
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

Business Value:

```text id="cs022"
Unused Inventory
```

---

# Why Use SELECT 1?

You will often see:

```sql id="cs023"
SELECT 1
```

inside EXISTS.

Example:

```sql id="cs024"
EXISTS
(
    SELECT 1
    FROM BorrowRecords
)
```

---

Reason:

```text id="cs025"
EXISTS only checks
whether rows exist.

Actual values are ignored.
```

---

# Correlated vs Non-Correlated Subqueries

---

## Non-Correlated

```sql id="cs026"
SELECT *
FROM Books
WHERE BookPrice >
(
    SELECT AVG(BookPrice)
    FROM Books
);
```

---

Characteristics:

```text id="cs027"
Runs Once

Independent

Returns Single Value
```

---

## Correlated

```sql id="cs028"
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

Characteristics:

```text id="cs029"
Runs Per Row

Depends On Outer Query

Uses Outer Values
```

---

# Example 5: Most Active Members

Business Question:

```text id="cs030"
Find members whose borrowing activity exceeds average activity.
```

---

Query:

```sql id="cs031"
SELECT
    M.MemberID,
    M.FirstName
FROM Members M
WHERE
(
    SELECT COUNT(*)
    FROM BorrowRecords BR
    WHERE BR.MemberID = M.MemberID
)
>
(
    SELECT AVG(BorrowCount)
    FROM
    (
        SELECT
            COUNT(*) AS BorrowCount
        FROM BorrowRecords
        GROUP BY MemberID
    ) AS BorrowStats
);
```

---

This combines:

```text id="cs032"
Correlated Subquery

Derived Table

Aggregate Functions
```

---

# Example 6: Authors With Books

```sql id="cs033"
SELECT *
FROM Authors A
WHERE EXISTS
(
    SELECT 1
    FROM BookAuthors BA
    WHERE BA.AuthorID = A.AuthorID
);
```

---

# Example 7: Categories With Books

```sql id="cs034"
SELECT *
FROM Categories C
WHERE EXISTS
(
    SELECT 1
    FROM Books B
    WHERE B.CategoryID = C.CategoryID
);
```

---

# Business Audit Example

Question:

```text id="cs035"
Which publishers have books?
```

---

Query:

```sql id="cs036"
SELECT *
FROM Publishers P
WHERE EXISTS
(
    SELECT 1
    FROM Books B
    WHERE B.PublisherID = P.PublisherID
);
```

---

# Performance Considerations

Correlated subqueries execute:

```text id="cs037"
Multiple Times
```

Potentially:

```text id="cs038"
Once Per Row
```

---

Large datasets may require:

```text id="cs039"
Indexes

JOIN Alternatives

Query Optimization
```

---

# Correlated Subquery Flow

```text id="cs040"
Outer Row
     ↓
Pass Value
     ↓
Subquery Executes
     ↓
Result Returned
     ↓
Next Row
```

---

# Common Beginner Mistakes

---

## Forgetting Outer Reference

Bad:

```sql id="cs041"
SELECT *
FROM Members M
WHERE EXISTS
(
    SELECT *
    FROM BorrowRecords
);
```

---

Problem:

```text id="cs042"
No correlation exists.
```

---

Correct:

```sql id="cs043"
WHERE BR.MemberID =
      M.MemberID
```

---

## Confusing EXISTS with IN

Both can solve similar problems.

However:

```text id="cs044"
EXISTS checks rows.

IN compares values.
```

---

## Using Correlated Subqueries Unnecessarily

Sometimes JOINs are simpler.

Evaluate alternatives.

---

# Hands-On Practice

Run:

```sql id="cs045"
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

```sql id="cs046"
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

Run:

```sql id="cs047"
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

Find members who borrowed books.

---

### Task 2

Find members who never borrowed books.

---

### Task 3

Find books that were borrowed.

---

### Task 4

Find books never borrowed.

---

### Task 5

Explain the difference between correlated and non-correlated subqueries.

---

# Best Practices

✅ Use EXISTS for existence checks

✅ Use NOT EXISTS for missing data analysis

✅ Ensure proper correlation

✅ Index related columns

✅ Test performance on large datasets

---

# Summary

In this lesson, you learned:

* Correlated Subqueries
* Outer Query References
* Row-by-Row Execution
* EXISTS Logic
* NOT EXISTS Logic
* Business Auditing
* Advanced Filtering

Correlated subqueries enable powerful analytical logic and are commonly used in enterprise reporting, data quality checks, and business intelligence solutions.

---

# Knowledge Check

### Question 1

What makes a subquery correlated?

A. It uses COUNT()

B. It references the outer query

C. It uses GROUP BY

D. It uses AVG()

---

### Question 2

How often does a correlated subquery execute?

A. Once

B. Twice

C. Per Row

D. Never

---

### Question 3

Which keyword is commonly used with correlated subqueries?

A. ORDER BY

B. EXISTS

C. DISTINCT

D. UNION

---

### Question 4

What does EXISTS check?

A. Values

B. Tables

C. Row Existence

D. Data Types

---

### Question 5

Which query finds books never borrowed?

A.

```sql
WHERE EXISTS (...)
```

B.

```sql
WHERE NOT EXISTS (...)
```

---

# Next Lesson

➡️ 08-EXISTS-and-NOT-EXISTS.md

In the next lesson, you'll dive deeper into EXISTS and NOT EXISTS, one of the most important techniques for auditing data, validating relationships, and finding missing records.
