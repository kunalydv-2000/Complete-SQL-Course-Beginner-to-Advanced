# Exercise 08: Module Assessment Quiz

## Objective

Evaluate understanding of SQL Relationships and Joins.

---

# Part A: Multiple Choice (40 Points)

### Question 1

Which key uniquely identifies a record?

A. Foreign Key

B. Primary Key

C. Composite Key

D. Candidate Key

---

### Question 2

Which key creates relationships between tables?

A. Foreign Key

B. Primary Key

C. Unique Key

D. Identity Key

---

### Question 3

Which JOIN returns only matching rows?

A. LEFT JOIN

B. RIGHT JOIN

C. INNER JOIN

D. FULL OUTER JOIN

---

### Question 4

Which JOIN returns all rows from the left table?

A. INNER JOIN

B. LEFT JOIN

C. RIGHT JOIN

D. FULL OUTER JOIN

---

### Question 5

Which JOIN returns all rows from both tables?

A. INNER JOIN

B. LEFT JOIN

C. RIGHT JOIN

D. FULL OUTER JOIN

---

### Question 6

Which JOIN is used when a table joins itself?

A. LEFT JOIN

B. RIGHT JOIN

C. FULL OUTER JOIN

D. SELF JOIN

---

### Question 7

Which relationship type requires a junction table?

A. One-to-One

B. One-to-Many

C. Many-to-Many

D. Recursive

---

### Question 8

What is the junction table between Books and Authors?

A. BorrowRecords

B. Reservations

C. Publishers

D. BookAuthors

---

### Question 9

Which clause defines the join condition?

A. GROUP BY

B. ORDER BY

C. ON

D. WHERE

---

### Question 10

Which join is commonly used to find unmatched records?

A. INNER JOIN

B. LEFT JOIN

C. CROSS JOIN

D. SELF JOIN

---

# Part B: Query Writing (40 Points)

### Task 1

Write a query displaying:

```text id="p1m9w2"
Book Title
Category Name
```

---

### Task 2

Write a query displaying:

```text id="r6c3f8"
Book Title
Publisher Name
```

---

### Task 3

Write a query displaying:

```text id="n2v7s1"
Member Name
Book Title
Borrow Date
```

---

### Task 4

Write a query displaying:

```text id="j4k8h5"
Book Title
Author Name
```

---

### Task 5

Write a query displaying books that have never been borrowed.

---

# Part C: Business Challenge (20 Points)

Build reports for:

### Report 1

Most Borrowed Books

Output:

```text id="q5z2r7"
Book Title
Borrow Count
```

---

### Report 2

Most Active Members

Output:

```text id="x8u4m9"
Member Name
Borrow Count
```

---

### Report 3

Most Popular Categories

Output:

```text id="y1s6n3"
Category Name
Borrow Count
```

---

# Scoring Guide

| Section            | Points |
| ------------------ | ------ |
| Multiple Choice    | 40     |
| Query Writing      | 40     |
| Business Challenge | 20     |

**Total: 100 Points**

---

# Pass Criteria

| Score    | Result           |
| -------- | ---------------- |
| 90–100   | Excellent        |
| 80–89    | Very Good        |
| 70–79    | Good             |
| 60–69    | Satisfactory     |
| Below 60 | Review Module 05 |

---

# Module Completion Checklist

Upon completion, learners should be able to:

✅ Understand relationships

✅ Identify Primary Keys

✅ Identify Foreign Keys

✅ Use INNER JOIN

✅ Use LEFT JOIN

✅ Use RIGHT JOIN

✅ Use FULL OUTER JOIN

✅ Use SELF JOIN

✅ Build multi-table reports

✅ Create business dashboards

---

# Next Module

## Module 06: SQL Subqueries and Nested Queries

Topics include:

* Scalar Subqueries
* Multi-Row Subqueries
* Correlated Subqueries
* EXISTS
* NOT EXISTS
* IN vs EXISTS
* Advanced Query Logic
