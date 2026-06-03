# Exercise 05: HAVING Clause

## Objective

Practice filtering grouped data using the HAVING clause and understand the difference between WHERE and HAVING.

---

# Database

```sql
USE LibraryManagementSystem;
GO
```

---

# Tasks

### Task 1

Display categories that contain more than 2 books.

Expected Output:

```text
CategoryID
TotalBooks
```

---

### Task 2

Display publishers that have published more than 2 books.

Expected Output:

```text
PublisherID
TotalBooks
```

---

### Task 3

Display publication years that contain more than 1 book.

Expected Output:

```text
PublicationYear
TotalBooks
```

---

### Task 4

Display members who have borrowed more than 1 book.

Expected Output:

```text
MemberID
BorrowCount
```

---

### Task 5

Display categories whose average book price exceeds 500.

Expected Output:

```text
CategoryID
AverageBookPrice
```

---

### Task 6

Display publishers whose total book value exceeds 2000.

Expected Output:

```text
PublisherID
TotalBookValue
```

---

# WHERE vs HAVING Challenge

Create a report that:

* Includes books published after 2015
* Groups by category
* Displays only categories containing more than 2 books

Expected Output:

```text
CategoryID
TotalBooks
```

---

# Business Scenario

The Library Director wants to identify:

* High-performing categories
* Major publishers
* Active members
* Valuable collections

Use HAVING to filter only meaningful business results.

---

# Success Criteria

✅ Uses HAVING correctly

✅ Uses aggregate functions in conditions

✅ Combines GROUP BY and HAVING

✅ Understands WHERE vs HAVING

✅ Produces filtered summary reports
