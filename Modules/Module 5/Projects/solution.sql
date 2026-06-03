```sql
USE LibraryManagementSystem;
GO

/*=========================================================
REPORT 01 : BOOK CATALOG REPORT
=========================================================*/

SELECT
    B.BookID,
    B.Title,
    C.CategoryName,
    P.PublisherName,
    B.PublicationYear,
    B.BookPrice
FROM Books B
INNER JOIN Categories C
    ON B.CategoryID = C.CategoryID
INNER JOIN Publishers P
    ON B.PublisherID = P.PublisherID;
GO


/*=========================================================
REPORT 02 : AUTHOR CATALOG REPORT
=========================================================*/

SELECT
    B.Title,
    A.AuthorName
FROM Books B
INNER JOIN BookAuthors BA
    ON B.BookID = BA.BookID
INNER JOIN Authors A
    ON BA.AuthorID = A.AuthorID;
GO


/*=========================================================
REPORT 03 : COMPLETE LIBRARY INVENTORY
=========================================================*/

SELECT
    B.Title,
    C.CategoryName,
    P.PublisherName,
    A.AuthorName,
    B.BookPrice,
    B.PublicationYear
FROM Books B
INNER JOIN Categories C
    ON B.CategoryID = C.CategoryID
INNER JOIN Publishers P
    ON B.PublisherID = P.PublisherID
INNER JOIN BookAuthors BA
    ON B.BookID = BA.BookID
INNER JOIN Authors A
    ON BA.AuthorID = A.AuthorID;
GO


/*=========================================================
REPORT 04 : BORROWING ACTIVITY REPORT
=========================================================*/

SELECT
    M.FirstName + ' ' + M.LastName AS MemberName,
    B.Title,
    BR.BorrowDate,
    BR.DueDate,
    BR.ReturnDate
FROM BorrowRecords BR
INNER JOIN Members M
    ON BR.MemberID = M.MemberID
INNER JOIN Books B
    ON BR.BookID = B.BookID;
GO


/*=========================================================
REPORT 05 : RESERVATION REPORT
=========================================================*/

SELECT
    M.FirstName + ' ' + M.LastName AS MemberName,
    B.Title,
    R.ReservationDate,
    R.Status
FROM Reservations R
INNER JOIN Members M
    ON R.MemberID = M.MemberID
INNER JOIN Books B
    ON R.BookID = B.BookID;
GO


/*=========================================================
REPORT 06 : BOOKS NEVER BORROWED
=========================================================*/

SELECT
    B.Title,
    C.CategoryName
FROM Books B
LEFT JOIN BorrowRecords BR
    ON B.BookID = BR.BookID
INNER JOIN Categories C
    ON B.CategoryID = C.CategoryID
WHERE BR.BorrowID IS NULL;
GO


/*=========================================================
REPORT 07 : MEMBERS WITHOUT BORROW RECORDS
=========================================================*/

SELECT
    M.FirstName + ' ' + M.LastName AS MemberName,
    M.Email
FROM Members M
LEFT JOIN BorrowRecords BR
    ON M.MemberID = BR.MemberID
WHERE BR.BorrowID IS NULL;
GO


/*=========================================================
REPORT 08 : MEMBERS WITHOUT RESERVATIONS
=========================================================*/

SELECT
    M.FirstName + ' ' + M.LastName AS MemberName,
    M.Email
FROM Members M
LEFT JOIN Reservations R
    ON M.MemberID = R.MemberID
WHERE R.ReservationID IS NULL;
GO


/*=========================================================
REPORT 09 : BORROWING SUMMARY BY MEMBER
=========================================================*/

SELECT
    M.FirstName + ' ' + M.LastName AS MemberName,
    COUNT(*) AS TotalBorrowedBooks
FROM BorrowRecords BR
INNER JOIN Members M
    ON BR.MemberID = M.MemberID
GROUP BY
    M.FirstName,
    M.LastName
ORDER BY TotalBorrowedBooks DESC;
GO


/*=========================================================
REPORT 10 : RESERVATION SUMMARY BY MEMBER
=========================================================*/

SELECT
    M.FirstName + ' ' + M.LastName AS MemberName,
    COUNT(*) AS TotalReservations
FROM Reservations R
INNER JOIN Members M
    ON R.MemberID = M.MemberID
GROUP BY
    M.FirstName,
    M.LastName
ORDER BY TotalReservations DESC;
GO


/*=========================================================
REPORT 11 : MOST BORROWED BOOKS
=========================================================*/

SELECT
    B.Title,
    COUNT(*) AS BorrowCount
FROM BorrowRecords BR
INNER JOIN Books B
    ON BR.BookID = B.BookID
GROUP BY B.Title
ORDER BY BorrowCount DESC;
GO


/*=========================================================
REPORT 12 : MOST POPULAR CATEGORIES
=========================================================*/

SELECT
    C.CategoryName,
    COUNT(*) AS BorrowCount
FROM BorrowRecords BR
INNER JOIN Books B
    ON BR.BookID = B.BookID
INNER JOIN Categories C
    ON B.CategoryID = C.CategoryID
GROUP BY C.CategoryName
ORDER BY BorrowCount DESC;
GO


/*=========================================================
REPORT 13 : PUBLISHER PERFORMANCE REPORT
=========================================================*/

SELECT
    P.PublisherName,
    COUNT(B.BookID) AS TotalBooks,
    AVG(B.BookPrice) AS AverageBookPrice
FROM Publishers P
LEFT JOIN Books B
    ON P.PublisherID = B.PublisherID
GROUP BY P.PublisherName
ORDER BY TotalBooks DESC;
GO


/*=========================================================
REPORT 14 : AUTHOR PRODUCTIVITY REPORT
=========================================================*/

SELECT
    A.AuthorName,
    COUNT(BA.BookID) AS TotalBooksWritten
FROM Authors A
LEFT JOIN BookAuthors BA
    ON A.AuthorID = BA.AuthorID
GROUP BY A.AuthorName
ORDER BY TotalBooksWritten DESC;
GO


/*=========================================================
REPORT 15 : EXECUTIVE DASHBOARD
=========================================================*/

SELECT
    (SELECT COUNT(*) FROM Books) AS TotalBooks,
    (SELECT COUNT(*) FROM Authors) AS TotalAuthors,
    (SELECT COUNT(*) FROM Members) AS TotalMembers,
    (SELECT COUNT(*) FROM Reservations) AS TotalReservations,
    (SELECT COUNT(*) FROM BorrowRecords) AS TotalBorrowRecords,
    (SELECT MIN(PublicationYear) FROM Books) AS OldestPublicationYear,
    (SELECT MAX(PublicationYear) FROM Books) AS NewestPublicationYear;
GO


/*=========================================================
BONUS 01 : TOP 5 MOST BORROWED BOOKS
=========================================================*/

SELECT TOP 5
    B.Title,
    COUNT(*) AS BorrowCount
FROM BorrowRecords BR
INNER JOIN Books B
    ON BR.BookID = B.BookID
GROUP BY B.Title
ORDER BY BorrowCount DESC;
GO


/*=========================================================
BONUS 02 : TOP 5 MOST ACTIVE MEMBERS
=========================================================*/

SELECT TOP 5
    M.FirstName + ' ' + M.LastName AS MemberName,
    COUNT(*) AS BorrowCount
FROM BorrowRecords BR
INNER JOIN Members M
    ON BR.MemberID = M.MemberID
GROUP BY
    M.FirstName,
    M.LastName
ORDER BY BorrowCount DESC;
GO


/*=========================================================
BONUS 03 : CATEGORIES WITH NO BOOKS
=========================================================*/

SELECT
    C.CategoryName
FROM Categories C
LEFT JOIN Books B
    ON C.CategoryID = B.CategoryID
WHERE B.BookID IS NULL;
GO


/*=========================================================
BONUS 04 : PUBLISHERS WITHOUT BOOKS
=========================================================*/

SELECT
    P.PublisherName
FROM Publishers P
LEFT JOIN Books B
    ON P.PublisherID = B.PublisherID
WHERE B.BookID IS NULL;
GO
```
