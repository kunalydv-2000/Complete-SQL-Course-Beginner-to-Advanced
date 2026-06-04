CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Age INT,
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employees
VALUES
(101,'Rahul',25,'IT',45000),
(102,'Aman',28,'HR',50000),
(103,'Priya',27,'Finance',55000),
(104,'Neha',30,'IT',60000),
(105,'Arjun',29,'Sales',52000);

SELECT * FROM Employees;

SELECT EmployeeName, Salary
FROM Employees;

SELECT *
FROM Employees
WHERE Salary > 50000;

UPDATE Employees
SET Salary = 50000
WHERE EmployeeID = 101;

DELETE FROM Employees
WHERE EmployeeID = 105;

ALTER TABLE Employees
ADD JoiningDate DATE;