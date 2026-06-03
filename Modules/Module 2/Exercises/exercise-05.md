# Exercise 05: Data Manipulation

## Objective

Practice INSERT, UPDATE, and DELETE statements.

---

# Part A: Insert Data

Insert 5 students into a Students table.

Include:

* StudentID
* Name
* Email

---

# Part B: Insert Multiple Rows

Use a single INSERT statement to add:

```text
5 additional students
```

---

# Part C: Update Data

Update a student's email address.

Example:

```sql
UPDATE Students
SET Email = 'new@email.com'
WHERE StudentID = 1;
```

---

# Part D: Delete Data

Delete one student record.

---

# Part E: Verification

Run:

```sql
SELECT *
FROM Students;
```

Answer:

1. How many students remain?
2. Which record was updated?
3. Which record was deleted?

---

# Challenge

Create and populate a Books table with:

* 10 books

Perform:

* 2 updates
* 2 deletions

Document your results.
