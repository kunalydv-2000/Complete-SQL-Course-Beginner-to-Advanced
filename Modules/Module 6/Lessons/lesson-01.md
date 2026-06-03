# Lesson 01: Introduction to Subqueries

> Learn what subqueries are, why they are important, and how nested queries help solve complex business problems.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand subqueries
* Understand nested queries
* Identify subquery components
* Understand query execution order
* Recognize business use cases
* Prepare for advanced SQL filtering

---

# Introduction

In previous modules, you learned how to retrieve data using:

```sql
SELECT
WHERE
GROUP BY
HAVING
ORDER BY
JOIN
```

These commands are powerful.

However, many business questions require SQL to calculate a result first and then use that result in another query.

Example:

```text
Find books priced above the average book price.

Find members who borrowed more books than average.

Find books in the most popular category.

Find authors who wrote the most books.
```

To solve these problems, SQL uses:

```text
Subqueries
```

---

# What is a Subquery?

A subquery is a query nested inside another SQL query.

General structure:

```sql
SELECT ...
FROM ...
WHERE Column =
(
    SELECT ...
    FROM ...
);
```

---

# Why Are Subqueries Useful?

Subqueries allow SQL to:

```text
Calculate values dynamically

Build advanced filters

Create analytical reports

Perform business comparisons

Reduce manual calculations
```

---

# Real-World Example

Question:

```text
Which books cost more than the average book price?
```

---

Step 1

Calculate average price.

```sql
SELECT AVG(BookPrice)
FROM Books;
```

Result:

```text
425.50
```

---

Step 2

Use that result.

```sql
SELECT *
FROM Books
WHERE BookPrice > 425.50;
```

---

Instead of manually typing the value, SQL can calculate it automatically.

```sql
SELECT *
FROM Books
WHERE BookPrice >
(
    SELECT AVG(BookPrice)
    FROM Books
);
```

This is a subquery.

---

# Components of a Subquery

Every subquery contains:

### Outer Query

```sql
SELECT *
FROM Books
WHERE BookPrice >
(
    ...
);
```

---

### Inner Query

```sql
SELECT AVG(BookPrice)
FROM Books
```

---

Visualization:

```text
Outer Query
     │
     ▼
Subquery
     │
     ▼
Result Returned
     │
     ▼
Final Output
```

---

# Query Execution Order

Important:

The subquery executes first.

Example:

```sql
SELECT *
FROM Books
WHERE BookPrice >
(
    SELECT AVG(BookPrice)
    FROM Books
);
```

Execution:

```text
Step 1:
AVG(BookPrice)

Step 2:
Return value

Step 3:
Outer query uses value

Step 4:
Final result returned
```

---

# Example Using the Library Database

Find books published after the average publication year.

```sql
SELECT *
FROM Books
WHERE PublicationYear >
(
    SELECT AVG(PublicationYear)
    FROM Books
);
```

---

# Types of Subqueries

There are several types.

---

## Scalar Subquery

Returns:

```text
One value
```

Example:

```sql
SELECT AVG(BookPrice)
FROM Books;
```

---

## Multi-Row Subquery

Returns:

```text
Many rows
```

Example:

```sql
SELECT CategoryID
FROM Categories;
```

---

## Correlated Subquery

Depends on:

```text
Outer query values
```

Example:

```sql
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

# Benefits of Subqueries

### Dynamic Calculations

No hard-coded values.

---

### Better Reporting

Useful for KPIs and dashboards.

---

### Easier Maintenance

Business rules stay inside SQL.

---

### Cleaner Logic

Complex filtering becomes manageable.

---

# Common Business Questions Solved with Subqueries

---

## Above Average Price

```sql
SELECT *
FROM Books
WHERE BookPrice >
(
    SELECT AVG(BookPrice)
    FROM Books
);
```

---

## Below Average Price

```sql
SELECT *
FROM Books
WHERE BookPrice <
(
    SELECT AVG(BookPrice)
    FROM Books
);
```

---

## Members With Reservations

```sql
SELECT *
FROM Members
WHERE MemberID IN
(
    SELECT MemberID
    FROM Reservations
);
```

---

## Books Never Borrowed

```sql
SELECT *
FROM Books
WHERE BookID NOT IN
(
    SELECT BookID
    FROM BorrowRecords
);
```

---

# Common Beginner Mistakes

---

## Expecting Outer Query First

Wrong assumption:

```text
Outer Query executes first.
```

Correct:

```text
Subquery executes first.
```

---

## Returning Multiple Rows Accidentally

Bad:

```sql
SELECT *
FROM Books
WHERE CategoryID =
(
    SELECT CategoryID
    FROM Categories
);
```

If multiple categories exist, SQL returns an error.

---

## Overusing Subqueries

Sometimes JOINs are simpler.

Choose the appropriate technique.

---

# Hands-On Practice

Run:

```sql
SELECT AVG(BookPrice)
FROM Books;
```

---

Run:

```sql
SELECT *
FROM Books
WHERE BookPrice >
(
    SELECT AVG(BookPrice)
    FROM Books
);
```

---

Run:

```sql
SELECT *
FROM Members
WHERE MemberID IN
(
    SELECT MemberID
    FROM Reservations
);
```

---

# Mini Exercise

### Task 1

Define a subquery.

---

### Task 2

Identify the outer query.

```sql
SELECT *
FROM Books
WHERE BookPrice >
(
    SELECT AVG(BookPrice)
    FROM Books
);
```

---

### Task 3

Identify the subquery.

---

### Task 4

Explain execution order.

---

### Task 5

List three business uses of subqueries.

---

# Best Practices

✅ Keep subqueries simple

✅ Format nested queries clearly

✅ Use aliases when needed

✅ Verify expected return values

✅ Understand execution order

---

# Summary

In this lesson, you learned:

* What a subquery is
* Query nesting
* Inner and outer queries
* Execution order
* Business applications
* Common mistakes

Subqueries are a foundational technique for advanced SQL analysis and reporting.

---

# Knowledge Check

### Question 1

What is a subquery?

A. A table

B. A query inside another query

C. A view

D. An index

---

### Question 2

Which executes first?

A. Outer Query

B. Subquery

---

### Question 3

Can a subquery return one value?

A. Yes

B. No

---

### Question 4

Can a subquery return multiple rows?

A. Yes

B. No

---

### Question 5

Why are subqueries useful?

A. Dynamic filtering

B. Analytics

C. Reporting

D. All of the Above

---

# Next Lesson

➡️ 02-Scalar-Subqueries.md

In the next lesson, you'll learn how scalar subqueries return a single value and are commonly used for comparisons, KPI calculations, and business reporting.
