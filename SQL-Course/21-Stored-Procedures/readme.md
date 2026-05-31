# Module 21: Stored Procedures

> A Stored Procedure is a precompiled collection of SQL statements stored in the database that can be executed whenever needed. Stored Procedures help improve code reusability, security, maintainability, and performance.

---

# 📖 Introduction

Suppose a company generates the same employee report every day:

```sql
SELECT EmployeeID,
       EmployeeName,
       Salary
FROM Employees
WHERE DepartmentID = 1;
```

Instead of writing this query repeatedly, we can save it as a Stored Procedure.

Then execute it using:

```sql
EXEC ProcedureName;
```

---

# 🎯 Learning Objectives

After completing this module, you will be able to:

✅ Understand Stored Procedures

✅ Create Procedures

✅ Execute Procedures

✅ Use Input Parameters

✅ Use Output Parameters

✅ Use Variables

✅ Implement Error Handling

✅ Understand Business Applications

---

# 📚 Table of Contents

1. What is a Stored Procedure?
2. Why Use Stored Procedures?
3. Benefits of Stored Procedures
4. Creating Procedures
5. Executing Procedures
6. Input Parameters
7. Output Parameters
8. Variables in Procedures
9. Conditional Logic
10. Error Handling
11. Altering Procedures
12. Dropping Procedures
13. Best Practices
14. Interview Questions
15. Business Analytics Examples
16. Summary
17. Practice Questions

---

# 1️⃣ What is a Stored Procedure?

A Stored Procedure is a named collection of SQL statements stored inside the database.

---

# Similar To

Programming:

```text
Function
Method
Reusable Block
```

---

SQL:

```sql
CREATE PROCEDURE
```

---

# Example

```sql
CREATE PROCEDURE GetEmployees
AS
BEGIN

    SELECT *
    FROM Employees;

END;
```

---

Execute:

```sql
EXEC GetEmployees;
```

---

Result:

Returns all employees.

---

# Why Procedures Matter

Used in:

- Enterprise Applications
- Banking Systems
- ERP Software
- CRM Systems
- Reporting Platforms

---

# 2️⃣ Why Use Stored Procedures?

Without Procedure:

```sql
SELECT *
FROM Employees;
```

must be written repeatedly.

---

With Procedure:

```sql
EXEC GetEmployees;
```

---

Benefits:

✅ Reusability

✅ Faster Development

✅ Centralized Logic

✅ Easier Maintenance

---

# Example

Salary report needed daily.

Store logic once.

Execute whenever required.

---

# 3️⃣ Benefits of Stored Procedures

---

# Reusability

Write once.

Use many times.

---

# Security

Users execute procedures.

They don't need direct table access.

---

# Maintainability

Modify procedure once.

Changes apply everywhere.

---

# Performance

SQL Server caches execution plans.

---

# Consistency

Everyone uses same business logic.

---

# 4️⃣ Creating Procedures

---

## Syntax

```sql
CREATE PROCEDURE ProcedureName
AS
BEGIN

    SQL Statements

END;
```

---

## Example

```sql
CREATE PROCEDURE GetEmployees
AS
BEGIN

    SELECT *
    FROM Employees;

END;
```

---

# Execute

```sql
EXEC GetEmployees;
```

---

Output:

All employee records.

---

# Another Example

```sql
CREATE PROCEDURE GetDepartments
AS
BEGIN

    SELECT *
    FROM Departments;

END;
```

---

# 5️⃣ Executing Procedures

Use:

```sql
EXEC
```

or

```sql
EXECUTE
```

---

Example

```sql
EXEC GetEmployees;
```

---

Alternative

```sql
EXECUTE GetEmployees;
```

---

Both work.

---

# 6️⃣ Input Parameters

Procedures can accept values.

---

# Syntax

```sql
CREATE PROCEDURE ProcedureName
(
    @Parameter DataType
)
AS
BEGIN

END;
```

---

# Example

```sql
CREATE PROCEDURE GetEmployeeByID
(
    @EmployeeID INT
)
AS
BEGIN

    SELECT *
    FROM Employees
    WHERE EmployeeID = @EmployeeID;

END;
```

---

Execute

```sql
EXEC GetEmployeeByID 101;
```

---

Result

Employee with ID 101.

---

# Multiple Parameters

```sql
CREATE PROCEDURE GetEmployee
(
    @DepartmentID INT,
    @Salary INT
)
AS
BEGIN

    SELECT *
    FROM Employees
    WHERE DepartmentID = @DepartmentID
      AND Salary > @Salary;

END;
```

---

Execute

```sql
EXEC GetEmployee 1,50000;
```

---

# 7️⃣ Output Parameters

Return values from procedures.

---

Example

```sql
CREATE PROCEDURE EmployeeCount
(
    @TotalEmployees INT OUTPUT
)
AS
BEGIN

    SELECT @TotalEmployees =
           COUNT(*)
    FROM Employees;

END;
```

---

Execution

```sql
DECLARE @Count INT;

EXEC EmployeeCount @Count OUTPUT;

SELECT @Count;
```

---

Output

```text
150
```

---

# Uses

- Counts
- Totals
- Status Codes
- Validation Results

---

# 8️⃣ Variables in Procedures

Variables store temporary values.

---

# Syntax

```sql
DECLARE @Variable DataType;
```

---

Example

```sql
CREATE PROCEDURE AverageSalary
AS
BEGIN

    DECLARE @AvgSalary DECIMAL(10,2);

    SELECT @AvgSalary =
           AVG(Salary)
    FROM Employees;

    SELECT @AvgSalary;

END;
```

---

Execute

```sql
EXEC AverageSalary;
```

---

Output

Average salary.

---

# Why Variables?

Used for:

- Calculations
- Conditions
- Intermediate Results

---

# 9️⃣ Conditional Logic

Stored Procedures support:

```sql
IF
ELSE
```

---

Example

```sql
CREATE PROCEDURE CheckSalary
(
    @Salary INT
)
AS
BEGIN

    IF @Salary > 50000

        PRINT 'High Salary';

    ELSE

        PRINT 'Low Salary';

END;
```

---

Execute

```sql
EXEC CheckSalary 60000;
```

---

Output

```text
High Salary
```

---

# 🔟 Error Handling

Professional procedures use:

```sql
TRY
CATCH
```

---

Example

```sql
BEGIN TRY

    SELECT 10 / 0;

END TRY

BEGIN CATCH

    PRINT 'Error Occurred';

END CATCH
```

---

Result

```text
Error Occurred
```

instead of application failure.

---

# Full Example

```sql
CREATE PROCEDURE SafeDivision
(
    @A INT,
    @B INT
)
AS
BEGIN

    BEGIN TRY

        SELECT @A / @B;

    END TRY

    BEGIN CATCH

        PRINT 'Division Error';

    END CATCH

END;
```

---

# 1️⃣1️⃣ Altering Procedures

Modify existing procedure.

---

## Syntax

```sql
ALTER PROCEDURE ProcedureName
AS
BEGIN

END;
```

---

Example

```sql
ALTER PROCEDURE GetEmployees
AS
BEGIN

    SELECT EmployeeID,
           EmployeeName
    FROM Employees;

END;
```

---

Procedure updated.

---

# 1️⃣2️⃣ Dropping Procedures

Remove procedure.

---

## Syntax

```sql
DROP PROCEDURE ProcedureName;
```

---

Example

```sql
DROP PROCEDURE GetEmployees;
```

---

Result

```text
Procedure removed.
```

---

Tables remain unchanged.

---

# 1️⃣3️⃣ Best Practices

---

## Use Meaningful Names

Good:

```text
GetEmployeeByID
GenerateSalesReport
CalculateBonus
```

---

## Use Parameters

Avoid hardcoding values.

---

## Include Error Handling

Use:

```sql
TRY
CATCH
```

---

## Keep Procedures Focused

One purpose per procedure.

---

## Document Business Logic

Essential in enterprise projects.

---

## Avoid SELECT *

Good:

```sql
SELECT EmployeeID,
       EmployeeName
```

---

# Professional Example

```sql
CREATE PROCEDURE GetDepartmentEmployees
(
    @DepartmentID INT
)
AS
BEGIN

    SELECT EmployeeID,
           EmployeeName,
           Salary

    FROM Employees

    WHERE DepartmentID = @DepartmentID;

END;
```

---

# 1️⃣4️⃣ Common Interview Questions

---

## What is a Stored Procedure?

A precompiled collection of SQL statements stored in the database.

---

## Why Use Stored Procedures?

Reusability, security, performance.

---

## Difference Between Procedure and Query?

Query runs once.

Procedure can be stored and reused.

---

## Can Procedures Accept Parameters?

Yes.

---

## Can Procedures Return Values?

Yes, using OUTPUT parameters.

---

## How Do You Execute a Procedure?

```sql
EXEC ProcedureName;
```

---

## How Do You Modify a Procedure?

```sql
ALTER PROCEDURE
```

---

# 1️⃣5️⃣ Business Analytics Examples

---

# Employee Lookup

```sql
EXEC GetEmployeeByID 101;
```

---

# Department Report

```sql
EXEC GetDepartmentEmployees 1;
```

---

# Sales Dashboard Procedure

```sql
CREATE PROCEDURE SalesSummary
AS
BEGIN

    SELECT ProductID,
           SUM(SalesAmount)

    FROM Sales

    GROUP BY ProductID;

END;
```

---

# KPI Procedure

```sql
CREATE PROCEDURE EmployeeKPI
AS
BEGIN

    SELECT COUNT(*) AS Employees,
           AVG(Salary) AS AvgSalary

    FROM Employees;

END;
```

---

# Monthly Reporting

Common in enterprise environments.

---

# 📝 Summary

In this module, you learned:

✅ Stored Procedures

✅ CREATE PROCEDURE

✅ EXECUTE PROCEDURE

✅ Input Parameters

✅ Output Parameters

✅ Variables

✅ IF ELSE Logic

✅ Error Handling

✅ ALTER PROCEDURE

✅ DROP PROCEDURE

---

# 🧠 Practice Questions

## Theory

1. What is a Stored Procedure?
2. Why use Stored Procedures?
3. How do you create a Procedure?
4. How do you execute a Procedure?
5. What are Input Parameters?
6. What are Output Parameters?
7. How do Variables work?
8. Why use TRY-CATCH?
9. How do you modify a Procedure?
10. How do you delete a Procedure?

---

## Practical Exercises

### Task 1

Create:

```sql
GetEmployees
```

Procedure.

---

### Task 2

Create a parameterized procedure.

---

### Task 3

Create a procedure returning employee count.

---

### Task 4

Use variables inside a procedure.

---

### Task 5

Implement TRY-CATCH.

---

### Task 6

Modify a procedure using:

```sql
ALTER PROCEDURE
```

---

### Challenge Project

Create:

```text
Employees
Departments
Sales
Orders
Customers
```

Build procedures for:

- Employee Reports
- Sales Summary
- Customer Analytics
- KPI Dashboard
- Error-Handled Reporting

---

# 🚀 Next Module

➡ **Module 22: SQL Functions**

Topics Covered:

- Built-in Functions
- Scalar Functions
- Aggregate Functions
- String Functions
- Date Functions
- Mathematical Functions
- User-Defined Functions (UDFs)
- Function vs Procedure
- Analytics Use Cases