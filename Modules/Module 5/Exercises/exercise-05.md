# Exercise 05: LEFT JOIN

## Objective

Practice using LEFT JOIN to identify missing or unmatched records.

---

# Database

```sql
USE LibraryManagementSystem;
GO
```

---

# Tasks

### Task 1

Display all books and any associated borrow records.

Output:

```text
Book Title
BorrowID
```

---

### Task 2

Display all books that have never been borrowed.

Expected Output:

```text
Book Title
```

---

### Task 3

Display all members and any associated borrow records.

Expected Output:

```text
Member Name
BorrowID
```

---

### Task 4

Display members who have never borrowed a book.

Expected Output:

```text
Member Name
Email
```

---

### Task 5

Display members who have never created a reservation.

Expected Output:

```text
Member Name
Email
```

---

### Task 6

Display all publishers and any books published by them.

Expected Output:

```text
Publisher Name
Book Title
```

---

# Challenge 1

Find categories with no books.

Expected Output:

```text
Category Name
```

---

# Challenge 2

Find publishers with no books.

Expected Output:

```text
Publisher Name
```

---

# Business Scenario

The Library Director wants to identify:

* Unused books
* Inactive members
* Empty categories
* Publishers without books

Use LEFT JOIN and NULL filtering to answer these questions.

---

# Success Criteria

✅ Uses LEFT JOIN correctly

✅ Uses IS NULL filtering

✅ Identifies unmatched records

✅ Produces business insights
