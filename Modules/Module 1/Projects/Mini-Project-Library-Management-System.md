# Mini Project: Library Management System

> Apply the concepts learned in Module 01 by designing a relational database for a Library Management System.

---

# Project Overview

A library wants to digitize its operations.

Currently, information about books, members, and borrowing activities is stored manually.

Your task is to design a relational database structure that can support the library's daily operations.

This project focuses on:

* Entities
* Attributes
* Tables
* Primary Keys
* Foreign Keys
* Relationships
* Database Design

No SQL coding is required.

---

# Learning Outcomes

After completing this project, you will be able to:

* Identify real-world entities
* Design database tables
* Select primary keys
* Define foreign keys
* Build relationships
* Create an Entity Relationship Diagram (ERD)

---

# Business Requirements

The library wants to store:

### Books

Information about all books available.

### Members

Information about registered members.

### Borrowing Records

Information about which member borrowed which book.

### Authors

Information about book authors.

---

# Project Tasks

## Task 1: Identify Entities

Based on the requirements, identify the main entities.

Minimum entities:

```text id="proj01"
Books
Members
Authors
BorrowRecords
```

You may add additional entities if needed.

---

## Task 2: Define Attributes

For each entity, define appropriate attributes.

---

### Example

#### Books

| Attribute       |
| --------------- |
| BookID          |
| Title           |
| ISBN            |
| PublicationYear |

---

### Your Turn

Define attributes for:

* Members
* Authors
* BorrowRecords

Minimum 4 attributes per entity.

---

## Task 3: Identify Primary Keys

Determine the primary key for each table.

Example:

| Table   | Primary Key |
| ------- | ----------- |
| Books   | BookID      |
| Members | MemberID    |

Complete the remaining tables.

---

## Task 4: Identify Foreign Keys

Determine which tables require foreign keys.

Example:

```text id="proj02"
BorrowRecords.MemberID
```

References:

```text id="proj03"
Members.MemberID
```

Identify all foreign keys in your design.

---

## Task 5: Define Relationships

Identify the relationship type between entities.

---

### Books ↔ Authors

Relationship Type:

```text id="proj04"
Many-to-Many
```

---

### Members → BorrowRecords

Relationship Type:

```text id="proj05"
One-to-Many
```

---

### Books → BorrowRecords

Relationship Type:

```text id="proj06"
One-to-Many
```

---

Complete all relationships.

---

## Task 6: Create an ER Diagram

Draw a simple Entity Relationship Diagram.

Example structure:

```text id="proj07"
Members
    │
    ▼
BorrowRecords
    ▲
    │
Books
```

Expand the diagram to include Authors.

---

## Task 7: Normalize the Design

Review your design and answer:

### Questions

1. Is any data duplicated?
2. Can information be stored more efficiently?
3. Are relationships properly separated?
4. Are foreign keys correctly defined?

Document your findings.

---

# Deliverables

Submit:

### 1. Entity List

List all entities.

---

### 2. Table Designs

Include attributes for each table.

---

### 3. Primary Key List

Identify primary keys.

---

### 4. Foreign Key List

Identify foreign keys.

---

### 5. Relationship Diagram

Include ERD.

---

### 6. Normalization Review

Provide answers to Task 7.

---

# Bonus Challenge

Extend the database to support:

### Categories

Examples:

* Fiction
* Science
* Technology

---

### Publishers

Store publisher information.

---

### Reservations

Allow members to reserve books.

Add these entities to your design.

---

# Example Solution Structure

```text id="proj08"
Books
-----
BookID (PK)
Title
ISBN
AuthorID (FK)

Authors
-------
AuthorID (PK)
AuthorName

Members
-------
MemberID (PK)
MemberName
Email

BorrowRecords
-------------
BorrowID (PK)
MemberID (FK)
BookID (FK)
BorrowDate
ReturnDate
```

---

# Evaluation Rubric

| Criteria              | Points |
| --------------------- | ------ |
| Entity Identification | 20     |
| Table Design          | 20     |
| Primary Keys          | 15     |
| Foreign Keys          | 15     |
| Relationships         | 15     |
| ER Diagram            | 10     |
| Normalization Review  | 5      |

**Total: 100 Points**

---

# Success Criteria

To successfully complete this project, you should be able to:

✅ Identify entities and attributes

✅ Design relational tables

✅ Select appropriate primary keys

✅ Define foreign keys

✅ Build relationships between tables

✅ Create a basic ERD

✅ Apply normalization principles

---

# Project Completion

Congratulations!

You have completed your first database design project.

This project demonstrates the foundational skills required before writing SQL queries and building real databases in Module 02.
