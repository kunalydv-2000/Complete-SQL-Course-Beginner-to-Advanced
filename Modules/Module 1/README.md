# Module 01: Database Fundamentals

> Build a strong foundation in databases, relational concepts, and SQL before writing your first query.

---

# 📖 Module Overview

Databases are the backbone of modern applications. Every business system, website, mobile application, and analytics platform relies on databases to store and manage information.

In this module, you'll learn:

* What databases are
* Why databases exist
* How relational databases work
* Core database terminology
* The history and evolution of SQL
* How SQL interacts with relational databases
* Introduction to MySQL

By the end of this module, you will understand the concepts behind SQL and be prepared to start creating and querying databases.

---

# 🎯 Learning Objectives

After completing this module, you will be able to:

* Explain the purpose of a database
* Differentiate between relational and non-relational structures
* Understand tables, rows, and columns
* Identify primary and foreign keys
* Explain relationships between tables
* Describe the role of SQL
* Understand SQL statement categories
* Explain why MySQL is widely used

---

# 📚 Lesson 1: Introduction to Databases

## What is a Database?

A database is an organized collection of related information that can be stored, managed, and retrieved efficiently.

### Examples

| Database         | Information Stored                |
| ---------------- | --------------------------------- |
| Banking System   | Accounts, Transactions, Customers |
| E-Commerce Store | Products, Orders, Customers       |
| Hospital System  | Patients, Doctors, Appointments   |
| School System    | Students, Courses, Grades         |

---

## Why Do We Need Databases?

Without databases:

* Data becomes difficult to manage
* Information becomes inconsistent
* Searching is slow
* Reporting becomes complex

Databases provide:

✅ Fast retrieval

✅ Data consistency

✅ Security

✅ Scalability

✅ Concurrent access

---

## Traditional Data Storage vs Databases

| Traditional Storage | Database System   |
| ------------------- | ----------------- |
| Paper Records       | Digital Storage   |
| Manual Search       | Instant Search    |
| High Error Rate     | Controlled Data   |
| Difficult Updates   | Easy Updates      |
| Limited Access      | Multi-user Access |

---

# 📚 Lesson 2: Evolution of Database Systems

## Hierarchical Databases

Data is organized like a tree structure.

```text
Customer
 ├── Account
 │    ├── Transaction
 │    └── Transaction
```

### Characteristics

* Parent-child relationship
* One parent per child
* Fast navigation
* Difficult to maintain

---

## Network Databases

Data is connected using links.

```text
Customer ←→ Account ←→ Product
          ↑
          ↓
     Transaction
```

### Characteristics

* Multiple relationships
* More flexible than hierarchical databases
* Complex navigation

---

## Relational Databases

Modern database systems use the relational model.

Data is stored in tables.

### Benefits

* Easy to understand
* Easy to maintain
* Scalable
* Standardized using SQL

Examples:

* MySQL
* PostgreSQL
* SQL Server
* Oracle Database

---

# 📚 Lesson 3: Understanding the Relational Model

The relational model organizes data into tables.

---

## Table

A table stores information about a specific entity.

### Customer Table

| CustomerID | FirstName | LastName |
| ---------- | --------- | -------- |
| 1          | John      | Smith    |
| 2          | Sarah     | Wilson   |

---

## Column

A column represents a specific attribute.

Examples:

* CustomerID
* FirstName
* LastName
* Email

---

## Row

A row represents a single record.

Example:

| CustomerID | FirstName | LastName |
| ---------- | --------- | -------- |
| 1          | John      | Smith    |

This row represents one customer.

---

# 📚 Lesson 4: Keys in Databases

## Primary Key

A primary key uniquely identifies each record in a table.

### Example

| CustomerID | Name  |
| ---------- | ----- |
| 1          | John  |
| 2          | Sarah |

CustomerID is the primary key.

### Characteristics

* Unique
* Cannot be NULL
* One primary key per table

---

## Foreign Key

A foreign key connects one table to another.

### Customers Table

| CustomerID | Name  |
| ---------- | ----- |
| 1          | John  |
| 2          | Sarah |

### Orders Table

| OrderID | CustomerID |
| ------- | ---------- |
| 101     | 1          |
| 102     | 2          |

CustomerID in the Orders table is a foreign key.

---

## Why Keys Matter

Keys help:

* Maintain relationships
* Prevent duplicate records
* Improve data integrity
* Support joins

---

# 📚 Lesson 5: Database Relationships

## One-to-One (1:1)

```text
Person → Passport
```

One person can have one passport.

---

## One-to-Many (1:N)

```text
Customer → Orders
```

One customer can place many orders.

---

## Many-to-Many (M:N)

```text
Students ↔ Courses
```

A student can enroll in many courses.

A course can have many students.

---

# 📚 Lesson 6: What is SQL?

SQL stands for Structured Query Language.

SQL is used to:

* Create databases
* Create tables
* Insert data
* Retrieve data
* Update data
* Delete data

---

## Example Query

```sql
SELECT first_name,
       last_name
FROM customers;
```

This query retrieves customer names.

---

# 📚 Lesson 7: SQL Statement Categories

## DDL (Data Definition Language)

Used to define database objects.

Examples:

```sql
CREATE TABLE customers (
    customer_id INT
);
```

```sql
ALTER TABLE customers;
```

```sql
DROP TABLE customers;
```

---

## DML (Data Manipulation Language)

Used to manage data.

Examples:

```sql
INSERT INTO customers
VALUES (1, 'John');
```

```sql
UPDATE customers
SET name = 'Sarah';
```

```sql
DELETE FROM customers;
```

---

## DQL (Data Query Language)

Used to retrieve data.

```sql
SELECT *
FROM customers;
```

---

## TCL (Transaction Control Language)

Used to control transactions.

```sql
COMMIT;
```

```sql
ROLLBACK;
```

---

# 📚 Lesson 8: Introduction to MySQL

## What is MySQL?

MySQL is an open-source relational database management system (RDBMS).

---

## Why Learn MySQL?

* Free and open source
* Beginner-friendly
* Industry recognized
* Widely used in web applications
* Strong community support

---

## Popular Companies Using MySQL

* Facebook
* YouTube
* Shopify
* Uber
* Netflix (selected services)

---

# 📝 Module Summary

In this module, you learned:

* What databases are
* Why databases are important
* Evolution of database systems
* Relational database concepts
* Tables, rows, and columns
* Primary and foreign keys
* Database relationships
* SQL fundamentals
* SQL statement categories
* Introduction to MySQL

---

# 🧪 Knowledge Check

### Question 1

What is the primary purpose of a database?

* A. Store and manage data
* B. Create websites
* C. Design graphics
* D. Write applications

---

### Question 2

Which key uniquely identifies a record?

* A. Foreign Key
* B. Composite Key
* C. Primary Key
* D. Alternate Key

---

### Question 3

Which SQL statement retrieves data?

* A. INSERT
* B. DELETE
* C. UPDATE
* D. SELECT

---

### Question 4

What type of relationship exists between Customers and Orders?

* A. One-to-One
* B. One-to-Many
* C. Many-to-Many
* D. None

---

# 🚀 Next Module

**Module 02: Creating and Populating Databases**

You'll learn how to:

* Create databases
* Define tables
* Choose data types
* Insert records
* Update and delete data
* Build your first SQL database
