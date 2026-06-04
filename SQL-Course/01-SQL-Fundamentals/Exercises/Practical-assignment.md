# Practical Assignment

## Scenario

You have joined a company as a Junior Data Analyst.

Create a database table to store employee information.

---

## Task 1: Create Table

Create a table named:

```text
Employees
```

Columns:

| Column | Data Type |
|----------|------------|
| EmployeeID | INT |
| EmployeeName | VARCHAR(100) |
| Age | INT |
| Department | VARCHAR(50) |
| Salary | DECIMAL(10,2) |

---

## Task 2: Insert Records

Insert the following records:

| EmployeeID | EmployeeName | Age | Department | Salary |
|------------|--------------|-----|------------|---------|
| 101 | Rahul | 25 | IT | 45000 |
| 102 | Aman | 28 | HR | 50000 |
| 103 | Priya | 27 | Finance | 55000 |
| 104 | Neha | 30 | IT | 60000 |
| 105 | Arjun | 29 | Sales | 52000 |

---

## Task 3: Retrieve Data

Write queries to:

1. Display all employees.
2. Display only EmployeeName and Salary.
3. Display employees whose salary is greater than 50000.

---

## Task 4: Update Data

Increase Rahul's salary to:

```text
50000
```

Verify the update.

---

## Task 5: Delete Data

Delete employee:

```text
EmployeeID = 105
```

Display remaining records.

---

## Task 6: Table Modification

Add a new column:

```text
JoiningDate
```

using ALTER TABLE.

---

## Bonus Challenge

Create a Departments table and establish a relationship using a Foreign Key.