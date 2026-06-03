# Introduction to MySQL

> Learn about MySQL, one of the world's most popular relational database management systems, and understand why it is an excellent choice for learning SQL.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand what MySQL is
* Learn the history of MySQL
* Understand the role of a Database Management System (DBMS)
* Explore MySQL architecture
* Identify MySQL components
* Understand MySQL editions
* Learn common MySQL tools
* Understand why MySQL is widely used

---

# Introduction

Learning SQL requires a database system where SQL commands can be executed.

Throughout this course, we will use **MySQL** as our primary database platform.

MySQL is:

* Free
* Open Source
* Easy to Install
* Industry Standard
* Beginner Friendly

It is one of the most widely used relational database management systems in the world.

---

# What is MySQL?

MySQL is a **Relational Database Management System (RDBMS)**.

An RDBMS is software that:

* Stores data
* Organizes data into tables
* Manages relationships
* Executes SQL queries
* Maintains security and integrity

---

# MySQL at a Glance

| Feature       | Description           |
| ------------- | --------------------- |
| Type          | Relational Database   |
| License       | Open Source           |
| SQL Support   | Yes                   |
| Platform      | Windows, Linux, macOS |
| Owner         | Oracle Corporation    |
| First Release | 1995                  |

---

# What Does MySQL Do?

MySQL allows users to:

```text id="mysql1"
Create Databases
        ↓
Create Tables
        ↓
Insert Data
        ↓
Query Data
        ↓
Update Data
        ↓
Delete Data
```

All of these operations are performed using SQL.

---

# History of MySQL

MySQL was originally developed by:

* Michael Widenius
* David Axmark
* Allan Larsson

---

# Timeline

```text id="mysql2"
1995
│
├── MySQL Released
│
2008
│
├── Acquired by Sun Microsystems
│
2010
│
├── Sun Acquired by Oracle
│
│
Present
│
└── Maintained by Oracle Corporation
```

---

# Why MySQL Became Popular

MySQL gained popularity because it is:

✅ Free

✅ Fast

✅ Reliable

✅ Cross-platform

✅ Easy to learn

✅ Supported by large communities

---

# Understanding an RDBMS

MySQL is not the database itself.

It is the software that manages databases.

---

# Example

```text id="mysql3"
MySQL Server
       │
       ├── Sales Database
       ├── HR Database
       ├── Inventory Database
       └── Analytics Database
```

One MySQL server can host multiple databases.

---

# MySQL Architecture

At a high level:

```text id="mysql4"
Application
      │
      ▼
SQL Query
      │
      ▼
MySQL Server
      │
      ▼
Database Files
```

---

# Components of MySQL

---

# Client

The client sends SQL commands.

Examples:

* MySQL Workbench
* Command Line Client
* Applications

---

# Server

The MySQL Server:

* Processes SQL queries
* Manages data
* Enforces rules
* Returns results

---

# Storage Engine

The storage engine determines how data is stored.

---

## Common Storage Engines

| Engine  | Purpose         |
| ------- | --------------- |
| InnoDB  | Default Engine  |
| MyISAM  | Legacy Engine   |
| Memory  | Temporary Data  |
| Archive | Historical Data |

---

# InnoDB

Most modern MySQL databases use InnoDB.

Benefits:

✅ Transactions

✅ Foreign Keys

✅ Crash Recovery

✅ High Reliability

---

# Databases

A database contains related tables.

Example:

```text id="mysql5"
OnlineStore
│
├── Customers
├── Orders
├── Products
└── Payments
```

---

# Tables

Tables store actual information.

Example:

### Customers

| CustomerID | Name  |
| ---------- | ----- |
| 1          | John  |
| 2          | Sarah |

---

# Rows and Columns

Rows store records.

Columns store attributes.

---

## Example

| CustomerID | Name | City  |
| ---------- | ---- | ----- |
| 1          | John | Delhi |

---

# MySQL Editions

Several MySQL editions exist.

---

# Community Edition

Most popular edition.

Features:

* Free
* Open Source
* Ideal for learning

This course uses Community Edition concepts.

---

# Enterprise Edition

Commercial version.

Additional features:

* Advanced security
* Monitoring
* Backup tools

---

# Popular MySQL Tools

---

# MySQL Workbench

Official graphical interface.

Features:

* Query Editor
* Database Design
* Administration
* Data Modeling

---

# MySQL Command Line Client

Allows direct execution of SQL commands.

Example:

```sql id="mysqlsql1"
SELECT *
FROM customers;
```

---

# phpMyAdmin

Web-based MySQL administration tool.

Popular in web hosting environments.

---

# DBeaver

Universal database management tool.

Supports:

* MySQL
* PostgreSQL
* Oracle
* SQL Server

---

# MySQL Workbench Overview

```text id="mysql6"
MySQL Workbench
│
├── SQL Editor
├── Schema Browser
├── Query Results
├── Administration
└── Data Modeling
```

---

# Example SQL Query

Suppose we have a customer table.

### Customers

| CustomerID | Name  |
| ---------- | ----- |
| 1          | John  |
| 2          | Sarah |

---

Query:

```sql id="mysqlsql2"
SELECT *
FROM Customers;
```

Result:

| CustomerID | Name  |
| ---------- | ----- |
| 1          | John  |
| 2          | Sarah |

---

# Why Learn MySQL First?

MySQL is excellent for beginners because:

---

## Simple Installation

Can be installed within minutes.

---

## Large Community

Millions of users worldwide.

---

## Abundant Learning Resources

Thousands of tutorials, books, and courses.

---

## Industry Adoption

Used by startups and enterprises alike.

---

## SQL Standard Compliance

Learning MySQL helps you learn SQL concepts transferable to:

* PostgreSQL
* SQL Server
* Oracle
* MariaDB

---

# Companies Using MySQL

Many well-known companies use MySQL in various systems.

Examples include:

* Facebook
* YouTube
* Shopify
* Uber
* Airbnb
* Booking.com

---

# MySQL vs Other Databases

| Feature             | MySQL     | PostgreSQL | SQL Server | Oracle    |
| ------------------- | --------- | ---------- | ---------- | --------- |
| Open Source         | Yes       | Yes        | No         | No        |
| Easy to Learn       | High      | Medium     | Medium     | Medium    |
| Enterprise Features | Good      | Excellent  | Excellent  | Excellent |
| Popularity          | Very High | High       | High       | High      |

---

# Advantages of MySQL

✅ Free and Open Source

✅ Cross Platform

✅ Fast Performance

✅ Reliable

✅ Large Community

✅ Easy Administration

✅ Beginner Friendly

---

# Limitations of MySQL

Like any technology, MySQL has limitations.

* Some advanced features lag behind PostgreSQL
* Enterprise features may require commercial editions
* Very large enterprise workloads may prefer Oracle or SQL Server

For learning SQL, however, MySQL is an excellent choice.

---

# Real-World Example

Imagine an online shopping application.

---

## Database

```text id="mysql7"
OnlineStore
```

---

## Tables

```text id="mysql8"
Customers
Products
Orders
Payments
```

---

## Query

```sql id="mysqlsql3"
SELECT *
FROM Orders;
```

MySQL processes the query and returns the requested data.

---

# Summary

In this lesson, you learned:

* What MySQL is
* The history of MySQL
* What an RDBMS does
* MySQL architecture
* Storage engines
* MySQL tools
* Community vs Enterprise editions
* Why MySQL is popular
* How MySQL executes SQL queries

MySQL will be the database platform used throughout this course as you begin writing and executing SQL statements.

---

# Knowledge Check

### Question 1

What does RDBMS stand for?

A. Relational Data Building Management System

B. Relational Database Management System

C. Remote Database Management Service

D. Relational Data Modeling Structure

---

### Question 2

Which company currently owns MySQL?

A. Microsoft

B. IBM

C. Oracle

D. Google

---

### Question 3

What is MySQL Workbench?

A. Programming Language

B. Operating System

C. Graphical Database Tool

D. Storage Engine

---

### Question 4

Which is the default MySQL storage engine?

A. MyISAM

B. Memory

C. InnoDB

D. Archive

---

# Module 01 Completion

🎉 Congratulations!

You have completed **Module 01: Database Fundamentals**.

You now understand:

* Databases
* Database Evolution
* Relational Models
* Keys and Relationships
* SQL Fundamentals
* SQL Statement Types
* MySQL Basics

---

# Next Module

➡️ **Module 02: Creating and Populating Databases**

In the next module, you'll begin working with actual databases and learn how to:

* Create databases
* Create tables
* Choose data types
* Insert records
* Update data
* Delete records
* Build your first SQL database
