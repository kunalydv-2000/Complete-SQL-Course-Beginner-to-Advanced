# Exercise 04: GROUP BY

## Objective

Practice grouping data and creating summary reports using the GROUP BY clause.

---

# Database

```sql
USE LibraryManagementSystem;
GO
```

---

# Tasks

### Task 1

Count books in each category.

Expected Output:

```text
CategoryID
TotalBooks
```

---

### Task 2

Count books published by each publisher.

Expected Output:

```text
PublisherID
TotalBooks
```

---

### Task 3

Count reservations by status.

Expected Output:

```text
Status
TotalReservations
```

---

### Task 4

Count borrow records by member.

Expected Output:

```text
MemberID
TotalBorrows
```

---

### Task 5

Count books published in each publication year.

Expected Output:

```text
PublicationYear
TotalBooks
```

---

### Task 6

Calculate average book price by category.

Expected Output:

```text
CategoryID
AverageBookPrice
```

---

### Task 7

Calculate total value of books by category.

Expected Output:

```text
CategoryID
TotalBookValue
```

---

### Challenge 1

Create a report showing:

```text
CategoryID
TotalBooks
OldestPublicationYear
NewestPublicationYear
```

---

### Challenge 2

Create a report showing:

```text
PublisherID
TotalBooks
AverageBookPrice
```

---

# Business Scenario

Library management wants to understand:

* Which categories contain the most books
* Which publishers contribute the most books
* Which members borrow most frequently
* Which publication years are most common

Build reports that help answer these questions.

---

# Success Criteria

✅ Uses GROUP BY correctly

✅ Uses aliases

✅ Uses aggregate functions with GROUP BY

✅ Creates meaningful business reports

✅ Results are sorted where appropriate
