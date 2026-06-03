# SQL Fundamentals Cheat Sheet

> Quick reference guide for Module 01: Database Fundamentals

---

# Database Fundamentals

## What is a Database?

A database is an organized collection of related data that can be stored, managed, and retrieved efficiently.

### Examples

| System     | Data Stored            |
| ---------- | ---------------------- |
| Banking    | Accounts, Transactions |
| E-Commerce | Products, Orders       |
| Hospital   | Patients, Appointments |
| School     | Students, Courses      |

---

# What is a DBMS?

A **Database Management System (DBMS)** is software used to create, manage, and interact with databases.

### Popular DBMS

| DBMS            | Type        |
| --------------- | ----------- |
| MySQL           | Open Source |
| PostgreSQL      | Open Source |
| SQL Server      | Commercial  |
| Oracle Database | Commercial  |

---

# Database Evolution

```text id="db001"
Paper Records
      ↓
File Systems
      ↓
Hierarchical Databases
      ↓
Network Databases
      ↓
Relational Databases
      ↓
Cloud Databases
```

---

# Relational Database Concepts

## Table

Stores related information.

Example:

| CustomerID | Name  |
| ---------- | ----- |
| 1          | John  |
| 2          | Sarah |

---

## Row

A single record in a table.

```text id="db002"
| 1 | John |
```

One row = One record

---

## Column

An attribute of an entity.

```text id="db003"
CustomerID
Name
Email
Phone
```

---

## Entity

A real-world object.

Examples:

* Customer
* Product
* Employee
* Order

---

## Attribute

A property of an entity.

Customer Attributes:

* CustomerID
* Name
* Email
* Phone

---

# Database Keys

## Primary Key (PK)

Uniquely identifies a record.

### Characteristics

✅ Unique

✅ Not NULL

✅ One per table

Example:

```text id="db004"
CustomerID
```

---

## Foreign Key (FK)

Creates relationships between tables.

Example:

```text id="db005"
Orders.CustomerID
```

References:

```text id="db006"
Customers.CustomerID
```

---

## Candidate Key

Any column capable of uniquely identifying a record.

Example:

```text id="db007"
EmployeeID
Email
```

---

## Alternate Key

Candidate key not selected as primary key.

Example:

```text id="db008"
Primary Key: EmployeeID

Alternate Key: Email
```

---

## Composite Key

Primary key composed of multiple columns.

Example:

```text id="db009"
(StudentID, CourseID)
```

---

## Surrogate Key

Artificially generated identifier.

Examples:

```text id="db010"
CustomerID
OrderID
ProductID
```

---

# Database Relationships

## One-to-One (1:1)

```text id="db011"
Person
   │
   ▼
Passport
```

---

## One-to-Many (1:N)

```text id="db012"
Customer
    │
    ├── Order
    ├── Order
    └── Order
```

---

## Many-to-Many (M:N)

```text id="db013"
Students
     ↔
Courses
```

Requires a bridge table.

---

# Referential Integrity

Foreign keys must reference valid records.

### Valid

```text id="db014"
CustomerID = 1
```

Exists in Customers table.

### Invalid

```text id="db015"
CustomerID = 999
```

Does not exist.

Violates referential integrity.

---

# Normalization

## Goal

Reduce data redundancy and improve consistency.

### Bad Design

| OrderID | CustomerName |
| ------- | ------------ |
| 101     | John         |
| 102     | John         |

---

### Better Design

Customers Table

| CustomerID | Name |
| ---------- | ---- |
| 1          | John |

Orders Table

| OrderID | CustomerID |
| ------- | ---------- |
| 101     | 1          |

---

# SQL Basics

## What is SQL?

**Structured Query Language**

Used to:

* Create databases
* Create tables
* Insert data
* Query data
* Update data
* Delete data

---

# SQL Categories

```text id="sql001"
SQL
│
├── DDL
├── DML
├── DQL
├── DCL
└── TCL
```

---

# DDL (Data Definition Language)

Used to define database structures.

| Command  | Purpose         |
| -------- | --------------- |
| CREATE   | Create Objects  |
| ALTER    | Modify Objects  |
| DROP     | Delete Objects  |
| TRUNCATE | Remove All Rows |

### Example

```sql
CREATE TABLE Customers (
    CustomerID INT,
    Name VARCHAR(100)
);
```

---

# DML (Data Manipulation Language)

Used to modify data.

| Command | Purpose     |
| ------- | ----------- |
| INSERT  | Add Data    |
| UPDATE  | Modify Data |
| DELETE  | Remove Data |

### Examples

```sql
INSERT INTO Customers
VALUES (1, 'John');
```

```sql
UPDATE Customers
SET Name = 'John Smith'
WHERE CustomerID = 1;
```

```sql
DELETE FROM Customers
WHERE CustomerID = 1;
```

---

# DQL (Data Query Language)

Used to retrieve data.

### Command

```sql
SELECT
```

Example:

```sql
SELECT *
FROM Customers;
```

---

# DCL (Data Control Language)

Used for security and permissions.

| Command | Purpose       |
| ------- | ------------- |
| GRANT   | Give Access   |
| REVOKE  | Remove Access |

Example:

```sql
GRANT SELECT
ON Customers
TO Analyst;
```

---

# TCL (Transaction Control Language)

Used to manage transactions.

| Command   | Purpose           |
| --------- | ----------------- |
| COMMIT    | Save Changes      |
| ROLLBACK  | Undo Changes      |
| SAVEPOINT | Create Checkpoint |

Examples:

```sql
COMMIT;
```

```sql
ROLLBACK;
```

---

# Core SQL Query Structure

```sql
SELECT column_name
FROM table_name
WHERE condition;
```

---

# Example Query

```sql
SELECT Name
FROM Customers
WHERE City = 'Delhi';
```

Meaning:

```text id="sql002"
Show customer names
for customers located in Delhi.
```

---

# Common SQL Keywords

| Keyword  | Purpose        |
| -------- | -------------- |
| SELECT   | Retrieve Data  |
| FROM     | Specify Table  |
| WHERE    | Filter Records |
| INSERT   | Add Records    |
| UPDATE   | Modify Records |
| DELETE   | Remove Records |
| CREATE   | Create Objects |
| ALTER    | Modify Objects |
| DROP     | Delete Objects |
| ORDER BY | Sort Results   |
| GROUP BY | Group Data     |

---

# MySQL Quick Facts

| Property       | Value       |
| -------------- | ----------- |
| Type           | RDBMS       |
| License        | Open Source |
| Owner          | Oracle      |
| First Release  | 1995        |
| Default Engine | InnoDB      |

---

# Popular MySQL Tools

| Tool            | Purpose            |
| --------------- | ------------------ |
| MySQL Workbench | GUI Tool           |
| MySQL CLI       | Command Line       |
| phpMyAdmin      | Web Administration |
| DBeaver         | Universal DB Tool  |

---

# SQL Learning Path

```text id="roadmap001"
Database Fundamentals
        ↓
Database Creation
        ↓
SELECT Queries
        ↓
Filtering
        ↓
Joins
        ↓
Functions
        ↓
Aggregations
        ↓
Subqueries
        ↓
Advanced SQL
```

---

# Module 01 Key Takeaways

✅ Understand databases

✅ Understand relational models

✅ Know tables, rows, and columns

✅ Understand primary and foreign keys

✅ Understand database relationships

✅ Understand normalization

✅ Know SQL basics

✅ Understand SQL statement categories

✅ Understand MySQL fundamentals

---

# Ready for Module 02?

Next topics:

* Creating Databases
* Data Types
* Creating Tables
* Inserting Records
* Updating Records
* Deleting Records
* Building Your First Database
