# Exercise 03: INNER JOIN

## Objective

Practice combining related tables using INNER JOIN.

---

# Database

```sql
USE LibraryManagementSystem;
GO
```

---

# Tasks

### Task 1

Display:

```text
Book Title
Category Name
```

Tables:

```text
Books
Categories
```

---

### Task 2

Display:

```text
Book Title
Publisher Name
```

Tables:

```text
Books
Publishers
```

---

### Task 3

Display:

```text
Member Name
Book Title
Borrow Date
```

Tables:

```text
Members
BorrowRecords
Books
```

---

### Task 4

Display:

```text
Member Name
Book Title
Reservation Date
```

Tables:

```text
Members
Reservations
Books
```

---

### Task 5

Display:

```text
Book Title
Author Name
```

Tables:

```text
Books
BookAuthors
Authors
```

---

# Challenge 1

Display:

```text
Book Title
Category Name
Publisher Name
```

using a single query.

---

# Challenge 2

Display:

```text
Book Title
Author Name
Publisher Name
```

using multiple INNER JOINs.

---

# Business Scenario

The Library Director wants a catalog showing complete book information including category, publisher, and author details.

Build the required reports using INNER JOIN.

---

# Success Criteria

✅ Uses INNER JOIN correctly

✅ Uses aliases

✅ Joins related tables

✅ Produces accurate results
