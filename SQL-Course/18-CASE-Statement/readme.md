# Module 18: CASE Statement

> The `CASE` statement is SQL's conditional logic operator. It works similarly to IF-ELSE statements in programming languages and allows you to create dynamic outputs, perform conditional calculations, categorize data, and build advanced business reports.

---

# 📖 Introduction

Consider an Employees table:

| EmployeeName | Salary |
|-------------|---------|
| Kunal | 30000 |
| Rahul | 60000 |
| Aman | 90000 |

Management asks:

> Categorize employees as Low, Medium, and High salary earners.

Expected Output:

| EmployeeName | Salary | SalaryCategory |
|-------------|---------|----------------|
| Kunal | 30000 | Low |
| Rahul | 60000 | Medium |
| Aman | 90000 | High |

To perform such conditional logic, SQL provides:

```sql
CASE
```

---

# 🎯 Learning Objectives

After completing this module, you will be able to:

✅ Understand CASE statements

✅ Use Simple CASE

✅ Use Searched CASE

✅ Use CASE in SELECT

✅ Use CASE in ORDER BY

✅ Use CASE with Aggregates

✅ Perform Conditional Aggregation

✅ Build Dynamic Reports

---

# 📚 Table of Contents

1. What is CASE?
2. Why CASE is Needed
3. Types of CASE
4. Simple CASE
5. Searched CASE
6. CASE in SELECT
7. CASE in ORDER BY
8. CASE with Aggregate Functions
9. Conditional Aggregation
10. Nested CASE
11. Common Mistakes
12. Best Practices
13. Interview Questions
14. Business Analytics Examples
15. Summary
16. Practice Questions

---

# 1️⃣ What is CASE?

The CASE statement adds conditional logic to SQL queries.

---

# Similar To

Programming:

```text
IF
ELSE IF
ELSE
```

---

SQL:

```sql
CASE
    WHEN Condition
    THEN Result

    ELSE Result
END
```

---

# Basic Example

```sql
SELECT EmployeeName,

       CASE
           WHEN Salary > 50000
           THEN 'High Salary'

           ELSE 'Low Salary'
       END AS SalaryStatus

FROM Employees;
```

---

# Why CASE Matters

Used in:

- Dashboards
- Business Reports
- KPI Calculations
- Data Categorization
- Analytics Projects

---

# 2️⃣ Why CASE is Needed

Without CASE:

```text
Raw Data Only
```

---

With CASE:

```text
Business Meaning
```

---

Example:

Raw Salary:

```text
45000
```

---

Business Category:

```text
Medium Salary
```

---

CASE converts data into understandable business information.

---

# 3️⃣ Types of CASE

SQL provides two forms:

| Type | Purpose |
|---------|---------|
| Simple CASE | Compare exact values |
| Searched CASE | Evaluate conditions |

---

# Simple CASE

```sql
CASE ColumnName
    WHEN Value1 THEN Result1
    WHEN Value2 THEN Result2
END
```

---

# Searched CASE

```sql
CASE
    WHEN Condition1 THEN Result1
    WHEN Condition2 THEN Result2
END
```

---

# 4️⃣ Simple CASE

Used when comparing exact values.

---

## Example Table

| DepartmentID |
|-------------|
| 1 |
| 2 |
| 3 |

---

Query

```sql
SELECT DepartmentID,

       CASE DepartmentID

            WHEN 1 THEN 'IT'

            WHEN 2 THEN 'HR'

            WHEN 3 THEN 'Finance'

            ELSE 'Unknown'

       END AS DepartmentName

FROM Employees;
```

---

Output

| DepartmentID | DepartmentName |
|-------------|---------------|
| 1 | IT |
| 2 | HR |
| 3 | Finance |

---

# Best Use Case

Mapping codes to labels.

---

Examples:

```text
Status Codes
Country Codes
Department IDs
Grades
```

---

# 5️⃣ Searched CASE

Most commonly used form.

---

Allows logical conditions.

---

Example

```sql
SELECT EmployeeName,
       Salary,

       CASE

            WHEN Salary < 40000
                 THEN 'Low'

            WHEN Salary BETWEEN 40000 AND 70000
                 THEN 'Medium'

            ELSE 'High'

       END AS SalaryCategory

FROM Employees;
```

---

Output

| EmployeeName | Salary | SalaryCategory |
|-------------|---------|---------------|
| Kunal | 30000 | Low |
| Rahul | 60000 | Medium |
| Aman | 90000 | High |

---

# Execution Rule

CASE executes from top to bottom.

---

First matching condition wins.

---

Example

```sql
CASE

WHEN Salary > 20000 THEN 'A'

WHEN Salary > 50000 THEN 'B'

END
```

---

Salary:

```text
60000
```

Result:

```text
A
```

because first condition matched.

---

# Always Order Conditions Carefully

---

# 6️⃣ CASE in SELECT

Most common use.

---

Example

```sql
SELECT EmployeeName,

       CASE
            WHEN Salary > 50000
            THEN 'Eligible'

            ELSE 'Not Eligible'
       END AS BonusStatus

FROM Employees;
```

---

Output

| EmployeeName | BonusStatus |
|-------------|-------------|
| Kunal | No |
| Rahul | Yes |

---

# Business Uses

- Salary Bands
- Risk Levels
- Customer Segments
- Performance Ratings

---

# 7️⃣ CASE in ORDER BY

Dynamic sorting.

---

Example

```sql
SELECT EmployeeName,
       Department

FROM Employees

ORDER BY

CASE Department

     WHEN 'IT' THEN 1

     WHEN 'HR' THEN 2

     WHEN 'Finance' THEN 3

END;
```

---

Result:

```text
IT First
HR Second
Finance Third
```

---

# Why?

Custom sort order.

---

# 8️⃣ CASE with Aggregate Functions

CASE can work with aggregates.

---

Example

Count employees with high salaries.

```sql
SELECT COUNT(

CASE

     WHEN Salary > 50000

     THEN 1

END

) AS HighSalaryEmployees

FROM Employees;
```

---

# Alternative

```sql
SELECT SUM(

CASE

     WHEN Salary > 50000

     THEN 1

     ELSE 0

END

) AS HighSalaryEmployees

FROM Employees;
```

---

# 9️⃣ Conditional Aggregation

One of the most important Data Analytics techniques.

---

Example

```sql
SELECT

SUM(
CASE
    WHEN Department='IT'
    THEN Salary
    ELSE 0
END
) AS ITSalary,

SUM(
CASE
    WHEN Department='HR'
    THEN Salary
    ELSE 0
END
) AS HRSalary

FROM Employees;
```

---

Output

| ITSalary | HRSalary |
|----------|----------|
| 150000 | 120000 |

---

# Why Important?

Used in:

- KPI Dashboards
- Power BI
- Tableau
- Financial Reports

---

# Example

Employee Count by Department

```sql
SELECT

SUM(
CASE
WHEN Department='IT'
THEN 1
ELSE 0
END
) AS ITEmployees,

SUM(
CASE
WHEN Department='HR'
THEN 1
ELSE 0
END
) AS HREmployees

FROM Employees;
```

---

# 🔟 Nested CASE

CASE inside CASE.

---

Example

```sql
SELECT EmployeeName,

CASE

    WHEN Department='IT'

         THEN

             CASE

                  WHEN Salary > 70000
                  THEN 'Senior IT'

                  ELSE 'Junior IT'

             END

    ELSE 'Other Department'

END AS EmployeeCategory

FROM Employees;
```

---

# Use Carefully

Can reduce readability.

---

# 1️⃣1️⃣ Common Mistakes

---

# Missing END

Bad:

```sql
CASE
WHEN Salary > 50000
THEN 'High'
```

---

Error.

---

Correct:

```sql
CASE
WHEN Salary > 50000
THEN 'High'
END
```

---

# Wrong Condition Order

Bad:

```sql
WHEN Salary > 20000
WHEN Salary > 50000
```

---

More specific conditions should appear first.

---

# Missing ELSE

Allowed but risky.

---

Example

```sql
CASE
WHEN Salary > 50000
THEN 'High'
END
```

---

Unmatched rows become:

```sql
NULL
```

---

# Mixing Data Types

Bad:

```sql
CASE

WHEN Salary > 50000

THEN 'High'

ELSE 100

END
```

---

Can cause conversion issues.

---

# 1️⃣2️⃣ Best Practices

---

## Always Include ELSE

Good:

```sql
ELSE 'Unknown'
```

---

## Use Meaningful Aliases

Good:

```sql
SalaryCategory
```

---

## Keep Conditions Ordered

Most specific first.

---

## Avoid Deep Nesting

Hard to maintain.

---

## Use Conditional Aggregation

Very common in analytics.

---

# Professional Example

```sql
SELECT EmployeeName,

       Salary,

       CASE

            WHEN Salary < 40000
                 THEN 'Low'

            WHEN Salary BETWEEN 40000 AND 70000
                 THEN 'Medium'

            ELSE 'High'

       END AS SalaryBand

FROM Employees;
```

---

# 1️⃣3️⃣ Common Interview Questions

---

## What is CASE?

Conditional logic in SQL.

---

## Difference Between Simple and Searched CASE?

Simple:

```sql
CASE Column
```

---

Searched:

```sql
CASE
WHEN Condition
```

---

## Can CASE Be Used in ORDER BY?

Yes.

---

## Can CASE Be Used with Aggregates?

Yes.

---

## What is Conditional Aggregation?

Using CASE inside aggregate functions.

---

# 1️⃣4️⃣ Business Analytics Examples

---

# Salary Categorization

```sql
SELECT EmployeeName,

CASE

WHEN Salary < 40000 THEN 'Low'

WHEN Salary < 70000 THEN 'Medium'

ELSE 'High'

END

FROM Employees;
```

---

# Customer Segmentation

```sql
SELECT CustomerName,

CASE

WHEN TotalPurchase > 100000
THEN 'Premium'

WHEN TotalPurchase > 50000
THEN 'Gold'

ELSE 'Regular'

END

FROM Customers;
```

---

# Department Salary Dashboard

```sql
SELECT

SUM(
CASE
WHEN Department='IT'
THEN Salary
ELSE 0
END
) AS ITSalary,

SUM(
CASE
WHEN Department='HR'
THEN Salary
ELSE 0
END
) AS HRSalary

FROM Employees;
```

---

# Employee Performance Rating

```sql
SELECT EmployeeName,

CASE

WHEN Rating >= 9 THEN 'Excellent'

WHEN Rating >= 7 THEN 'Good'

WHEN Rating >= 5 THEN 'Average'

ELSE 'Needs Improvement'

END

FROM Employees;
```

---

# 📝 Summary

In this module, you learned:

✅ Simple CASE

✅ Searched CASE

✅ CASE in SELECT

✅ CASE in ORDER BY

✅ CASE with Aggregates

✅ Conditional Aggregation

✅ Nested CASE

✅ Dashboard Reporting Techniques

---

# 🧠 Practice Questions

## Theory

1. What is CASE?
2. Why is CASE used?
3. Difference between Simple and Searched CASE?
4. Can CASE be used in SELECT?
5. Can CASE be used in ORDER BY?
6. What is Conditional Aggregation?
7. Why is ELSE important?
8. How does CASE execute conditions?
9. What is Nested CASE?
10. What are common CASE mistakes?

---

## Practical Exercises

### Task 1

Categorize salaries:

```text
Low
Medium
High
```

---

### Task 2

Convert Department IDs into names.

---

### Task 3

Create bonus eligibility status.

---

### Task 4

Use CASE in ORDER BY.

---

### Task 5

Count employees by department using CASE.

---

### Task 6

Calculate department-wise salary totals using CASE.

---

### Challenge Project

Create:

```text
Employees
Departments
Customers
Orders
```

Generate:

- Salary Bands
- Customer Segments
- Performance Ratings
- Department KPIs
- Dashboard Metrics

using:

- CASE
- Aggregates
- Conditional Aggregation

---

# 🚀 Next Module

➡ **Module 19: Views**

Topics Covered:

- What are Views?
- Creating Views
- Updating Views
- Dropping Views
- Advantages of Views
- Security Benefits
- View Limitations
- Real-World Reporting Use Cases