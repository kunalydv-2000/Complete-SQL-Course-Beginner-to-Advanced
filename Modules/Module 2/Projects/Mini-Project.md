# Project: Build a Library Management System Database

> Design, create, populate, and manage a complete Library Management System database using SQL Server.

---

# Project Overview

In this project, you will build a fully functional relational database for a Library Management System.

You will apply all concepts learned in Module 02:

* Create a database
* Create tables
* Select appropriate data types
* Apply constraints
* Create relationships
* Insert records
* Update records
* Delete records
* Verify data integrity

This project simulates a real-world database development task.

---

# Learning Outcomes

After completing this project, you will be able to:

* Create a complete SQL Server database
* Build relational tables
* Implement primary and foreign keys
* Populate tables with data
* Manage records using DML statements
* Validate database relationships
* Execute a complete database development workflow

---

# Business Scenario

A local library currently manages information using spreadsheets.

The library wants a centralized database system capable of managing:

* Books
* Authors
* Members
* Categories
* Publishers
* Borrowing Records
* Reservations

You have been hired as a database developer to build the solution.

---

# Project Requirements

## Database Name

```text
LibraryManagementSystem
```

---

# Required Tables

Create the following tables:

```text
Categories
Publishers
Authors
Books
BookAuthors
Members
BorrowRecords
Reservations
```

---

# Table Requirements

## Categories

| Column       | Data Type    |
| ------------ | ------------ |
| CategoryID   | INT IDENTITY |
| CategoryName | VARCHAR(100) |

Constraints:

* PRIMARY KEY
* UNIQUE CategoryName

---

## Publishers

| Column        | Data Type    |
| ------------- | ------------ |
| PublisherID   | INT IDENTITY |
| PublisherName | VARCHAR(150) |
| Country       | VARCHAR(100) |

Constraints:

* PRIMARY KEY

---

## Authors

| Column    | Data Type    |
| --------- | ------------ |
| AuthorID  | INT IDENTITY |
| FirstName | VARCHAR(100) |
| LastName  | VARCHAR(100) |
| BirthDate | DATE         |

Constraints:

* PRIMARY KEY
* NOT NULL names

---

## Books

| Column          | Data Type    |
| --------------- | ------------ |
| BookID          | INT IDENTITY |
| Title           | VARCHAR(255) |
| ISBN            | VARCHAR(20)  |
| PublicationYear | INT          |
| CategoryID      | INT          |
| PublisherID     | INT          |

Constraints:

* PRIMARY KEY
* UNIQUE ISBN
* FOREIGN KEY CategoryID
* FOREIGN KEY PublisherID

---

## BookAuthors

| Column   | Data Type |
| -------- | --------- |
| BookID   | INT       |
| AuthorID | INT       |

Constraints:

* Composite PRIMARY KEY
* Foreign Keys

---

## Members

| Column         | Data Type    |
| -------------- | ------------ |
| MemberID       | INT IDENTITY |
| FirstName      | VARCHAR(100) |
| LastName       | VARCHAR(100) |
| Email          | VARCHAR(255) |
| Phone          | VARCHAR(20)  |
| MembershipDate | DATE         |

Constraints:

* PRIMARY KEY
* UNIQUE Email
* DEFAULT MembershipDate

---

## BorrowRecords

| Column     | Data Type    |
| ---------- | ------------ |
| BorrowID   | INT IDENTITY |
| MemberID   | INT          |
| BookID     | INT          |
| BorrowDate | DATE         |
| DueDate    | DATE         |
| ReturnDate | DATE         |

Constraints:

* PRIMARY KEY
* Foreign Keys

---

## Reservations

| Column          | Data Type    |
| --------------- | ------------ |
| ReservationID   | INT IDENTITY |
| MemberID        | INT          |
| BookID          | INT          |
| ReservationDate | DATE         |
| Status          | VARCHAR(20)  |

Constraints:

* PRIMARY KEY
* DEFAULT Status = 'Pending'
* Foreign Keys

---

# Part 1: Create the Database

Create the database:

```sql
CREATE DATABASE LibraryManagementSystem;
GO

USE LibraryManagementSystem;
GO
```

---

# Part 2: Create Tables

Create all required tables.

Requirements:

✅ Correct data types

✅ Correct constraints

✅ Proper naming conventions

---

# Part 3: Populate Data

Insert:

### Categories

At least:

```text
Technology
Science
Business
History
Fiction
```

---

### Publishers

At least:

```text
5 Publishers
```

---

### Authors

At least:

```text
10 Authors
```

---

### Books

At least:

```text
20 Books
```

---

### Members

At least:

```text
15 Members
```

---

### Borrow Records

At least:

```text
20 Borrow Records
```

---

### Reservations

At least:

```text
10 Reservations
```

---

# Part 4: Update Data

Perform the following updates:

### Task 1

Update a member email address.

---

### Task 2

Update a book title.

---

### Task 3

Increase publication year for a selected book.

---

### Task 4

Change reservation status.

Example:

```text
Pending → Approved
```

---

# Part 5: Delete Data

Perform the following deletions:

### Task 1

Delete a reservation.

---

### Task 2

Delete a borrow record.

---

### Task 3

Delete a test member.

---

# Part 6: Verification Queries

Execute:

```sql
SELECT * FROM Categories;
SELECT * FROM Publishers;
SELECT * FROM Authors;
SELECT * FROM Books;
SELECT * FROM Members;
SELECT * FROM BorrowRecords;
SELECT * FROM Reservations;
```

Verify:

* Records exist
* Relationships work correctly
* Constraints are enforced

---

# Challenge Tasks

Complete the following enhancements.

---

## Challenge 1

Create a Reviews table.

```text
ReviewID
MemberID
BookID
Rating
Comments
ReviewDate
```

Requirements:

* Rating must be between 1 and 5

---

## Challenge 2

Create a Staff table.

```text
StaffID
FirstName
LastName
Position
HireDate
```

---

## Challenge 3

Create a Branches table.

```text
BranchID
BranchName
Location
```

---

# Deliverables

Submit:

### 1. Database Script

```text
LibraryManagementSystem.sql
```

Must include:

* Database creation
* Table creation
* Constraints

---

### 2. Data Population Script

```text
InsertData.sql
```

Must include:

* Sample data for all tables

---

### 3. Maintenance Script

```text
DataMaintenance.sql
```

Must include:

* UPDATE statements
* DELETE statements

---

### 4. Verification Script

```text
VerificationQueries.sql
```

Must include:

* SELECT statements

---

# Evaluation Rubric

| Criteria             | Points |
| -------------------- | ------ |
| Database Creation    | 10     |
| Table Design         | 20     |
| Data Types           | 10     |
| Constraints          | 20     |
| Data Insertion       | 15     |
| Data Updates         | 10     |
| Data Deletions       | 5      |
| Verification Queries | 5      |
| Code Quality         | 5      |

**Total: 100 Points**

---

# Success Criteria

To successfully complete this project, you should demonstrate the ability to:

✅ Create databases

✅ Create tables

✅ Use appropriate data types

✅ Apply constraints

✅ Insert records

✅ Update records

✅ Delete records

✅ Maintain relationships

✅ Verify database integrity

---

# Project Completion

Congratulations!

By completing this project, you have built your first complete SQL Server database application and demonstrated mastery of the core concepts covered in Module 02.

You are now ready to begin querying data in Module 03: Query Fundamentals.
