# Module 06 Project

# Library Analytics and KPI Reporting System

> Build an advanced analytics solution using SQL Subqueries, Derived Tables, EXISTS, NOT EXISTS, and KPI Dashboards to generate business insights for a Library Management System.

---

# Project Overview

In this project, you will act as a:

```text
SQL Data Analyst
```

working for a digital library.

Management wants deeper insights into:

* Book Performance
* Member Activity
* Inventory Utilization
* Author Productivity
* Publisher Performance
* Reservation Trends

You will use advanced SQL subquery techniques to build reports and dashboards.

---

# Project Goals

Create a reporting solution that can answer:

```text
Which books are above average price?

Which books are never borrowed?

Which members are active?

Which members are inactive?

Which publishers contribute most books?

Which authors have no books?

Which categories perform best?

What are the library KPIs?
```

---

# Skills Covered

This project reinforces:

✅ Scalar Subqueries

✅ Multi-Row Subqueries

✅ WHERE Subqueries

✅ SELECT Subqueries

✅ FROM Subqueries

✅ Derived Tables

✅ Correlated Subqueries

✅ EXISTS

✅ NOT EXISTS

✅ KPI Reporting

---

# Database Used

```text
LibraryManagementSystem
```

---

# Tables

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

# Business Requirements

Management requires the following reports.

---

# Part 1: Inventory Analysis

---

## Report 1

Books Above Average Price

Display:

```text
BookID

Title

BookPrice
```

Condition:

```text
Price > Average Price
```

---

## Report 2

Books Below Average Price

Display:

```text
BookID

Title

BookPrice
```

Condition:

```text
Price < Average Price
```

---

## Report 3

Most Expensive Books

Display:

```text
Title

BookPrice
```

Condition:

```text
Highest Price
```

---

## Report 4

Newest Books

Display:

```text
Title

PublicationYear
```

Condition:

```text
Latest Publication Year
```

---

# Part 2: Member Activity Analysis

---

## Report 5

Active Members

Display members who have:

```text
Borrow Records
```

Use:

```text
EXISTS
```

---

## Report 6

Inactive Members

Display members who have:

```text
No Borrow Records
```

Use:

```text
NOT EXISTS
```

---

## Report 7

Members With Reservations

Display members who have:

```text
Reservations
```

---

## Report 8

Members Without Reservations

Display members who have:

```text
No Reservations
```

---

# Part 3: Inventory Utilization

---

## Report 9

Books That Were Borrowed

Use:

```text
EXISTS
```

---

## Report 10

Books Never Borrowed

Use:

```text
NOT EXISTS
```

---

## Report 11

Books With Reservations

Use:

```text
EXISTS
```

---

## Report 12

Books Without Reservations

Use:

```text
NOT EXISTS
```

---

# Part 4: Author Analytics

---

## Report 13

Authors With Books

Display:

```text
Author Name
```

Use:

```text
EXISTS
```

---

## Report 14

Authors Without Books

Display:

```text
Author Name
```

Use:

```text
NOT EXISTS
```

---

## Report 15

Author Productivity Report

Display:

```text
Author Name

Total Books Written
```

Use:

```text
Derived Table
```

---

# Part 5: Publisher Analytics

---

## Report 16

Publishers With Books

---

## Report 17

Publishers Without Books

---

## Report 18

Publisher Performance Report

Display:

```text
Publisher Name

Total Books Published
```

Use:

```text
Derived Table
```

---

# Part 6: Category Analytics

---

## Report 19

Categories With Books

---

## Report 20

Categories Without Books

---

## Report 21

Category Performance Report

Display:

```text
Category Name

Total Books

Average Price
```

Use:

```text
Derived Table
```

---

# Part 7: Borrowing Analytics

---

## Report 22

Borrow Count Per Member

Display:

```text
MemberID

BorrowCount
```

Use:

```text
Derived Table
```

---

## Report 23

Average Borrow Activity

Calculate:

```text
Average Borrow Count
Per Member
```

Use:

```text
Derived Table
```

---

## Report 24

Members Above Average Activity

Display:

```text
MemberID

Member Name

BorrowCount
```

Use:

```text
Correlated Subquery
```

---

# Part 8: Executive KPI Dashboard

Create a one-query dashboard displaying:

```text
Total Books

Total Members

Total Authors

Total Publishers

Total Categories

Total Reservations

Total Borrow Records
```

Use:

```text
SELECT Subqueries
```

---

# Part 9: Inventory KPI Dashboard

Create a dashboard displaying:

```text
Total Books

Inventory Value

Average Book Price

Highest Book Price

Lowest Book Price
```

---

# Part 10: Advanced Analytics Dashboard

Create a report showing:

```text
Books Never Borrowed

Inactive Members

Authors Without Books

Publishers Without Books

Categories Without Books
```

Use:

```text
NOT EXISTS
```

---

# Bonus Challenges

---

## Challenge 1

Top 5 Most Active Members

Display:

```text
Member Name

Borrow Count
```

---

## Challenge 2

Top 5 Most Reserved Books

Display:

```text
Book Title

Reservation Count
```

---

## Challenge 3

Publishers Above Average Book Count

Use:

```text
Scalar Subquery

Derived Table
```

---

## Challenge 4

Categories Above Average Book Price

Use:

```text
AVG()
```

and a subquery.

---

## Challenge 5

Build a Library Executive Dashboard

Include:

```text
Inventory KPIs

Borrow KPIs

Reservation KPIs

Member KPIs

Author KPIs
```

in one SQL script.

---

# Deliverables

Submit:

### 1. SQL Script File

```text
library_analytics_project.sql
```

Containing all reports.

---

### 2. Documentation File

```text
project-report.md
```

Explaining:

* Report Purpose
* SQL Logic
* Business Value

---

### 3. KPI Dashboard Queries

Separate section containing:

```text
Executive KPIs

Inventory KPIs

Activity KPIs
```

---

# Expected Learning Outcome

After completing this project, you will be able to:

✅ Write production-ready subqueries

✅ Build KPI dashboards

✅ Use EXISTS and NOT EXISTS professionally

✅ Create derived-table reports

✅ Solve analytical business problems

✅ Develop business intelligence reports

✅ Prepare for advanced SQL analytics and data engineering projects

---

# Project Difficulty

```text
Intermediate
```

---

# Estimated Completion Time

```text
4 – 6 Hours
```

---

# Success Criteria

Your solution should demonstrate:

* Correct use of Scalar Subqueries
* Correct use of Multi-Row Subqueries
* Correct use of Correlated Subqueries
* Proper EXISTS / NOT EXISTS usage
* Derived Table implementation
* KPI Dashboard creation
* Professional SQL formatting

Complete all reports and bonus challenges to achieve full project completion.
