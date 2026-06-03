# Module 02: Creating and Populating Databases

> Learn how to create databases, define tables, choose appropriate data types, apply constraints, and manipulate data using SQL.

---

# 📖 Module Overview

In Module 01, you learned the theoretical foundations of relational databases, including tables, keys, relationships, normalization, and SQL fundamentals.

In this module, you'll move from theory to practice by building actual database structures and populating them with data.

You will learn how to:

* Create databases
* Create tables
* Define columns and data types
* Apply constraints
* Insert records
* Update records
* Delete records
* Build a complete relational database

This module forms the foundation for writing meaningful SQL queries in future modules.

---

# 🎯 Learning Objectives

After completing this module, you will be able to:

* Create databases using SQL
* Create and modify tables
* Select appropriate SQL data types
* Apply primary key and foreign key constraints
* Insert records into tables
* Update existing records
* Delete records safely
* Build a small relational database from scratch

---

# 🗺️ Module Roadmap

## Lesson 01: Introduction to Database Creation

Learn how databases are created and managed.

### Topics Covered

* Database lifecycle
* Creating databases
* Database naming conventions
* SQL Server database architecture

### Skills Gained

* Database creation
* Database management fundamentals

---

## Lesson 02: Working with SQL Data Types

Learn how data is stored in database tables.

### Topics Covered

* Numeric data types
* Character data types
* Date and time data types
* Boolean values
* Choosing appropriate data types

### Skills Gained

* Data modeling
* Data type selection

---

## Lesson 03: Creating Tables

Learn how to define database tables.

### Topics Covered

* CREATE TABLE statement
* Column definitions
* Table structure design
* Table naming conventions

### Skills Gained

* Table creation
* Schema design

---

## Lesson 04: Understanding Constraints

Learn how databases enforce data integrity.

### Topics Covered

* PRIMARY KEY
* FOREIGN KEY
* UNIQUE
* NOT NULL
* DEFAULT
* CHECK constraints

### Skills Gained

* Data validation
* Integrity enforcement

---

## Lesson 05: Inserting Data

Learn how to add records to tables.

### Topics Covered

* INSERT INTO statement
* Single-row inserts
* Multi-row inserts
* Handling NULL values

### Skills Gained

* Data population
* Record management

---

## Lesson 06: Updating Data

Learn how to modify existing records.

### Topics Covered

* UPDATE statement
* WHERE clause
* Safe update practices

### Skills Gained

* Data maintenance
* Data correction

---

## Lesson 07: Deleting Data

Learn how to remove records safely.

### Topics Covered

* DELETE statement
* WHERE clause
* Data removal best practices

### Skills Gained

* Record deletion
* Data cleanup

---

## Lesson 08: Building a Sample Database

Apply everything learned in this module.

### Topics Covered

* Database design implementation
* Table creation
* Constraint creation
* Data insertion

### Skills Gained

* End-to-end database development
* Practical SQL implementation

---

# 🏗️ Sample Project

Throughout this module, you'll build a complete:

## Library Management System

### Database Components

```text id="m2roadmap"
LibraryManagementSystem
│
├── Authors
├── Books
├── Members
├── BorrowRecords
├── Categories
├── Publishers
└── Reservations
```

---

# 📂 Module Structure

```text id="m2structure"
Module-02-Creating-and-Populating-Databases/
│
├── README.md
│
├── lessons/
│   ├── 01-Introduction-to-Database-Creation.md
│   ├── 02-Working-with-SQL-Data-Types.md
│   ├── 03-Creating-Tables.md
│   ├── 04-Understanding-Constraints.md
│   ├── 05-Inserting-Data.md
│   ├── 06-Updating-Data.md
│   ├── 07-Deleting-Data.md
│   └── 08-Building-a-Sample-Database.md
│
├── exercises/
├── solutions/
├── projects/
├── datasets/
├── scripts/
├── cheatsheets/
└── assets/
```

---

# 🛠 SQL Commands You'll Learn

## Database Creation

```sql id="m2sql1"
CREATE DATABASE LibraryManagementSystem;
```

---

## Table Creation

```sql id="m2sql2"
CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    FirstName VARCHAR(100)
);
```

---

## Data Insertion

```sql id="m2sql3"
INSERT INTO Members
VALUES (1, 'John');
```

---

## Data Update

```sql id="m2sql4"
UPDATE Members
SET FirstName = 'Johnny'
WHERE MemberID = 1;
```

---

## Data Deletion

```sql id="m2sql5"
DELETE FROM Members
WHERE MemberID = 1;
```

---

# 📊 Module Deliverables

By the end of this module, you will have created:

✅ A complete database

✅ Multiple relational tables

✅ Primary and foreign key relationships

✅ Sample datasets

✅ SQL scripts

✅ A Library Management System database project

---

# 📝 Exercises

The module includes hands-on exercises covering:

### Exercise 01

Database Creation

### Exercise 02

SQL Data Types

### Exercise 03

Table Creation

### Exercise 04

Constraints

### Exercise 05

Data Manipulation

### Exercise 06

Module Assessment Quiz

---

# 📚 Prerequisites

Before starting this module, you should understand:

* Databases
* Tables
* Rows and columns
* Primary keys
* Foreign keys
* Database relationships
* SQL fundamentals

These concepts were covered in Module 01.

---

# 🎓 Expected Outcome

After completing this module, you will be able to:

✅ Create databases from scratch

✅ Design relational tables

✅ Apply constraints correctly

✅ Populate databases with data

✅ Maintain data using SQL

✅ Build small real-world database systems

---

# 🚀 What's Next?

After completing Module 02, you'll move to:

# Module 03: Query Primer

Where you'll learn:

* SELECT
* FROM
* WHERE
* ORDER BY
* GROUP BY
* HAVING

and begin retrieving meaningful information from your databases.

---

# 🏁 Module Goal

By the end of Module 02, you should be comfortable creating and populating databases and ready to begin querying data like a professional SQL developer.
