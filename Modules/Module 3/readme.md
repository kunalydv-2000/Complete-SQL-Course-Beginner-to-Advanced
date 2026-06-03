# Module 03: Query Fundamentals

> Learn how to retrieve, filter, sort, and display data using SQL queries. This module introduces the SELECT statement and the core querying techniques used in every SQL-based application.

---

# 📖 Module Overview

In Module 02, you learned how to create databases, build tables, define relationships, and populate them with data.

Now it's time to answer questions using that data.

This module introduces the most important SQL skill:

**Querying data.**

You'll learn how to:

* Retrieve data from tables
* Select specific columns
* Remove duplicate results
* Filter records
* Sort results
* Limit returned rows
* Rename columns
* Build practical business queries

These skills form the foundation for reporting, analytics, dashboards, and business intelligence.

---

# 🎯 Learning Objectives

After completing this module, you will be able to:

* Write SELECT statements
* Retrieve data from tables
* Select specific columns
* Use DISTINCT to remove duplicates
* Filter records with WHERE
* Apply comparison operators
* Sort results with ORDER BY
* Limit results using TOP
* Create aliases for readable output
* Use IN, BETWEEN, and LIKE operators
* Build real-world SQL reports

---

# 🗺️ Module Roadmap

```text
SELECT
   ↓
Specific Columns
   ↓
DISTINCT
   ↓
WHERE
   ↓
ORDER BY
   ↓
TOP
   ↓
Aliases
   ↓
IN / BETWEEN / LIKE
   ↓
Business Queries
```

---

# 📚 Lessons

---

## Lesson 01: Introduction to SELECT

### Topics Covered

* What is a query?
* Understanding result sets
* SELECT statement
* Retrieving all rows
* Understanding SQL execution

### Example

```sql
SELECT *
FROM Members;
```

### Skills Gained

* Basic querying
* Understanding table data

---

## Lesson 02: Selecting Specific Columns

### Topics Covered

* Selecting required columns
* Avoiding unnecessary data retrieval
* Best practices for column selection

### Example

```sql
SELECT
    FirstName,
    LastName
FROM Members;
```

### Skills Gained

* Efficient querying
* Better report design

---

## Lesson 03: Using DISTINCT

### Topics Covered

* Duplicate values
* Removing duplicates
* Business reporting use cases

### Example

```sql
SELECT DISTINCT CategoryID
FROM Books;
```

### Skills Gained

* Data deduplication
* Cleaner reports

---

## Lesson 04: Filtering with WHERE

### Topics Covered

* WHERE clause
* Comparison operators
* Logical filtering

### Example

```sql
SELECT *
FROM Books
WHERE PublicationYear > 2020;
```

### Skills Gained

* Data filtering
* Business reporting

---

## Lesson 05: Sorting with ORDER BY

### Topics Covered

* Ascending sorting
* Descending sorting
* Multi-column sorting

### Example

```sql
SELECT *
FROM Books
ORDER BY Title ASC;
```

### Skills Gained

* Report organization
* Data presentation

---

## Lesson 06: Using TOP

### Topics Covered

* Limiting records
* Top N reporting
* Query optimization basics

### Example

```sql
SELECT TOP 5 *
FROM Books;
```

### Skills Gained

* Sampling data
* Dashboard reporting

---

## Lesson 07: Column Aliases

### Topics Covered

* AS keyword
* Friendly report headers
* Improving readability

### Example

```sql
SELECT
    FirstName AS First_Name
FROM Members;
```

### Skills Gained

* Professional reporting
* Readable query outputs

---

## Lesson 08: Filtering with IN, BETWEEN, and LIKE

### Topics Covered

* IN operator
* BETWEEN operator
* LIKE operator
* Wildcards

### Examples

```sql
SELECT *
FROM Books
WHERE CategoryID IN (1,2,3);
```

```sql
SELECT *
FROM Books
WHERE PublicationYear BETWEEN 2010 AND 2025;
```

```sql
SELECT *
FROM Members
WHERE FirstName LIKE 'J%';
```

### Skills Gained

* Advanced filtering
* Search functionality

---

## Lesson 09: Building Business Queries

### Topics Covered

* Combining multiple clauses
* Business reporting
* Query design techniques

### Example

```sql
SELECT
    Title,
    PublicationYear
FROM Books
WHERE PublicationYear > 2015
ORDER BY PublicationYear DESC;
```

### Skills Gained

* Business analysis
* Report generation

---

# 🛠 SQL Commands You'll Learn

| Command  | Purpose               |
| -------- | --------------------- |
| SELECT   | Retrieve data         |
| DISTINCT | Remove duplicates     |
| WHERE    | Filter rows           |
| ORDER BY | Sort results          |
| TOP      | Limit rows            |
| AS       | Create aliases        |
| IN       | Match multiple values |
| BETWEEN  | Match ranges          |
| LIKE     | Pattern matching      |

---

# 📊 Sample Database

Throughout this module, you'll continue using the:

```text
LibraryManagementSystem
```

Database created in Module 02.

---

## Tables Used

```text
Categories
Publishers
Authors
Books
BookAuthors
Members
BorrowRecords
Reservations
```

This provides realistic business scenarios and real-world SQL practice.

---

# 💼 Business Questions You'll Answer

By the end of this module, you'll be able to answer questions such as:

### Which books were published after 2020?

```sql
SELECT *
FROM Books
WHERE PublicationYear > 2020;
```

---

### Which members have names starting with S?

```sql
SELECT *
FROM Members
WHERE FirstName LIKE 'S%';
```

---

### What are the newest books?

```sql
SELECT TOP 5 *
FROM Books
ORDER BY PublicationYear DESC;
```

---

### Which categories exist in the library?

```sql
SELECT DISTINCT CategoryID
FROM Books;
```

---

# 📂 Module Structure

```text
Module-03-Query-Fundamentals/
│
├── README.md
│
├── lessons/
│   ├── 01-Introduction-to-SELECT.md
│   ├── 02-Selecting-Specific-Columns.md
│   ├── 03-Using-DISTINCT.md
│   ├── 04-Filtering-with-WHERE.md
│   ├── 05-Sorting-with-ORDER-BY.md
│   ├── 06-Using-TOP.md
│   ├── 07-Column-Aliases.md
│   ├── 08-Filtering-with-IN-BETWEEN-LIKE.md
│   └── 09-Building-Business-Queries.md
│
├── exercises/
├── solutions/
├── projects/
├── datasets/
├── cheatsheets/
└── assets/
```

---

# 📝 Exercises

This module contains practical exercises covering:

### Exercise 01

SELECT Basics

### Exercise 02

DISTINCT and WHERE

### Exercise 03

ORDER BY and TOP

### Exercise 04

LIKE, IN, and BETWEEN

### Exercise 05

Business Reporting Queries

### Exercise 06

Module Assessment Quiz

---

# 📚 Prerequisites

Before starting this module, you should understand:

* Databases
* Tables
* Columns
* Rows
* Data Types
* Constraints
* INSERT
* UPDATE
* DELETE

These concepts were covered in Modules 01 and 02.

---

# 🎓 Expected Outcome

After completing this module, you will be able to:

✅ Retrieve data from databases

✅ Filter records efficiently

✅ Sort query results

✅ Search data using patterns

✅ Build meaningful reports

✅ Answer business questions using SQL

---

# 🚀 What's Next?

After completing Module 03, you'll move to:

# Module 04: Aggregate Functions and Grouping

Topics include:

* COUNT()
* SUM()
* AVG()
* MIN()
* MAX()
* GROUP BY
* HAVING

You'll begin creating analytical reports and business summaries from your data.

---

# 🏁 Module Goal

By the end of Module 03, you should be comfortable retrieving, filtering, sorting, and presenting data using SQL queries—the core skill used by SQL developers, analysts, and data professionals every day.
