# Module 10: Aggregate Functions

> Aggregate functions perform calculations on multiple rows and return a single summarized value. They are among the most important tools in SQL for reporting, business intelligence, and data analytics.

---

# 📖 Introduction

Imagine a company database containing thousands of employees.

Instead of viewing every employee record individually, management may ask:

- How many employees are there?
- What is the total salary expense?
- What is the average salary?
- What is the highest salary?
- What is the lowest salary?

Aggregate functions answer these questions.

---

# 🎯 Learning Objectives

After completing this module, you will be able to:

✅ Understand aggregate functions

✅ Use COUNT()

✅ Use SUM()

✅ Use AVG()

✅ Use MIN()

✅ Use MAX()

✅ Handle NULL values correctly

✅ Apply aggregates in business scenarios

✅ Write analytical SQL queries

---

# 📚 Table of Contents

1. What are Aggregate Functions?
2. Aggregate Function Rules
3. COUNT()
4. SUM()
5. AVG()
6. MIN()
7. MAX()
8. Aggregate Functions and NULL Values
9. Multiple Aggregate Functions
10. Aggregate Functions with WHERE
11. Business Analytics Examples
12. Common Mistakes
13. Best Practices
14. Summary
15. Practice Questions

---

# 1️⃣ What are Aggregate Functions?

Aggregate functions perform calculations on a set of rows and return a single result.

---

## Example Table

| EmployeeID | EmployeeName | Salary |
|------------|-------------|---------|
| 101 | Kunal | 45000 |
| 102 | Rahul | 50000 |
| 103 | Aman | 60000 |

---

Question:

```text
What is the total salary?
```

Aggregate Function:

```sql
SELECT SUM(Salary)
FROM Employees;
```

Output:

```text
155000
```

---

# Why Aggregate Functions Matter

Used in:

- Dashboards
- Reports
- KPI calculations
- Financial analysis
- Business intelligence

---

# Common Aggregate Functions

| Function | Purpose |
|-----------|----------|
| COUNT() | Counts rows |
| SUM() | Adds values |
| AVG() | Calculates average |
| MIN() | Smallest value |
| MAX() | Largest value |

---

# 2️⃣ Aggregate Function Rules

Aggregate functions:

✅ Work on multiple rows

✅ Return a single value

✅ Ignore NULL values (except COUNT(*))

---

Example:

```sql
SELECT AVG(Salary)
FROM Employees;
```

Returns one value.

---

# 3️⃣ COUNT()

Used to count records.

---

# COUNT(*)

Counts all rows.

---

Example

```sql
SELECT COUNT(*)
FROM Employees;
```

Output:

```text
100
```

Meaning:

```text
100 rows exist
```

---

# Example Table

| EmployeeID | Name |
|------------|------|
| 101 | Kunal |
| 102 | Rahul |
| 103 | Aman |

---

Query

```sql
SELECT COUNT(*)
FROM Employees;
```

Output:

```text
3
```

---

# COUNT(ColumnName)

Counts only non-NULL values.

---

Example

| EmployeeID | Bonus |
|------------|-------|
| 101 | 5000 |
| 102 | NULL |
| 103 | 2000 |

---

Query

```sql
SELECT COUNT(Bonus)
FROM Employees;
```

Output:

```text
2
```

---

NULL is ignored.

---

# COUNT(DISTINCT)

Counts unique values.

---

Example

| City |
|------|
| Delhi |
| Delhi |
| Mumbai |
| Pune |

---

Query

```sql
SELECT COUNT(DISTINCT City)
FROM Employees;
```

Output:

```text
3
```

---

# Real-World Uses

- Number of customers
- Number of orders
- Number of products
- Unique cities

---

# 4️⃣ SUM()

Adds numeric values.

---

Example Table

| Salary |
|---------|
| 45000 |
| 50000 |
| 60000 |

---

Query

```sql
SELECT SUM(Salary)
FROM Employees;
```

Output

```text
155000
```

---

# Example

```sql
SELECT SUM(Quantity)
FROM Orders;
```

---

# Real-World Uses

- Total Revenue
- Total Sales
- Total Expenses
- Total Quantity Sold

---

# 5️⃣ AVG()

Calculates average value.

---

Formula

```text
Total ÷ Count
```

---

Example

| Salary |
|---------|
| 45000 |
| 50000 |
| 60000 |

---

Query

```sql
SELECT AVG(Salary)
FROM Employees;
```

Output

```text
51666.67
```

---

# Example

```sql
SELECT AVG(Marks)
FROM Students;
```

---

# Real-World Uses

- Average Salary
- Average Revenue
- Average Customer Spend
- Average Rating

---

# 6️⃣ MIN()

Returns the smallest value.

---

Example

| Salary |
|---------|
| 45000 |
| 50000 |
| 60000 |

---

Query

```sql
SELECT MIN(Salary)
FROM Employees;
```

Output

```text
45000
```

---

# Works on Dates

Example

```sql
SELECT MIN(OrderDate)
FROM Orders;
```

Output

```text
Earliest order date
```

---

# Real-World Uses

- Lowest Salary
- Cheapest Product
- Earliest Order
- Minimum Score

---

# 7️⃣ MAX()

Returns largest value.

---

Example

```sql
SELECT MAX(Salary)
FROM Employees;
```

Output

```text
60000
```

---

# Works on Dates

Example

```sql
SELECT MAX(OrderDate)
FROM Orders;
```

Output

```text
Latest order date
```

---

# Real-World Uses

- Highest Salary
- Highest Revenue
- Latest Transaction
- Maximum Score

---

# 8️⃣ Aggregate Functions and NULL Values

Aggregate functions generally ignore NULL values.

---

Example Table

| Salary |
|---------|
| 45000 |
| NULL |
| 60000 |

---

# COUNT(*)

```sql
SELECT COUNT(*)
FROM Employees;
```

Output

```text
3
```

Counts all rows.

---

# COUNT(Salary)

```sql
SELECT COUNT(Salary)
FROM Employees;
```

Output

```text
2
```

NULL ignored.

---

# AVG(Salary)

```sql
SELECT AVG(Salary)
FROM Employees;
```

Output

```text
52500
```

Computed using:

```text
45000 + 60000
```

Only.

---

# Important Rule

Aggregate functions ignore NULL values except:

```sql
COUNT(*)
```

---

# 9️⃣ Multiple Aggregate Functions

You can use multiple aggregates in one query.

---

Example

```sql
SELECT COUNT(*) AS TotalEmployees,

       SUM(Salary) AS TotalSalary,

       AVG(Salary) AS AverageSalary,

       MIN(Salary) AS LowestSalary,

       MAX(Salary) AS HighestSalary

FROM Employees;
```

---

Output

| Metric | Value |
|---------|---------|
| TotalEmployees | 100 |
| TotalSalary | 5000000 |
| AverageSalary | 50000 |
| LowestSalary | 25000 |
| HighestSalary | 150000 |

---

# 🔟 Aggregate Functions with WHERE

Aggregates can be combined with filtering.

---

Example

```sql
SELECT AVG(Salary)
FROM Employees
WHERE Department = 'IT';
```

---

Meaning:

```text
Average salary of IT employees only
```

---

Example

```sql
SELECT COUNT(*)
FROM Orders
WHERE OrderDate >= '2025-01-01';
```

---

Meaning:

```text
Orders placed in 2025
```

---

# 1️⃣1️⃣ Business Analytics Examples

---

# Total Revenue

```sql
SELECT SUM(SalesAmount)
FROM Sales;
```

---

# Average Order Value

```sql
SELECT AVG(OrderAmount)
FROM Orders;
```

---

# Highest Paid Employee

```sql
SELECT MAX(Salary)
FROM Employees;
```

---

# Total Customers

```sql
SELECT COUNT(*)
FROM Customers;
```

---

# Number of Unique Cities

```sql
SELECT COUNT(DISTINCT City)
FROM Customers;
```

---

# KPI Dashboard Query

```sql
SELECT COUNT(*) AS TotalOrders,

       SUM(OrderAmount) AS Revenue,

       AVG(OrderAmount) AS AvgOrderValue,

       MAX(OrderAmount) AS HighestOrder,

       MIN(OrderAmount) AS LowestOrder
FROM Orders;
```

---

# 1️⃣2️⃣ Common Mistakes

---

# Using SUM on Text

Bad

```sql
SELECT SUM(EmployeeName)
FROM Employees;
```

Error.

---

SUM requires numeric data.

---

# Forgetting NULL Behavior

Incorrect assumptions can produce wrong results.

---

# COUNT(Column) vs COUNT(*)

Example

```sql
COUNT(*)
```

Counts all rows.

---

```sql
COUNT(Salary)
```

Counts non-NULL salaries only.

---

# Wrong Data Type

Using AVG on text columns.

---

# Ignoring WHERE

Example

```sql
SELECT AVG(Salary)
FROM Employees;
```

May not answer:

```text
Average IT salary
```

Need:

```sql
WHERE Department='IT'
```

---

# 1️⃣3️⃣ Best Practices

---

## Use Aliases

Good

```sql
SELECT AVG(Salary) AS AverageSalary
FROM Employees;
```

---

## Use COUNT(*)

For row counts.

---

## Handle NULL Values

Understand how aggregates treat NULLs.

---

## Filter Before Aggregating

Example

```sql
WHERE Department='IT'
```

---

## Combine Multiple Aggregates

Reduces database calls.

---

# Professional Example

```sql
SELECT COUNT(*) AS TotalEmployees,

       AVG(Salary) AS AvgSalary,

       MIN(Salary) AS LowestSalary,

       MAX(Salary) AS HighestSalary

FROM Employees;
```

---

# 📝 Summary

In this module, you learned:

✅ COUNT()

✅ SUM()

✅ AVG()

✅ MIN()

✅ MAX()

✅ NULL Handling

✅ Aggregate Rules

✅ Business Analytics Queries

✅ KPI Calculations

---

# 🧠 Practice Questions

## Theory

1. What is an aggregate function?
2. What does COUNT(*) do?
3. Difference between COUNT(*) and COUNT(Column)?
4. What does SUM() do?
5. What does AVG() do?
6. What does MIN() do?
7. What does MAX() do?
8. How do aggregate functions handle NULL values?
9. What is COUNT(DISTINCT)?
10. Why use aliases with aggregates?

---

## Practical Exercises

### Task 1

Find:

```sql
Total Employees
```

using:

```sql
COUNT(*)
```

---

### Task 2

Find:

```sql
Total Salary Expense
```

using:

```sql
SUM()
```

---

### Task 3

Find:

```sql
Average Salary
```

using:

```sql
AVG()
```

---

### Task 4

Find:

```sql
Highest Salary
```

using:

```sql
MAX()
```

---

### Task 5

Find:

```sql
Lowest Salary
```

using:

```sql
MIN()
```

---

### Task 6

Count unique cities.

---

### Task 7

Calculate average salary of IT employees only.

---

### Challenge Project

Create an Employee Analytics Report containing:

- Total Employees
- Total Salary Expense
- Average Salary
- Highest Salary
- Lowest Salary
- Number of Unique Cities

Use a single SQL query.

---


# 🚀 Next Module

➡ **Module 11: GROUP BY Clause**

Topics Covered:

- GROUP BY Basics
- Grouping Records
- Aggregates with GROUP BY
- Multiple Column Grouping
- GROUP BY vs DISTINCT
- Common Errors
- Real-World Business Reports