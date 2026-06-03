# Lesson 02: Primary Keys and Foreign Keys

> Learn how Primary Keys and Foreign Keys uniquely identify records and create relationships between tables in a relational database.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand Primary Keys
* Understand Foreign Keys
* Identify Primary Keys in tables
* Identify Foreign Keys in tables
* Understand referential integrity
* Create table relationships
* Prepare for SQL JOIN operations

---

# Introduction

In the previous lesson, you learned that tables are connected through relationships.

Question:

```text
How does SQL know which book belongs to which category?

How does SQL know which member borrowed which book?

How does SQL know which author wrote which book?
```

The answer is:

```text
Primary Keys
Foreign Keys
```

These keys form the foundation of relational databases.

---

# What is a Primary Key?

A Primary Key (PK) is a column that uniquely identifies each record in a table.

Example:

Books Table

| BookID | Title                 |
| ------ | --------------------- |
| 1      | SQL Basics            |
| 2      | Power BI Fundamentals |
| 3      | Python Programming    |

---

Here:

```text
BookID
```

is the Primary Key.

Why?

Because every value is unique.

---

# Primary Key Rules

A Primary Key must:

✅ Be unique

✅ Not contain NULL values

✅ Identify one row only

✅ Exist once per table

---

# Example

```sql
CREATE TABLE Books
(
    BookID INT PRIMARY KEY,
    Title VARCHAR(100)
);
```

---

# Visualizing a Primary Key

```text
Books

BookID
──────
1
2
3
4
5
```

Every record has a unique identifier.

---

# Examples of Primary Keys

| Table         | Primary Key   |
| ------------- | ------------- |
| Categories    | CategoryID    |
| Publishers    | PublisherID   |
| Authors       | AuthorID      |
| Books         | BookID        |
| Members       | MemberID      |
| BorrowRecords | BorrowID      |
| Reservations  | ReservationID |

---

# Why Primary Keys Matter

Without Primary Keys:

```text
Duplicate Records

Data Confusion

Poor Data Integrity
```

Example:

| BookID | Title      |
| ------ | ---------- |
| 1      | SQL Basics |
| 1      | SQL Basics |

Which record is correct?

SQL cannot determine this reliably.

---

# What is a Foreign Key?

A Foreign Key (FK) is a column that references the Primary Key of another table.

It creates a relationship between tables.

---

Example:

Categories

| CategoryID | CategoryName |
| ---------- | ------------ |
| 1          | Technology   |
| 2          | Science      |

---

Books

| BookID | Title       | CategoryID |
| ------ | ----------- | ---------- |
| 1      | SQL Basics  | 1          |
| 2      | Physics 101 | 2          |

---

Books.CategoryID references Categories.CategoryID.

Therefore:

```text
CategoryID
```

in Books is a Foreign Key.

---

# Visualizing a Foreign Key

```text
Categories
-----------
CategoryID (PK)

      ▲
      │
      │

Books
-----------
CategoryID (FK)
```

---

# Foreign Key Example

```sql
CREATE TABLE Categories
(
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100)
);
```

---

```sql
CREATE TABLE Books
(
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),

    CategoryID INT,

    FOREIGN KEY (CategoryID)
        REFERENCES Categories(CategoryID)
);
```

---

# Relationship Created

```text
Categories
      │
      ▼
Books
```

One Category → Many Books

---

# Library Database Keys

---

## Categories

| Column     | Key Type    |
| ---------- | ----------- |
| CategoryID | Primary Key |

---

## Publishers

| Column      | Key Type    |
| ----------- | ----------- |
| PublisherID | Primary Key |

---

## Authors

| Column   | Key Type    |
| -------- | ----------- |
| AuthorID | Primary Key |

---

## Books

| Column      | Key Type    |
| ----------- | ----------- |
| BookID      | Primary Key |
| CategoryID  | Foreign Key |
| PublisherID | Foreign Key |

---

## Members

| Column   | Key Type    |
| -------- | ----------- |
| MemberID | Primary Key |

---

## BorrowRecords

| Column   | Key Type    |
| -------- | ----------- |
| BorrowID | Primary Key |
| MemberID | Foreign Key |
| BookID   | Foreign Key |

---

## Reservations

| Column        | Key Type    |
| ------------- | ----------- |
| ReservationID | Primary Key |
| MemberID      | Foreign Key |
| BookID        | Foreign Key |

---

# What is Referential Integrity?

Referential Integrity ensures that Foreign Keys reference valid records.

---

Valid Example

Categories

| CategoryID |
| ---------- |
| 1          |
| 2          |

Books

| Title      | CategoryID |
| ---------- | ---------- |
| SQL Basics | 1          |

---

This is valid because:

```text
CategoryID 1 exists.
```

---

Invalid Example

Books

| Title      | CategoryID |
| ---------- | ---------- |
| SQL Basics | 99         |

---

Problem:

```text
CategoryID 99 does not exist.
```

SQL prevents this.

---

# Parent and Child Tables

Example:

```text
Categories
      ↓
Books
```

---

Parent Table:

```text
Categories
```

Contains:

```text
Primary Key
```

---

Child Table:

```text
Books
```

Contains:

```text
Foreign Key
```

---

# Multiple Foreign Keys

A table can contain multiple Foreign Keys.

Example:

Books

| BookID | CategoryID | PublisherID |
| ------ | ---------- | ----------- |

---

Relationships:

```text
CategoryID
      ↓
Categories

PublisherID
      ↓
Publishers
```

---

# Many-to-Many Example

Books and Authors

```text
Books
   ↕
Authors
```

Cannot be connected directly.

Use:

```text
BookAuthors
```

---

BookAuthors Table

| BookID | AuthorID |
| ------ | -------- |
| 1      | 1        |
| 1      | 2        |
| 2      | 1        |

---

Foreign Keys:

```text
BookID
   ↓
Books

AuthorID
   ↓
Authors
```

---

# Querying Metadata

View table structure:

```sql
EXEC sp_help Books;
```

---

View keys:

```sql
EXEC sp_helpconstraint 'Books';
```

---

# Common Beginner Mistakes

---

## Using Duplicate Primary Keys

Bad:

```text
BookID
------
1
1
2
```

Primary Keys must be unique.

---

## Foreign Key Without Parent Record

Bad:

```text
CategoryID = 999
```

if Category 999 does not exist.

---

## Confusing PK and FK

Remember:

```text
PK → Identifies

FK → Connects
```

---

# Relationship Flow

```text
Categories
(CategoryID)
      │
      ▼
Books
(CategoryID)
```

---

# Hands-On Practice

Identify the Primary Key:

### Categories

Answer:

```text
CategoryID
```

---

### Books

Answer:

```text
BookID
```

---

Identify the Foreign Key:

### Books → Categories

Answer:

```text
CategoryID
```

---

### BorrowRecords → Members

Answer:

```text
MemberID
```

---

### BorrowRecords → Books

Answer:

```text
BookID
```

---

# Mini Exercise

### Task 1

Identify the Primary Key in Authors.

---

### Task 2

Identify the Primary Key in Publishers.

---

### Task 3

Identify the Foreign Key connecting Books and Publishers.

---

### Task 4

Identify the Foreign Key connecting Reservations and Members.

---

### Task 5

Explain referential integrity.

---

# Best Practices

✅ Every table should have a Primary Key

✅ Use integer-based IDs

✅ Create Foreign Keys for relationships

✅ Maintain referential integrity

✅ Use meaningful naming conventions

---

# Summary

In this lesson, you learned:

* Primary Keys
* Foreign Keys
* Referential Integrity
* Parent Tables
* Child Tables
* Relationship Creation
* Many-to-Many Relationships

Primary Keys identify records, while Foreign Keys connect tables and make relational databases possible.

---

# Knowledge Check

### Question 1

What does a Primary Key do?

A. Connect tables

B. Identify records uniquely

C. Sort records

D. Delete records

---

### Question 2

What does a Foreign Key do?

A. Identify records

B. Connect tables

C. Create indexes

D. Filter data

---

### Question 3

Can a table have multiple Foreign Keys?

A. Yes

B. No

---

### Question 4

Which table contains the Foreign Key?

```text
Categories
      ↓
Books
```

A. Categories

B. Books

---

### Question 5

What does referential integrity prevent?

A. Duplicate queries

B. Invalid relationships

C. Indexes

D. Views

---

# Next Lesson

➡️ 03-Introduction-to-INNER-JOIN.md

In the next lesson, you'll learn how to use INNER JOIN to combine data from related tables and retrieve meaningful business information.
