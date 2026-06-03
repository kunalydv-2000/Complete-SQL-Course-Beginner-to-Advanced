# Exercise 02: Primary Keys and Foreign Keys

## Objective

Practice identifying Primary Keys and Foreign Keys.

---

# Database

```sql
USE LibraryManagementSystem;
GO
```

---

# Tasks

### Task 1

Identify the Primary Key in:

```text
Books
```

Expected Answer:

```text
BookID
```

---

### Task 2

Identify the Primary Key in:

```text
Members
```

Expected Answer:

```text
MemberID
```

---

### Task 3

Identify the Foreign Key connecting Books and Categories.

Expected Answer:

```text
CategoryID
```

---

### Task 4

Identify the Foreign Key connecting Books and Publishers.

Expected Answer:

```text
PublisherID
```

---

### Task 5

Identify the Foreign Keys in BookAuthors.

Expected Answer:

```text
BookID
AuthorID
```

---

# Query Tasks

### Task 6

Display all books.

```sql
SELECT *
FROM Books;
```

Identify:

```text
Primary Key
Foreign Keys
```

---

### Task 7

Display all borrow records.

```sql
SELECT *
FROM BorrowRecords;
```

Identify:

```text
Primary Key
Foreign Keys
```

---

# Challenge

Create a table showing:

| Table | Primary Key | Foreign Keys |
| ----- | ----------- | ------------ |

For every table in the database.

---

# Success Criteria

✅ Identifies PKs

✅ Identifies FKs

✅ Understands referential integrity

✅ Understands table connections
