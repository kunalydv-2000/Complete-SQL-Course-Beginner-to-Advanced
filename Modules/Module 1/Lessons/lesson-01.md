# Introduction to Databases

> Understanding what databases are, why they exist, and how they power modern applications.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Define a database
* Explain why databases are important
* Identify real-world database applications
* Compare traditional data storage with database systems
* Understand the advantages of database management systems

---

# What is a Database?

A database is an organized collection of related data that can be stored, managed, and retrieved efficiently.

Think of a database as a digital filing cabinet where information is organized in a structured manner.

Examples include:

* Customer records
* Employee information
* Product inventories
* Student records
* Banking transactions

---

# Real-World Examples

## Banking System

Stores:

* Customer information
* Account details
* Transaction history
* Loan information

### Example

| Account Number | Customer Name | Balance |
| -------------- | ------------- | ------- |
| 1001           | John Smith    | $5,000  |
| 1002           | Sarah Lee     | $8,500  |

---

## E-Commerce Platform

Stores:

* Products
* Customers
* Orders
* Payments

### Example

| Product ID | Product Name | Price |
| ---------- | ------------ | ----- |
| P101       | Laptop       | $1200 |
| P102       | Mouse        | $25   |

---

## Hospital Management System

Stores:

* Patient records
* Doctors
* Appointments
* Medical history

---

# Why Do We Need Databases?

Before databases, organizations stored information in:

* Paper files
* Spreadsheets
* Manual registers

These methods created several problems.

## Problem 1: Slow Data Retrieval

Finding information manually can take minutes or hours.

Database systems retrieve information in milliseconds.

---

## Problem 2: Data Duplication

The same information may exist in multiple places.

Example:

```text
Customer Name: John Smith
Customer Name: John Smith
Customer Name: John Smith
```

Databases reduce unnecessary duplication.

---

## Problem 3: Data Inconsistency

Different records may contain conflicting information.

Example:

```text
File A:
John Smith

File B:
Jon Smith
```

Databases help maintain consistency.

---

## Problem 4: Security Issues

Anyone can access paper files.

Database systems provide:

* Authentication
* Authorization
* Access control

---

# Database Management System (DBMS)

A DBMS is software used to create, manage, and interact with databases.

Examples:

| DBMS            | Type        |
| --------------- | ----------- |
| MySQL           | Open Source |
| PostgreSQL      | Open Source |
| SQL Server      | Commercial  |
| Oracle Database | Commercial  |

---

# Components of a Database System

```text
Users
  ↓
Applications
  ↓
DBMS
  ↓
Database
```

### Users

People who interact with data.

### Applications

Software that accesses the database.

### DBMS

Manages storage and retrieval.

### Database

Stores actual information.

---

# Characteristics of Modern Databases

## Data Integrity

Ensures data remains accurate.

---

## Security

Protects sensitive information.

---

## Scalability

Handles growing amounts of data.

---

## Reliability

Ensures data remains available.

---

## Multi-User Support

Allows many users to access data simultaneously.

---

# Traditional File System vs Database System

| Feature            | File System    | Database    |
| ------------------ | -------------- | ----------- |
| Data Storage       | Separate Files | Centralized |
| Data Consistency   | Low            | High        |
| Security           | Limited        | Advanced    |
| Scalability        | Poor           | Excellent   |
| Querying           | Difficult      | Easy        |
| Multi-user Support | Limited        | Strong      |

---

# Common Database Terminology

## Data

Raw facts or information.

Example:

```text
John
25
Delhi
```

---

## Information

Processed and meaningful data.

Example:

```text
John is a 25-year-old customer living in Delhi.
```

---

## Record

A collection of related data.

Example:

| ID | Name | City  |
| -- | ---- | ----- |
| 1  | John | Delhi |

This row is a record.

---

# Benefits of Databases

✅ Faster access to data

✅ Improved security

✅ Better data consistency

✅ Reduced duplication

✅ Easier reporting

✅ Concurrent access

✅ Backup and recovery support

---

# Summary

In this lesson, you learned:

* What databases are
* Why organizations use databases
* Problems with traditional storage systems
* What a DBMS does
* Key database terminology
* Benefits of database systems

These concepts form the foundation for understanding relational databases and SQL.

---

# Knowledge Check

### Question 1

What is a database?

A. Programming language

B. Collection of related data

C. Operating system

D. Web server

---

### Question 2

What software manages databases?

A. Compiler

B. Browser

C. DBMS

D. IDE

---

### Question 3

Which is NOT a database benefit?

A. Faster retrieval

B. Better security

C. Reduced consistency

D. Scalability

---

# Next Lesson

➡️ 02-Evolution-of-Databases.md
