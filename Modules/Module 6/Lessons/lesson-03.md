# Lesson 03: Multi-Row Subqueries

> Learn how multi-row subqueries return multiple values and how operators such as IN, ANY, ALL, and EXISTS work with result sets.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand Multi-Row Subqueries
* Use the IN operator
* Use the ANY operator
* Use the ALL operator
* Work with multiple returned values
* Build dynamic filtering logic
* Solve real-world business problems

---

# Introduction

In the previous lesson, you learned about:

```text id="mrs001"
Scalar Subqueries
```

Scalar subqueries return:

```text id="mrs002"
One Value
```

Example:

```sql id="mrs003"
SELECT AVG(BookPrice)
FROM Books;
```

Result:

```text id="mrs004"
425.50
```

---

But many business questions require multiple values.

Example:

```text id="mrs005"
Find books belonging to selected categories.

Find members who made reservations.

Find books borrowed by active members.
```

These problems use:

```text id="mrs006"
Multi-Row Subqueries
```

---

# What is a Multi-Row Subquery?

A Multi-Row Subquery returns:

```text id="mrs007"
More Than One Row
```

Example:

```sql id="mrs008"
SELECT CategoryID
FROM Categories;
```

Result:

| CategoryID |
| ---------- |
| 1          |
| 2          |
| 3          |
| 4          |

---

Multiple rows are returned.

---

# Why Normal Operators Fail

Bad Example:

```sql id="mrs009"
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

```text id="mrs010"
Subquery returns multiple rows.

=
expects one value.
```

SQL Server Error:

```text id="mrs011"
Subquery returned more than 1 value.
```

---

# Solution: IN Operator

The IN operator works with multiple values.

---

# Syntax

```sql id="mrs012"
SELECT *
FROM TableName
WHERE ColumnName IN
(
    Subquery
);
```

---

# Example 1: Books by Categories

```sql id="mrs013"
SELECT *
FROM Books
WHERE CategoryID IN
(
    SELECT CategoryID
    FROM Categories
);
```

---

Execution:

```text id="mrs014"
Subquery Returns:

1
2
3
4

Outer Query:

WHERE CategoryID IN
(1,2,3,4)
```

---

# Example 2: Members With Reservations

Business Question:

```text id="mrs015"
Which members created reservations?
```

---

Query:

```sql id="mrs016"
SELECT *
FROM Members
WHERE MemberID IN
(
    SELECT MemberID
    FROM Reservations
);
```

---

Execution:

```text id="mrs017"
Reservation Members Returned

↓

Matching Members Retrieved
```

---

# Example 3: Books That Were Borrowed

```sql id="mrs018"
SELECT *
FROM Books
WHERE BookID IN
(
    SELECT BookID
    FROM BorrowRecords
);
```

---

Business Value:

```text id="mrs019"
Identify Active Books
```

---

# Example 4: Books Never Borrowed

Using NOT IN

```sql id="mrs020"
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

```text id="mrs021"
Identify Unused Inventory
```

---

# Understanding ANY

ANY compares a value against any value returned by the subquery.

---

# Syntax

```sql id="mrs022"
SELECT *
FROM TableName
WHERE Column > ANY
(
    Subquery
);
```

---

# Example

Find books more expensive than at least one book.

```sql id="mrs023"
SELECT *
FROM Books
WHERE BookPrice > ANY
(
    SELECT BookPrice
    FROM Books
);
```

---

Meaning:

```text id="mrs024"
Greater than at least one returned value.
```

---

# Understanding ALL

ALL compares against every value returned.

---

# Syntax

```sql id="mrs025"
SELECT *
FROM TableName
WHERE Column > ALL
(
    Subquery
);
```

---

# Example

```sql id="mrs026"
SELECT *
FROM Books
WHERE BookPrice > ALL
(
    SELECT BookPrice
    FROM Books
    WHERE CategoryID = 1
);
```

---

Meaning:

```text id="mrs027"
Greater than every returned value.
```

---

# IN vs ANY vs ALL

| Operator | Purpose                     |
| -------- | --------------------------- |
| IN       | Match Any Value             |
| ANY      | Compare Against Any Value   |
| ALL      | Compare Against Every Value |

---

# Business Example 1

Members Who Borrowed Books

```sql id="mrs028"
SELECT *
FROM Members
WHERE MemberID IN
(
    SELECT MemberID
    FROM BorrowRecords
);
```

---

# Business Example 2

Members Without Borrow Records

```sql id="mrs029"
SELECT *
FROM Members
WHERE MemberID NOT IN
(
    SELECT MemberID
    FROM BorrowRecords
);
```

---

# Business Example 3

Books in Reserved Categories

```sql id="mrs030"
SELECT *
FROM Books
WHERE CategoryID IN
(
    SELECT DISTINCT CategoryID
    FROM Books
    WHERE BookID IN
    (
        SELECT BookID
        FROM Reservations
    )
);
```

---

# Nested Multi-Row Subqueries

Subqueries can be nested.

Example:

```sql id="mrs031"
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

Execution Flow

```text id="mrs032"
Inner Query
     ↓
Returns Values
     ↓
Outer Query Uses Values
     ↓
Final Result
```

---

# Common Beginner Mistakes

---

## Using = Instead of IN

Bad:

```sql id="mrs033"
WHERE CategoryID =
(
    SELECT CategoryID
    FROM Categories
);
```

---

Correct:

```sql id="mrs034"
WHERE CategoryID IN
(
    SELECT CategoryID
    FROM Categories
);
```

---

## Forgetting NOT IN

Bad:

```text id="mrs035"
Trying to find missing records
using IN
```

---

Correct:

```sql id="mrs036"
NOT IN
```

---

## Returning NULL Values

Be careful:

```sql id="mrs037"
NOT IN
```

may behave unexpectedly if NULL values exist.

---

# Hands-On Practice

Run:

```sql id="mrs038"
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

```sql id="mrs039"
SELECT *
FROM Books
WHERE BookID IN
(
    SELECT BookID
    FROM BorrowRecords
);
```

---

Run:

```sql id="mrs040"
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

Find all members who created reservations.

---

### Task 2

Find all books that were borrowed.

---

### Task 3

Find all books never borrowed.

---

### Task 4

Find all members who never borrowed books.

---

### Task 5

Explain the difference between IN and NOT IN.

---

# Best Practices

✅ Use IN for multi-row results

✅ Use NOT IN carefully with NULL values

✅ Test subqueries independently

✅ Format nested queries clearly

✅ Use EXISTS for large datasets when appropriate

---

# Summary

In this lesson, you learned:

* Multi-Row Subqueries
* IN Operator
* NOT IN Operator
* ANY Operator
* ALL Operator
* Nested Subqueries
* Dynamic Filtering

Multi-row subqueries allow SQL to work with lists of values and are widely used in reporting, analytics, and business intelligence solutions.

---

# Knowledge Check

### Question 1

What does a Multi-Row Subquery return?

A. One Value

B. Multiple Values

C. One Column Only

D. One Table

---

### Question 2

Which operator is commonly used with Multi-Row Subqueries?

A. =

B. IN

C. LIKE

D. BETWEEN

---

### Question 3

Which operator finds records not returned by a subquery?

A. IN

B. ANY

C. NOT IN

D. ALL

---

### Question 4

What does ANY mean?

A. Compare with all values

B. Compare with at least one value

C. Compare with NULL

D. Compare with no values

---

### Question 5

What does ALL mean?

A. Compare with one value

B. Compare with every returned value

C. Compare with NULL

D. Compare with first value only

---

# Next Lesson

➡️ 04-Subqueries-in-WHERE-Clause.md

In the next lesson, you'll learn how subqueries are commonly used inside the WHERE clause to create dynamic filtering conditions and advanced business rules.
