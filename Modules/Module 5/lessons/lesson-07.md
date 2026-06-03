# Lesson 07: SELF JOIN

> Learn how to join a table to itself using SELF JOIN and analyze hierarchical relationships such as employee-manager structures and recursive data relationships.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand SELF JOIN
* Join a table to itself
* Use table aliases effectively
* Model hierarchical relationships
* Analyze parent-child relationships
* Build reporting structures
* Understand recursive data relationships

---

# Introduction

So far, every JOIN has involved:

```text id="sj001"
Table A
      ↔
Table B
```

Examples:

```text id="sj002"
Books ↔ Categories

Books ↔ Publishers

Members ↔ BorrowRecords
```

But sometimes a table contains relationships within itself.

Example:

```text id="sj003"
Employee
     ↓
Manager
```

Both employees and managers exist in the same table.

To solve this, SQL provides:

```sql id="sj004"
SELF JOIN
```

---

# What is SELF JOIN?

A SELF JOIN joins a table to itself.

Visualization:

```text id="sj005"
Employees
     ↔
Employees
```

---

Important:

```text id="sj006"
No special JOIN keyword exists.

SELF JOIN uses
INNER JOIN, LEFT JOIN, etc.

The difference is:
the same table appears twice.
```

---

# Why Use SELF JOIN?

SELF JOIN is useful when:

```text id="sj007"
Employees → Managers

Categories → Parent Categories

Products → Parent Products

Organizational Hierarchies
```

---

# Sample Employee Table

| EmployeeID | EmployeeName | ManagerID |
| ---------- | ------------ | --------- |
| 1          | John         | NULL      |
| 2          | Sarah        | 1         |
| 3          | Mike         | 1         |
| 4          | Emma         | 2         |

---

Meaning:

```text id="sj008"
John manages Sarah

John manages Mike

Sarah manages Emma
```

---

# Problem

Question:

```text id="sj009"
Show employee names
along with manager names.
```

The manager name does not exist directly.

Only:

```text id="sj010"
ManagerID
```

is stored.

---

# Solution Using SELF JOIN

```sql id="sj011"
SELECT
    E.EmployeeName,
    M.EmployeeName AS ManagerName
FROM Employees E
INNER JOIN Employees M
    ON E.ManagerID = M.EmployeeID;
```

---

# Understanding Aliases

```text id="sj012"
Employees E
```

Represents:

```text id="sj013"
Employee
```

---

```text id="sj014"
Employees M
```

Represents:

```text id="sj015"
Manager
```

---

Same table.

Different roles.

---

# Result

| Employee | Manager |
| -------- | ------- |
| Sarah    | John    |
| Mike     | John    |
| Emma     | Sarah   |

---

# How SELF JOIN Works

Step 1:

```text id="sj016"
Employee Record
```

↓

Step 2:

```text id="sj017"
ManagerID
```

↓

Step 3:

```text id="sj018"
Find Matching EmployeeID
```

↓

Step 4:

```text id="sj019"
Return Manager Name
```

---

# Visual Representation

```text id="sj020"
Employees

EmployeeID = 1
John

EmployeeID = 2
Sarah
ManagerID = 1
```

↓

Join:

```text id="sj021"
Sarah → John
```

---

# LEFT SELF JOIN

Problem:

The CEO has no manager.

Example:

| EmployeeID | EmployeeName | ManagerID |
| ---------- | ------------ | --------- |
| 1          | John         | NULL      |

---

Using INNER JOIN:

```sql id="sj022"
SELECT
    E.EmployeeName,
    M.EmployeeName
FROM Employees E
INNER JOIN Employees M
    ON E.ManagerID = M.EmployeeID;
```

---

Result:

```text id="sj023"
John disappears.
```

---

Using LEFT JOIN:

```sql id="sj024"
SELECT
    E.EmployeeName,
    M.EmployeeName AS ManagerName
FROM Employees E
LEFT JOIN Employees M
    ON E.ManagerID = M.EmployeeID;
```

---

Result:

| Employee | Manager |
| -------- | ------- |
| John     | NULL    |
| Sarah    | John    |
| Mike     | John    |
| Emma     | Sarah   |

---

# Parent-Child Categories Example

Category Table

| CategoryID | CategoryName | ParentCategoryID |
| ---------- | ------------ | ---------------- |
| 1          | Technology   | NULL             |
| 2          | SQL          | 1                |
| 3          | Power BI     | 1                |

---

Business Question:

```text id="sj025"
Show category
and parent category.
```

---

Query:

```sql id="sj026"
SELECT
    C.CategoryName,
    P.CategoryName AS ParentCategory
FROM Categories C
LEFT JOIN Categories P
    ON C.ParentCategoryID = P.CategoryID;
```

---

# Result

| Category   | Parent     |
| ---------- | ---------- |
| Technology | NULL       |
| SQL        | Technology |
| Power BI   | Technology |

---

# Library Example

Suppose Authors table contains:

| AuthorID | AuthorName | MentorAuthorID |
| -------- | ---------- | -------------- |
| 1        | John Smith | NULL           |
| 2        | Jane Brown | 1              |

---

Query:

```sql id="sj027"
SELECT
    A.AuthorName,
    M.AuthorName AS Mentor
FROM Authors A
LEFT JOIN Authors M
    ON A.MentorAuthorID = M.AuthorID;
```

---

# SELF JOIN Execution Flow

```text id="sj028"
Employees (Alias E)
         ↓
Employees (Alias M)
         ↓
Join Condition
         ↓
Results
```

---

# Business Example 1

Employee Reporting Structure

```sql id="sj029"
SELECT
    E.EmployeeName,
    M.EmployeeName AS ManagerName
FROM Employees E
LEFT JOIN Employees M
    ON E.ManagerID = M.EmployeeID;
```

---

# Business Example 2

Category Hierarchy

```sql id="sj030"
SELECT
    C.CategoryName,
    P.CategoryName AS ParentCategory
FROM Categories C
LEFT JOIN Categories P
    ON C.ParentCategoryID = P.CategoryID;
```

---

# Business Example 3

Mentor Relationships

```sql id="sj031"
SELECT
    A.AuthorName,
    M.AuthorName AS MentorAuthor
FROM Authors A
LEFT JOIN Authors M
    ON A.MentorAuthorID = M.AuthorID;
```

---

# Common Beginner Mistakes

---

## Not Using Aliases

Bad:

```sql id="sj032"
SELECT *
FROM Employees
INNER JOIN Employees
```

---

SQL cannot determine which instance of the table you mean.

---

Correct:

```sql id="sj033"
Employees E
Employees M
```

---

## Wrong Join Columns

Bad:

```sql id="sj034"
ON E.EmployeeID =
   M.EmployeeID
```

---

Correct:

```sql id="sj035"
ON E.ManagerID =
   M.EmployeeID
```

---

## Using INNER JOIN Instead of LEFT JOIN

Problem:

```text id="sj036"
Top-level records disappear.
```

---

Solution:

```text id="sj037"
LEFT JOIN
```

---

# Hands-On Practice

Run:

```sql id="sj038"
SELECT
    E.EmployeeName,
    M.EmployeeName AS ManagerName
FROM Employees E
LEFT JOIN Employees M
    ON E.ManagerID = M.EmployeeID;
```

---

Run:

```sql id="sj039"
SELECT
    C.CategoryName,
    P.CategoryName AS ParentCategory
FROM Categories C
LEFT JOIN Categories P
    ON C.ParentCategoryID = P.CategoryID;
```

---

# Mini Exercise

### Task 1

Create a SELF JOIN showing employees and managers.

---

### Task 2

Create a SELF JOIN showing categories and parent categories.

---

### Task 3

Create a SELF JOIN showing authors and mentors.

---

### Task 4

Explain why aliases are required in SELF JOIN.

---

### Task 5

Explain why LEFT JOIN is often preferred in SELF JOIN.

---

# Best Practices

✅ Always use aliases

✅ Use meaningful alias names

✅ Verify hierarchical relationships

✅ Use LEFT JOIN for top-level records

✅ Document recursive structures

---

# Summary

In this lesson, you learned:

* SELF JOIN fundamentals
* Joining a table to itself
* Employee-manager relationships
* Parent-child hierarchies
* Recursive relationships
* Alias usage
* Hierarchical reporting

SELF JOIN is a powerful technique for analyzing hierarchical and recursive relationships stored within a single table.

---

# Knowledge Check

### Question 1

What is a SELF JOIN?

A. Joining two databases

B. Joining a table to itself

C. Joining views

D. Joining three tables

---

### Question 2

Are aliases required in SELF JOIN?

A. Yes

B. No

---

### Question 3

Which column typically connects employees to managers?

A. EmployeeName

B. EmployeeID

C. ManagerID

D. DepartmentID

---

### Question 4

Which JOIN type is often preferred in SELF JOIN?

A. CROSS JOIN

B. LEFT JOIN

C. RIGHT JOIN

D. FULL JOIN

---

### Question 5

What type of relationship is commonly analyzed using SELF JOIN?

A. Hierarchical

B. Random

C. Temporary

D. Aggregate

---

# Next Lesson

➡️ 08-Many-to-Many-Relationships.md

In the next lesson, you'll learn how many-to-many relationships work and how junction tables connect entities such as Books and Authors.
