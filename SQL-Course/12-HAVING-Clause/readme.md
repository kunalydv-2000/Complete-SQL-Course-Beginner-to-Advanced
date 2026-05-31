# Module 12: HAVING Clause

> The `HAVING` clause is used to filter groups created by the `GROUP BY` clause. While `WHERE` filters rows before grouping, `HAVING` filters groups after aggregation.

---

# 📖 Introduction

Consider an Employees table:

| EmployeeID | Department | Salary |
|------------|------------|---------|
| 101 | IT | 50000 |
| 102 | IT | 60000 |
| 103 | HR | 45000 |
| 104 | HR | 55000 |
| 105 | HR | 65000 |

Management asks:

> Show only departments with more than 2 employees.

This cannot be done using a simple WHERE clause because the condition depends on an aggregate value (`COUNT(*)`).

For such situations, SQL provides:

```sql
HAVING
```

---

# 🎯 Learning Objectives

After completing this module, you will be able to:

✅ Understand HAVING

✅ Differentiate HAVING and WHERE

✅ Filter grouped data

✅ Use HAVING with COUNT()

✅ Use HAVING with SUM()

✅ Use HAVING with AVG()

✅ Use multiple HAVING conditions

✅ Create analytical reports

---

# 📚 Table of Contents

1. What is HAVING?
2. Why HAVING is Needed
3. HAVING Syntax
4. HAVING with COUNT()
5. HAVING with SUM()
6. HAVING with AVG()
7. HAVING with MIN() and MAX()
8. HAVING with Multiple Conditions
9. WHERE vs HAVING
10. Query Execution Order
11. Common Errors
12. Best Practices
13. Business Analytics Examples
14. Summary
15. Practice Questions

---

# 1️⃣ What is HAVING?

The `HAVING` clause filters groups after the `GROUP BY` operation has been performed.

---

## Example

```sql
SELECT Department,
       COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Department
HAVING COUNT(*) > 2;
```

---

Output:

| Department | EmployeeCount |
|------------|--------------|
| HR | 3 |

---

Explanation:

```text
IT → 2 employees
HR → 3 employees
```

Only HR satisfies:

```text
COUNT(*) > 2
```

---

# Why HAVING Matters

Used in:

- KPI Dashboards
- Sales Reports
- Revenue Analysis
- Customer Segmentation
- Business Intelligence

---

# 2️⃣ Why HAVING is Needed

Suppose you write:

```sql
SELECT Department,
       COUNT(*)
FROM Employees
WHERE COUNT(*) > 2
GROUP BY Department;
```

---

This causes an error.

Reason:

```text
WHERE cannot use aggregate functions.
```

---

Correct:

```sql
SELECT Department,
       COUNT(*)
FROM Employees
GROUP BY Department
HAVING COUNT(*) > 2;
```

---

# Key Rule

```text
WHERE → Filters Rows

HAVING → Filters Groups
```

---

# 3️⃣ HAVING Syntax

Basic syntax:

```sql
SELECT ColumnName,
       AggregateFunction(ColumnName)
FROM TableName
GROUP BY ColumnName
HAVING Condition;
```

---

## Example

```sql
SELECT Department,
       AVG(Salary)
FROM Employees
GROUP BY Department
HAVING AVG(Salary) > 50000;
```

---

# General Structure

```sql
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
```

---

# 4️⃣ HAVING with COUNT()

Most common use case.

---

## Example Table

| Department |
|------------|
| IT |
| IT |
| HR |
| HR |
| HR |

---

Query:

```sql
SELECT Department,
       COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Department
HAVING COUNT(*) >= 3;
```

---

Output:

| Department | EmployeeCount |
|------------|---------------|
| HR | 3 |

---

# Business Uses

- Departments with more than 10 employees
- Cities with more than 100 customers
- Products sold more than 1000 times

---

# 5️⃣ HAVING with SUM()

Filter groups based on totals.

---

## Example

| Department | Salary |
|------------|---------|
| IT | 50000 |
| IT | 60000 |
| HR | 45000 |
| HR | 55000 |
| HR | 65000 |

---

Query:

```sql
SELECT Department,
       SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Department
HAVING SUM(Salary) > 150000;
```

---

Output:

| Department | TotalSalary |
|------------|-------------|
| HR | 165000 |

---

# Business Uses

- Cities with revenue above ₹1,00,000
- Products generating high sales
- Departments exceeding budget limits

---

# 6️⃣ HAVING with AVG()

Filter groups based on averages.

---

Query:

```sql
SELECT Department,
       AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY Department
HAVING AVG(Salary) > 55000;
```

---

Output:

| Department | AverageSalary |
|------------|---------------|
| HR | 55000 |

(Depending on dataset values)

---

# Business Uses

- Departments with high average salaries
- Products with high average ratings
- Regions with high average revenue

---

# 7️⃣ HAVING with MIN() and MAX()

---

## MAX Example

```sql
SELECT Department,
       MAX(Salary) AS HighestSalary
FROM Employees
GROUP BY Department
HAVING MAX(Salary) > 60000;
```

---

Output:

Only departments having salaries above 60000.

---

## MIN Example

```sql
SELECT Department,
       MIN(Salary) AS LowestSalary
FROM Employees
GROUP BY Department
HAVING MIN(Salary) > 30000;
```

---

Output:

Departments where the lowest salary exceeds 30000.

---

# 8️⃣ HAVING with Multiple Conditions

You can combine conditions using:

```sql
AND
OR
NOT
```

---

## Example

```sql
SELECT Department,
       COUNT(*) AS Employees,
       AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department
HAVING COUNT(*) >= 2
AND AVG(Salary) > 50000;
```

---

Output:

Only groups satisfying both conditions.

---

# Using OR

```sql
HAVING COUNT(*) > 10
OR AVG(Salary) > 50000
```

---

# Using NOT

```sql
HAVING NOT COUNT(*) < 5
```

---

# 9️⃣ WHERE vs HAVING

This is one of the most important interview topics.

---

# WHERE

Filters rows before grouping.

Example:

```sql
SELECT *
FROM Employees
WHERE Salary > 50000;
```

---

# HAVING

Filters groups after grouping.

Example:

```sql
SELECT Department,
       AVG(Salary)
FROM Employees
GROUP BY Department
HAVING AVG(Salary) > 50000;
```

---

# Comparison Table

| Feature | WHERE | HAVING |
|----------|----------|----------|
| Filters | Rows | Groups |
| Uses Aggregate Functions | ❌ | ✅ |
| Executes Before GROUP BY | ✅ | ❌ |
| Executes After GROUP BY | ❌ | ✅ |

---

# Example Using Both

```sql
SELECT Department,
       AVG(Salary)
FROM Employees
WHERE Salary > 30000
GROUP BY Department
HAVING AVG(Salary) > 50000;
```

---

Explanation:

### WHERE

Filters employees.

---

### GROUP BY

Creates department groups.

---

### HAVING

Filters department groups.

---

# 🔟 Query Execution Order

Query:

```sql
SELECT Department,
       AVG(Salary)
FROM Employees
WHERE Salary > 30000
GROUP BY Department
HAVING AVG(Salary) > 50000
ORDER BY AVG(Salary);
```

---

Actual Execution:

```text
1. FROM
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. ORDER BY
```

---

Understanding this order is critical for advanced SQL.

---

# 1️⃣1️⃣ Common Errors

---

# Using Aggregate in WHERE

Bad:

```sql
WHERE COUNT(*) > 2
```

---

Error.

---

Correct:

```sql
HAVING COUNT(*) > 2
```

---

# Missing GROUP BY

Bad:

```sql
SELECT Department,
       COUNT(*)
FROM Employees
HAVING COUNT(*) > 2;
```

---

Usually incorrect logic.

---

# Wrong Aggregate Usage

Bad:

```sql
HAVING EmployeeName = 'Kunal'
```

Use WHERE instead.

---

# Using HAVING Instead of WHERE

Bad:

```sql
HAVING Salary > 50000
```

---

Better:

```sql
WHERE Salary > 50000
```

---

# 1️⃣2️⃣ Best Practices

---

## Use WHERE First

Filter rows early.

Good:

```sql
WHERE Salary > 30000
```

---

## Use HAVING Only for Aggregates

Good:

```sql
HAVING AVG(Salary) > 50000
```

---

## Use Meaningful Aliases

Good:

```sql
AVG(Salary) AS AverageSalary
```

---

## Keep Conditions Readable

Use proper formatting.

---

## Combine WHERE and HAVING

Improves performance.

---

# Professional Example

```sql
SELECT Department,

       COUNT(*) AS EmployeeCount,

       AVG(Salary) AS AverageSalary

FROM Employees

WHERE Salary > 30000

GROUP BY Department

HAVING COUNT(*) >= 2

ORDER BY AverageSalary DESC;
```

---

# 1️⃣3️⃣ Business Analytics Examples

---

# Departments with More Than 5 Employees

```sql
SELECT Department,
       COUNT(*)
FROM Employees
GROUP BY Department
HAVING COUNT(*) > 5;
```

---

# Cities Generating Revenue Above ₹1 Lakh

```sql
SELECT City,
       SUM(Revenue)
FROM Sales
GROUP BY City
HAVING SUM(Revenue) > 100000;
```

---

# Products with Average Rating Above 4

```sql
SELECT ProductName,
       AVG(Rating)
FROM Reviews
GROUP BY ProductName
HAVING AVG(Rating) > 4;
```

---

# Customers with Multiple Orders

```sql
SELECT CustomerID,
       COUNT(*)
FROM Orders
GROUP BY CustomerID
HAVING COUNT(*) > 1;
```

---

# KPI Dashboard Query

```sql
SELECT Department,

       COUNT(*) AS Employees,

       AVG(Salary) AS AvgSalary,

       SUM(Salary) AS TotalSalary

FROM Employees

GROUP BY Department

HAVING AVG(Salary) > 50000;
```

---

# 📝 Summary

In this module, you learned:

✅ HAVING Clause

✅ HAVING with COUNT()

✅ HAVING with SUM()

✅ HAVING with AVG()

✅ HAVING with MIN()

✅ HAVING with MAX()

✅ Multiple Conditions

✅ WHERE vs HAVING

✅ Query Execution Order

✅ Business Analytics Queries

---

# 🧠 Practice Questions

## Theory

1. What is HAVING?
2. Why is HAVING needed?
3. Difference between WHERE and HAVING?
4. Can HAVING use aggregate functions?
5. Can WHERE use aggregate functions?
6. When does HAVING execute?
7. What is query execution order?
8. How does HAVING work with COUNT()?
9. How does HAVING work with SUM()?
10. Why combine WHERE and HAVING?

---

## Practical Exercises

### Task 1

Show departments having:

```sql
COUNT(*) > 2
```

---

### Task 2

Show departments where:

```sql
AVG(Salary) > 50000
```

---

### Task 3

Show cities with:

```sql
SUM(SalesAmount) > 100000
```

---

### Task 4

Show customers with:

```sql
COUNT(*) > 1
```

---

### Task 5

Use both:

```sql
WHERE
HAVING
```

in a single query.

---

### Task 6

Find departments where:

```sql
MIN(Salary) > 30000
```

---

### Challenge Project

Build an Employee Analytics Report showing:

- Departments with more than 3 employees
- Average salary above ₹50,000
- Total salary expense above ₹1,00,000

Use:

- GROUP BY
- HAVING
- COUNT()
- AVG()
- SUM()

in a single query.

---

# 🚀 Next Module

➡ **Module 13: UPDATE Statement**

Topics Covered:

- UPDATE Syntax
- Updating Single Records
- Updating Multiple Records
- UPDATE with WHERE
- UPDATE with Expressions
- UPDATE Using JOIN
- Common Mistakes
- Best Practices