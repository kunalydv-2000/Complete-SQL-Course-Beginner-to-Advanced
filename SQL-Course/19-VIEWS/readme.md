# Module 19: Views

> A View is a virtual table based on the result of a SQL query. Views do not store data themselves; instead, they store a query definition and display data from underlying tables whenever accessed.

---

# 📖 Introduction

Suppose management frequently requests:

```text
Employee Name
Department Name
Salary
```

from multiple joined tables.

Instead of writing the same JOIN query repeatedly, we can create a View.

A View behaves like a table but is actually a saved SQL query.

---

# 🎯 Learning Objectives

After completing this module, you will be able to:

✅ Understand Views

✅ Create Views

✅ Query Views

✅ Modify Views

✅ Drop Views

✅ Understand Security Benefits

✅ Understand View Limitations

✅ Use Views in Reporting Systems

---

# 📚 Table of Contents

1. What is a View?
2. Why Use Views?
3. How Views Work
4. Creating Views
5. Querying Views
6. Updating Views
7. Altering Views
8. Dropping Views
9. Advantages of Views
10. Limitations of Views
11. Security with Views
12. Common Mistakes
13. Best Practices
14. Interview Questions
15. Business Analytics Examples
16. Summary
17. Practice Questions

---

# 1️⃣ What is a View?

A View is a virtual table created from a SQL query.

---

## Table

Physical object.

Stores actual data.

---

## View

Virtual object.

Stores only SQL logic.

---

# Example

Employees

| EmployeeID | EmployeeName | Salary |
|------------|-------------|---------|
| 101 | Kunal | 50000 |
| 102 | Rahul | 60000 |

---

View:

```sql
CREATE VIEW EmployeeView
AS

SELECT EmployeeName,
       Salary
FROM Employees;
```

---

Now:

```sql
SELECT *
FROM EmployeeView;
```

works like a normal table.

---

# Why Views Matter

Used in:

- Reporting Systems
- Dashboards
- Data Security
- Business Intelligence
- Data Warehouses

---

# 2️⃣ Why Use Views?

Imagine a report requiring:

```sql
Employees
JOIN Departments
JOIN Locations
```

every day.

---

Without View:

Write long query repeatedly.

---

With View:

```sql
SELECT *
FROM EmployeeReport;
```

---

Benefits:

✅ Simplicity

✅ Reusability

✅ Security

✅ Consistency

---

# 3️⃣ How Views Work

Consider:

```sql
CREATE VIEW EmployeeView
AS

SELECT EmployeeName,
       Salary
FROM Employees;
```

---

SQL stores:

```text
Query Definition
```

---

Not:

```text
Actual Data
```

---

When:

```sql
SELECT *
FROM EmployeeView;
```

runs:

SQL executes underlying query.

---

# View Architecture

```text
User
 │
 ▼
View
 │
 ▼
Base Tables
```

---

# 4️⃣ Creating Views

---

## Syntax

```sql
CREATE VIEW ViewName
AS

SELECT Columns
FROM TableName;
```

---

## Example

```sql
CREATE VIEW EmployeeDetails
AS

SELECT EmployeeID,
       EmployeeName,
       Salary
FROM Employees;
```

---

# Query View

```sql
SELECT *
FROM EmployeeDetails;
```

---

# Complex View

```sql
CREATE VIEW EmployeeDepartmentView
AS

SELECT E.EmployeeID,
       E.EmployeeName,
       D.DepartmentName

FROM Employees E

INNER JOIN Departments D

ON E.DepartmentID = D.DepartmentID;
```

---

# Result

Joined data available as a simple table.

---

# 5️⃣ Querying Views

Views are queried exactly like tables.

---

Example

```sql
SELECT *
FROM EmployeeDepartmentView;
```

---

Filtering

```sql
SELECT *
FROM EmployeeDepartmentView
WHERE DepartmentName = 'IT';
```

---

Sorting

```sql
SELECT *
FROM EmployeeDepartmentView
ORDER BY EmployeeName;
```

---

# Key Point

Users often don't know underlying table structure.

---

# 6️⃣ Updating Views

Some views can be updated.

---

Example

```sql
CREATE VIEW EmployeeBasicInfo
AS

SELECT EmployeeID,
       EmployeeName
FROM Employees;
```

---

Update Through View

```sql
UPDATE EmployeeBasicInfo
SET EmployeeName = 'Kunal Yadav'
WHERE EmployeeID = 101;
```

---

Underlying table updates automatically.

---

# Conditions for Updatable Views

Generally:

✅ Single table

✅ No GROUP BY

✅ No Aggregate Functions

✅ No DISTINCT

---

# Usually Not Updatable

```sql
GROUP BY
JOIN
UNION
Aggregate Functions
```

---

# 7️⃣ Altering Views

Modify existing views.

---

## Syntax

```sql
ALTER VIEW ViewName
AS

SELECT ...
```

---

Example

Original View

```sql
CREATE VIEW EmployeeView
AS

SELECT EmployeeName
FROM Employees;
```

---

Modify

```sql
ALTER VIEW EmployeeView
AS

SELECT EmployeeName,
       Salary
FROM Employees;
```

---

View updated.

---

# 8️⃣ Dropping Views

Remove a view permanently.

---

## Syntax

```sql
DROP VIEW ViewName;
```

---

Example

```sql
DROP VIEW EmployeeView;
```

---

Result

```text
View deleted
```

---

Base tables remain unaffected.

---

# Important

```sql
DROP VIEW EmployeeView;
```

does NOT delete:

```text
Employees table
Data
```

---

# 9️⃣ Advantages of Views

---

# Simplicity

Complex queries become simple.

---

Without View

```sql
SELECT ...
FROM A
JOIN B
JOIN C
```

---

With View

```sql
SELECT *
FROM SalesReport;
```

---

# Security

Hide sensitive columns.

---

Example

Hide:

```text
Salary
Bank Account
SSN
```

---

View exposes only required data.

---

# Consistency

Everyone uses same logic.

---

# Reusability

Create once.

Use many times.

---

# Business Reporting

Very common in dashboards.

---

# 🔟 Limitations of Views

---

# Performance

Complex views may execute slowly.

---

# No Data Storage

Standard views do not store results.

---

# Update Restrictions

Many views cannot be updated.

---

# Dependency Issues

If underlying table changes:

```sql
DROP COLUMN
RENAME COLUMN
```

View may fail.

---

# 1️⃣1️⃣ Security with Views

One of the most important use cases.

---

Example

Employees Table

| EmployeeID | EmployeeName | Salary |
|------------|-------------|---------|

---

Management wants:

```text
Employee Names Only
```

---

Create View

```sql
CREATE VIEW EmployeePublicView
AS

SELECT EmployeeID,
       EmployeeName
FROM Employees;
```

---

Users access:

```sql
EmployeePublicView
```

---

Salary remains hidden.

---

# Real-World Uses

- HR Systems
- Finance Reports
- Customer Data Access
- Compliance Requirements

---

# 1️⃣2️⃣ Common Mistakes

---

# Using SELECT *

Bad:

```sql
CREATE VIEW EmployeeView
AS

SELECT *
FROM Employees;
```

---

If table changes:

View behavior changes.

---

Better:

```sql
SELECT EmployeeID,
       EmployeeName
```

---

# Complex Nested Views

View based on View based on View.

---

Hard to maintain.

---

# Forgetting Dependencies

Dropping columns can break views.

---

# Performance Problems

Large joins inside views.

---

# 1️⃣3️⃣ Best Practices

---

## Use Explicit Column Names

Good:

```sql
SELECT EmployeeID,
       EmployeeName
```

---

## Use Meaningful Names

Good:

```text
EmployeeReportView
SalesSummaryView
```

---

## Document Purpose

Every view should have clear business purpose.

---

## Avoid Deep Nesting

Keep view hierarchy simple.

---

## Use Views for Security

Hide sensitive data.

---

# Professional Example

```sql
CREATE VIEW EmployeeReportView
AS

SELECT E.EmployeeID,
       E.EmployeeName,
       D.DepartmentName

FROM Employees E

INNER JOIN Departments D

ON E.DepartmentID = D.DepartmentID;
```

---

# 1️⃣4️⃣ Common Interview Questions

---

## What is a View?

A virtual table based on a query.

---

## Does a View Store Data?

Normally no.

Stores query definition.

---

## Difference Between Table and View?

Table stores data.

View stores query logic.

---

## Can Views Be Updated?

Some can.

Depends on complexity.

---

## Why Use Views?

Security, simplicity, reusability.

---

## What Happens When a View Is Dropped?

Only view removed.

Underlying tables remain.

---

# 1️⃣5️⃣ Business Analytics Examples

---

# Employee Report

```sql
CREATE VIEW EmployeeReport
AS

SELECT EmployeeID,
       EmployeeName,
       Salary

FROM Employees;
```

---

# Department Dashboard

```sql
CREATE VIEW DepartmentDashboard
AS

SELECT DepartmentID,
       COUNT(*) AS Employees

FROM Employees

GROUP BY DepartmentID;
```

---

# Sales Summary

```sql
CREATE VIEW SalesSummary
AS

SELECT ProductID,
       SUM(SalesAmount) AS TotalSales

FROM Sales

GROUP BY ProductID;
```

---

# Customer Analytics

```sql
CREATE VIEW CustomerAnalytics
AS

SELECT CustomerID,
       COUNT(*) AS Orders

FROM Orders

GROUP BY CustomerID;
```

---

# KPI Reporting Layer

Views are often created specifically for:

```text
Power BI
Tableau
Looker
SSRS
Excel Dashboards
```

---

# 📝 Summary

In this module, you learned:

✅ CREATE VIEW

✅ Querying Views

✅ Updating Views

✅ ALTER VIEW

✅ DROP VIEW

✅ Security Benefits

✅ View Limitations

✅ Reporting Use Cases

---

# 🧠 Practice Questions

## Theory

1. What is a View?
2. Why are Views used?
3. Does a View store data?
4. Difference between Table and View?
5. How do you create a View?
6. How do you modify a View?
7. How do you delete a View?
8. What are View advantages?
9. What are View limitations?
10. How do Views improve security?

---

## Practical Exercises

### Task 1

Create:

```sql
EmployeeView
```

showing employee details.

---

### Task 2

Create a JOIN-based View.

---

### Task 3

Modify a View using:

```sql
ALTER VIEW
```

---

### Task 4

Drop a View.

---

### Task 5

Create a security-focused View hiding salary data.

---

### Task 6

Create a summary View using:

```sql
GROUP BY
```

---

### Challenge Project

Create:

```text
Employees
Departments
Orders
Customers
Sales
```

Build:

- Employee Report View
- Department Dashboard View
- Sales Summary View
- Customer Analytics View

for a reporting environment.

---

# 🚀 Next Module

➡ **Module 20: Indexes**

Topics Covered:

- What are Indexes?
- Clustered Index
- Non-Clustered Index
- Unique Index
- Composite Index
- Index Performance
- Index Maintenance
- Query Optimization
- Execution Plans