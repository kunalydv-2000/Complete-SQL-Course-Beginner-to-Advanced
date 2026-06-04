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
FROM _Books_;

-- Report 02
SELECT
    COUNT(*) AS TotalMembers
FROM Members_Table;

-- Report 03
SELECT
    COUNT(*) AS TotalAuthors
FROM _Authors_;

-- Report 04
SELECT
    COUNT(*) AS TotalReservations
FROM Reservations_table;

-- Report 05
SELECT
    COUNT(*) AS TotalBorrows
FROM BorrowRecords_table;


/*====================================================
 PART 2: MIN AND MAX REPORTS
====================================================*/

-- Report 06
SELECT
    MIN(PublicationYear) AS OldestPublicationYear
FROM _Books_;

-- Report 07
SELECT
    MAX(PublicationYear) AS NewestPublicationYear
FROM _Books_;

-- Report 08
SELECT
    MIN(MembershipDate) AS EarliestMembershipDate
FROM Members_Table;

-- Report 09
SELECT
    MAX(MembershipDate) AS LatestMembershipDate
FROM Members_Table;


/*====================================================
 PART 3: GROUP BY REPORTS
====================================================*/

-- Report 10
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM _Books_
GROUP BY CategoryID;

-- Report 11
SELECT
    PublisherID,
    COUNT(*) AS TotalBooks
FROM _Books_
GROUP BY PublisherID;

-- Report 12
SELECT
    Status,
    COUNT(*) AS TotalReservations
FROM Reservations_table
GROUP BY Status;

-- Report 13
SELECT
    MemberID,
    COUNT(*) AS TotalBorrows
FROM BorrowRecords_table
GROUP BY MemberID;

-- Report 14
SELECT
    PublicationYear,
    COUNT(*) AS TotalBooks
FROM _Books_
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
FROM _Books_
GROUP BY CategoryID;

-- Report 16
SELECT
    PublisherID,
    COUNT(*) AS TotalBooks,
    MIN(PublicationYear) AS OldestPublication,
    MAX(PublicationYear) AS NewestPublication
FROM _Books_
GROUP BY PublisherID;

-- Report 17
SELECT
    PublicationYear,
    COUNT(*) AS BooksPublished
FROM _Books_
GROUP BY PublicationYear;


/*====================================================
 PART 5: HAVING REPORTS
====================================================*/

-- Report 18
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM _Books_
GROUP BY CategoryID
HAVING COUNT(*) > 2;

-- Report 19
SELECT
    PublisherID,
    COUNT(*) AS TotalBooks
FROM _Books_
GROUP BY PublisherID
HAVING COUNT(*) > 2;

-- Report 20
SELECT
    PublicationYear,
    COUNT(*) AS TotalBooks
FROM _Books_
GROUP BY PublicationYear
HAVING COUNT(*) > 1;

-- Report 21
SELECT
    MemberID,
    COUNT(*) AS TotalBorrows
FROM BorrowRecords_table
GROUP BY MemberID
HAVING COUNT(*) > 1;


/*====================================================
 PART 6: BUSINESS KPI REPORTS
====================================================*/

-- Report 22
SELECT
    COUNT(*) AS LibraryBookCount
FROM _Books_;

-- Report 23
SELECT
    COUNT(*) AS RegisteredMembers
FROM Members_Table;

-- Report 24
SELECT
    MAX(PublicationYear) AS LatestBookYear
FROM _Books_;

-- Report 25
SELECT
    MIN(PublicationYear) AS OldestBookYear
FROM _Books_;


/*====================================================
 PART 7: MANAGEMENT DASHBOARD REPORTS
====================================================*/

-- Report 26
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM _Books_
GROUP BY CategoryID
ORDER BY TotalBooks DESC;

-- Report 27
SELECT
    PublisherID,
    COUNT(*) AS TotalBooks
FROM _Books_
GROUP BY PublisherID
ORDER BY TotalBooks DESC;

-- Report 28
SELECT
    Status,
    COUNT(*) AS TotalReservations
FROM Reservations_table
GROUP BY Status
ORDER BY TotalReservations DESC;

-- Report 29
SELECT TOP 5
    MemberID,
    COUNT(*) AS TotalBorrows
FROM BorrowRecords_table
GROUP BY MemberID
ORDER BY TotalBorrows DESC;

-- Report 30
SELECT
    PublicationYear,
    COUNT(*) AS TotalBooks
FROM _Books_
GROUP BY PublicationYear
ORDER BY TotalBooks DESC;


/*====================================================
 CHALLENGE REPORTS
====================================================*/

-- Challenge 01
SELECT TOP 1
    CategoryID,
    COUNT(*) AS TotalBooks
FROM _Books_
GROUP BY CategoryID
ORDER BY TotalBooks DESC;

-- Challenge 02
SELECT TOP 1
    PublisherID,
    COUNT(*) AS TotalBooks
FROM _Books_
GROUP BY PublisherID
ORDER BY TotalBooks DESC;

-- Challenge 03
SELECT TOP 1
    PublicationYear,
    COUNT(*) AS TotalBooks
FROM _Books_
GROUP BY PublicationYear
ORDER BY TotalBooks DESC;

-- Challenge 04
SELECT
    MemberID,
    COUNT(*) AS BorrowCount
FROM BorrowRecords_table
GROUP BY MemberID
HAVING COUNT(*) > 2;

-- Challenge 05
SELECT
    (SELECT COUNT(*) FROM _Books_) AS TotalBooks,
    (SELECT COUNT(*) FROM Members_Table) AS TotalMembers,
    (SELECT COUNT(*) FROM Reservations_table) AS TotalReservations,
    (SELECT MIN(PublicationYear) FROM _Books_) AS OldestPublicationYear,
    (SELECT MAX(PublicationYear) FROM _Books_) AS NewestPublicationYear;


/*====================================================
 BONUS DASHBOARD QUERIES
====================================================*/

-- Books per Category
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM _Books_
GROUP BY CategoryID
ORDER BY TotalBooks DESC;

-- Reservations per Status
SELECT
    Status,
    COUNT(*) AS TotalReservations
FROM Reservations_table
GROUP BY Status
ORDER BY TotalReservations DESC;

-- Borrow Activity per Member
SELECT
    MemberID,
    COUNT(*) AS BorrowCount
FROM BorrowRecords_table
GROUP BY MemberID
ORDER BY BorrowCount DESC;

-- Publisher Performance
SELECT
    PublisherID,
    COUNT(*) AS TotalBooks,
    MIN(PublicationYear) AS FirstPublication,
    MAX(PublicationYear) AS LatestPublication
FROM _Books_
GROUP BY PublisherID
ORDER BY TotalBooks DESC;

-- Category Summary
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks,
    MIN(PublicationYear) AS OldestBook,
    MAX(PublicationYear) AS NewestBook
FROM _Books_
GROUP BY CategoryID
ORDER BY TotalBooks DESC;
```
