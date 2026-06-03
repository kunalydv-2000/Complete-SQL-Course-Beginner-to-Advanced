# Lesson 08: EXISTS and NOT EXISTS

> Learn how EXISTS and NOT EXISTS work, how they differ from IN and NOT IN, and how they are used for auditing, validation, and relationship analysis in professional SQL development.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand EXISTS
* Understand NOT EXISTS
* Check row existence efficiently
* Find missing relationships
* Perform data audits
* Compare EXISTS and IN
* Build advanced business reports

---

# Introduction

In previous lessons, you learned:

```text id="en001"
Subqueries

Multi-Row Subqueries

Correlated Subqueries
```

One of the most powerful uses of correlated subqueries is:

```sql id="en002"
EXISTS

NOT EXISTS
```

These operators answer business questions such as:

```text id="en003"
Does a borrow record exist?

Does a reservation exist?

Does a book have an author?

Does a member have activity?

Which records have no related records?
```

---

# What is EXISTS?

EXISTS checks whether a subquery returns at least one row.

---

# Syntax

```sql id="en004"
SELECT *
FROM TableA A
WHERE EXISTS
(
    SELECT 1
    FROM TableB B
    WHERE B.Column = A.Column
);
```

---

# How EXISTS Works

SQL asks:

```text id="en005"
Does at least one matching row exist?
```

---

If:

```text id="en006"
YES
```

Return the row.

---

If:

```text id="en007"
NO
```

Ignore the row.

---

# Visual Example

Members

| MemberID | Name    |
| -------- | ------- |
| 1        | Alice   |
| 2        | Bob     |
| 3        | Charlie |

---

BorrowRecords

| BorrowID | MemberID |
| -------- | -------- |
| 1        | 1        |
| 2        | 1        |
| 3        | 2        |

---

Question:

```text id="en008"
Which members borrowed books?
```

---

Query

```sql id="en009"
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

| MemberID | Name  |
| -------- | ----- |
| 1        | Alice |
| 2        | Bob   |

---

Charlie is excluded because:

```text id="en010"
No matching borrow record exists.
```

---

# Why SELECT 1?

Most EXISTS queries use:

```sql id="en011"
SELECT 1
```

Example:

```sql id="en012"
EXISTS
(
    SELECT 1
    FROM BorrowRecords
)
```

---

Reason:

```text id="en013"
EXISTS ignores actual values.

It only checks
whether rows exist.
```

---

These are equivalent:

```sql id="en014"
SELECT 1
```

```sql id="en015"
SELECT *
```

```sql id="en016"
SELECT MemberID
```

---

Best Practice:

```sql id="en017"
SELECT 1
```

---

# Example 1: Members With Borrow Activity

```sql id="en018"
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

# Example 2: Members With Reservations

```sql id="en019"
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

# Example 3: Books That Were Borrowed

```sql id="en020"
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

# What is NOT EXISTS?

NOT EXISTS returns rows where no matching rows exist.

---

# Syntax

```sql id="en021"
SELECT *
FROM TableA A
WHERE NOT EXISTS
(
    SELECT 1
    FROM TableB B
    WHERE B.Column = A.Column
);
```

---

# How NOT EXISTS Works

SQL asks:

```text id="en022"
Does a matching row exist?
```

---

If:

```text id="en023"
YES
```

Ignore the row.

---

If:

```text id="en024"
NO
```

Return the row.

---

# Example 4: Books Never Borrowed

Business Question:

```text id="en025"
Which books have never been borrowed?
```

---

Query

```sql id="en026"
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

# Example 5: Members Who Never Borrowed

```sql id="en027"
SELECT *
FROM Members M
WHERE NOT EXISTS
(
    SELECT 1
    FROM BorrowRecords BR
    WHERE BR.MemberID = M.MemberID
);
```

---

# Example 6: Members Without Reservations

```sql id="en028"
SELECT *
FROM Members M
WHERE NOT EXISTS
(
    SELECT 1
    FROM Reservations R
    WHERE R.MemberID = M.MemberID
);
```

---

# Example 7: Categories Without Books

```sql id="en029"
SELECT *
FROM Categories C
WHERE NOT EXISTS
(
    SELECT 1
    FROM Books B
    WHERE B.CategoryID = C.CategoryID
);
```

---

# Business Audit Example

Question:

```text id="en030"
Which publishers have no books?
```

---

Query:

```sql id="en031"
SELECT *
FROM Publishers P
WHERE NOT EXISTS
(
    SELECT 1
    FROM Books B
    WHERE B.PublisherID = P.PublisherID
);
```

---

# EXISTS vs NOT EXISTS

| Operator   | Purpose          |
| ---------- | ---------------- |
| EXISTS     | Matching Records |
| NOT EXISTS | Missing Records  |

---

# Visual Representation

EXISTS

```text id="en032"
Parent
   ↓
Child Exists
```

Return Parent

---

NOT EXISTS

```text id="en033"
Parent
   ↓
Child Missing
```

Return Parent

---

# EXISTS vs IN

Example using IN

```sql id="en034"
SELECT *
FROM Members
WHERE MemberID IN
(
    SELECT MemberID
    FROM BorrowRecords
);
```

---

Equivalent EXISTS Version

```sql id="en035"
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

# Key Difference

IN:

```text id="en036"
Compares Values
```

---

EXISTS:

```text id="en037"
Checks Row Existence
```

---

# Performance Advantage

Large Datasets:

```text id="en038"
EXISTS often performs better.
```

Reason:

```text id="en039"
Stops searching
after first match.
```

---

# Data Quality Auditing

EXISTS and NOT EXISTS are commonly used for:

```text id="en040"
Data Validation

Data Integrity

Relationship Auditing

Exception Reporting
```

---

# Example: Books Without Authors

```sql id="en041"
SELECT *
FROM Books B
WHERE NOT EXISTS
(
    SELECT 1
    FROM BookAuthors BA
    WHERE BA.BookID = B.BookID
);
```

---

# Example: Authors With Books

```sql id="en042"
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

# Execution Flow

```text id="en043"
Outer Row
      ↓
Subquery Executes
      ↓
Match Found?
      ↓
Yes / No
      ↓
Return Decision
```

---

# Common Beginner Mistakes

---

## Forgetting Correlation

Bad:

```sql id="en044"
SELECT *
FROM Members
WHERE EXISTS
(
    SELECT *
    FROM BorrowRecords
);
```

---

Problem:

```text id="en045"
No relationship defined.
```

---

Correct:

```sql id="en046"
WHERE BR.MemberID =
      M.MemberID
```

---

## Using NOT IN With NULL Values

Potential issue:

```sql id="en047"
NOT IN
```

may fail when NULLs exist.

---

Safer:

```sql id="en048"
NOT EXISTS
```

---

## Using EXISTS for Scalar Comparisons

Bad:

```text id="en049"
Average Price Comparisons
```

---

Use:

```text id="en050"
Scalar Subqueries
```

instead.

---

# Hands-On Practice

Run:

```sql id="en051"
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

```sql id="en052"
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

Run:

```sql id="en053"
SELECT *
FROM Publishers P
WHERE NOT EXISTS
(
    SELECT 1
    FROM Books B
    WHERE B.PublisherID = P.PublisherID
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

Find publishers with no books.

---

# Best Practices

✅ Use EXISTS for existence checks

✅ Use NOT EXISTS for missing data analysis

✅ Use SELECT 1 inside EXISTS

✅ Correlate subqueries properly

✅ Prefer NOT EXISTS over NOT IN when NULLs may exist

---

# Summary

In this lesson, you learned:

* EXISTS
* NOT EXISTS
* Correlated Filtering
* Data Auditing
* Missing Relationship Analysis
* Data Integrity Validation
* Performance Considerations

EXISTS and NOT EXISTS are essential SQL tools for enterprise reporting, data quality audits, exception reporting, and business intelligence solutions.

---

# Knowledge Check

### Question 1

What does EXISTS check?

A. Column Values

B. Row Existence

C. Data Types

D. Tables

---

### Question 2

What does NOT EXISTS return?

A. Matching Records

B. Missing Records

C. Duplicate Records

D. Sorted Records

---

### Question 3

Why is `SELECT 1` commonly used?

A. Faster Inserts

B. EXISTS ignores returned values

C. Required Syntax

D. Creates Indexes

---

### Question 4

Which is safer when NULL values may exist?

A. NOT IN

B. NOT EXISTS

---

### Question 5

Which operator is commonly used for data audits?

A. EXISTS / NOT EXISTS

B. TOP

C. ORDER BY

D. DISTINCT

---

# Next Lesson

➡️ 09-IN-vs-EXISTS.md

In the next lesson, you'll learn the differences between IN and EXISTS, performance considerations, optimization strategies, and when to use each approach in real-world SQL development.
