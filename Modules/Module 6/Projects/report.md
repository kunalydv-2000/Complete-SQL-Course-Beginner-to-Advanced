# Project Report

# Library Analytics and KPI Reporting System

## Module 06: SQL Subqueries and Nested Queries

---

# Project Information

| Item            | Details                                       |
| --------------- | --------------------------------------------- |
| Project Name    | Library Analytics and KPI Reporting System    |
| Module          | Module 06 – SQL Subqueries and Nested Queries |
| Database        | LibraryManagementSystem                       |
| Project Type    | Analytics & Reporting                         |
| Difficulty      | Intermediate                                  |
| Author          | __________________                            |
| Completion Date | __________________                            |

---

# Project Overview

The objective of this project was to develop a comprehensive analytics and reporting solution for a Library Management System using advanced SQL subquery techniques.

The project demonstrates how scalar subqueries, multi-row subqueries, correlated subqueries, EXISTS, NOT EXISTS, and derived tables can be used to solve real-world business reporting requirements.

The reports generated help management understand:

* Inventory performance
* Member activity
* Author productivity
* Publisher contributions
* Reservation trends
* Library KPIs

---

# Business Objectives

The project was designed to answer the following business questions:

### Inventory Analysis

* Which books are above average price?
* Which books are below average price?
* Which books have never been borrowed?
* Which books have reservations?

### Member Analysis

* Which members actively borrow books?
* Which members are inactive?
* Which members create reservations?

### Author Analysis

* Which authors have published books?
* Which authors have not published books?
* Which authors are the most productive?

### Publisher Analysis

* Which publishers contribute the most books?
* Which publishers have no books?

### Executive Reporting

* What are the library's key performance indicators?
* What is the current inventory value?
* What is the average book price?

---

# Database Structure

The project uses the following tables:

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

---

# SQL Concepts Applied

The following Module 06 concepts were implemented.

| Concept               | Used |
| --------------------- | ---- |
| Scalar Subqueries     | ✓    |
| Multi-Row Subqueries  | ✓    |
| Subqueries in WHERE   | ✓    |
| Subqueries in SELECT  | ✓    |
| Subqueries in FROM    | ✓    |
| Derived Tables        | ✓    |
| Correlated Subqueries | ✓    |
| EXISTS                | ✓    |
| NOT EXISTS            | ✓    |
| KPI Reporting         | ✓    |

---

# Report Summary

---

## Report 1: Books Above Average Price

### Objective

Identify premium-priced books.

### SQL Technique

Scalar Subquery

### Business Value

Helps management identify high-value inventory.

---

## Report 2: Books Below Average Price

### Objective

Identify lower-priced books.

### SQL Technique

Scalar Subquery

### Business Value

Useful for promotional campaigns and pricing analysis.

---

## Report 3: Most Expensive Books

### Objective

Find the highest-priced books.

### SQL Technique

Scalar Subquery using MAX()

### Business Value

Supports premium inventory analysis.

---

## Report 4: Newest Books

### Objective

Identify the most recently published books.

### SQL Technique

Scalar Subquery using MAX()

### Business Value

Highlights the newest additions to the library.

---

## Report 5: Active Members

### Objective

Identify members with borrowing activity.

### SQL Technique

EXISTS

### Business Value

Measures member engagement.

---

## Report 6: Inactive Members

### Objective

Identify members with no borrowing activity.

### SQL Technique

NOT EXISTS

### Business Value

Supports member retention initiatives.

---

## Report 7: Members With Reservations

### Objective

Identify members placing reservations.

### SQL Technique

EXISTS

### Business Value

Measures demand and engagement.

---

## Report 8: Members Without Reservations

### Objective

Identify members who have not reserved books.

### SQL Technique

NOT EXISTS

### Business Value

Supports targeted marketing campaigns.

---

## Report 9: Books That Were Borrowed

### Objective

Identify actively used books.

### SQL Technique

EXISTS

### Business Value

Measures inventory utilization.

---

## Report 10: Books Never Borrowed

### Objective

Identify unused inventory.

### SQL Technique

NOT EXISTS

### Business Value

Supports collection optimization.

---

## Report 11: Books With Reservations

### Objective

Identify high-demand books.

### SQL Technique

EXISTS

### Business Value

Helps manage inventory demand.

---

## Report 12: Books Without Reservations

### Objective

Identify low-demand books.

### SQL Technique

NOT EXISTS

### Business Value

Supports inventory planning.

---

## Report 13: Authors With Books

### Objective

Identify active authors.

### SQL Technique

EXISTS

### Business Value

Tracks publishing activity.

---

## Report 14: Authors Without Books

### Objective

Identify inactive authors.

### SQL Technique

NOT EXISTS

### Business Value

Supports content auditing.

---

## Report 15: Author Productivity Report

### Objective

Measure author output.

### SQL Technique

Derived Table

### Business Value

Ranks authors by total books written.

---

## Report 16–18: Publisher Analytics

### Objective

Measure publisher performance.

### SQL Technique

EXISTS, NOT EXISTS, Derived Tables

### Business Value

Evaluates publisher contributions.

---

## Report 19–21: Category Analytics

### Objective

Measure category performance.

### SQL Technique

Derived Tables

### Business Value

Identifies the strongest content categories.

---

## Report 22–24: Borrowing Analytics

### Objective

Measure borrowing activity.

### SQL Technique

Derived Tables and Correlated Subqueries

### Business Value

Identifies highly engaged members.

---

# Executive KPI Dashboard

The dashboard provides a high-level overview of library operations.

### KPIs Included

* Total Books
* Total Members
* Total Authors
* Total Publishers
* Total Categories
* Total Reservations
* Total Borrow Records

### SQL Technique

SELECT Clause Subqueries

### Business Value

Provides management with quick operational insights.

---

# Inventory KPI Dashboard

### KPIs Included

* Total Books
* Inventory Value
* Average Book Price
* Highest Book Price
* Lowest Book Price

### SQL Technique

Scalar Subqueries

### Business Value

Supports inventory valuation and pricing analysis.

---

# Advanced Analytics Dashboard

### Metrics Included

* Books Never Borrowed
* Inactive Members
* Authors Without Books
* Publishers Without Books
* Categories Without Books

### SQL Technique

NOT EXISTS

### Business Value

Supports data quality analysis and operational improvements.

---

# Key Learnings

Throughout this project, the following SQL skills were developed:

### Subquery Design

* Scalar Subqueries
* Multi-Row Subqueries
* Correlated Subqueries

### Reporting Techniques

* KPI Dashboards
* Inventory Reports
* Activity Reports

### Data Analysis

* Performance Analysis
* Trend Identification
* Utilization Analysis

### Query Optimization

* EXISTS
* NOT EXISTS
* Derived Tables

---

# Challenges Faced

### Challenge 1

Managing multiple nested queries.

### Solution

Used proper formatting and aliases.

---

### Challenge 2

Finding missing relationships.

### Solution

Used NOT EXISTS.

---

### Challenge 3

Building KPI dashboards.

### Solution

Used SELECT clause subqueries.

---

# Conclusion

The Library Analytics and KPI Reporting System successfully demonstrates the practical application of SQL subqueries in business intelligence and reporting scenarios.

By combining scalar subqueries, correlated subqueries, EXISTS, NOT EXISTS, and derived tables, the project delivers meaningful insights into library operations and provides management with actionable information for decision-making.

The project reinforces essential SQL skills used by Data Analysts, Business Intelligence Developers, Database Developers, and Data Engineers.

---

# Project Completion Checklist

```text
✓ Inventory Analysis

✓ Member Activity Analysis

✓ Author Analytics

✓ Publisher Analytics

✓ Category Analytics

✓ Borrowing Analytics

✓ Executive KPI Dashboard

✓ Inventory KPI Dashboard

✓ Advanced Analytics Dashboard

✓ Scalar Subqueries

✓ Correlated Subqueries

✓ EXISTS / NOT EXISTS

✓ Derived Tables
```

## Project Status

```text
COMPLETED
```
