```sql
/*====================================================
 MODULE 04 PROJECT
 Library Analytics Dashboard
 SQL Server (SSMS)
====================================================*/

USE LibraryManagementSystem;
GO

/*====================================================
 PART 1: COUNT REPORTS
====================================================*/

-- Report 01
SELECT
    COUNT(*) AS TotalBooks
FROM Books;

-- Report 02
SELECT
    COUNT(*) AS TotalMembers
FROM Members;

-- Report 03
SELECT
    COUNT(*) AS TotalAuthors
FROM Authors;

-- Report 04
SELECT
    COUNT(*) AS TotalReservations
FROM Reservations;

-- Report 05
SELECT
    COUNT(*) AS TotalBorrows
FROM BorrowRecords;


/*====================================================
 PART 2: MIN AND MAX REPORTS
====================================================*/

-- Report 06
SELECT
    MIN(PublicationYear) AS OldestPublicationYear
FROM Books;

-- Report 07
SELECT
    MAX(PublicationYear) AS NewestPublicationYear
FROM Books;

-- Report 08
SELECT
    MIN(MembershipDate) AS EarliestMembershipDate
FROM Members;

-- Report 09
SELECT
    MAX(MembershipDate) AS LatestMembershipDate
FROM Members;


/*====================================================
 PART 3: GROUP BY REPORTS
====================================================*/

-- Report 10
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID;

-- Report 11
SELECT
    PublisherID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY PublisherID;

-- Report 12
SELECT
    Status,
    COUNT(*) AS TotalReservations
FROM Reservations
GROUP BY Status;

-- Report 13
SELECT
    MemberID,
    COUNT(*) AS TotalBorrows
FROM BorrowRecords
GROUP BY MemberID;

-- Report 14
SELECT
    PublicationYear,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY PublicationYear;


/*====================================================
 PART 4: MULTIPLE AGGREGATE FUNCTIONS
====================================================*/

-- Report 15
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks,
    MIN(PublicationYear) AS OldestBookYear,
    MAX(PublicationYear) AS NewestBookYear
FROM Books
GROUP BY CategoryID;

-- Report 16
SELECT
    PublisherID,
    COUNT(*) AS TotalBooks,
    MIN(PublicationYear) AS OldestPublication,
    MAX(PublicationYear) AS NewestPublication
FROM Books
GROUP BY PublisherID;

-- Report 17
SELECT
    PublicationYear,
    COUNT(*) AS BooksPublished
FROM Books
GROUP BY PublicationYear;


/*====================================================
 PART 5: HAVING REPORTS
====================================================*/

-- Report 18
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID
HAVING COUNT(*) > 2;

-- Report 19
SELECT
    PublisherID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY PublisherID
HAVING COUNT(*) > 2;

-- Report 20
SELECT
    PublicationYear,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY PublicationYear
HAVING COUNT(*) > 1;

-- Report 21
SELECT
    MemberID,
    COUNT(*) AS TotalBorrows
FROM BorrowRecords
GROUP BY MemberID
HAVING COUNT(*) > 1;


/*====================================================
 PART 6: BUSINESS KPI REPORTS
====================================================*/

-- Report 22
SELECT
    COUNT(*) AS LibraryBookCount
FROM Books;

-- Report 23
SELECT
    COUNT(*) AS RegisteredMembers
FROM Members;

-- Report 24
SELECT
    MAX(PublicationYear) AS LatestBookYear
FROM Books;

-- Report 25
SELECT
    MIN(PublicationYear) AS OldestBookYear
FROM Books;


/*====================================================
 PART 7: MANAGEMENT DASHBOARD REPORTS
====================================================*/

-- Report 26
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID
ORDER BY TotalBooks DESC;

-- Report 27
SELECT
    PublisherID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY PublisherID
ORDER BY TotalBooks DESC;

-- Report 28
SELECT
    Status,
    COUNT(*) AS TotalReservations
FROM Reservations
GROUP BY Status
ORDER BY TotalReservations DESC;

-- Report 29
SELECT TOP 5
    MemberID,
    COUNT(*) AS TotalBorrows
FROM BorrowRecords
GROUP BY MemberID
ORDER BY TotalBorrows DESC;

-- Report 30
SELECT
    PublicationYear,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY PublicationYear
ORDER BY TotalBooks DESC;


/*====================================================
 CHALLENGE REPORTS
====================================================*/

-- Challenge 01
SELECT TOP 1
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID
ORDER BY TotalBooks DESC;

-- Challenge 02
SELECT TOP 1
    PublisherID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY PublisherID
ORDER BY TotalBooks DESC;

-- Challenge 03
SELECT TOP 1
    PublicationYear,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY PublicationYear
ORDER BY TotalBooks DESC;

-- Challenge 04
SELECT
    MemberID,
    COUNT(*) AS BorrowCount
FROM BorrowRecords
GROUP BY MemberID
HAVING COUNT(*) > 2;

-- Challenge 05
SELECT
    (SELECT COUNT(*) FROM Books) AS TotalBooks,
    (SELECT COUNT(*) FROM Members) AS TotalMembers,
    (SELECT COUNT(*) FROM Reservations) AS TotalReservations,
    (SELECT MIN(PublicationYear) FROM Books) AS OldestPublicationYear,
    (SELECT MAX(PublicationYear) FROM Books) AS NewestPublicationYear;


/*====================================================
 BONUS DASHBOARD QUERIES
====================================================*/

-- Books per Category
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID
ORDER BY TotalBooks DESC;

-- Reservations per Status
SELECT
    Status,
    COUNT(*) AS TotalReservations
FROM Reservations
GROUP BY Status
ORDER BY TotalReservations DESC;

-- Borrow Activity per Member
SELECT
    MemberID,
    COUNT(*) AS BorrowCount
FROM BorrowRecords
GROUP BY MemberID
ORDER BY BorrowCount DESC;

-- Publisher Performance
SELECT
    PublisherID,
    COUNT(*) AS TotalBooks,
    MIN(PublicationYear) AS FirstPublication,
    MAX(PublicationYear) AS LatestPublication
FROM Books
GROUP BY PublisherID
ORDER BY TotalBooks DESC;

-- Category Summary
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks,
    MIN(PublicationYear) AS OldestBook,
    MAX(PublicationYear) AS NewestBook
FROM Books
GROUP BY CategoryID
ORDER BY TotalBooks DESC;
```
