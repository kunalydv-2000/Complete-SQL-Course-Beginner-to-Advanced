-- ==========================================
-- Library Management System Database
-- ==========================================

-- Create Database
CREATE DATABASE Library_Management_System;

-- Use Database
USE Library_Management_System;

-- ==========================================
-- Categories Table
-- ==========================================

CREATE TABLE Categories (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL UNIQUE
);

-- ==========================================
-- Publishers Table
-- ==========================================

CREATE TABLE Publishers (
    PublisherID INT IDENTITY(1,1) PRIMARY KEY,
    PublisherName VARCHAR(150) NOT NULL,
    Country VARCHAR(100)
);

-- ==========================================
-- Authors Table
-- ==========================================

CREATE TABLE Authors (
    AuthorID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    BirthDate DATE
);

-- ==========================================
-- Books Table
-- ==========================================

CREATE TABLE Books (
    BookID INT IDENTITY(1,1) PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    PublicationYear INT,
    CategoryID INT,
    PublisherID INT,

    CONSTRAINT fk_books_category
        FOREIGN KEY (CategoryID)
        REFERENCES Categories(CategoryID),

    CONSTRAINT fk_books_publisher
        FOREIGN KEY (PublisherID)
        REFERENCES Publishers(PublisherID)
);

-- ==========================================
-- Book Authors (Many-to-Many)
-- ==========================================

CREATE TABLE BookAuthors (
    BookID INT,
    AuthorID INT,

    PRIMARY KEY (BookID, AuthorID),

    CONSTRAINT fk_bookauthors_book
        FOREIGN KEY (BookID)
        REFERENCES Books(BookID)
        ON DELETE CASCADE,

    CONSTRAINT fk_bookauthors_author
        FOREIGN KEY (AuthorID)
        REFERENCES Authors(AuthorID)
        ON DELETE CASCADE
);

-- ==========================================
-- Members Table
-- ==========================================

CREATE TABLE Members (
    MemberID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(255) UNIQUE,
    Phone VARCHAR(20),
    MembershipDate DATE NOT NULL
);

-- ==========================================
-- Borrow Records Table
-- ==========================================

CREATE TABLE BorrowRecords (
    BorrowID INT IDENTITY(1,1) PRIMARY KEY,
    MemberID INT NOT NULL,
    BookID INT NOT NULL,
    BorrowDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE,

    CONSTRAINT fk_borrow_member
        FOREIGN KEY (MemberID)
        REFERENCES Members(MemberID),

    CONSTRAINT fk_borrow_book
        FOREIGN KEY (BookID)
        REFERENCES Books(BookID)
);

-- ==========================================
-- Reservations Table
-- ==========================================

CREATE TABLE Reservations (
    ReservationID INT IDENTITY(1,1) PRIMARY KEY,
    MemberID INT NOT NULL,
    BookID INT NOT NULL,
    ReservationDate DATE NOT NULL,
    Status VARCHAR(20) DEFAULT 'Pending',

    CONSTRAINT fk_reservation_member
        FOREIGN KEY (MemberID)
        REFERENCES Members(MemberID),

    CONSTRAINT fk_reservation_book
        FOREIGN KEY (BookID)
        REFERENCES Books(BookID)
);

-- ==========================================
-- Sample Categories
-- ==========================================

INSERT INTO Categories (CategoryName)
VALUES
('Technology'),
('Science'),
('History'),
('Fiction'),
('Business');

-- ==========================================
-- Sample Publishers
-- ==========================================

INSERT INTO Publishers
(PublisherName, Country)
VALUES
('O''Reilly Media', 'USA'),
('Packt Publishing', 'UK'),
('Pearson', 'USA');

-- ==========================================
-- Sample Authors
-- ==========================================

INSERT INTO Authors
(FirstName, LastName, BirthDate)
VALUES
('Alan', 'Beaulieu', '1965-05-10'),
('Robert', 'Martin', '1952-12-05'),
('Andrew', 'Ng', '1976-04-18');

-- ==========================================
-- Sample Books
-- ==========================================

INSERT INTO Books
(
    Title,
    ISBN,
    PublicationYear,
    CategoryID,
    PublisherID
)
VALUES
(
    'Learning SQL',
    '9780596520830',
    2020,
    1,
    1
),
(
    'Clean Code',
    '9780132350884',
    2008,
    1,
    3
);

-- ==========================================
-- Book Authors Mapping
-- ==========================================

INSERT INTO BookAuthors
(BookID, AuthorID)
VALUES
(1, 1),
(2, 2);

-- ==========================================
-- Sample Members
-- ==========================================

INSERT INTO Members
(
    FirstName,
    LastName,
    Email,
    Phone,
    MembershipDate
)
VALUES
(
    'John',
    'Smith',
    'john@example.com',
    '9876543210',
    GETDATE()
),
(
    'Sarah',
    'Wilson',
    'sarah@example.com',
    '9876543211',
    GETDATE()
);

-- ==========================================
-- Sample Borrow Records
-- ==========================================

INSERT INTO BorrowRecords
(
    MemberID,
    BookID,
    BorrowDate,
    DueDate
)
VALUES
(
    1,
    1,
    GETDATE(),
    DATEADD(DAY, 14, GETDATE())
);

-- ==========================================
-- Sample Reservations
-- ==========================================

INSERT INTO Reservations
(
    MemberID,
    BookID,
    ReservationDate
)
VALUES
(
    2,
    2,
    GETDATE()
);

-- ==========================================
-- Verification Queries
-- ==========================================

SELECT * FROM Categories;
SELECT * FROM Publishers;
SELECT * FROM Authors;
SELECT * FROM Books;
SELECT * FROM Members;
SELECT * FROM BorrowRecords;
SELECT * FROM Reservations;
