[Main Roadmap](https://github.com/kunalydv-2000/Complete-SQL-Course-Beginner-to-Advanced/blob/61950d4642ce8bd9ed200084e830ac99ce308582/README.md) | [Next →](https://github.com/kunalydv-2000/Complete-SQL-Course-Beginner-to-Advanced/blob/a20e75dca2993d7e1668750048e74eb9779d1912/SQL-Course/04-CREATE-TABLE-Statement/readme.md)
# Module 3: SQL Data Types

> Data types define the kind of data that can be stored in a column. Choosing the correct data type is one of the most important database design decisions because it affects storage, performance, accuracy, and data integrity.

---

# 📖 Introduction

Every column in a SQL table must have a data type.

A data type tells SQL Server:

- What kind of data can be stored
- How much storage space is required
- What operations can be performed
- How data should be displayed

Example:

```sql
CREATE TABLE Employees
(
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    Salary DECIMAL(10,2),
    JoiningDate DATE
);
```

Here:

| Column | Data Type |
|----------|----------|
| EmployeeID | INT |
| EmployeeName | VARCHAR |
| Salary | DECIMAL |
| JoiningDate | DATE |

---

# 🎯 Learning Objectives

After completing this module, you will be able to:

✅ Understand SQL Data Types

✅ Differentiate between numeric and character data

✅ Store dates and times correctly

✅ Select appropriate data types

✅ Optimize database storage

✅ Avoid common design mistakes

---

# 📚 Table of Contents

1. What is a Data Type?
2. Why Data Types Matter
3. Categories of Data Types
4. Numeric Data Types
5. Character Data Types
6. Date and Time Data Types
7. Boolean Data Types
8. Binary Data Types
9. Choosing the Right Data Type
10. Best Practices
11. Summary
12. Practice Questions

---

# 1️⃣ What is a Data Type?

A Data Type defines the type of value that can be stored in a column.

Think of a data type as a container.

Example:

```text
Age
```

can only store numbers.

```text
Name
```

can store text.

```text
JoiningDate
```

can store dates.

---

# Example

```sql
CREATE TABLE Students
(
    StudentID INT,
    StudentName VARCHAR(100),
    Age INT
);
```

---

# 2️⃣ Why Data Types Matter

Selecting the correct data type provides:

### Better Performance

Smaller storage = Faster queries

---

### Data Integrity

Prevents invalid values.

Example:

```sql
Age INT
```

Cannot store:

```text
Twenty
```

---

### Storage Optimization

Efficient use of disk space.

---

### Easier Data Analysis

Proper calculations and sorting.

---

# 3️⃣ Categories of SQL Data Types

SQL Server Data Types can be divided into:

```text
Data Types
│
├── Numeric
├── Character
├── Date & Time
├── Boolean
├── Binary
└── Special Types
```

---

# 4️⃣ Numeric Data Types

Used to store numbers.

---

# INT

Stores whole numbers.

Range:

```text
-2,147,483,648
to
 2,147,483,647
```

Storage:

```text
4 Bytes
```

Example:

```sql
Age INT
```

Valid Values:

```text
18
25
100
```

---

# SMALLINT

Smaller integer values.

Range:

```text
-32,768
to
32,767
```

Storage:

```text
2 Bytes
```

Example:

```sql
Year SMALLINT
```

---

# BIGINT

Large integer values.

Range:

```text
-9 Quintillion
to
+9 Quintillion
```

Storage:

```text
8 Bytes
```

Example:

```sql
Population BIGINT
```

---

# TINYINT

Stores small positive integers.

Range:

```text
0 to 255
```

Storage:

```text
1 Byte
```

Example:

```sql
Rating TINYINT
```

---

# DECIMAL

Stores exact decimal numbers.

Syntax:

```sql
DECIMAL(p,s)
```

Where:

```text
p = Precision
s = Scale
```

---

## Precision

Total digits.

---

## Scale

Digits after decimal point.

---

Example:

```sql
Salary DECIMAL(10,2)
```

Meaning:

```text
12345678.90
```

Maximum:

10 digits total

2 digits after decimal

---

# NUMERIC

Same as DECIMAL.

```sql
Salary NUMERIC(10,2)
```

---

# FLOAT

Stores approximate decimal values.

Example:

```sql
InterestRate FLOAT
```

---

Use For:

- Scientific calculations
- Statistical calculations

Avoid for money calculations.

---

# MONEY

Stores currency values.

Example:

```sql
Salary MONEY
```

---

# Numeric Data Type Comparison

| Data Type | Storage | Example |
|------------|----------|----------|
| TINYINT | 1 Byte | 100 |
| SMALLINT | 2 Bytes | 30000 |
| INT | 4 Bytes | 500000 |
| BIGINT | 8 Bytes | 9999999999 |
| DECIMAL | Variable | 45000.50 |
| FLOAT | Variable | 3.141592 |
| MONEY | 8 Bytes | ₹50000.25 |

---

# 5️⃣ Character Data Types

Used for storing text.

---

# CHAR

Fixed-length character data.

Example:

```sql
Gender CHAR(1)
```

Stored:

```text
M
F
```

---

If stored value:

```text
A
```

SQL still reserves:

```text
1 Character
```

---

# VARCHAR

Variable-length character data.

Example:

```sql
Name VARCHAR(100)
```

Storage depends on actual text.

---

Example:

```text
Kunal
```

Uses fewer bytes than:

```text
Kunal Kumar Yadav
```

---

# CHAR vs VARCHAR

| Feature | CHAR | VARCHAR |
|----------|----------|----------|
| Length | Fixed | Variable |
| Storage | Fixed | Flexible |
| Performance | Slightly Faster | Efficient Storage |

---

# NCHAR

Fixed-length Unicode data.

Supports:

- Hindi
- Chinese
- Japanese
- Arabic

Example:

```sql
Name NCHAR(50)
```

---

# NVARCHAR

Variable-length Unicode data.

Most commonly used for multilingual systems.

Example:

```sql
Name NVARCHAR(100)
```

---

# TEXT

Stores very large text.

Example:

```sql
Description TEXT
```

Modern SQL Server prefers:

```sql
VARCHAR(MAX)
```

---

# Character Data Type Comparison

| Type | Unicode | Fixed |
|--------|--------|--------|
| CHAR | No | Yes |
| VARCHAR | No | No |
| NCHAR | Yes | Yes |
| NVARCHAR | Yes | No |

---

# 6️⃣ Date and Time Data Types

Used for storing dates and times.

---

# DATE

Stores only date.

Example:

```sql
JoiningDate DATE
```

Stored:

```text
2026-06-01
```

---

# TIME

Stores only time.

Example:

```sql
LoginTime TIME
```

Stored:

```text
10:45:20
```

---

# DATETIME

Stores both date and time.

Example:

```sql
CreatedAt DATETIME
```

Stored:

```text
2026-06-01 10:45:20
```

---

# DATETIME2

Improved version of DATETIME.

Advantages:

✅ Larger date range

✅ Better precision

✅ Recommended by Microsoft

Example:

```sql
CreatedAt DATETIME2
```

---

# SMALLDATETIME

Less storage.

Stores:

```text
Date + Time
```

with reduced precision.

---

# Date Data Type Comparison

| Type | Date | Time |
|--------|--------|--------|
| DATE | Yes | No |
| TIME | No | Yes |
| DATETIME | Yes | Yes |
| DATETIME2 | Yes | Yes |
| SMALLDATETIME | Yes | Yes |

---

# 7️⃣ Boolean Data Type

SQL Server does not have TRUE/FALSE.

Instead:

```sql
BIT
```

is used.

---

Example:

```sql
IsActive BIT
```

Values:

```text
1 = True
0 = False
```

---

Example Table

| EmployeeID | IsActive |
|------------|-----------|
| 101 | 1 |
| 102 | 0 |

---

# 8️⃣ Binary Data Types

Used for storing files.

Examples:

- Images
- PDFs
- Videos

---

# BINARY

Fixed-length binary data.

---

# VARBINARY

Variable-length binary data.

Example:

```sql
ProfilePicture VARBINARY(MAX)
```

---

# Common Uses

Store:

```text
Images
Documents
Audio Files
```

---

# 9️⃣ Choosing the Right Data Type

---

# Employee ID

✅

```sql
EmployeeID INT
```

❌

```sql
EmployeeID VARCHAR(50)
```

---

# Salary

✅

```sql
Salary DECIMAL(10,2)
```

❌

```sql
Salary FLOAT
```

---

# Employee Name

✅

```sql
EmployeeName VARCHAR(100)
```

---

# Joining Date

✅

```sql
JoiningDate DATE
```

---

# Active Status

✅

```sql
IsActive BIT
```

---

# 🔟 Best Practices

### Use Smallest Appropriate Type

Good:

```sql
Age TINYINT
```

Bad:

```sql
Age BIGINT
```

---

### Avoid FLOAT for Currency

Good:

```sql
Salary DECIMAL(10,2)
```

Bad:

```sql
Salary FLOAT
```

---

### Use VARCHAR Instead of CHAR

Unless length is fixed.

---

### Use DATETIME2

Instead of DATETIME.

---

### Use NVARCHAR for International Applications

Supports all languages.

---

### Avoid Deprecated Types

Avoid:

```sql
TEXT
NTEXT
IMAGE
```

Prefer:

```sql
VARCHAR(MAX)
NVARCHAR(MAX)
VARBINARY(MAX)
```

---

# Example Table Using Best Practices

```sql
CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    EmployeeName NVARCHAR(100),
    Salary DECIMAL(10,2),
    JoiningDate DATE,
    LastLogin DATETIME2,
    IsActive BIT
);
```

---

# 📝 Summary

In this module, you learned:

✅ What Data Types are

✅ Numeric Data Types

✅ Character Data Types

✅ Date & Time Data Types

✅ Boolean Data Types

✅ Binary Data Types

✅ Data Type Selection

✅ Storage Optimization

✅ Best Practices

---

# 🧠 Practice Questions

## Theory

1. What is a Data Type?
2. Difference between CHAR and VARCHAR?
3. Difference between DATE and DATETIME?
4. What is Precision?
5. What is Scale?
6. Difference between INT and BIGINT?
7. Why avoid FLOAT for salary?
8. What is NVARCHAR?
9. What is BIT?
10. What is VARBINARY(MAX)?

---

## Practical

### Task 1

Create a table:

```sql
Employees
```

Columns:

```text
EmployeeID
EmployeeName
Salary
JoiningDate
IsActive
```

Use appropriate data types.

---

### Task 2

Insert 10 records.

---

### Task 3

Display all records.

---

### Task 4

Create a table:

```sql
Products
```

with:

```text
ProductID
ProductName
Price
ManufactureDate
Description
```

Choose the best data types.

---

# 🚀 Next Module

➡ Module 4: CREATE TABLE Statement

Topics Covered:

- CREATE TABLE Syntax
- Column Definitions
- Constraints
- Naming Conventions
- Real-World Table Design
- Best Practices
