# Exercise 04: Multiple Table Joins

## Objective

Practice combining data from three or more related tables using multiple INNER JOIN statements.

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
Publisher Name
```

Tables:

```text
Books
Categories
Publishers
```

---

### Task 2

Display:

```text
Book Title
Author Name
Category Name
```

Tables:

```text
Books
BookAuthors
Authors
Categories
```

---

### Task 3

Display:

```text
Member Name
Book Title
Borrow Date
Category Name
```

Tables:

```text
Members
BorrowRecords
Books
Categories
```

---

### Task 4

Display:

```text
Member Name
Book Title
Reservation Date
Publisher Name
```

Tables:

```text
Members
Reservations
Books
Publishers
```

---

### Task 5

Display:

```text
Book Title
Author Name
Category Name
Publisher Name
```

Tables:

```text
Books
Authors
BookAuthors
Categories
Publishers
```

---

# Challenge 1

Create a complete inventory report containing:

```text
BookID
Title
Author
Category
Publisher
Publication Year
Book Price
```

---

# Challenge 2

Create a borrowing report containing:

```text
Member Name
Book Title
Author Name
Borrow Date
Due Date
```

---

# Business Scenario

Management wants a single report showing all information about books, authors, categories, and publishers without opening multiple tables.

Build the required reports.

---

# Success Criteria

✅ Uses 3+ table joins

✅ Uses aliases consistently

✅ Produces readable output

✅ Uses proper join conditions
