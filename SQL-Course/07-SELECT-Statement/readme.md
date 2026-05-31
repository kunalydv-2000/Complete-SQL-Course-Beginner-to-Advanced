# Module 7: SELECT Statement

> The `SELECT` statement is the most frequently used SQL command. It is used to retrieve data from one or more tables and forms the foundation of data analysis, reporting, dashboards, and business intelligence.

---

# 📖 Introduction

Databases store data, but stored data has little value unless it can be retrieved and analyzed.

The `SELECT` statement allows us to:

- View records
- Retrieve specific columns
- Filter information
- Perform calculations
- Generate reports
- Prepare data for dashboards

Almost every SQL query starts with a SELECT statement.

---

# 🎯 Learning Objectives

After completing this module, you will be able to:

✅ Retrieve data from tables

✅ Select specific columns

✅ Use aliases

✅ Remove duplicates

✅ Retrieve limited records

✅ Create calculated columns

✅ Understand query execution basics

✅ Write production-quality SELECT queries

---

# 📚 Table of Contents

1. What is SELECT?
2. SELECT Syntax
3. SELECT *
4. Selecting Specific Columns
5. Column Aliases
6. DISTINCT
7. TOP Clause
8. Expressions and Calculations
9. Calculated Columns
10. Query Processing Order
11. Common Mistakes
12. Best Practices
13. Summary
14. Practice Questions

---

# 1️⃣ What is SELECT?

The `SELECT` statement retrieves data from database tables.

---

## Example

Table:

| EmployeeID | EmployeeName | Salary |
|------------|-------------|---------|
| 101 | Kunal | 45000 |
| 102 | Rahul | 50000 |

Query:

```sql
SELECT *
FROM Employees;
```

Output:

| EmployeeID | EmployeeName | Salary |
|------------|-------------|---------|
| 101 | Kunal | 45000 |
| 102 | Rahul | 50000 |

---

# Why SELECT is Important

Used for:

- Reporting
- Dashboards
- Analytics
- Business Intelligence
- Data Extraction

---

# 2️⃣ SELECT Syntax

Basic syntax:

```sql
SELECT Column1, Column2
FROM TableName;
```

---

## Example

```sql
SELECT EmployeeName,
       Salary
FROM Employees;
```

Output:

| EmployeeName | Salary |
|-------------|---------|
| Kunal | 45000 |
| Rahul | 50000 |

---

# SELECT Statement Structure

```sql
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
```

These clauses will be studied in later modules.

---

# 3️⃣ SELECT *

The asterisk (*) means:

```text
Retrieve all columns
```

---

## Syntax

```sql
SELECT *
FROM Employees;
```

---

## Example

Table:

| EmployeeID | EmployeeName | Salary | City |
|------------|-------------|---------|------|
| 101 | Kunal | 45000 | Delhi |

Query:

```sql
SELECT *
FROM Employees;
```

Output:

| EmployeeID | EmployeeName | Salary | City |
|------------|-------------|---------|------|
| 101 | Kunal | 45000 | Delhi |

---

# Advantages

✅ Quick

✅ Useful during learning

---

# Disadvantages

❌ Retrieves unnecessary data

❌ Slower for large tables

❌ Not recommended in production systems

---

# 4️⃣ Selecting Specific Columns

Instead of retrieving everything, select only required columns.

---

## Example

```sql
SELECT EmployeeName,
       Salary
FROM Employees;
```

Output:

| EmployeeName | Salary |
|-------------|---------|
| Kunal | 45000 |
| Rahul | 50000 |

---

# Benefits

✅ Faster queries

✅ Reduced memory usage

✅ Better readability

---

# Example

```sql
SELECT ProductName,
       Price
FROM Products;
```

---

# 5️⃣ Column Aliases

Aliases provide temporary names to columns.

---

## Syntax

```sql
SELECT ColumnName AS AliasName
FROM TableName;
```

---

## Example

```sql
SELECT EmployeeName AS Name
FROM Employees;
```

Output:

| Name |
|------|
| Kunal |
| Rahul |

---

# Alias Without AS

```sql
SELECT EmployeeName Name
FROM Employees;
```

Also valid.

---

# Example

```sql
SELECT Salary AS MonthlySalary
FROM Employees;
```

---

# Multiple Aliases

```sql
SELECT EmployeeID AS ID,
       EmployeeName AS Name,
       Salary AS MonthlySalary
FROM Employees;
```

---

# Why Use Aliases?

Improves readability.

---

Bad:

```text
EmployeeName
```

---

Better:

```text
Employee Name
```

---

Example:

```sql
SELECT EmployeeName AS [Employee Name]
FROM Employees;
```

---

# 6️⃣ DISTINCT

Used to remove duplicate values.

---

# Example Table

| City |
|------|
| Delhi |
| Delhi |
| Mumbai |
| Pune |

---

Query:

```sql
SELECT DISTINCT City
FROM Employees;
```

Output:

| City |
|------|
| Delhi |
| Mumbai |
| Pune |

---

# Without DISTINCT

```sql
SELECT City
FROM Employees;
```

Output:

```text
Delhi
Delhi
Mumbai
Pune
```

---

# Multiple Columns

```sql
SELECT DISTINCT City,
                Department
FROM Employees;
```

Duplicates removed based on the combination.

---

# Use Cases

- Unique customers
- Unique cities
- Unique products
- Reporting

---

# 7️⃣ TOP Clause

Returns a limited number of records.

---

## Syntax

```sql
SELECT TOP 5 *
FROM Employees;
```

---

Output:

First 5 rows.

---

# Example

```sql
SELECT TOP 3
       EmployeeName,
       Salary
FROM Employees;
```

---

# TOP with Percentage

```sql
SELECT TOP 10 PERCENT *
FROM Employees;
```

Returns:

```text
Top 10% rows
```

---

# TOP with ORDER BY

```sql
SELECT TOP 5 *
FROM Employees
ORDER BY Salary DESC;
```

Returns:

```text
Highest 5 salaries
```

---

# Real-World Use Cases

- Top Customers
- Top Products
- Top Employees
- Sample Data

---

# 8️⃣ Expressions and Calculations

SQL can perform calculations directly inside SELECT.

---

# Example

```sql
SELECT 10 + 5;
```

Output:

```text
15
```

---

# Example

```sql
SELECT Salary + 5000
FROM Employees;
```

---

Output

| Salary + 5000 |
|---------------|
| 50000 |
| 55000 |

---

# Arithmetic Operators

| Operator | Meaning |
|-----------|-----------|
| + | Addition |
| - | Subtraction |
| * | Multiplication |
| / | Division |
| % | Modulus |

---

# Example

```sql
SELECT 100 * 5;
```

Output:

```text
500
```

---

# 9️⃣ Calculated Columns

Create new values dynamically.

---

## Example

Table:

| EmployeeName | Salary |
|-------------|---------|
| Kunal | 45000 |

---

Query:

```sql
SELECT EmployeeName,
       Salary,
       Salary * 12 AS AnnualSalary
FROM Employees;
```

Output:

| EmployeeName | Salary | AnnualSalary |
|-------------|---------|-------------|
| Kunal | 45000 | 540000 |

---

# Example

```sql
SELECT ProductName,
       Price,
       Price * 0.18 AS GST
FROM Products;
```

---

# Business Applications

- Annual Salary
- Profit Calculation
- Tax Calculation
- Revenue Calculation

---

# 🔟 Query Processing Order

When SQL executes:

```sql
SELECT EmployeeName
FROM Employees;
```

Database processes:

```text
1. FROM
2. SELECT
```

---

Example:

```sql
SELECT EmployeeName
FROM Employees
WHERE Salary > 50000;
```

Actual execution:

```text
1. FROM
2. WHERE
3. SELECT
```

---

# Why Important?

Helps understand:

- Filtering
- Aggregation
- Query optimization

---

# 1️⃣1️⃣ Common Mistakes

---

# Misspelled Column Names

Bad:

```sql
SELECT EmployeName
FROM Employees;
```

Error:

```text
Invalid column name
```

---

# Selecting Non-Existing Columns

Bad:

```sql
SELECT Bonus
FROM Employees;
```

Error:

```text
Column does not exist
```

---

# Using SELECT *

Bad for production:

```sql
SELECT *
FROM Employees;
```

---

Better:

```sql
SELECT EmployeeID,
       EmployeeName
FROM Employees;
```

---

# Missing Commas

Bad:

```sql
SELECT EmployeeID
EmployeeName
FROM Employees;
```

Error.

---

Correct:

```sql
SELECT EmployeeID,
       EmployeeName
FROM Employees;
```

---

# 1️⃣2️⃣ Best Practices

---

## Select Only Needed Columns

Good:

```sql
SELECT EmployeeName,
       Salary
FROM Employees;
```

---

## Avoid SELECT *

In production systems.

---

## Use Meaningful Aliases

Good:

```sql
Salary AS MonthlySalary
```

---

## Format Queries Properly

Readable SQL is easier to maintain.

---

## Use Calculated Columns Carefully

Verify calculations.

---

# Example of Well-Written Query

```sql
SELECT EmployeeID,
       EmployeeName AS [Employee Name],
       Salary,
       Salary * 12 AS AnnualSalary
FROM Employees;
```

---

# Real-World Example

Employee Report:

```sql
SELECT EmployeeID,
       EmployeeName AS [Employee Name],
       Salary,
       Salary * 12 AS AnnualSalary
FROM Employees;
```

Output:

| EmployeeID | Employee Name | Salary | AnnualSalary |
|------------|--------------|---------|-------------|
| 101 | Kunal | 45000 | 540000 |
| 102 | Rahul | 50000 | 600000 |

---

# 📝 Summary

In this module, you learned:

✅ SELECT Statement

✅ SELECT *

✅ Specific Columns

✅ Aliases

✅ DISTINCT

✅ TOP Clause

✅ Expressions

✅ Calculated Columns

✅ Query Processing Basics

✅ Best Practices

---

# 🧠 Practice Questions

## Theory

1. What is the SELECT statement?
2. What does SELECT * mean?
3. Why should SELECT * be avoided in production?
4. What is an alias?
5. What is DISTINCT?
6. What is the TOP clause?
7. What are calculated columns?
8. What is query processing order?
9. What are arithmetic operators in SQL?
10. Why select only required columns?

---

## Practical Exercises

### Task 1

Create:

```sql
Employees
```

Insert 10 records.

Retrieve:

```sql
SELECT *
FROM Employees;
```

---

### Task 2

Display only:

```text
EmployeeName
Salary
```

---

### Task 3

Use aliases:

```text
Employee Name
Monthly Salary
```

---

### Task 4

Find unique cities using:

```sql
DISTINCT
```

---

### Task 5

Display:

```text
Top 5 employees
```

using:

```sql
TOP
```

---

### Task 6

Create calculated column:

```sql
AnnualSalary = Salary * 12
```

---

### Challenge Project

Create:

```sql
Products
```

Table.

Generate a report showing:

- Product Name
- Price
- GST (18%)
- Final Price

using calculated columns.

---


# 🚀 Next Module

➡ **Module 8: Filtering Data with WHERE Clause**

Topics Covered:

- WHERE Clause
- Comparison Operators
- Logical Operators
- BETWEEN
- IN
- LIKE
- Wildcards
- NULL Handling
- Advanced Filtering Techniques