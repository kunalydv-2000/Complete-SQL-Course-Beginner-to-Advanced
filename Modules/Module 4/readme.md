# Module 04: Aggregate Functions and Grouping

> Learn how to summarize, analyze, and transform raw data into meaningful business insights using SQL aggregate functions and grouping techniques.

---

# 📖 Module Overview

In Module 03, you learned how to retrieve and filter data using:

* SELECT
* WHERE
* ORDER BY
* TOP
* DISTINCT
* LIKE
* IN
* BETWEEN

While these skills help answer simple business questions, organizations often need summarized information rather than individual records.

Examples:

```text
How many books do we have?

How many members are registered?

Which category contains the most books?

How many reservations are approved?

What is the average book price?
```

These questions require aggregation.

In this module, you'll learn how to:

* Count records
* Calculate totals
* Calculate averages
* Find minimum values
* Find maximum values
* Group records
* Filter grouped data
* Build analytical reports

These skills are widely used in:

* Data Analysis
* Business Intelligence
* Reporting
* Dashboard Development
* Data Warehousing

---

# 🎯 Learning Objectives

After completing this module, you will be able to:

* Use COUNT()
* Use SUM()
* Use AVG()
* Use MIN()
* Use MAX()
* Group records with GROUP BY
* Filter groups with HAVING
* Create summary reports
* Build analytical dashboards
* Answer management-level business questions

---

# 🗺️ Module Roadmap

```text
COUNT()
   ↓
SUM()
   ↓
AVG()
   ↓
MIN() / MAX()
   ↓
GROUP BY
   ↓
Multiple Column GROUP BY
   ↓
HAVING
   ↓
Business Reports
   ↓
Analytics Dashboard
```

---

# 📚 Lessons

---

## Lesson 01: Introduction to Aggregate Functions

### Topics Covered

* What are aggregate functions?
* Why aggregation matters
* Business reporting concepts
* Analytical SQL

### Example

```sql
SELECT COUNT(*)
FROM Books;
```

### Skills Gained

* Understanding summary calculations
* Business reporting fundamentals

---

## Lesson 02: COUNT Function

### Topics Covered

* COUNT(*)
* COUNT(column)
* Counting records
* Counting categories

### Example

```sql
SELECT COUNT(*)
FROM Members;
```

### Skills Gained

* Record counting
* KPI development

---

## Lesson 03: SUM Function

### Topics Covered

* Adding values
* Calculating totals
* Business metrics

### Example

```sql
SELECT SUM(FineAmount)
FROM BorrowRecords;
```

### Skills Gained

* Financial calculations
* Total reporting

---

## Lesson 04: AVG Function

### Topics Covered

* Average calculations
* Analytical reporting
* Business insights

### Example

```sql
SELECT AVG(BookPrice)
FROM Books;
```

### Skills Gained

* Trend analysis
* Performance measurement

---

## Lesson 05: MIN and MAX Functions

### Topics Covered

* Minimum values
* Maximum values
* Earliest dates
* Latest dates

### Example

```sql
SELECT MAX(PublicationYear)
FROM Books;
```

### Skills Gained

* Finding extremes
* Data analysis

---

## Lesson 06: Introduction to GROUP BY

### Topics Covered

* Grouping records
* Summary reports
* Category analysis

### Example

```sql
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID;
```

### Skills Gained

* Data summarization
* Reporting by category

---

## Lesson 07: Multiple Column GROUP BY

### Topics Covered

* Multi-level grouping
* Business segmentation
* Detailed reports

### Example

```sql
SELECT
    CategoryID,
    PublisherID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY
    CategoryID,
    PublisherID;
```

### Skills Gained

* Advanced reporting
* Business breakdown analysis

---

## Lesson 08: HAVING Clause

### Topics Covered

* Filtering grouped results
* HAVING vs WHERE
* Aggregate filtering

### Example

```sql
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID
HAVING COUNT(*) > 5;
```

### Skills Gained

* Advanced report filtering
* Business rule implementation

---

## Lesson 09: Business Aggregation Reports

### Topics Covered

* KPI reporting
* Executive summaries
* Operational metrics

### Example

```sql
SELECT
    Status,
    COUNT(*) AS TotalReservations
FROM Reservations
GROUP BY Status;
```

### Skills Gained

* Dashboard reporting
* Business analytics

---

## Lesson 10: Aggregation Best Practices

### Topics Covered

* Query optimization
* Naming conventions
* Report readability
* Analytical design principles

### Skills Gained

* Professional SQL development
* Maintainable reporting solutions

---

# 🔧 Aggregate Functions Overview

| Function | Purpose              |
| -------- | -------------------- |
| COUNT()  | Counts records       |
| SUM()    | Calculates totals    |
| AVG()    | Calculates averages  |
| MIN()    | Finds smallest value |
| MAX()    | Finds largest value  |

---

# 📊 Sample Database

Continue using:

```text
LibraryManagementSystem
```

---

## Tables Used

```text
Books
Authors
Publishers
Categories
Members
BorrowRecords
Reservations
BookAuthors
```

These tables provide realistic data for analytical reporting.

---

# 💼 Business Questions You'll Answer

---

## How many books exist?

```sql
SELECT COUNT(*)
FROM Books;
```

---

## How many members are registered?

```sql
SELECT COUNT(*)
FROM Members;
```

---

## Which category has the most books?

```sql
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID
ORDER BY TotalBooks DESC;
```

---

## How many reservations exist by status?

```sql
SELECT
    Status,
    COUNT(*) AS TotalReservations
FROM Reservations
GROUP BY Status;
```

---

## What is the newest publication year?

```sql
SELECT MAX(PublicationYear)
FROM Books;
```

---

# 📂 Module Structure

```text
Module-04-Aggregate-Functions-and-Grouping/
│
├── README.md
│
├── lessons/
├── exercises/
├── solutions/
├── projects/
├── cheatsheets/
├── datasets/
└── assets/
```

---

# 📝 Exercises

This module includes practical exercises covering:

### Exercise 01

COUNT Function

### Exercise 02

SUM and AVG

### Exercise 03

MIN and MAX

### Exercise 04

GROUP BY

### Exercise 05

HAVING

### Exercise 06

Business Reports

### Exercise 07

Module Assessment Quiz

---

# 📚 Prerequisites

Before starting this module, you should understand:

* SELECT
* WHERE
* ORDER BY
* TOP
* DISTINCT
* LIKE
* IN
* BETWEEN
* Aliases

These concepts were covered in Module 03.

---

# 📈 Real-World Applications

Aggregate functions are used in:

### Business Intelligence

```text
Monthly Revenue
Customer Counts
Sales Totals
```

---

### Data Analytics

```text
Average Order Value
Top Categories
Trend Analysis
```

---

### Dashboard Development

```text
KPIs
Summary Metrics
Executive Reports
```

---

# 🎓 Expected Outcome

After completing this module, you will be able to:

✅ Summarize data

✅ Calculate totals

✅ Calculate averages

✅ Find highest and lowest values

✅ Group records

✅ Filter grouped results

✅ Build analytical reports

✅ Create dashboard-ready queries

---

# 🚀 What's Next?

After completing Module 04, you'll move to:

# Module 05: SQL Joins and Relationships

Topics include:

* INNER JOIN
* LEFT JOIN
* RIGHT JOIN
* FULL JOIN
* Self Joins
* Multi-Table Queries

You'll learn how to combine data from multiple tables and build relational reports.

---

# 🏁 Module Goal

By the end of Module 04, you should be comfortable transforming raw database records into meaningful summaries, reports, KPIs, and business insights using SQL aggregate functions and grouping techniques.
