# Exercise 06: RIGHT JOIN and FULL OUTER JOIN

## Objective

Practice using RIGHT JOIN and FULL OUTER JOIN to analyze matching and non-matching data.

---

# Database

```sql
USE LibraryManagementSystem;
GO
```

---

# Tasks

### Task 1

Using RIGHT JOIN, display:

```text
Publisher Name
Book Title
```

Include publishers even if they have no books.

---

### Task 2

Using RIGHT JOIN, display:

```text
Category Name
Book Title
```

Include categories even if they contain no books.

---

### Task 3

Using FULL OUTER JOIN, display:

```text
Book Title
BorrowID
```

Include all books and all borrow records.

---

### Task 4

Using FULL OUTER JOIN, display:

```text
Member Name
ReservationID
```

Include all members and all reservations.

---

### Task 5

Using FULL OUTER JOIN, display:

```text
Publisher Name
Book Title
```

Include:

```text
Publishers without books
Books without publishers
```

---

# Analysis Questions

### Question 1

What is the difference between:

```text
INNER JOIN
LEFT JOIN
RIGHT JOIN
FULL OUTER JOIN
```

---

### Question 2

When would FULL OUTER JOIN be useful in business reporting?

---

# Challenge

Create a reconciliation report showing:

```text
All Books
All Categories
Matched Records
Unmatched Records
```

using FULL OUTER JOIN.

---

# Business Scenario

A data quality audit is being performed.

Management wants to identify:

* Missing relationships
* Orphaned records
* Incomplete data

Use OUTER JOINs to perform the analysis.

---

# Success Criteria

✅ Uses RIGHT JOIN

✅ Uses FULL OUTER JOIN

✅ Identifies unmatched records

✅ Understands join differences
