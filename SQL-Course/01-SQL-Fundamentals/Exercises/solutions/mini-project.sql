```sql
/*========================================================
  MINI PROJECT SOLUTION
  Module 01 - SQL Fundamentals
  Project: Employee Management System
========================================================*/

/*========================================================
  STEP 1: CREATE TABLES
========================================================*/

create database EmployeeManagement;
use EmployeeManagement;


CREATE TABLE Departments
(
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100) NOT NULL,
    Age INT,
    Salary DECIMAL(10,2),
    DepartmentID INT,

    FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID)
);

/*========================================================
  STEP 2: INSERT DATA
========================================================*/

/* Departments */

INSERT INTO Departments
(DepartmentID, DepartmentName)
VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

/* Employees */

INSERT INTO Employees
(EmployeeID, EmployeeName, Age, Salary, DepartmentID)
VALUES
(101, 'Rahul', 25, 45000, 2),
(102, 'Aman', 28, 50000, 1),
(103, 'Priya', 27, 55000, 3),
(104, 'Neha', 30, 60000, 2),
(105, 'Arjun', 29, 52000, 1);

/*========================================================
  STEP 3: DISPLAY DATA
========================================================*/

/* Display all employees */

SELECT *
FROM Employees;

/* Display all departments */

SELECT *
FROM Departments;

/*========================================================
  STEP 4: FILTER DATA
========================================================*/

/* Employees earning more than 50000 */

SELECT *
FROM Employees
WHERE Salary > 50000;

/*========================================================
  STEP 5: AGGREGATE FUNCTIONS
========================================================*/

/* Total Employees */

SELECT COUNT(*) AS TotalEmployees
FROM Employees;

/* Highest Salary */

SELECT MAX(Salary) AS HighestSalary
FROM Employees;

/* Average Salary */

SELECT AVG(Salary) AS AverageSalary
FROM Employees;

/*========================================================
  STEP 6: JOIN QUERY
========================================================*/

/* Employee with Department Name */

SELECT
    E.EmployeeID,
    E.EmployeeName,
    E.Age,
    E.Salary,
    D.DepartmentName
FROM Employees E
INNER JOIN Departments D
    ON E.DepartmentID = D.DepartmentID;

/*========================================================
  STEP 7: UPDATE DATA
========================================================*/

/* Increase Rahul's salary */

UPDATE Employees
SET Salary = 50000
WHERE EmployeeID = 101;

/* Verify Update */

SELECT *
FROM Employees
WHERE EmployeeID = 101;

/*========================================================
  STEP 8: DELETE DATA
========================================================*/

/* Delete Employee */

DELETE FROM Employees
WHERE EmployeeID = 105;

/* Verify Deletion */

SELECT *
FROM Employees;

/*========================================================
  BONUS: ALTER TABLE
========================================================*/

ALTER TABLE Employees
ADD JoiningDate DATE;

/*========================================================
  BONUS: GROUP BY
========================================================*/

SELECT
    DepartmentID,
    COUNT(*) AS EmployeeCount,
    AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY DepartmentID;

/*========================================================
  PROJECT COMPLETED
========================================================*/
```
