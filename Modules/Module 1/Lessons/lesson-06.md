# SQL Statement Types

> Learn how SQL is organized into different categories and understand the purpose of each type of SQL statement.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand the major SQL statement categories
* Differentiate between DDL, DML, DQL, DCL, and TCL
* Identify when each statement type should be used
* Understand how SQL commands interact with database objects and data
* Write basic examples of each SQL statement type

---

# Introduction

SQL contains many commands.

Some commands create database objects.

Some retrieve data.

Others modify records or manage transactions.

To make SQL easier to understand, commands are grouped into categories.

```text id="sqlcat1"
SQL
│
├── DDL
├── DML
├── DQL
├── DCL
└── TCL
```

Each category serves a different purpose.

---

# Overview of SQL Categories

| Category | Full Form                    | Purpose                 |
| -------- | ---------------------------- | ----------------------- |
| DDL      | Data Definition Language     | Define database objects |
| DML      | Data Manipulation Language   | Modify data             |
| DQL      | Data Query Language          | Retrieve data           |
| DCL      | Data Control Language        | Manage permissions      |
| TCL      | Transaction Control Language | Manage transactions     |

---

# Understanding SQL Workflow

A typical SQL workflow looks like:

```text id="sqlcat2"
Create Database Objects
          ↓
Insert Data
          ↓
Query Data
          ↓
Update Data
          ↓
Control Access
          ↓
Manage Transactions
```

---

# DDL (Data Definition Language)

DDL is used to define and manage database structures.

DDL affects database objects such as:

* Databases
* Tables
* Views
* Indexes
* Constraints

---

# Common DDL Commands

| Command  | Purpose         |
| -------- | --------------- |
| CREATE   | Create objects  |
| ALTER    | Modify objects  |
| DROP     | Remove objects  |
| TRUNCATE | Remove all rows |
| RENAME   | Rename objects  |

---

# CREATE Statement

Used to create database objects.

---

## Example

```sql id="ddl01"
CREATE TABLE Customers (
    CustomerID INT,
    Name VARCHAR(100)
);
```

This creates a table named Customers.

---

# ALTER Statement

Used to modify existing objects.

---

## Example

```sql id="ddl02"
ALTER TABLE Customers
ADD Email VARCHAR(100);
```

Adds a new column.

---

# DROP Statement

Deletes an object permanently.

---

## Example

```sql id="ddl03"
DROP TABLE Customers;
```

Deletes the entire table.

---

# TRUNCATE Statement

Removes all rows from a table.

---

## Example

```sql id="ddl04"
TRUNCATE TABLE Customers;
```

The table remains, but all data is removed.

---

# DDL Visualization

```text id="ddlflow"
CREATE
   ↓
ALTER
   ↓
TRUNCATE
   ↓
DROP
```

---

# DML (Data Manipulation Language)

DML is used to manipulate data stored in tables.

DML affects rows rather than table structures.

---

# Common DML Commands

| Command | Purpose        |
| ------- | -------------- |
| INSERT  | Add records    |
| UPDATE  | Modify records |
| DELETE  | Remove records |

---

# INSERT Statement

Adds new rows.

---

## Example

```sql id="dml01"
INSERT INTO Customers
VALUES (1, 'John');
```

---

# Table After Insert

| CustomerID | Name |
| ---------- | ---- |
| 1          | John |

---

# UPDATE Statement

Modifies existing rows.

---

## Example

```sql id="dml02"
UPDATE Customers
SET Name = 'John Smith'
WHERE CustomerID = 1;
```

---

# DELETE Statement

Removes rows.

---

## Example

```sql id="dml03"
DELETE FROM Customers
WHERE CustomerID = 1;
```

---

# Important Warning

Never use UPDATE or DELETE without a WHERE clause unless you intend to affect all records.

---

## Dangerous Example

```sql id="dml04"
DELETE FROM Customers;
```

This removes every row.

---

# DML Visualization

```text id="dmlflow"
INSERT
   ↓
UPDATE
   ↓
DELETE
```

---

# DQL (Data Query Language)

DQL is used to retrieve data.

The primary DQL command is:

```sql id="dql01"
SELECT
```

---

# Why DQL Matters

Most SQL work involves retrieving data.

Examples:

* Reports
* Dashboards
* Analytics
* Business Intelligence

---

# Example

```sql id="dql02"
SELECT *
FROM Customers;
```

Returns all records.

---

# Selecting Specific Columns

```sql id="dql03"
SELECT Name
FROM Customers;
```

Returns only the Name column.

---

# Filtering Data

```sql id="dql04"
SELECT *
FROM Customers
WHERE City = 'Delhi';
```

Returns only customers from Delhi.

---

# DQL Visualization

```text id="dqlflow"
Database
     ↓
SELECT
     ↓
Result Set
```

---

# DCL (Data Control Language)

DCL manages permissions and security.

Used mainly by database administrators.

---

# Common DCL Commands

| Command | Purpose            |
| ------- | ------------------ |
| GRANT   | Give permissions   |
| REVOKE  | Remove permissions |

---

# GRANT Statement

Provides access to users.

---

## Example

```sql id="dcl01"
GRANT SELECT
ON Customers
TO Analyst;
```

Allows Analyst to query data.

---

# REVOKE Statement

Removes permissions.

---

## Example

```sql id="dcl02"
REVOKE SELECT
ON Customers
FROM Analyst;
```

Removes access.

---

# Why DCL Matters

DCL helps organizations:

* Protect sensitive data
* Restrict access
* Maintain compliance
* Improve security

---

# TCL (Transaction Control Language)

TCL manages transactions.

---

# What is a Transaction?

A transaction is a group of operations treated as a single unit.

Example:

```text id="tcl1"
Withdraw Money
       ↓
Deposit Money
```

Both actions must succeed.

---

# Common TCL Commands

| Command   | Purpose           |
| --------- | ----------------- |
| COMMIT    | Save changes      |
| ROLLBACK  | Undo changes      |
| SAVEPOINT | Create checkpoint |

---

# COMMIT Statement

Permanently saves changes.

---

## Example

```sql id="tcl01"
COMMIT;
```

---

# ROLLBACK Statement

Undoes changes.

---

## Example

```sql id="tcl02"
ROLLBACK;
```

---

# SAVEPOINT Statement

Creates a checkpoint.

---

## Example

```sql id="tcl03"
SAVEPOINT BeforeUpdate;
```

Allows partial rollback.

---

# Transaction Example

Suppose a bank transfer:

```text id="tcl2"
Account A
Withdraw $500

      ↓

Account B
Deposit $500
```

If the deposit fails:

```sql id="tcl04"
ROLLBACK;
```

Prevents data inconsistency.

---

# Summary Table

| Category | Purpose             | Common Commands        |
| -------- | ------------------- | ---------------------- |
| DDL      | Define Structure    | CREATE, ALTER, DROP    |
| DML      | Modify Data         | INSERT, UPDATE, DELETE |
| DQL      | Retrieve Data       | SELECT                 |
| DCL      | Control Access      | GRANT, REVOKE          |
| TCL      | Manage Transactions | COMMIT, ROLLBACK       |

---

# Real-World Scenario

Imagine building an online shopping application.

---

## Step 1

Create tables.

```sql id="real01"
CREATE TABLE Products (...);
```

DDL

---

## Step 2

Insert products.

```sql id="real02"
INSERT INTO Products (...);
```

DML

---

## Step 3

Retrieve products.

```sql id="real03"
SELECT * FROM Products;
```

DQL

---

## Step 4

Grant analyst access.

```sql id="real04"
GRANT SELECT;
```

DCL

---

## Step 5

Save transactions.

```sql id="real05"
COMMIT;
```

TCL

---

# Summary

In this lesson, you learned:

* The five major SQL categories
* DDL for database structures
* DML for modifying data
* DQL for querying data
* DCL for security and permissions
* TCL for transaction management
* Real-world use cases for each category

Understanding these categories helps organize SQL commands and makes learning advanced SQL much easier.

---

# Knowledge Check

### Question 1

Which SQL category creates tables?

A. DML

B. DQL

C. DDL

D. TCL

---

### Question 2

Which command retrieves data?

A. UPDATE

B. INSERT

C. SELECT

D. DELETE

---

### Question 3

Which category manages permissions?

A. DCL

B. DML

C. DDL

D. TCL

---

### Question 4

Which command permanently saves changes?

A. DELETE

B. COMMIT

C. SELECT

D. REVOKE

---

# Next Lesson

➡️ 07-Introduction-to-MySQL.md

In the next lesson, you'll learn about MySQL, its architecture, installation options, tools, and why it remains one of the most popular relational database management systems in the world.
