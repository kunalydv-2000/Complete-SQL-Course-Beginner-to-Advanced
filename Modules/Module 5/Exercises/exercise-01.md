# Exercise 01: Database Relationships

## Objective

Understand and identify relationships between tables in a relational database.

---

# Database

```sql
USE LibraryManagementSystem;
GO
```

---

# Tasks

### Task 1

Identify the relationship between:

```text
Categories
Books
```

Expected Answer:

```text
One-to-Many
```

---

### Task 2

Identify the relationship between:

```text
Publishers
Books
```

Expected Answer:

```text
One-to-Many
```

---

### Task 3

Identify the relationship between:

```text
Members
BorrowRecords
```

Expected Answer:

```text
One-to-Many
```

---

### Task 4

Identify the relationship between:

```text
Books
Authors
```

Expected Answer:

```text
Many-to-Many
```

---

### Task 5

Which table acts as the junction table between Books and Authors?

Expected Answer:

```text
BookAuthors
```

---

# Diagram Exercise

Draw the following relationships:

```text
Categories → Books
Publishers → Books
Books → BorrowRecords
Books → Reservations
Books ↔ Authors
```

---

# Challenge

Create a relationship diagram for the entire LibraryManagementSystem database.

---

# Success Criteria

✅ Understands relationship types

✅ Identifies one-to-many relationships

✅ Identifies many-to-many relationships

✅ Understands junction tables
