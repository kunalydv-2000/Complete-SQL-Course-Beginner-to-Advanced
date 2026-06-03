# Lesson 02: Scalar Subqueries

> Learn how scalar subqueries return a single value and are commonly used for comparisons, KPI calculations, dynamic filtering, and business analytics.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand Scalar Subqueries
* Identify single-value subqueries
* Use aggregate functions in subqueries
* Build dynamic filters
* Create KPI-based reports
* Compare records against calculated values
* Solve business analysis problems

---

# Introduction

In the previous lesson, you learned:

```text
Subqueries

Inner Queries

Outer Queries

Query Execution Order
```

One of the most common types of subqueries is:

```text
Scalar Subquery
```

---

# What is a Scalar Subquery?

A Scalar Subquery returns:

```text
Exactly One Value
```

Examples:

```text
Average Price

Maximum Price

Minimum Price

Total Books

Latest Publication Year
```

---

# Examples of Single Values

```sql
SELECT AVG(BookPrice)
FROM Books;
```

Result:

```text
425.50
```

---

```sql
SELECT COUNT(*)
FROM Books;
```

Result:

```text
150
```

---

```sql
SELECT MAX(BookPrice)
FROM Books;
```

Result:

```text
899.99
```

---

Each returns:

```text
One Value
```

Therefore they can be used as Scalar Subqueries.

---

# Basic Syntax

```sql
SELECT *
FROM TableName
WHERE ColumnName >
(
    SELECT AggregateFunction(ColumnName)
    FROM TableName
);
```

---

# Example 1: Books Above Average Price

Business Question:

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

Use subquery.

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

Execution:

```text
Calculate Average Price
          ↓
Return Single Value
          ↓
Compare Each Book Price
          ↓
Return Matching Books
```

---

# Example 2: Books Below Average Price

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

Business Insight:

```text
Budget-Friendly Books
```

---

# Example 3: Most Expensive Books

Business Question:

```text
Find books with the highest price.
```

---

```sql
SELECT *
FROM Books
WHERE BookPrice =
(
    SELECT MAX(BookPrice)
    FROM Books
);
```

---

# Example 4: Least Expensive Books

```sql
SELECT *
FROM Books
WHERE BookPrice =
(
    SELECT MIN(BookPrice)
    FROM Books
);
```

---

# Example 5: Newest Books

```sql
SELECT *
FROM Books
WHERE PublicationYear =
(
    SELECT MAX(PublicationYear)
    FROM Books
);
```

---

# Example 6: Oldest Books

```sql
SELECT *
FROM Books
WHERE PublicationYear =
(
    SELECT MIN(PublicationYear)
    FROM Books
);
```

---

# Using COUNT() in Scalar Subqueries

Question:

```text
Does the library contain more than 100 books?
```

---

```sql
SELECT
(
    SELECT COUNT(*)
    FROM Books
) AS TotalBooks;
```

---

Result:

```text
150
```

---

# Using SUM() in Scalar Subqueries

Question:

```text
What is the total inventory value?
```

---

```sql
SELECT
(
    SELECT SUM(BookPrice)
    FROM Books
) AS TotalInventoryValue;
```

---

# Using Scalar Subqueries in SELECT

Example:

```sql
SELECT
    Title,
    BookPrice,
    (
        SELECT AVG(BookPrice)
        FROM Books
    ) AS AveragePrice
FROM Books;
```

---

Result

| Title              | BookPrice | AveragePrice |
| ------------------ | --------- | ------------ |
| SQL Fundamentals   | 500       | 425.50       |
| Power BI Analytics | 600       | 425.50       |

---

Useful for dashboards.

---

# Business KPI Example

Question:

```text
Show each book and compare it against average price.
```

---

```sql
SELECT
    Title,
    BookPrice,
    (
        SELECT AVG(BookPrice)
        FROM Books
    ) AS AveragePrice
FROM Books;
```

---

# Example: Books Published After Average Year

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

# Example: Members Above Average Borrowing Activity

Step 1

Calculate average borrowing count.

---

Step 2

Compare member activity.

---

Example:

```sql
SELECT
    MemberID,
    COUNT(*) AS BorrowCount
FROM BorrowRecords
GROUP BY MemberID;
```

This concept becomes more powerful when combined with correlated subqueries later.

---

# Scalar Subquery Flow

```text
Subquery
   ↓
Returns One Value
   ↓
Outer Query Uses Value
   ↓
Final Result
```

---

# Common Aggregate Functions

| Function | Purpose |
| -------- | ------- |
| AVG()    | Average |
| COUNT()  | Count   |
| SUM()    | Total   |
| MAX()    | Highest |
| MIN()    | Lowest  |

---

# Real Business Examples

---

## Above Average Sales

```sql
SELECT *
FROM Sales
WHERE Amount >
(
    SELECT AVG(Amount)
    FROM Sales
);
```

---

## Highest Salary

```sql
SELECT *
FROM Employees
WHERE Salary =
(
    SELECT MAX(Salary)
    FROM Employees
);
```

---

## Latest Orders

```sql
SELECT *
FROM Orders
WHERE OrderDate =
(
    SELECT MAX(OrderDate)
    FROM Orders
);
```

---

# Common Beginner Mistakes

---

## Returning Multiple Rows

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

Problem:

```text
Multiple rows returned.
```

---

Scalar subqueries must return:

```text
One Value Only
```

---

## Using Wrong Operator

Bad:

```sql
WHERE BookPrice =
(
    SELECT AVG(BookPrice)
    FROM Books
);
```

Usually:

```sql
>
<
>=
<=
```

are more useful.

---

## Forgetting Parentheses

Bad:

```sql
WHERE BookPrice >
SELECT AVG(BookPrice)
FROM Books;
```

---

Correct:

```sql
WHERE BookPrice >
(
    SELECT AVG(BookPrice)
    FROM Books
);
```

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
FROM Books
WHERE BookPrice =
(
    SELECT MAX(BookPrice)
    FROM Books
);
```

---

Run:

```sql
SELECT *
FROM Books
WHERE PublicationYear =
(
    SELECT MAX(PublicationYear)
    FROM Books
);
```

---

# Mini Exercise

### Task 1

Find books priced above average.

---

### Task 2

Find books priced below average.

---

### Task 3

Find the most expensive book.

---

### Task 4

Find the newest published book.

---

### Task 5

Display the total number of books using a scalar subquery.

---

# Best Practices

✅ Ensure only one value is returned

✅ Use aggregate functions

✅ Format subqueries clearly

✅ Use meaningful aliases

✅ Test subqueries independently

---

# Summary

In this lesson, you learned:

* Scalar Subqueries
* Single-value results
* Aggregate functions
* Dynamic comparisons
* KPI calculations
* Business reporting

Scalar subqueries are one of the most frequently used SQL techniques for creating intelligent, dynamic, and maintainable business queries.

---

# Knowledge Check

### Question 1

What does a Scalar Subquery return?

A. Multiple Rows

B. One Value

C. Multiple Columns

D. Tables

---

### Question 2

Which function commonly produces a scalar value?

A. AVG()

B. MAX()

C. MIN()

D. All of the Above

---

### Question 3

Which query finds books above average price?

```sql
SELECT *
FROM Books
WHERE BookPrice >
(
    SELECT AVG(BookPrice)
    FROM Books
);
```

A. Correct

B. Incorrect

---

### Question 4

Can COUNT(*) be used in a scalar subquery?

A. Yes

B. No

---

### Question 5

What happens if a scalar subquery returns multiple rows?

A. Faster execution

B. Error

C. Table creation

D. Successful execution

---

# Next Lesson

➡️ 03-Multi-Row-Subqueries.md

In the next lesson, you'll learn how multi-row subqueries return multiple values and work with operators such as IN, ANY, ALL, and EXISTS.
