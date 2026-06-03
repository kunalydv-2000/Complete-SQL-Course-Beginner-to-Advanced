/*====================================================
  LIBRARY MANAGEMENT SYSTEM
  Module 02 Project Script
  SQL Server (SSMS)
====================================================*/

-- ==========================================
-- CREATE DATABASE
-- ==========================================

CREATE DATABASE Library_Management_System_;
GO

USE Library_Management_System_;
GO

-- ==========================================
-- CREATE TABLES
-- ==========================================

CREATE TABLE _Categories_ (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE _Publishers_ (
    PublisherID INT IDENTITY(1,1) PRIMARY KEY,
    PublisherName VARCHAR(150) NOT NULL,
    Country VARCHAR(100)
);

CREATE TABLE _Authors_(
    AuthorID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    BirthDate DATE
);

CREATE TABLE _Books_(
    BookID INT IDENTITY(1,1) PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    ISBN VARCHAR(20) NOT NULL UNIQUE,
    PublicationYear INT,
    CategoryID INT,
    PublisherID INT,

    CONSTRAINT _FK_Books_Category
        FOREIGN KEY (CategoryID)
        REFERENCES _Categories_(CategoryID),

    CONSTRAINT _FK_Books_Publisher
        FOREIGN KEY (PublisherID)
        REFERENCES _Publishers_(PublisherID)
);

CREATE TABLE BookAuthors_Table (
    BookID INT NOT NULL,
    AuthorID INT NOT NULL,

    CONSTRAINT PK_BookAuthors
        PRIMARY KEY (BookID, AuthorID),

    CONSTRAINT _FK_BookAuthors_Book
        FOREIGN KEY (BookID)
        REFERENCES _Books_(BookID),

    CONSTRAINT _FK_BookAuthors_Author
        FOREIGN KEY (AuthorID)
        REFERENCES _Authors_(AuthorID)
);

CREATE TABLE Members_Table (
    MemberID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(255) UNIQUE,
    Phone VARCHAR(20),
    MembershipDate DATE DEFAULT GETDATE()
);

CREATE TABLE BorrowRecords_Table (
    BorrowID INT IDENTITY(1,1) PRIMARY KEY,
    MemberID INT NOT NULL,
    BookID INT NOT NULL,
    BorrowDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE,

    CONSTRAINT _FK_Borrow_Member
        FOREIGN KEY (MemberID)
        REFERENCES Members_Table(MemberID),

    CONSTRAINT _FK_Borrow_Book
        FOREIGN KEY (BookID)
        REFERENCES _Books_(BookID)
);

CREATE TABLE Reservations_Table (
    ReservationID INT IDENTITY(1,1) PRIMARY KEY,
    MemberID INT NOT NULL,
    BookID INT NOT NULL,
    ReservationDate DATE NOT NULL,
    Status VARCHAR(20) DEFAULT 'Pending',

    CONSTRAINT _FK_Reservation_Member
        FOREIGN KEY (MemberID)
        REFERENCES Members_Table(MemberID),

    CONSTRAINT _FK_Reservation_Book
        FOREIGN KEY (BookID)
        REFERENCES _Books_(BookID)
);

-- ==========================================
-- INSERT CATEGORIES
-- ==========================================

INSERT INTO _Categories_(CategoryName)
VALUES
('Technology'),
('Science'),
('Business'),
('History'),
('Fiction');

-- ==========================================
-- INSERT PUBLISHERS
-- ==========================================

INSERT INTO _Publishers_
(PublisherName, Country)
VALUES
('O''Reilly Media', 'USA'),
('Packt Publishing', 'UK'),
('Pearson', 'USA'),
('McGraw-Hill', 'USA'),
('Wiley', 'USA');

-- ==========================================
-- INSERT AUTHORS
-- ==========================================

INSERT INTO _Authors_
(FirstName, LastName, BirthDate)
VALUES
('Alan','Beaulieu','1965-05-10'),
('Robert','Martin','1952-12-05'),
('Andrew','Ng','1976-04-18'),
('Simon','Sinek','1973-10-09'),
('Yuval','Harari','1976-02-24'),
('Stephen','King','1947-09-21'),
('James','Clear','1986-01-01'),
('Eric','Evans','1965-01-01'),
('Martin','Fowler','1963-12-18'),
('Brené','Brown','1965-11-18');

-- ==========================================
-- INSERT BOOKS
-- ==========================================

INSERT INTO _Books_
(
    Title,
    ISBN,
    PublicationYear,
    CategoryID,
    PublisherID
)
VALUES
('The SQL Handbook', '9781000000001', 2020, 1, 1),
('Database Design Essentials', '9781000000002', 2019, 1, 2),
('Mastering T-SQL', '9781000000003', 2021, 1, 3),
('Data Analytics Fundamentals', '9781000000004', 2022, 2, 1),
('Business Intelligence Guide', '9781000000005', 2023, 2, 4),
('Power BI for Beginners', '9781000000006', 2022, 2, 5),
('Advanced SQL Queries', '9781000000007', 2021, 1, 2),
('Cloud Database Systems', '9781000000008', 2024, 3, 3),
('Data Warehousing Concepts', '9781000000009', 2020, 3, 4),
('Big Data Technologies', '9781000000010', 2023, 3, 5),
('Python for Data Analysis', '9781000000011', 2022, 4, 1),
('Machine Learning Basics', '9781000000012', 2023, 4, 2),
('Artificial Intelligence Explained', '9781000000013', 2024, 4, 3),
('Statistics for Analysts', '9781000000014', 2019, 4, 4),
('Excel for Professionals', '9781000000015', 2021, 2, 5),
('Data Visualization Principles', '9781000000016', 2022, 2, 1),
('NoSQL Databases', '9781000000017', 2023, 3, 2),
('Cybersecurity Fundamentals', '9781000000018', 2020, 5, 3),
('Computer Networks', '9781000000019', 2018, 5, 4),
('Operating Systems Concepts', '9781000000020', 2019, 5, 5),
('Software Engineering Practices', '9781000000021', 2021, 5, 1),
('Agile Project Management', '9781000000022', 2022, 5, 2),
('Data Science with Python', '9781000000023', 2024, 4, 3),
('ETL Development Guide', '9781000000024', 2023, 3, 4),
('Reporting and Dashboards', '9781000000025', 2022, 2, 5);

-- ==========================================
-- INSERT BOOK AUTHORS
-- ==========================================

INSERT INTO BookAuthors_Table
(BookID, AuthorID)
VALUES
(1,1),
(2,2),
(4,3),
(5,4),
(6,5),
(7,6),
(8,7),
(9,8),
(10,9);

-- ==========================================
-- INSERT MEMBERS
-- ==========================================

INSERT INTO Members_Table
(
    FirstName,
    LastName,
    Email,
    Phone
)
VALUES
('John', 'Smith', 'john.smith@email.com', '9876543210'),
('Emma', 'Johnson', 'emma.johnson@email.com', '9876543211'),
('Michael', 'Brown', 'michael.brown@email.com', '9876543212'),
('Olivia', 'Davis', 'olivia.davis@email.com', '9876543213'),
('William', 'Wilson', 'william.wilson@email.com', '9876543214'),
('Sophia', 'Taylor', 'sophia.taylor@email.com', '9876543215'),
('James', 'Anderson', 'james.anderson@email.com', '9876543216'),
('Ava', 'Thomas', 'ava.thomas@email.com', '9876543217'),
('Benjamin', 'Jackson', 'benjamin.jackson@email.com', '9876543218'),
('Isabella', 'White', 'isabella.white@email.com', '9876543219'),
('Lucas', 'Harris', 'lucas.harris@email.com', '9876543220'),
('Mia', 'Martin', 'mia.martin@email.com', '9876543221'),
('Henry', 'Thompson', 'henry.thompson@email.com', '9876543222'),
('Charlotte', 'Garcia', 'charlotte.garcia@email.com', '9876543223'),
('Alexander', 'Martinez', 'alexander.martinez@email.com', '9876543224');

-- ==========================================
-- INSERT BORROW RECORDS
-- ==========================================

INSERT INTO BorrowRecords_Table
(
    MemberID,
    BookID,
    BorrowDate,
    DueDate
)
VALUES
(1,1,GETDATE(),DATEADD(DAY,14,GETDATE())),
(2,2,GETDATE(),DATEADD(DAY,14,GETDATE())),
(3,3,GETDATE(),DATEADD(DAY,14,GETDATE())),
(4,4,GETDATE(),DATEADD(DAY,14,GETDATE())),
(5,5,GETDATE(),DATEADD(DAY,14,GETDATE())),
(6,6,GETDATE(),DATEADD(DAY,14,GETDATE())),
(7,7,GETDATE(),DATEADD(DAY,14,GETDATE())),
 (8,8,GETDATE(),DATEADD(DAY,14,GETDATE())),
 (9,9,GETDATE(),DATEADD(DAY,14,GETDATE())),
 (10,10,GETDATE(),DATEADD(DAY,14,GETDATE())),
 (11,11,GETDATE(),DATEADD(DAY,14,GETDATE())),
 (12,12,GETDATE(),DATEADD(DAY,14,GETDATE())),
 (13,13,GETDATE(),DATEADD(DAY,14,GETDATE())),
 (14,14,GETDATE(),DATEADD(DAY,14,GETDATE())),
 (15,15,GETDATE(),DATEADD(DAY,14,GETDATE()));
-- ==========================================
-- INSERT RESERVATIONS
-- ==========================================

INSERT INTO Reservations_Table
(
    MemberID,
    BookID,
    ReservationDate
)
VALUES
(1,6,GETDATE()),
(2,7,GETDATE()),
(3,8,GETDATE()),
(4,9,GETDATE()),
(5,10,GETDATE()),
(6,11,GETDATE()),
(7,12,GETDATE()),
(8,13,GETDATE()),
(9,14,GETDATE()),
(10,15,GETDATE());

-- ==========================================
-- UPDATE OPERATIONS
-- ==========================================

UPDATE Members_Table
SET Email = 'johnsmith@email.com'
WHERE MemberID = 1;

UPDATE _Books_
SET Title = 'Clean Code Second Edition'
WHERE BookID = 2;

UPDATE _Books_
SET PublicationYear = 2025
WHERE BookID = 1;

UPDATE Reservations_Table
SET Status = 'Approved'
WHERE ReservationID = 1;

-- ==========================================
-- DELETE OPERATIONS
-- ==========================================

DELETE FROM Reservations_Table
WHERE ReservationID = 5;

DELETE FROM BorrowRecords_Table
WHERE BorrowID = 5;

DELETE FROM Members_Table
WHERE MemberID = 10;

-- ==========================================
-- VERIFICATION QUERIES
-- ==========================================

SELECT * FROM _Categories_;
SELECT * FROM _Publishers_;
SELECT * FROM _Authors_;
SELECT * FROM _Books_;
SELECT * FROM BookAuthors_Table;
SELECT * FROM Members_Table;
SELECT * FROM BorrowRecords_Table;
SELECT * FROM Reservations_Table;

-- ==========================================
-- VIEW TABLES
-- ==========================================

SELECT *
FROM INFORMATION_SCHEMA.TABLES;

-- ==========================================
-- VIEW CONSTRAINTS
-- ==========================================

SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS;
```
