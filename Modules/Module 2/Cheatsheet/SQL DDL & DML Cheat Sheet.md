# SQL DDL & DML Cheat Sheet

> Quick Reference Guide for Module 02: Creating and Populating Databases

---

# Database Creation

## Create Database

```sql
CREATE DATABASE LibraryManagementSystem;
GO
```

---

## Use Database

```sql
USE LibraryManagementSystem;
GO
```

---

## View Databases

```sql
SELECT name
FROM sys.databases;
```

---

# SQL Data Types

## Numeric Data Types

| Data Type     | Description         | Example   |
| ------------- | ------------------- | --------- |
| INT           | Whole Numbers       | 100       |
| BIGINT        | Large Whole Numbers | 999999999 |
| SMALLINT      | Small Whole Numbers | 500       |
| DECIMAL(10,2) | Decimal Values      | 99.99     |

---

## Character Data Types

| Data Type  | Description          | Example |
| ---------- | -------------------- | ------- |
| CHAR(n)    | Fixed Length Text    | M       |
| VARCHAR(n) | Variable Length Text | John    |

---

## Date & Time Data Types

| Data Type | Description   | Example             |
| --------- | ------------- | ------------------- |
| DATE      | Date Only     | 2026-01-01          |
| TIME      | Time Only     | 10:30:00            |
| DATETIME  | Date and Time | 2026-01-01 10:30:00 |

---

## Logical Data Type

| Data Type | Description         |
| --------- | ------------------- |
| BIT       | 0 = False, 1 = True |

---

# CREATE TABLE

## Basic Syntax

```sql
CREATE TABLE TableName (
    ColumnName DataType
);
```

---

## Example

```sql
CREATE TABLE Students (
    StudentID INT,
    FirstName VARCHAR(100),
    LastName VARCHAR(100)
);
```

---

# Constraints

## PRIMARY KEY

Uniquely identifies each record.

```sql
StudentID INT PRIMARY KEY
```

---

## PRIMARY KEY with IDENTITY

```sql
StudentID INT IDENTITY(1,1) PRIMARY KEY
```

Automatically generates:

```text
1
2
3
4
...
```

---

## FOREIGN KEY

Creates relationships between tables.

```sql
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID)
```

---

## UNIQUE

Prevents duplicate values.

```sql
Email VARCHAR(255) UNIQUE
```

---

## NOT NULL

Prevents NULL values.

```sql
FirstName VARCHAR(100) NOT NULL
```

---

## DEFAULT

Provides automatic values.

```sql
RegistrationDate DATE
DEFAULT GETDATE()
```

---

## CHECK

Enforces business rules.

```sql
Age INT
CHECK (Age >= 18)
```

---

## Complete Example

```sql
CREATE TABLE Members (
    MemberID INT IDENTITY(1,1) PRIMARY KEY,

    FirstName VARCHAR(100) NOT NULL,

    LastName VARCHAR(100) NOT NULL,

    Email VARCHAR(255) UNIQUE,

    Age INT CHECK (Age >= 18),

    RegistrationDate DATE DEFAULT GETDATE()
);
```

---

# INSERT INTO

## Insert Single Row

```sql
INSERT INTO Students
VALUES
(1, 'John');
```

---

## Insert with Column Names

```sql
INSERT INTO Students
(
    StudentID,
    FirstName
)
VALUES
(
    1,
    'John'
);
```

---

## Insert Multiple Rows

```sql
INSERT INTO Students
VALUES
(1, 'John'),
(2, 'Sarah'),
(3, 'David');
```

---

## Insert NULL

```sql
INSERT INTO Members
(
    MemberID,
    Email
)
VALUES
(
    1,
    NULL
);
```

---

# UPDATE

## Basic Syntax

```sql
UPDATE TableName
SET ColumnName = Value
WHERE Condition;
```

---

## Update One Record

```sql
UPDATE Students
SET FirstName = 'Johnny'
WHERE StudentID = 1;
```

---

## Update Multiple Columns

```sql
UPDATE Members
SET
    FirstName = 'John',
    LastName = 'Smith',
    Email = 'john@email.com'
WHERE MemberID = 1;
```

---

## Increase Salary

```sql
UPDATE Employees
SET Salary = Salary + 5000;
```

---

## Percentage Increase

```sql
UPDATE Employees
SET Salary = Salary * 1.10;
```

---

# DELETE

## Basic Syntax

```sql
DELETE FROM TableName
WHERE Condition;
```

---

## Delete One Record

```sql
DELETE FROM Students
WHERE StudentID = 1;
```

---

## Delete Multiple Records

```sql
DELETE FROM Employees
WHERE DepartmentID = 3;
```

---

## Delete NULL Values

```sql
DELETE FROM Members
WHERE Email IS NULL;
```

---

# TRUNCATE TABLE

Removes all rows.

```sql
TRUNCATE TABLE Students;
```

### Characteristics

✅ Faster than DELETE

✅ Removes all rows

❌ Cannot use WHERE

---

# DROP TABLE

Removes table and data.

```sql
DROP TABLE Students;
```

---

# DELETE vs TRUNCATE vs DROP

| Command  | Removes Rows | Removes Table |
| -------- | ------------ | ------------- |
| DELETE   | Yes          | No            |
| TRUNCATE | Yes          | No            |
| DROP     | Yes          | Yes           |

---

# Useful SQL Server Functions

## Current Date & Time

```sql
GETDATE()
```

---

## Add Days

```sql
DATEADD(DAY, 14, GETDATE())
```

---

## Current Date Only

```sql
CAST(GETDATE() AS DATE)
```

---

# INFORMATION_SCHEMA Views

## View Tables

```sql
SELECT *
FROM INFORMATION_SCHEMA.TABLES;
```

---

## View Columns

```sql
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS;
```

---

## View Constraints

```sql
SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS;
```

---

# Library Management System Example

## Create Database

```sql
CREATE DATABASE LibraryManagementSystem;
GO

USE LibraryManagementSystem;
GO
```

---

## Create Members Table

```sql
CREATE TABLE Members (
    MemberID INT IDENTITY(1,1) PRIMARY KEY,

    FirstName VARCHAR(100) NOT NULL,

    LastName VARCHAR(100) NOT NULL,

    Email VARCHAR(255) UNIQUE,

    MembershipDate DATE DEFAULT GETDATE()
);
```

---

## Insert Member

```sql
INSERT INTO Members
(
    FirstName,
    LastName,
    Email
)
VALUES
(
    'John',
    'Smith',
    'john@email.com'
);
```

---

## Update Member

```sql
UPDATE Members
SET Email = 'johnsmith@email.com'
WHERE MemberID = 1;
```

---

## Delete Member

```sql
DELETE FROM Members
WHERE MemberID = 1;
```

---

# Safe SQL Workflow

```text
Create Database
       ↓
Create Tables
       ↓
Apply Constraints
       ↓
Insert Data
       ↓
Verify Data
       ↓
Update Data
       ↓
Verify Changes
       ↓
Delete Data
       ↓
Verify Results
```

---

# Common Mistakes

## UPDATE Without WHERE

Bad:

```sql
UPDATE Students
SET FirstName = 'Test';
```

Updates every row.

---

## DELETE Without WHERE

Bad:

```sql
DELETE FROM Students;
```

Deletes every row.

---

## Wrong Data Type

Bad:

```sql
Age VARCHAR(100)
```

Better:

```sql
Age INT
```

---

## Missing Primary Key

Bad:

```sql
CREATE TABLE Students (
    Name VARCHAR(100)
);
```

Better:

```sql
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100)
);
```

---

# Module 02 Key Takeaways

✅ Create databases

✅ Use SQL Server data types

✅ Create tables

✅ Apply constraints

✅ Insert records

✅ Update records

✅ Delete records

✅ Understand relationships

✅ Build complete relational databases

---

# Ready for Module 03?

Next topics:

```text
SELECT
FROM
WHERE
DISTINCT
TOP
ORDER BY
Aliases
```

You will begin retrieving and analyzing data using SQL queries.
