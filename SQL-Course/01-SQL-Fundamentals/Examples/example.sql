CREATE TABLE Employees
(
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    Salary DECIMAL(10,2)
);

INSERT INTO Employees
(EmployeeID, EmployeeName, Salary)
VALUES
(101, 'Kunal', 45000),
(102, 'Rahul', 50000),
(103, 'Aman', 55000);

SELECT *
FROM Employees;

SELECT EmployeeName, Salary
FROM Employees;

SELECT *
FROM Employees
WHERE Salary > 50000;

UPDATE Employees
SET Salary = 60000
WHERE EmployeeID = 101;

SELECT *
FROM Employees;

DELETE FROM Employees
WHERE EmployeeID = 103;

SELECT *
FROM Employees;

ALTER TABLE Employees
ADD Department VARCHAR(50);

ALTER TABLE Employees
ADD JoiningDate DATE;

TRUNCATE TABLE Employees;

DROP TABLE Employees;

CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Salary DECIMAL(10,2)
);

CREATE TABLE Departments
(
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    DepartmentID INT,

    FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID)
);

SELECT COUNT(*) AS TotalEmployees
FROM Employees;

SELECT SUM(Salary) AS TotalSalary
FROM Employees;

SELECT AVG(Salary) AS AverageSalary
FROM Employees;

SELECT MIN(Salary) AS MinimumSalary
FROM Employees;

SELECT MAX(Salary) AS MaximumSalary
FROM Employees;

SELECT DepartmentID,
       COUNT(*) AS EmployeeCount,
       AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY DepartmentID;

BEGIN TRANSACTION;

UPDATE Employees
SET Salary = Salary + 5000
WHERE EmployeeID = 101;

SAVEPOINT BeforeCommit;

COMMIT;

/* Example Rollback */

BEGIN TRANSACTION;

UPDATE Employees
SET Salary = Salary - 10000
WHERE EmployeeID = 101;

ROLLBACK;

GRANT SELECT
ON Employees
TO AnalystUser;

REVOKE SELECT
ON Employees
FROM AnalystUser;