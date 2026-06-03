# Lesson 08: Many-to-Many Relationships

> Learn how many-to-many relationships work, why junction tables are required, and how to connect entities such as Books and Authors in relational databases.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand many-to-many relationships
* Understand junction tables
* Design many-to-many database structures
* Create bridge tables
* Analyze relationship mappings
* Query many-to-many data
* Build advanced relational reports

---

# Introduction

In previous lessons, you learned:

```text id="mm001"
One-to-One Relationships

One-to-Many Relationships

SELF JOIN Relationships
```

However, many real-world relationships are more complex.

Example:

```text id="mm002"
Books
   ↕
Authors
```

Questions:

```text id="mm003"
Can a book have multiple authors?

Can an author write multiple books?
```

Answer:

```text id="mm004"
Yes
```

This creates a:

```text id="mm005"
Many-to-Many Relationship
```

---

# What is a Many-to-Many Relationship?

A many-to-many relationship exists when:

```text id="mm006"
One record in Table A
can relate to many records in Table B

AND

One record in Table B
can relate to many records in Table A
```

---

# Example

Books

| BookID | Title              |
| ------ | ------------------ |
| 1      | SQL Fundamentals   |
| 2      | Power BI Analytics |

---

Authors

| AuthorID | AuthorName |
| -------- | ---------- |
| 1        | John Smith |
| 2        | Jane Brown |

---

Relationships:

```text id="mm007"
SQL Fundamentals
   ├─ John Smith
   └─ Jane Brown

John Smith
   ├─ SQL Fundamentals
   └─ Power BI Analytics
```

---

# Why Direct Relationships Don't Work

Bad Design:

```text id="mm008"
Books
   ↔
Authors
```

---

Problem:

```text id="mm009"
Multiple authors per book

Multiple books per author

Duplicate data
```

---

Example:

| BookID | Title            | Author     |
| ------ | ---------------- | ---------- |
| 1      | SQL Fundamentals | John Smith |
| 1      | SQL Fundamentals | Jane Brown |

---

Issues:

```text id="mm010"
Duplicate Book Records

Poor Data Integrity

Update Problems
```

---

# Solution: Junction Table

A junction table resolves many-to-many relationships.

---

# Library Example

```text id="mm011"
Books
   ↓
BookAuthors
   ↓
Authors
```

---

# Visual Diagram

```text id="mm012"
Books
(BookID)
    │
    ▼

BookAuthors
(BookID, AuthorID)

    ▲
    │

Authors
(AuthorID)
```

---

# BookAuthors Table

| BookID | AuthorID |
| ------ | -------- |
| 1      | 1        |
| 1      | 2        |
| 2      | 1        |

---

Meaning:

```text id="mm013"
Book 1 → Author 1

Book 1 → Author 2

Book 2 → Author 1
```

---

# Primary Key in Junction Tables

Junction tables often use:

```text id="mm014"
Composite Primary Key
```

---

Example:

```sql id="mm015"
CREATE TABLE BookAuthors
(
    BookID INT,
    AuthorID INT,

    PRIMARY KEY(BookID, AuthorID)
);
```

---

# Why Composite Keys?

Because:

```text id="mm016"
BookID alone is not unique

AuthorID alone is not unique

Together they are unique
```

---

# Foreign Keys in Junction Tables

```sql id="mm017"
CREATE TABLE BookAuthors
(
    BookID INT,
    AuthorID INT,

    PRIMARY KEY(BookID, AuthorID),

    FOREIGN KEY (BookID)
        REFERENCES Books(BookID),

    FOREIGN KEY (AuthorID)
        REFERENCES Authors(AuthorID)
);
```

---

# Relationship Flow

```text id="mm018"
Books
     ↓
BookAuthors
     ↓
Authors
```

---

# Querying Many-to-Many Relationships

Question:

```text id="mm019"
Which authors wrote which books?
```

---

Query:

```sql id="mm020"
SELECT
    B.Title,
    A.AuthorName
FROM Books B
INNER JOIN BookAuthors BA
    ON B.BookID = BA.BookID
INNER JOIN Authors A
    ON BA.AuthorID = A.AuthorID;
```

---

# Result

| Title              | Author     |
| ------------------ | ---------- |
| SQL Fundamentals   | John Smith |
| SQL Fundamentals   | Jane Brown |
| Power BI Analytics | John Smith |

---

# Understanding the Join

Step 1:

```text id="mm021"
Books
+
BookAuthors
```

↓

Step 2:

```text id="mm022"
Result
+
Authors
```

↓

Final Report

---

# Another Many-to-Many Example

Students and Courses

---

Students

| StudentID | StudentName |
| --------- | ----------- |
| 1         | Alice       |
| 2         | Bob         |

---

Courses

| CourseID | CourseName |
| -------- | ---------- |
| 1        | SQL        |
| 2        | Python     |

---

Relationship:

```text id="mm023"
Students
      ↓
Enrollments
      ↓
Courses
```

---

Enrollment Table

| StudentID | CourseID |
| --------- | -------- |
| 1         | 1        |
| 1         | 2        |
| 2         | 1        |

---

# Business Example

Question:

```text id="mm024"
Which books belong to which authors?
```

---

Query:

```sql id="mm025"
SELECT
    B.Title,
    A.AuthorName
FROM Books B
INNER JOIN BookAuthors BA
    ON B.BookID = BA.BookID
INNER JOIN Authors A
    ON BA.AuthorID = A.AuthorID
ORDER BY B.Title;
```

---

# Author Productivity Report

Question:

```text id="mm026"
How many books has each author written?
```

---

Query:

```sql id="mm027"
SELECT
    A.AuthorName,
    COUNT(*) AS TotalBooks
FROM Authors A
INNER JOIN BookAuthors BA
    ON A.AuthorID = BA.AuthorID
GROUP BY A.AuthorName;
```

---

# Book Collaboration Report

Question:

```text id="mm028"
How many authors contributed to each book?
```

---

Query:

```sql id="mm029"
SELECT
    B.Title,
    COUNT(*) AS AuthorCount
FROM Books B
INNER JOIN BookAuthors BA
    ON B.BookID = BA.BookID
GROUP BY B.Title;
```

---

# Common Beginner Mistakes

---

## Connecting Tables Directly

Bad:

```text id="mm030"
Books
   ↔
Authors
```

without a junction table.

---

Correct:

```text id="mm031"
Books
   ↓
BookAuthors
   ↓
Authors
```

---

## Missing Composite Primary Key

Bad:

```sql id="mm032"
CREATE TABLE BookAuthors
(
    BookID INT,
    AuthorID INT
);
```

---

Better:

```sql id="mm033"
PRIMARY KEY(BookID, AuthorID)
```

---

## Forgetting Foreign Keys

Always create:

```text id="mm034"
BookID → Books

AuthorID → Authors
```

---

# Hands-On Practice

Create:

```sql id="mm035"
CREATE TABLE BookAuthors
(
    BookID INT,
    AuthorID INT,

    PRIMARY KEY(BookID, AuthorID)
);
```

---

Insert Sample Data:

```sql id="mm036"
INSERT INTO BookAuthors
VALUES
(1,1),
(1,2),
(2,1);
```

---

Run:

```sql id="mm037"
SELECT
    B.Title,
    A.AuthorName
FROM Books B
INNER JOIN BookAuthors BA
    ON B.BookID = BA.BookID
INNER JOIN Authors A
    ON BA.AuthorID = A.AuthorID;
```

---

# Mini Exercise

### Task 1

Explain why Books and Authors form a many-to-many relationship.

---

### Task 2

Identify the junction table.

---

### Task 3

Create a BookAuthors table.

---

### Task 4

Display books with authors.

---

### Task 5

Count books written by each author.

---

# Best Practices

✅ Use junction tables

✅ Use composite primary keys

✅ Create foreign keys

✅ Avoid duplicate relationship records

✅ Use aliases in queries

---

# Summary

In this lesson, you learned:

* Many-to-Many Relationships
* Junction Tables
* Composite Primary Keys
* Relationship Mapping
* BookAuthors Structure
* Advanced JOIN Queries
* Reporting Across Multiple Relationships

Many-to-many relationships are essential in real-world databases and are commonly implemented using bridge or junction tables.

---

# Knowledge Check

### Question 1

What is a many-to-many relationship?

A. One record to one record

B. One record to many records

C. Many records to many records

D. No relationship

---

### Question 2

What table connects Books and Authors?

A. BorrowRecords

B. Reservations

C. Categories

D. BookAuthors

---

### Question 3

What type of key is commonly used in a junction table?

A. Foreign Key

B. Composite Primary Key

C. Unique Key

D. Identity Key

---

### Question 4

Can an author write multiple books?

A. Yes

B. No

---

### Question 5

Can a book have multiple authors?

A. Yes

B. No

---

# Next Lesson

➡️ 09-Business-Reports-with-Joins.md

In the next lesson, you'll combine everything learned so far to build real-world business reports, management dashboards, and analytical solutions using SQL JOINs.
