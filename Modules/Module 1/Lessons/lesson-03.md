# Understanding the Relational Model

> Learn the core concepts that power modern databases: tables, rows, columns, keys, and relationships.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand the relational model
* Explain tables, rows, and columns
* Identify entities and attributes
* Understand primary keys and foreign keys
* Explain relationships between tables
* Understand data normalization
* Recognize the advantages of relational databases

---

# Introduction

The relational model is the foundation of modern database systems.

Introduced by **Dr. Edgar F. Codd** in 1970, the relational model organizes data into tables that can be connected through relationships.

Today, almost every SQL database system is based on this model.

Examples include:

* MySQL
* PostgreSQL
* SQL Server
* Oracle Database
* IBM DB2

---

# What is the Relational Model?

The relational model stores data in **tables**.

Each table contains:

* Rows
* Columns
* Relationships with other tables

---

## Example

### Customers Table

| CustomerID | FirstName | LastName |
| ---------- | --------- | -------- |
| 1          | John      | Smith    |
| 2          | Sarah     | Wilson   |
| 3          | David     | Lee      |

---

In this table:

* CustomerID, FirstName, LastName are columns
* Each customer record is a row

---

# Core Components of the Relational Model

```text id="a1q8kz"
Relational Model
       │
       ├── Tables
       ├── Rows
       ├── Columns
       ├── Primary Keys
       ├── Foreign Keys
       └── Relationships
```

---

# Tables

A table is a collection of related information.

Each table represents a specific subject or entity.

---

## Examples

| Table Name | Stores               |
| ---------- | -------------------- |
| Customers  | Customer Information |
| Products   | Product Information  |
| Orders     | Order Details        |
| Employees  | Employee Data        |

---

# Entities

An entity is a real-world object that we want to store information about.

Examples:

* Customer
* Product
* Employee
* Order
* Student

---

## Customer Entity

```text id="uws0sl"
Customer
 ├── CustomerID
 ├── Name
 ├── Email
 └── Phone
```

---

# Attributes

Attributes describe an entity.

For a Customer:

| Attribute  |
| ---------- |
| CustomerID |
| Name       |
| Email      |
| Phone      |

These become columns in a database table.

---

# Columns

Columns represent attributes of an entity.

---

## Example

| CustomerID | Name | Email |
| ---------- | ---- | ----- |

The columns are:

* CustomerID
* Name
* Email

Each column stores a specific type of information.

---

# Rows

Rows represent individual records.

---

## Example

| CustomerID | Name       | Email                                   |
| ---------- | ---------- | --------------------------------------- |
| 1          | John Smith | [john@email.com](mailto:john@email.com) |

This row represents one customer.

---

# Terminology Mapping

| Database Term | Meaning               |
| ------------- | --------------------- |
| Table         | Collection of records |
| Column        | Attribute             |
| Row           | Record                |
| Entity        | Real-world object     |
| Attribute     | Property of an entity |

---

# Primary Keys

A primary key uniquely identifies each row in a table.

---

## Example

### Customers Table

| CustomerID | Name  |
| ---------- | ----- |
| 1          | John  |
| 2          | Sarah |
| 3          | David |

CustomerID is the primary key.

---

# Characteristics of a Primary Key

A primary key must be:

✅ Unique

✅ Not NULL

✅ Stable

✅ One per table

---

# Why Primary Keys Matter

Without primary keys:

```text id="s7r1xb"
John Smith
John Smith
John Smith
```

It becomes difficult to identify records.

Using a unique identifier solves this problem.

```text id="2j1dve"
1 → John Smith
2 → John Smith
3 → John Smith
```

---

# Natural Keys vs Surrogate Keys

## Natural Key

A real-world value.

Example:

```text id="83x4hp"
Email Address
Passport Number
National ID
```

---

## Surrogate Key

An artificially generated identifier.

Example:

```text id="4n7qye"
CustomerID
ProductID
OrderID
```

Most databases use surrogate keys.

---

# Foreign Keys

Foreign keys create relationships between tables.

---

## Customers Table

| CustomerID | Name  |
| ---------- | ----- |
| 1          | John  |
| 2          | Sarah |

---

## Orders Table

| OrderID | CustomerID |
| ------- | ---------- |
| 101     | 1          |
| 102     | 2          |

CustomerID in Orders references CustomerID in Customers.

This is called a foreign key.

---

# Visualizing Foreign Keys

```text id="j2e0lm"
Customers
---------
CustomerID (PK)

     │
     ▼

Orders
---------
OrderID
CustomerID (FK)
```

---

# Why Foreign Keys Matter

Foreign keys help:

* Connect tables
* Prevent invalid data
* Maintain integrity
* Support joins

---

# Relationships in Databases

Relationships connect tables together.

---

# One-to-One Relationship (1:1)

Each record in one table matches exactly one record in another.

---

## Example

```text id="l7n2tz"
Person
   │
   ▼
Passport
```

One person has one passport.

One passport belongs to one person.

---

# One-to-Many Relationship (1:N)

Most common relationship type.

---

## Example

```text id="z4u1mc"
Customer
    │
    ├── Order 1
    ├── Order 2
    └── Order 3
```

One customer can place many orders.

---

## Tables

### Customers

| CustomerID | Name |
| ---------- | ---- |
| 1          | John |

---

### Orders

| OrderID | CustomerID |
| ------- | ---------- |
| 101     | 1          |
| 102     | 1          |
| 103     | 1          |

---

# Many-to-Many Relationship (M:N)

Both sides can have multiple related records.

---

## Example

```text id="f1v6ga"
Students
     ↔
 Courses
```

A student can enroll in many courses.

A course can contain many students.

---

# Resolving Many-to-Many Relationships

Relational databases use a bridge table.

---

## Example

### Students

| StudentID | Name |
| --------- | ---- |
| 1         | John |

---

### Courses

| CourseID | Course |
| -------- | ------ |
| 101      | SQL    |

---

### Enrollments

| StudentID | CourseID |
| --------- | -------- |
| 1         | 101      |

---

# Data Redundancy

Redundancy occurs when data is stored repeatedly.

---

## Bad Design

| OrderID | CustomerName |
| ------- | ------------ |
| 1       | John         |
| 2       | John         |
| 3       | John         |

The customer name appears multiple times.

---

# Problems with Redundancy

* Increased storage
* Update anomalies
* Inconsistent data
* Maintenance difficulties

---

# Normalization

Normalization reduces redundancy.

The goal:

> Store each piece of information only once.

---

# Example of Normalization

---

## Customers Table

| CustomerID | Name |
| ---------- | ---- |
| 1          | John |

---

## Orders Table

| OrderID | CustomerID |
| ------- | ---------- |
| 101     | 1          |
| 102     | 1          |

Instead of repeating the customer name, we store CustomerID.

---

# Benefits of the Relational Model

## Simplicity

Tables are easy to understand.

---

## Flexibility

Relationships can represent complex business processes.

---

## Consistency

Normalization reduces duplication.

---

## Integrity

Primary and foreign keys maintain data quality.

---

## Powerful Querying

SQL makes retrieving information easy.

---

# Real-World Example

Imagine an online store.

---

## Customers

| CustomerID | Name |
| ---------- | ---- |
| 1          | John |

---

## Products

| ProductID | Product |
| --------- | ------- |
| P1        | Laptop  |

---

## Orders

| OrderID | CustomerID |
| ------- | ---------- |
| O1      | 1          |

---

## OrderItems

| OrderID | ProductID |
| ------- | --------- |
| O1      | P1        |

Through relationships, the database can answer:

* Which products did John buy?
* How many orders exist?
* What products are most popular?

---

# Summary

In this lesson, you learned:

* What the relational model is
* Tables, rows, and columns
* Entities and attributes
* Primary keys
* Foreign keys
* Database relationships
* Data redundancy
* Normalization
* Benefits of relational databases

These concepts form the foundation for writing SQL queries in future modules.

---

# Knowledge Check

### Question 1

What is a row in a table called?

A. Attribute

B. Record

C. Entity

D. Schema

---

### Question 2

Which key uniquely identifies a row?

A. Foreign Key

B. Composite Key

C. Primary Key

D. Candidate Key

---

### Question 3

What type of relationship exists between Customers and Orders?

A. One-to-One

B. One-to-Many

C. Many-to-Many

D. None

---

### Question 4

What is the purpose of normalization?

A. Increase duplication

B. Reduce redundancy

C. Increase storage

D. Remove relationships

---

# Next Lesson

➡️ 04-Keys-and-Relationships.md

In the next lesson, you will take a deeper dive into primary keys, foreign keys, composite keys, candidate keys, and relationship design techniques used in real-world databases.
