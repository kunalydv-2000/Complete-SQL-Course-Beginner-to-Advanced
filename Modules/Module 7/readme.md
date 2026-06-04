# Module 07: SQL Views and Stored Procedures

> Learn how to create reusable database objects using Views and Stored Procedures to simplify reporting, improve security, automate business logic, and build enterprise-level SQL solutions.

---

# 📖 Module Overview

In previous modules, you learned:

```text id="m701"
SELECT

WHERE

ORDER BY

GROUP BY

HAVING

JOINS

Subqueries

EXISTS

Derived Tables
```

These techniques help retrieve and analyze data.

However, real-world applications require:

```text id="m702"
Reusable Queries

Centralized Business Logic

Secure Data Access

Automated Reporting

Database Reusability
```

SQL provides these capabilities through:

```text id="m703"
Views

Stored Procedures
```

Views and Stored Procedures are among the most important database objects used in enterprise applications.

---

# 🎯 Learning Objectives

After completing this module, you will be able to:

* Understand SQL Views
* Create Views
* Modify Views
* Use Views for Reporting
* Understand Stored Procedures
* Create Stored Procedures
* Pass Parameters
* Use Output Parameters
* Implement Dynamic SQL
* Build Reusable Database Solutions

---

# 🗺️ Module Roadmap

```text id="m704"
Introduction to Views
          ↓
Creating Views
          ↓
Updating Views
          ↓
View Best Practices
          ↓
Introduction to Stored Procedures
          ↓
Creating Stored Procedures
          ↓
Input Parameters
          ↓
Output Parameters
          ↓
Dynamic SQL
          ↓
Business Automation
```

---

# 📚 Lessons

---

## Lesson 01: Introduction to Views

### Topics Covered

* What is a View?
* Why Views Matter
* Virtual Tables
* Business Applications

### Skills Gained

* Understanding reusable queries
* Simplifying data access

---

## Lesson 02: Creating Views

### Topics Covered

* CREATE VIEW
* Single Table Views
* Multi-Table Views
* Reporting Views

### Skills Gained

* Creating reusable reports

---

## Lesson 03: Updating and Managing Views

### Topics Covered

* ALTER VIEW
* DROP VIEW
* View Maintenance

### Skills Gained

* Managing database objects

---

## Lesson 04: View Best Practices

### Topics Covered

* Performance
* Security
* Naming Conventions
* Reporting Strategies

### Skills Gained

* Professional view design

---

## Lesson 05: Introduction to Stored Procedures

### Topics Covered

* What is a Stored Procedure?
* Benefits
* Execution Process

### Skills Gained

* Understanding business automation

---

## Lesson 06: Creating Stored Procedures

### Topics Covered

* CREATE PROCEDURE
* EXEC
* Procedure Logic

### Skills Gained

* Building reusable database code

---

## Lesson 07: Input Parameters

### Topics Covered

* Procedure Parameters
* Dynamic Filtering
* User Inputs

### Skills Gained

* Parameterized procedures

---

## Lesson 08: Output Parameters

### Topics Covered

* OUTPUT Keyword
* Returning Values
* KPI Procedures

### Skills Gained

* Advanced procedure design

---

## Lesson 09: Dynamic SQL

### Topics Covered

* EXEC()
* sp_executesql
* Dynamic Query Generation

### Skills Gained

* Flexible query development

---

## Lesson 10: Business Automation with Procedures

### Topics Covered

* Reporting Automation
* KPI Dashboards
* Enterprise Solutions

### Skills Gained

* Production-ready SQL development

---

# 📊 Sample Database

Continue using:

```text id="m705"
LibraryManagementSystem
```

---

# Tables Used

```text id="m706"
Categories

Publishers

Authors

Books

BookAuthors

Members

BorrowRecords

Reservations
```

---

# 💼 Business Problems You'll Solve

---

## Create a Book Catalog View

```sql id="m707"
CREATE VIEW vw_BookCatalog
AS
SELECT
    BookID,
    Title,
    BookPrice
FROM Books;
```

---

## Create an Active Members View

```sql id="m708"
CREATE VIEW vw_ActiveMembers
AS
SELECT DISTINCT
    M.MemberID,
    M.FirstName,
    M.LastName
FROM Members M
INNER JOIN BorrowRecords BR
    ON M.MemberID = BR.MemberID;
```

---

## Create a Stored Procedure

```sql id="m709"
CREATE PROCEDURE GetAllBooks
AS
BEGIN
    SELECT *
    FROM Books;
END;
```

---

## Execute a Procedure

```sql id="m710"
EXEC GetAllBooks;
```

---

## Parameterized Procedure

```sql id="m711"
CREATE PROCEDURE GetBookByCategory
    @CategoryID INT
AS
BEGIN
    SELECT *
    FROM Books
    WHERE CategoryID = @CategoryID;
END;
```

---

# 🔍 What is a View?

A View is:

```text id="m712"
A Virtual Table
```

Created from:

```text id="m713"
SELECT Statements
```

---

Benefits:

* Reusability
* Security
* Simpler Queries
* Centralized Logic

---

# 🔍 What is a Stored Procedure?

A Stored Procedure is:

```text id="m714"
A Saved SQL Program
```

Stored inside the database.

---

Benefits:

* Reusability
* Better Performance
* Security
* Business Automation

---

# 📂 Module Structure

```text id="m715"
Module-07-SQL-Views-and-Stored-Procedures/
│
├── README.md
│
├── lessons/
│   ├── 01-Introduction-to-Views.md
│   ├── 02-Creating-Views.md
│   ├── 03-Updating-and-Managing-Views.md
│   ├── 04-View-Best-Practices.md
│   ├── 05-Introduction-to-Stored-Procedures.md
│   ├── 06-Creating-Stored-Procedures.md
│   ├── 07-Input-Parameters.md
│   ├── 08-Output-Parameters.md
│   ├── 09-Dynamic-SQL.md
│   └── 10-Business-Automation-with-Procedures.md
│
├── exercises/
├── solutions/
├── projects/
├── cheatsheets/
├── datasets/
└── assets/
```

---

# 📝 Exercises

This module includes:

### Exercise 01

Introduction to Views

### Exercise 02

Creating Views

### Exercise 03

Managing Views

### Exercise 04

View Best Practices

### Exercise 05

Introduction to Stored Procedures

### Exercise 06

Creating Procedures

### Exercise 07

Input Parameters

### Exercise 08

Output Parameters

### Exercise 09

Dynamic SQL

### Exercise 10

Module Assessment

---

# 🚀 Project

## Library Reporting and Automation System

Build:

* Book Catalog Views
* Member Activity Views
* Reservation Views
* Inventory Views
* Reporting Procedures
* KPI Procedures
* Parameterized Search Procedures
* Automated Dashboard Procedures

Using:

```text id="m716"
Views

Stored Procedures

Parameters

Output Parameters

Dynamic SQL
```

---

# 📚 Prerequisites

Before starting this module, you should understand:

```text id="m717"
SELECT

WHERE

GROUP BY

HAVING

JOINS

Subqueries
```

These concepts were covered in Modules 01–06.

---

# 🌍 Real-World Applications

### Business Intelligence

```text id="m718"
Reporting Views

Dashboard Procedures

Executive KPIs
```

---

### Enterprise Systems

```text id="m719"
ERP Systems

CRM Systems

Inventory Systems
```

---

### Database Administration

```text id="m720"
Security Layers

Reusable Logic

Controlled Data Access
```

---

# 🎓 Expected Outcome

After completing this module, you will be able to:

✅ Create Views

✅ Manage Views

✅ Create Stored Procedures

✅ Use Parameters

✅ Return Output Values

✅ Generate Dynamic SQL

✅ Automate Business Reports

✅ Build Enterprise Database Solutions

---

# 🔜 What's Next?

After Module 07, you'll move to:

# Module 08: SQL Triggers and Transactions

Topics include:

* DML Triggers
* AFTER Triggers
* INSTEAD OF Triggers
* Transactions
* COMMIT
* ROLLBACK
* Error Handling
* Data Integrity

---

# 🏁 Module Goal

By the end of Module 07, you will be able to create reusable database objects, automate reporting processes, secure data access, and build enterprise-grade SQL solutions using Views and Stored Procedures.
