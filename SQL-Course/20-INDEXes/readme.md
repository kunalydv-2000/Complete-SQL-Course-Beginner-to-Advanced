# Module 20: Indexes

> Indexes are database objects that improve the speed of data retrieval operations. They work similarly to the index of a book, allowing SQL Server to locate data quickly without scanning the entire table.

---

# 📖 Introduction

Imagine a table containing:

```text
10,000,000 Employees
```

You execute:

```sql
SELECT *
FROM Employees
WHERE EmployeeID = 1001;
```

Without an index:

```text
SQL may scan millions of rows.
```

With an index:

```text
SQL can directly locate the required row.
```

This is why indexes are critical for database performance.

---

# 🎯 Learning Objectives

After completing this module, you will be able to:

✅ Understand indexes

✅ Understand clustered indexes

✅ Understand non-clustered indexes

✅ Create indexes

✅ Drop indexes

✅ Use composite indexes

✅ Understand index performance

✅ Optimize SQL queries

---

# 📚 Table of Contents

1. What is an Index?
2. Why Indexes are Needed
3. How Indexes Work
4. Clustered Index
5. Non-Clustered Index
6. Unique Index
7. Composite Index
8. Creating Indexes
9. Dropping Indexes
10. Index Advantages
11. Index Disadvantages
12. Index Maintenance
13. Execution Plans
14. Best Practices
15. Interview Questions
16. Business Analytics Examples
17. Summary
18. Practice Questions

---

# 1️⃣ What is an Index?

An index is a special lookup structure that helps SQL Server find rows faster.

---

# Book Example

Without index:

```text
Read every page.
```

---

With index:

```text
Find topic in index.
Jump directly to page.
```

---

Databases use the same concept.

---

# Example

Table:

| EmployeeID | EmployeeName |
|------------|-------------|
| 1 | Kunal |
| 2 | Rahul |
| 3 | Aman |

---

Query:

```sql
SELECT *
FROM Employees
WHERE EmployeeID = 3;
```

---

Index helps SQL locate:

```text
EmployeeID = 3
```

quickly.

---

# Why Indexes Matter

Used for:

- Faster Searches
- Faster Joins
- Faster Sorting
- Faster Reporting
- Better Dashboard Performance

---

# 2️⃣ Why Indexes are Needed

Consider:

```text
1 Million Rows
```

---

Without Index

```text
Table Scan
```

SQL checks every row.

---

With Index

```text
Index Seek
```

SQL directly finds matching rows.

---

# Performance Difference

Example:

Without Index

```text
5 Seconds
```

---

With Index

```text
50 Milliseconds
```

---

# 3️⃣ How Indexes Work

Most database systems use:

```text
B-Tree Structure
```

---

Structure:

```text
Root
 │
 ├── Branch
 │
 └── Leaf Nodes
```

---

SQL navigates the tree.

Instead of reading:

```text
Every Row
```

it jumps directly to required data.

---

# Simplified Example

```text
EmployeeID

1
2
3
4
5
...
```

Index stores ordered references.

---

# Benefits

```text
Fast Search
Fast Sorting
Fast Filtering
```

---

# 4️⃣ Clustered Index

Most important index type.

---

# Definition

A clustered index determines the physical order of data inside a table.

---

# Key Rule

```text
Only ONE Clustered Index Per Table
```

---

# Why?

A table can only be physically sorted one way.

---

# Example

```sql
CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100)
);
```

---

SQL Server automatically creates:

```text
Clustered Index
```

on Primary Key by default.

---

# Data Storage

```text
1
2
3
4
5
```

stored physically in order.

---

# Best For

```sql
Primary Keys
Date Columns
Frequently Sorted Data
```

---

# 5️⃣ Non-Clustered Index

Most commonly created manually.

---

# Definition

Stores:

```text
Indexed Values
+
Pointer to Actual Data
```

---

# Example

```sql
CREATE NONCLUSTERED INDEX IX_EmployeeName
ON Employees(EmployeeName);
```

---

# Structure

```text
EmployeeName
     │
     ▼
Pointer
     │
     ▼
Actual Row
```

---

# Key Rule

```text
Multiple Non-Clustered Indexes Allowed
```

---

Example

```sql
EmployeeName
Email
City
DepartmentID
```

can all have indexes.

---

# Best For

```sql
WHERE
JOIN
ORDER BY
```

columns.

---

# 6️⃣ Unique Index

Prevents duplicate values.

---

Example

```sql
CREATE UNIQUE INDEX IX_Email
ON Employees(Email);
```

---

Allowed

```text
abc@email.com
xyz@email.com
```

---

Not Allowed

```text
abc@email.com
abc@email.com
```

---

Error occurs.

---

# Why Use Unique Index?

Ensures data integrity.

---

Examples

```text
Email
Username
Passport Number
PAN Number
```

---

# 7️⃣ Composite Index

Index built on multiple columns.

---

Example

```sql
CREATE INDEX IX_Employee
ON Employees
(
    DepartmentID,
    Salary
);
```

---

# Useful Query

```sql
SELECT *
FROM Employees
WHERE DepartmentID = 1
AND Salary > 50000;
```

---

# Order Matters

Good:

```sql
(DepartmentID, Salary)
```

---

Query

```sql
WHERE DepartmentID = 1
```

uses index.

---

Query

```sql
WHERE Salary > 50000
```

may not fully use it.

---

# Left-Most Rule

Most databases use:

```text
First Column First
```

---

# 8️⃣ Creating Indexes

---

# Create Non-Clustered Index

```sql
CREATE INDEX IX_EmployeeName
ON Employees(EmployeeName);
```

---

# Create Unique Index

```sql
CREATE UNIQUE INDEX IX_Email
ON Employees(Email);
```

---

# Create Composite Index

```sql
CREATE INDEX IX_DepartmentSalary
ON Employees
(
    DepartmentID,
    Salary
);
```

---

# View Existing Indexes

```sql
sp_helpindex Employees;
```

---

# 9️⃣ Dropping Indexes

Remove indexes when no longer needed.

---

## Syntax

```sql
DROP INDEX IndexName
ON TableName;
```

---

## Example

```sql
DROP INDEX IX_EmployeeName
ON Employees;
```

---

# Important

Only index removed.

Data remains.

---

# 🔟 Index Advantages

---

# Faster Searches

```sql
WHERE EmployeeID = 100
```

---

# Faster Joins

```sql
JOIN Employees
ON DepartmentID
```

---

# Faster Sorting

```sql
ORDER BY EmployeeName
```

---

# Faster Aggregation

```sql
GROUP BY DepartmentID
```

---

# Better Dashboard Performance

Large reports execute faster.

---

# 1️⃣1️⃣ Index Disadvantages

---

# Additional Storage

Indexes consume disk space.

---

# Slower INSERT

Example

```sql
INSERT
```

must update indexes.

---

# Slower UPDATE

Modified values require index updates.

---

# Slower DELETE

Index entries removed too.

---

# Too Many Indexes

Can reduce performance.

---

# Example

Bad:

```text
20 indexes
on
small table
```

---

# 1️⃣2️⃣ Index Maintenance

Indexes become fragmented over time.

---

# Why?

Due to:

```text
INSERT
UPDATE
DELETE
```

operations.

---

# Reorganize

Light maintenance.

```sql
ALTER INDEX ALL
ON Employees
REORGANIZE;
```

---

# Rebuild

Heavy maintenance.

```sql
ALTER INDEX ALL
ON Employees
REBUILD;
```

---

# Monitor Fragmentation

Using SQL Server DMVs.

Advanced topic.

---

# 1️⃣3️⃣ Execution Plans

Execution plans show:

```text
How SQL Executes Queries
```

---

Types:

```text
Index Seek
Index Scan
Table Scan
```

---

# Best

```text
Index Seek
```

---

# Worst

```text
Table Scan
```

on large tables.

---

# Example

Query

```sql
SELECT *
FROM Employees
WHERE EmployeeID = 100;
```

---

With Index

```text
Index Seek
```

---

Without Index

```text
Table Scan
```

---

# 1️⃣4️⃣ Best Practices

---

## Index Frequently Searched Columns

Good

```sql
EmployeeID
Email
DepartmentID
```

---

## Index Join Columns

Good

```sql
Foreign Keys
```

---

## Avoid Too Many Indexes

Balance read and write performance.

---

## Use Composite Indexes Carefully

Order columns properly.

---

## Monitor Execution Plans

Verify index usage.

---

## Review Unused Indexes

Remove unnecessary ones.

---

# Professional Example

```sql
CREATE INDEX IX_Orders_CustomerID
ON Orders(CustomerID);
```

---

Reason:

```sql
JOIN Customers
```

occurs frequently.

---

# 1️⃣5️⃣ Common Interview Questions

---

## What is an Index?

Improves query performance.

---

## Difference Between Clustered and Non-Clustered Index?

Clustered:

```text
Sorts actual data.
```

---

Non-Clustered:

```text
Stores pointers.
```

---

## How Many Clustered Indexes?

```text
One
```

per table.

---

## How Many Non-Clustered Indexes?

```text
Many
```

---

## Why Can Indexes Slow Down Inserts?

Indexes must also be updated.

---

## What is a Composite Index?

Multiple columns in one index.

---

## What is an Index Seek?

Direct lookup using an index.

---

# 1️⃣6️⃣ Business Analytics Examples

---

# Employee Search Optimization

```sql
CREATE INDEX IX_EmployeeID
ON Employees(EmployeeID);
```

---

# Customer Lookup

```sql
CREATE INDEX IX_CustomerEmail
ON Customers(Email);
```

---

# Sales Dashboard

```sql
CREATE INDEX IX_Sales_Date
ON Sales(SaleDate);
```

---

# Revenue Analysis

```sql
CREATE INDEX IX_Department
ON Employees(DepartmentID);
```

---

# Order Analytics

```sql
CREATE INDEX IX_OrderDate
ON Orders(OrderDate);
```

---

# Data Warehouse Example

Fact Tables often contain:

```text
Millions of Rows
```

Indexes are critical for:

```text
Power BI
Tableau
SSRS
```

performance.

---

# 📝 Summary

In this module, you learned:

✅ Index Basics

✅ Clustered Index

✅ Non-Clustered Index

✅ Unique Index

✅ Composite Index

✅ Creating Indexes

✅ Dropping Indexes

✅ Execution Plans

✅ Index Maintenance

✅ Performance Optimization

---

# 🧠 Practice Questions

## Theory

1. What is an Index?
2. Why are Indexes needed?
3. What is a Clustered Index?
4. What is a Non-Clustered Index?
5. How many Clustered Indexes can a table have?
6. What is a Composite Index?
7. What is a Unique Index?
8. Why can indexes slow down INSERT statements?
9. What is an Index Seek?
10. What is a Table Scan?

---

## Practical Exercises

### Task 1

Create a non-clustered index on EmployeeName.

---

### Task 2

Create a unique index on Email.

---

### Task 3

Create a composite index.

---

### Task 4

Drop an index.

---

### Task 5

Compare query performance:

```sql
Before Index
After Index
```

---

### Task 6

View table indexes using:

```sql
sp_helpindex
```

---

### Challenge Project

Create:

```text
Employees
Customers
Orders
Sales
Products
```

Add indexes for:

- Primary Keys
- Foreign Keys
- Search Columns
- Reporting Columns

Analyze:

- Query Speed
- Execution Plans
- Index Usage

---

# 🚀 Next Module

➡ **Module 21: Stored Procedures**

Topics Covered:

- What are Stored Procedures?
- Creating Procedures
- Executing Procedures
- Input Parameters
- Output Parameters
- Error Handling
- Performance Benefits
- Real-World Applications