# What is SQL?

> Learn the language that powers modern relational databases and enables users to store, retrieve, manipulate, and analyze data.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand what SQL is
* Learn the history of SQL
* Understand why SQL is important
* Identify the major SQL statement categories
* Understand how SQL interacts with databases
* Write your first SQL queries
* Recognize the role of SQL in modern data careers

---

# Introduction

Imagine a database containing millions of records.

How do we:

* Find customers from a specific city?
* Calculate total sales?
* Update employee salaries?
* Delete inactive accounts?

The answer is **SQL**.

SQL is the standard language used to communicate with relational databases.

Without SQL, working with databases would be extremely difficult.

---

# What is SQL?

SQL stands for:

**Structured Query Language**

It is the standard language used to:

* Create databases
* Create tables
* Insert data
* Retrieve data
* Update data
* Delete data
* Control access
* Manage transactions

---

# Simple Definition

> SQL is the language used to communicate with relational databases.

Think of SQL as the bridge between users and data.

---

# Why Was SQL Created?

Before SQL, interacting with databases required complex programming.

Users needed a simpler way to:

* Store information
* Retrieve information
* Analyze information

SQL solved this problem by providing a standard language for databases.

---

# History of SQL

The origins of SQL trace back to the relational model proposed by:

**Dr. Edgar F. Codd**

in 1970.

---

# Evolution Timeline

```text id="sqlt1"
1970
│
├─ Relational Model Proposed
│
1974
│
├─ SEQUEL Language Developed
│
1986
│
├─ ANSI SQL Standard
│
1992
│
├─ SQL-92 Standard
│
1999
│
├─ SQL:1999
│
2003+
│
└─ Modern SQL Standards
```

---

# Why SQL Became Popular

SQL succeeded because it is:

✅ Easy to learn

✅ Standardized

✅ Powerful

✅ Flexible

✅ Supported by all major databases

---

# Databases That Use SQL

Many popular databases support SQL.

| Database        | SQL Support |
| --------------- | ----------- |
| MySQL           | Yes         |
| PostgreSQL      | Yes         |
| SQL Server      | Yes         |
| Oracle Database | Yes         |
| IBM DB2         | Yes         |
| SQLite          | Yes         |

---

# What Can SQL Do?

SQL can perform four major tasks:

```text id="sqlt2"
Create Data Structures
        ↓
Store Data
        ↓
Retrieve Data
        ↓
Modify Data
```

---

# Example: Retrieving Data

Suppose we have a customer table.

| CustomerID | Name  |
| ---------- | ----- |
| 1          | John  |
| 2          | Sarah |

SQL Query:

```sql id="sql01"
SELECT *
FROM Customers;
```

Result:

| CustomerID | Name  |
| ---------- | ----- |
| 1          | John  |
| 2          | Sarah |

---

# Example: Inserting Data

SQL can add records.

```sql id="sql02"
INSERT INTO Customers
VALUES (3, 'David');
```

---

# Example: Updating Data

```sql id="sql03"
UPDATE Customers
SET Name = 'John Smith'
WHERE CustomerID = 1;
```

---

# Example: Deleting Data

```sql id="sql04"
DELETE FROM Customers
WHERE CustomerID = 3;
```

---

# SQL is a Declarative Language

Most programming languages are procedural.

Example:

```text id="sqlt3"
Step 1
Step 2
Step 3
Step 4
```

You tell the computer exactly how to do something.

---

# SQL Works Differently

With SQL:

You describe **what** you want.

The database decides **how** to retrieve it.

Example:

```sql id="sql05"
SELECT *
FROM Customers
WHERE City = 'Delhi';
```

You request the result.

The database engine determines the best execution method.

---

# SQL Components

SQL is divided into several categories.

```text id="sqlt4"
SQL
│
├── DDL
├── DML
├── DQL
├── DCL
└── TCL
```

We will explore these in detail in the next lesson.

---

# Understanding a SQL Query

Consider:

```sql id="sql06"
SELECT Name
FROM Customers
WHERE City = 'Mumbai';
```

---

# SELECT Clause

Specifies which columns to return.

```sql id="sql07"
SELECT Name
```

---

# FROM Clause

Specifies which table to query.

```sql id="sql08"
FROM Customers
```

---

# WHERE Clause

Filters records.

```sql id="sql09"
WHERE City = 'Mumbai'
```

---

# Putting It Together

```sql id="sql10"
SELECT Name
FROM Customers
WHERE City = 'Mumbai';
```

Meaning:

> Show customer names for customers who live in Mumbai.

---

# Real-World Applications of SQL

SQL is used everywhere.

---

# Banking

Examples:

* Account management
* Transactions
* Loan systems
* Fraud detection

---

# E-Commerce

Examples:

* Product management
* Order tracking
* Inventory control
* Customer analytics

---

# Healthcare

Examples:

* Patient records
* Appointments
* Billing systems

---

# Education

Examples:

* Student information
* Attendance
* Grades
* Course registration

---

# Social Media

Examples:

* User profiles
* Posts
* Comments
* Followers

---

# SQL and Data Careers

SQL is one of the most important skills in data-related jobs.

---

# Data Analyst

Uses SQL to:

* Extract data
* Build reports
* Analyze trends

---

# Business Analyst

Uses SQL to:

* Generate business insights
* Monitor KPIs
* Create dashboards

---

# Data Engineer

Uses SQL to:

* Build pipelines
* Transform data
* Manage databases

---

# Database Administrator (DBA)

Uses SQL to:

* Maintain databases
* Optimize performance
* Manage security

---

# Software Developer

Uses SQL to:

* Build applications
* Store user data
* Create backend systems

---

# Advantages of SQL

---

## Easy to Learn

SQL syntax is straightforward.

Example:

```sql id="sql11"
SELECT *
FROM Products;
```

---

## Standardized

Most databases use similar SQL syntax.

---

## Powerful

Can analyze millions of records efficiently.

---

## Flexible

Works with small and large databases.

---

## Widely Supported

Supported by virtually every relational database system.

---

# Common SQL Keywords

| Keyword  | Purpose        |
| -------- | -------------- |
| SELECT   | Retrieve data  |
| INSERT   | Add data       |
| UPDATE   | Modify data    |
| DELETE   | Remove data    |
| CREATE   | Create objects |
| ALTER    | Modify objects |
| DROP     | Delete objects |
| WHERE    | Filter data    |
| ORDER BY | Sort data      |
| GROUP BY | Aggregate data |

---

# SQL Example Walkthrough

### Products Table

| ProductID | ProductName | Price |
| --------- | ----------- | ----- |
| 1         | Laptop      | 800   |
| 2         | Mouse       | 20    |
| 3         | Keyboard    | 50    |

---

Query:

```sql id="sql12"
SELECT ProductName,
       Price
FROM Products
WHERE Price > 25;
```

---

Result:

| ProductName | Price |
| ----------- | ----- |
| Laptop      | 800   |
| Keyboard    | 50    |

---

# Summary

In this lesson, you learned:

* What SQL is
* Why SQL was created
* The history of SQL
* How SQL interacts with databases
* Common SQL operations
* SQL syntax fundamentals
* SQL's role in modern careers

SQL is the language that powers nearly every relational database system and is one of the most valuable technical skills in data and software careers.

---

# Knowledge Check

### Question 1

What does SQL stand for?

A. Structured Query Language

B. Standard Query Logic

C. Simple Query Language

D. Structured Quick Language

---

### Question 2

Which SQL statement retrieves data?

A. UPDATE

B. DELETE

C. SELECT

D. INSERT

---

### Question 3

SQL is primarily used with:

A. Relational Databases

B. Operating Systems

C. Web Browsers

D. Compilers

---

### Question 4

Which clause filters records?

A. SELECT

B. FROM

C. WHERE

D. GROUP BY

---

# Next Lesson

➡️ 06-SQL-Statement-Types.md

In the next lesson, you'll explore DDL, DML, DQL, TCL, and DCL statements and understand how SQL is organized into different functional categories.
