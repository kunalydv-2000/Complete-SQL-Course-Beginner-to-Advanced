# Lesson 04: Subqueries in WHERE Clause

> Learn how to use subqueries inside the WHERE clause to create dynamic filters, advanced business rules, and intelligent data retrieval logic.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Use subqueries in the WHERE clause
* Create dynamic filtering conditions
* Use scalar and multi-row subqueries in WHERE
* Build business-driven filtering logic
* Use IN and NOT IN effectively
* Prepare for correlated subqueries
* Solve real-world reporting problems

---

# Introduction

The most common location for a subquery is:

```sql
WHERE
```

The WHERE clause controls:

```text
Which rows are returned
```

Instead of hardcoding values, subqueries allow SQL to determine filter values dynamically.

---

# Traditional Filtering

Example:

```sql
SELECT *
FROM Books
WHERE BookPrice > 500;
```

Problem:

```text
500 is hardcoded.

If average prices change,
the query becomes outdated.
```

---

# Dynamic Filtering with Subqueries

```sql
SELECT *
FROM Books
WHERE BookPrice >
(
    SELECT AVG(BookPrice)
    FROM Books
);
```

Now SQL calculates the value automatically.

---

# How It Works

Step 1:

```sql
SELECT AVG(BookPrice)
FROM Books;
```

Returns:

```text
425.50
```

---

Step 2:

Outer query becomes:

```sql
SELECT *
FROM Books
WHERE BookPrice > 425.50;
```

---

Execution Flow

```text
Subquery Executes
        ↓
Returns Value(s)
        ↓
WHERE Uses Result
        ↓
Final Rows Returned
```

---

# Example 1: Above Average Book Price

Business Question:

```text
Which books are priced above average?
```

---

Query:

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

# Example 2: Below Average Book Price

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

# Example 4: Newest Books

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

# Multi-Row Subqueries in WHERE

Using:

```sql
IN
```

---

Business Question:

```text
Which members created reservations?
```

---

Query:

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

Execution

```text
Reservation Member IDs
        ↓
Returned by Subquery
        ↓
WHERE IN Filters Members
```

---

# Example 5: Members Without Reservations

```sql
SELECT *
FROM Members
WHERE MemberID NOT IN
(
    SELECT MemberID
    FROM Reservations
);
```

---

Business Value:

```text
Inactive Members
```

---

# Example 6: Books That Were Borrowed

```sql
SELECT *
FROM Books
WHERE BookID IN
(
    SELECT BookID
    FROM BorrowRecords
);
```

---

# Example 7: Books Never Borrowed

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

Business Value:

```text
Unused Inventory
```

---

# Combining WHERE Conditions

Subqueries can work with other conditions.

---

Example:

```sql
SELECT *
FROM Books
WHERE CategoryID IN
(
    SELECT CategoryID
    FROM Categories
)
AND BookPrice > 300;
```

---

Execution:

```text
Category Filter
        ↓
Price Filter
        ↓
Final Results
```

---

# Nested WHERE Subqueries

Subqueries can contain subqueries.

---

Example:

```sql
SELECT *
FROM Books
WHERE CategoryID IN
(
    SELECT CategoryID
    FROM Categories
    WHERE CategoryName IN
    (
        'Technology',
        'Programming'
    )
);
```

---

Execution:

```text
Inner Query
      ↓
Middle Query
      ↓
Outer Query
```

---

# Business Example: Active Members

Question:

```text
Which members borrowed books?
```

---

Query:

```sql
SELECT *
FROM Members
WHERE MemberID IN
(
    SELECT MemberID
    FROM BorrowRecords
);
```

---

# Business Example: Reserved Books

Question:

```text
Which books currently have reservations?
```

---

Query:

```sql
SELECT *
FROM Books
WHERE BookID IN
(
    SELECT BookID
    FROM Reservations
);
```

---

# Business Example: Categories With Borrow Activity

```sql
SELECT *
FROM Categories
WHERE CategoryID IN
(
    SELECT DISTINCT CategoryID
    FROM Books
    WHERE BookID IN
    (
        SELECT BookID
        FROM BorrowRecords
    )
);
```

---

# Operators Commonly Used

| Operator | Purpose               |
| -------- | --------------------- |
| =        | Single Value          |
| >        | Greater Than          |
| <        | Less Than             |
| >=       | Greater Than or Equal |
| <=       | Less Than or Equal    |
| IN       | Multiple Values       |
| NOT IN   | Excluded Values       |

---

# Query Execution Example

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
Step 1
AVG(BookPrice)

Step 2
Return Value

Step 3
Apply WHERE Condition

Step 4
Return Matching Books
```

---

# Common Beginner Mistakes

---

## Using = With Multiple Rows

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

---

Problem:

```text
Multiple Rows Returned
```

---

Use:

```sql
IN
```

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

## Ignoring NULL Values

Be careful when using:

```sql
NOT IN
```

NULL values may affect results.

---

# Hands-On Practice

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

Run:

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

# Mini Exercise

### Task 1

Find books priced above average.

---

### Task 2

Find books priced below average.

---

### Task 3

Find members with reservations.

---

### Task 4

Find books never borrowed.

---

### Task 5

Find members who never borrowed books.

---

# Best Practices

✅ Use WHERE subqueries for dynamic filtering

✅ Test subqueries separately

✅ Use IN for multiple values

✅ Use aggregate functions appropriately

✅ Format nested queries clearly

---

# Summary

In this lesson, you learned:

* Subqueries in WHERE
* Dynamic filtering
* Scalar filtering
* Multi-row filtering
* IN and NOT IN
* Business reporting filters
* Nested WHERE logic

The WHERE clause is the most common and practical place to use subqueries in real-world SQL development.

---

# Knowledge Check

### Question 1

Which clause most commonly uses subqueries?

A. SELECT

B. FROM

C. WHERE

D. ORDER BY

---

### Question 2

Which operator works with multi-row subqueries?

A. =

B. IN

C. LIKE

D. BETWEEN

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

What does NOT IN do?

A. Includes Values

B. Excludes Values

C. Sorts Values

D. Counts Values

---

### Question 5

What executes first?

A. WHERE Clause

B. Outer Query

C. Subquery

D. ORDER BY

---

# Next Lesson

➡️ 05-Subqueries-in-SELECT-Clause.md

In the next lesson, you'll learn how to place subqueries inside the SELECT clause to create calculated columns, KPIs, dashboard metrics, and executive reports.
