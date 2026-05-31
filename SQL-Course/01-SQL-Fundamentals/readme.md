# Module 1: SQL Fundamentals

> The foundation of every SQL query, database operation, and data analytics project starts here.

---

# 📖 Introduction

SQL (Structured Query Language) is the standard language used to communicate with relational databases. It allows users to create, store, retrieve, modify, and manage data efficiently.

Whether you want to become a Data Analyst, Business Analyst, Data Engineer, Backend Developer, or Database Administrator, SQL is one of the most important technical skills to learn.

---

# 🎯 Learning Objectives

After completing this module, you will be able to:

- Understand what databases are
- Differentiate between DBMS and RDBMS
- Understand why SQL is used
- Learn SQL command categories
- Understand database terminology
- Write your first SQL query
- Understand how SQL fits into Data Analytics

---

# 📚 Table of Contents

1. What is Data?
2. What is a Database?
3. What is DBMS?
4. What is RDBMS?
5. What is SQL?
6. Why Learn SQL?
7. Database Terminology
8. SQL Command Categories
9. SQL Language Components
10. SQL Query Processing
11. SQL in Data Analytics
12. Real-World Applications
13. Summary
14. Practice Questions

---

# 1️⃣ What is Data?

Data refers to raw facts, observations, or information.

Examples:

| EmployeeID | Name | Salary |
|------------|---------|---------|
| 101 | Kunal | 45000 |
| 102 | Rahul | 50000 |
| 103 | Aman | 55000 |

In this table:

- 101, 102, 103 are data
- Names are data
- Salaries are data

---

# 2️⃣ What is a Database?

A database is an organized collection of related data stored electronically.

Think of a database as a digital filing cabinet.

Example:

A company stores:

- Employee Information
- Customer Information
- Sales Data
- Product Data

All these records together form a database.

---

## Without Database

Imagine storing employee information in:

- Notebooks
- Excel sheets
- Text files

Problems:

❌ Duplicate records

❌ Data inconsistency

❌ Difficult searching

❌ Security issues

❌ Slow updates

---

## With Database

Advantages:

✅ Fast searching

✅ Easy updates

✅ Security

✅ Backup support

✅ Data consistency

✅ Multi-user access

---

# 3️⃣ What is DBMS?

DBMS stands for Database Management System.

It is software that allows users to create and manage databases.

---

## Responsibilities of DBMS

A DBMS:

- Creates databases
- Stores data
- Retrieves data
- Updates data
- Deletes data
- Manages security
- Handles backups

---

## Examples of DBMS

- Microsoft SQL Server
- MySQL
- PostgreSQL
- Oracle Database
- SQLite

---

# 4️⃣ What is RDBMS?

RDBMS stands for Relational Database Management System.

An RDBMS stores data in the form of tables.

---

## Example

### Employees Table

| EmployeeID | Name |
|------------|---------|
| 101 | Kunal |
| 102 | Rahul |

### Departments Table

| DepartmentID | DepartmentName |
|--------------|----------------|
| 1 | HR |
| 2 | IT |

These tables can be connected using relationships.

---

## Key Features of RDBMS

### Tables

Data is stored in rows and columns.

### Relationships

Tables can be connected.

### Primary Keys

Uniquely identify records.

### Foreign Keys

Create relationships between tables.

---

# DBMS vs RDBMS

| Feature | DBMS | RDBMS |
|----------|------|--------|
| Data Storage | Files | Tables |
| Relationships | Limited | Strong |
| Normalization | Optional | Supported |
| Security | Basic | Advanced |
| Examples | File Systems | SQL Server |

---

# 5️⃣ What is SQL?

SQL stands for:

**Structured Query Language**

It is used to communicate with relational databases.

SQL helps us:

- Create tables
- Insert data
- Retrieve data
- Update data
- Delete data

---

## Example Query

```sql
SELECT * FROM Employees;
```

Meaning:

- SELECT → Retrieve data
- * → All columns
- FROM → Source table
- Employees → Table name
```

---

# Output

| EmployeeID | Name |
|------------|------|
| 101 | Kunal |
| 102 | Rahul |

---

# 6️⃣ Why Learn SQL?

SQL is one of the most demanded skills in:

- Data Analytics
- Business Intelligence
- Data Engineering
- Software Development
- Data Science

---

## Job Roles Using SQL

### Data Analyst

- Extract data
- Analyze trends
- Create reports

### Business Analyst

- Generate business insights

### Data Engineer

- Build data pipelines

### Database Administrator

- Manage databases

### Backend Developer

- Connect applications with databases

---

# 7️⃣ Important Database Terminology

---

## Database

Collection of related data.

Example:

```text
CompanyDB
```

---

## Table

Collection of rows and columns.

Example:

```text
Employees
```

---

## Row (Record)

Single entry in a table.

Example:

| EmployeeID | Name |
|------------|---------|
| 101 | Kunal |

This is one row.

---

## Column (Field)

Specific attribute.

Example:

| Name |
|--------|
| Kunal |
| Rahul |

Name is a column.

---

## Schema

Blueprint of a database.

Defines:

- Tables
- Columns
- Data Types
- Relationships

---

## Primary Key

Uniquely identifies a row.

Example:

| EmployeeID |
|------------|
| 101 |
| 102 |

Cannot:

❌ Repeat

❌ Be NULL

---

## Foreign Key

Creates relationship between tables.

Example:

Employee table stores:

```text
DepartmentID
```

which references

```text
Departments.DepartmentID
```

---

# 8️⃣ SQL Command Categories

SQL commands are divided into 5 categories.

---

# DDL (Data Definition Language)

Used to define database structure.

Commands:

```sql
CREATE
ALTER
DROP
TRUNCATE
```

---

## CREATE

Creates database objects.

```sql
CREATE TABLE Employees
(
 EmployeeID INT,
 Name VARCHAR(100)
);
```

---

## ALTER

Modifies table structure.

```sql
ALTER TABLE Employees
ADD Salary INT;
```

---

## DROP

Deletes object permanently.

```sql
DROP TABLE Employees;
```

---

## TRUNCATE

Deletes all rows.

```sql
TRUNCATE TABLE Employees;
```

---

# DML (Data Manipulation Language)

Used to manipulate data.

Commands:

```sql
INSERT
UPDATE
DELETE
```

---

## INSERT

Adds records.

```sql
INSERT INTO Employees
VALUES
(101,'Kunal');
```

---

## UPDATE

Modifies data.

```sql
UPDATE Employees
SET Name='Rahul'
WHERE EmployeeID=101;
```

---

## DELETE

Removes rows.

```sql
DELETE FROM Employees
WHERE EmployeeID=101;
```

---

# DQL (Data Query Language)

Used for data retrieval.

Command:

```sql
SELECT
```

Example:

```sql
SELECT *
FROM Employees;
```

---

# DCL (Data Control Language)

Controls permissions.

Commands:

```sql
GRANT
REVOKE
```

---

# TCL (Transaction Control Language)

Controls transactions.

Commands:

```sql
COMMIT
ROLLBACK
SAVEPOINT
```

---

# 9️⃣ SQL Query Processing Order

When SQL executes:

```sql
SELECT Name
FROM Employees
WHERE Salary > 50000;
```

Database processes:

```text
FROM
WHERE
SELECT
```

Actual execution order:

1. FROM
2. WHERE
3. SELECT

Understanding this is important for advanced SQL.

---

# 🔟 First SQL Query

```sql
SELECT *
FROM Employees;
```

Breakdown:

| Keyword | Meaning |
|----------|---------|
| SELECT | Retrieve data |
| * | All columns |
| FROM | Source table |
| Employees | Table name |

---

# 1️⃣1️⃣ SQL in Data Analytics

SQL is used daily for:

### Data Extraction

```sql
SELECT *
FROM Sales;
```

---

### Data Cleaning

```sql
UPDATE Customers
SET City='Delhi'
WHERE City='delhi';
```

---

### Data Aggregation

```sql
SELECT SUM(Sales)
FROM Orders;
```

---

### Reporting

```sql
SELECT Month,
       SUM(Revenue)
FROM Sales
GROUP BY Month;
```

---

# 1️⃣2️⃣ Real-World SQL Workflow

A Data Analyst typically:

### Step 1

Receive business question.

Example:

> Which products generated the highest revenue?

---

### Step 2

Write SQL query.

```sql
SELECT ProductName,
       SUM(Revenue)
FROM Sales
GROUP BY ProductName;
```

---

### Step 3

Analyze output.

---

### Step 4

Build dashboard using:

- Power BI
- Tableau
- Excel

---

# 📝 Summary

In this module, you learned:

✅ What data is

✅ What databases are

✅ What DBMS and RDBMS are

✅ What SQL is

✅ Why SQL is important

✅ Database terminology

✅ SQL command categories

✅ Query processing basics

✅ SQL applications in analytics

---

# 🧠 Practice Questions

### Theory

1. What is a database?
2. Difference between DBMS and RDBMS?
3. What is SQL?
4. What is a Primary Key?
5. What is a Foreign Key?
6. Explain DDL commands.
7. Explain DML commands.
8. Explain DCL commands.
9. Explain TCL commands.
10. Why is SQL important for Data Analysts?

---

### Practical

Create a table:

```sql
Students
```

with columns:

```text
StudentID
StudentName
Age
Course
```

Then:

1. Insert 5 records
2. Display all records
3. Update one record
4. Delete one record

---

# 🎯 Next Module

➡️ Module 2: Database Objects

Topics:

- Database
- Table
- Row
- Column
- Schema
- Keys
- Relationships
- Constraints Introduction