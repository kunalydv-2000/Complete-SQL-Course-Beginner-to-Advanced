# Module 15: ALTER TABLE Statement

> The `ALTER TABLE` statement is used to modify the structure of an existing table. It allows you to add, remove, or modify columns and constraints without recreating the table.

---

# 📖 Introduction

In real-world databases, requirements change frequently.

Examples:

- Company wants to store employee emails.
- Product table needs a new category column.
- Customer name length must increase.
- New business rules require constraints.

Instead of deleting and recreating the table, SQL provides:

```sql
ALTER TABLE
```

---

# 🎯 Learning Objectives

After completing this module, you will be able to:

✅ Add new columns

✅ Modify existing columns

✅ Drop columns

✅ Add constraints

✅ Remove constraints

✅ Understand schema evolution

✅ Apply ALTER TABLE safely in production

---

# 📚 Table of Contents

1. What is ALTER TABLE?
2. Why ALTER TABLE is Important
3. ALTER TABLE Syntax
4. ADD COLUMN
5. ALTER COLUMN
6. DROP COLUMN
7. ADD CONSTRAINT
8. DROP CONSTRAINT
9. Working with Existing Data
10. Common Errors
11. Best Practices
12. Real-World Examples
13. Summary
14. Practice Questions

---

# 1️⃣ What is ALTER TABLE?

`ALTER TABLE` modifies an existing table structure.

---

## Example

Original Table

```sql
CREATE TABLE Employees
(
    EmployeeID INT,
    EmployeeName VARCHAR(100)
);
```

---

Need:

```text
Employee Email
```

---

Solution:

```sql
ALTER TABLE Employees
ADD Email VARCHAR(100);
```

---

Updated Structure

| Column |
|----------|
| EmployeeID |
| EmployeeName |
| Email |

---

# Why ALTER TABLE Matters

Used for:

- New business requirements
- Database upgrades
- Data model improvements
- Production maintenance

---

# 2️⃣ Why ALTER TABLE is Important

Imagine:

Initial Design

```text
EmployeeID
EmployeeName
```

---

After 6 months:

Need:

```text
Email
JoiningDate
Department
```

---

Without ALTER TABLE:

```text
Recreate entire table
Move all data
Risk data loss
```

---

With ALTER TABLE:

```sql
ALTER TABLE Employees
ADD Email VARCHAR(100);
```

---

Quick and safe.

---

# 3️⃣ ALTER TABLE Syntax

General syntax:

```sql
ALTER TABLE TableName
Action;
```

---

Actions include:

```text
ADD
ALTER COLUMN
DROP COLUMN
ADD CONSTRAINT
DROP CONSTRAINT
```

---

# 4️⃣ ADD COLUMN

Used to add new columns.

---

## Syntax

```sql
ALTER TABLE TableName
ADD ColumnName DataType;
```

---

## Example

```sql
ALTER TABLE Employees
ADD Email VARCHAR(100);
```

---

Before

| EmployeeID | EmployeeName |
|------------|-------------|

---

After

| EmployeeID | EmployeeName | Email |
|------------|-------------|-------|

---

# Add Multiple Columns

```sql
ALTER TABLE Employees
ADD
    City VARCHAR(50),
    Country VARCHAR(50);
```

---

Result

New columns added simultaneously.

---

# Add Column with Default

```sql
ALTER TABLE Employees
ADD Country VARCHAR(50)
DEFAULT 'India';
```

---

# 5️⃣ ALTER COLUMN

Used to modify an existing column.

---

## Syntax

```sql
ALTER TABLE TableName
ALTER COLUMN ColumnName NewDataType;
```

---

## Example

Current:

```sql
EmployeeName VARCHAR(50)
```

Need:

```sql
EmployeeName VARCHAR(100)
```

---

Query

```sql
ALTER TABLE Employees
ALTER COLUMN EmployeeName VARCHAR(100);
```

---

# Common Uses

### Increase Length

```sql
VARCHAR(50)
→
VARCHAR(200)
```

---

### Change Data Type

```sql
INT
→
BIGINT
```

---

### Change NULL Property

```sql
ALTER TABLE Employees
ALTER COLUMN Email VARCHAR(100) NOT NULL;
```

---

# Important

Existing data must be compatible.

---

Example

Bad:

```sql
VARCHAR
→
INT
```

when values contain text.

---

Error occurs.

---

# 6️⃣ DROP COLUMN

Removes a column permanently.

---

## Syntax

```sql
ALTER TABLE TableName
DROP COLUMN ColumnName;
```

---

## Example

```sql
ALTER TABLE Employees
DROP COLUMN Email;
```

---

Before

| EmployeeID | EmployeeName | Email |
|------------|-------------|-------|

---

After

| EmployeeID | EmployeeName |
|------------|-------------|

---

⚠️ Data in Email column is permanently lost.

---

# Drop Multiple Columns

```sql
ALTER TABLE Employees
DROP COLUMN City,
            Country;
```

---

# 7️⃣ ADD CONSTRAINT

Constraints can be added later.

---

# Add PRIMARY KEY

```sql
ALTER TABLE Employees
ADD CONSTRAINT PK_Employees
PRIMARY KEY (EmployeeID);
```

---

# Add UNIQUE

```sql
ALTER TABLE Employees
ADD CONSTRAINT UQ_Email
UNIQUE (Email);
```

---

# Add CHECK

```sql
ALTER TABLE Employees
ADD CONSTRAINT CHK_Salary
CHECK (Salary > 0);
```

---

# Add DEFAULT

```sql
ALTER TABLE Employees
ADD CONSTRAINT DF_Country
DEFAULT 'India'
FOR Country;
```

---

# Add FOREIGN KEY

```sql
ALTER TABLE Employees
ADD CONSTRAINT FK_Department
FOREIGN KEY (DepartmentID)
REFERENCES Departments(DepartmentID);
```

---

# 8️⃣ DROP CONSTRAINT

Remove existing constraints.

---

## Syntax

```sql
ALTER TABLE TableName
DROP CONSTRAINT ConstraintName;
```

---

## Example

```sql
ALTER TABLE Employees
DROP CONSTRAINT UQ_Email;
```

---

Constraint removed.

---

# Find Constraint Names

SQL Server:

```sql
sp_help Employees;
```

---

or

```sql
EXEC sp_help 'Employees';
```

---

# 9️⃣ Working with Existing Data

Most important production concept.

---

# Example

Table:

| EmployeeID | Salary |
|------------|---------|
| 101 | 50000 |
| 102 | 60000 |

---

Adding:

```sql
CHECK (Salary > 0)
```

works because all existing rows satisfy rule.

---

# Example Failure

Existing Data:

| Salary |
|---------|
| -1000 |

---

Adding:

```sql
CHECK (Salary > 0)
```

fails.

---

Reason:

Existing records violate new constraint.

---

# Production Rule

Always verify existing data before schema changes.

---

# 🔟 Common Errors

---

# Data Type Conversion Failure

Bad:

```sql
ALTER COLUMN Salary INT;
```

when values contain:

```text
45000.75
```

---

# NOT NULL Failure

Bad:

```sql
ALTER COLUMN Email VARCHAR(100) NOT NULL;
```

when existing NULL values exist.

---

# Dropping Used Columns

Bad:

```sql
DROP COLUMN DepartmentID;
```

when Foreign Keys depend on it.

---

# Adding Duplicate Constraint

Constraint names must be unique.

---

# 1️⃣1️⃣ Best Practices

---

## Backup Before Changes

Especially in production.

---

## Test in Development

Never alter production first.

---

## Check Existing Data

Before:

```sql
NOT NULL
CHECK
FOREIGN KEY
```

changes.

---

## Use Meaningful Constraint Names

Good:

```text
PK_Employees
FK_Employees_Departments
CHK_Salary
```

---

## Avoid Unnecessary Schema Changes

Frequent changes increase risk.

---

## Document Every Change

Professional databases track schema evolution.

---

# Professional Workflow

Step 1

Review structure.

```sql
sp_help Employees;
```

---

Step 2

Check data.

```sql
SELECT *
FROM Employees;
```

---

Step 3

Apply change.

```sql
ALTER TABLE Employees
ADD Email VARCHAR(100);
```

---

Step 4

Verify.

```sql
sp_help Employees;
```

---

# 1️⃣2️⃣ Real-World Examples

---

# Add Email Column

```sql
ALTER TABLE Employees
ADD Email VARCHAR(100);
```

---

# Increase Product Name Length

```sql
ALTER TABLE Products
ALTER COLUMN ProductName VARCHAR(200);
```

---

# Add Salary Validation

```sql
ALTER TABLE Employees
ADD CONSTRAINT CHK_Salary
CHECK (Salary > 0);
```

---

# Remove Temporary Column

```sql
ALTER TABLE Employees
DROP COLUMN TempData;
```

---

# Add Department Relationship

```sql
ALTER TABLE Employees
ADD CONSTRAINT FK_Department
FOREIGN KEY (DepartmentID)
REFERENCES Departments(DepartmentID);
```

---

# Complete Example

```sql
ALTER TABLE Employees
ADD Email VARCHAR(100);

ALTER TABLE Employees
ADD CONSTRAINT UQ_Email
UNIQUE (Email);
```

---

# 📝 Summary

In this module, you learned:

✅ ALTER TABLE

✅ ADD COLUMN

✅ ALTER COLUMN

✅ DROP COLUMN

✅ ADD CONSTRAINT

✅ DROP CONSTRAINT

✅ Schema Evolution

✅ Production Safety Practices

✅ Common ALTER TABLE Errors

---

# 🧠 Practice Questions

## Theory

1. What is ALTER TABLE?
2. Why use ALTER TABLE?
3. How do you add a column?
4. How do you modify a column?
5. How do you remove a column?
6. How do you add a constraint?
7. How do you drop a constraint?
8. What happens when dropping a column?
9. Why check existing data first?
10. What are ALTER TABLE best practices?

---

## Practical Exercises

### Task 1

Add:

```sql
Email
```

column to Employees.

---

### Task 2

Increase EmployeeName length from:

```sql
VARCHAR(50)
```

to

```sql
VARCHAR(100)
```

---

### Task 3

Add:

```sql
UNIQUE
```

constraint to Email.

---

### Task 4

Add:

```sql
CHECK (Salary > 0)
```

constraint.

---

### Task 5

Drop a column.

---

### Task 6

Drop a constraint.

---

### Challenge Project

Create:

```text
Employees
Departments
```

Then:

- Add new columns
- Modify data types
- Add primary keys
- Add foreign keys
- Add check constraints
- Remove unused columns

using only ALTER TABLE statements.

---

# 🚀 Next Module

➡ **Module 16: SQL JOINS (Most Important SQL Topic)**

Topics Covered:

- Why JOINS Are Needed
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL OUTER JOIN
- SELF JOIN
- CROSS JOIN
- Join Execution Logic
- Real-World Analytics Queries
- Interview Questions