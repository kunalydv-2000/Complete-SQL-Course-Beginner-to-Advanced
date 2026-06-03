/*==========================================================
MODULE 06 PROJECT
Library Analytics and KPI Reporting System
==========================================================*/

USE LibraryManagementSystem;
GO

/*==========================================================
PART 1 - INVENTORY ANALYSIS
==========================================================*/

-- Report 1: Books Above Average Price

SELECT
    BookID,
    Title,
    BookPrice
FROM Books
WHERE BookPrice >
(
    SELECT AVG(BookPrice)
    FROM Books
);

------------------------------------------------------------

-- Report 2: Books Below Average Price

SELECT
    BookID,
    Title,
    BookPrice
FROM Books
WHERE BookPrice <
(
    SELECT AVG(BookPrice)
    FROM Books
);

------------------------------------------------------------

-- Report 3: Most Expensive Books

SELECT
    BookID,
    Title,
    BookPrice
FROM Books
WHERE BookPrice =
(
    SELECT MAX(BookPrice)
    FROM Books
);

------------------------------------------------------------

-- Report 4: Newest Books

SELECT
    BookID,
    Title,
    PublicationYear
FROM Books
WHERE PublicationYear =
(
    SELECT MAX(PublicationYear)
    FROM Books
);

GO

/*==========================================================
PART 2 - MEMBER ACTIVITY ANALYSIS
==========================================================*/

-- Report 5: Active Members

SELECT
    M.*
FROM Members M
WHERE EXISTS
(
    SELECT 1
    FROM BorrowRecords BR
    WHERE BR.MemberID = M.MemberID
);

------------------------------------------------------------

-- Report 6: Inactive Members

SELECT
    M.*
FROM Members M
WHERE NOT EXISTS
(
    SELECT 1
    FROM BorrowRecords BR
    WHERE BR.MemberID = M.MemberID
);

------------------------------------------------------------

-- Report 7: Members With Reservations

SELECT
    M.*
FROM Members M
WHERE EXISTS
(
    SELECT 1
    FROM Reservations R
    WHERE R.MemberID = M.MemberID
);

------------------------------------------------------------

-- Report 8: Members Without Reservations

SELECT
    M.*
FROM Members M
WHERE NOT EXISTS
(
    SELECT 1
    FROM Reservations R
    WHERE R.MemberID = M.MemberID
);

GO

/*==========================================================
PART 3 - INVENTORY UTILIZATION
==========================================================*/

-- Report 9: Books That Were Borrowed

SELECT
    B.*
FROM Books B
WHERE EXISTS
(
    SELECT 1
    FROM BorrowRecords BR
    WHERE BR.BookID = B.BookID
);

------------------------------------------------------------

-- Report 10: Books Never Borrowed

SELECT
    B.*
FROM Books B
WHERE NOT EXISTS
(
    SELECT 1
    FROM BorrowRecords BR
    WHERE BR.BookID = B.BookID
);

------------------------------------------------------------

-- Report 11: Books With Reservations

SELECT
    B.*
FROM Books B
WHERE EXISTS
(
    SELECT 1
    FROM Reservations R
    WHERE R.BookID = B.BookID
);

------------------------------------------------------------

-- Report 12: Books Without Reservations

SELECT
    B.*
FROM Books B
WHERE NOT EXISTS
(
    SELECT 1
    FROM Reservations R
    WHERE R.BookID = B.BookID
);

GO

/*==========================================================
PART 4 - AUTHOR ANALYTICS
==========================================================*/

-- Report 13: Authors With Books

SELECT
    A.*
FROM Authors A
WHERE EXISTS
(
    SELECT 1
    FROM BookAuthors BA
    WHERE BA.AuthorID = A.AuthorID
);

------------------------------------------------------------

-- Report 14: Authors Without Books

SELECT
    A.*
FROM Authors A
WHERE NOT EXISTS
(
    SELECT 1
    FROM BookAuthors BA
    WHERE BA.AuthorID = A.AuthorID
);

------------------------------------------------------------

-- Report 15: Author Productivity Report

SELECT
    A.AuthorID,
    A.AuthorName,
    AP.TotalBooks
FROM Authors A
INNER JOIN
(
    SELECT
        AuthorID,
        COUNT(*) AS TotalBooks
    FROM BookAuthors
    GROUP BY AuthorID
) AP
ON A.AuthorID = AP.AuthorID
ORDER BY AP.TotalBooks DESC;

GO

/*==========================================================
PART 5 - PUBLISHER ANALYTICS
==========================================================*/

-- Report 16: Publishers With Books

SELECT
    P.*
FROM Publishers P
WHERE EXISTS
(
    SELECT 1
    FROM Books B
    WHERE B.PublisherID = P.PublisherID
);

------------------------------------------------------------

-- Report 17: Publishers Without Books

SELECT
    P.*
FROM Publishers P
WHERE NOT EXISTS
(
    SELECT 1
    FROM Books B
    WHERE B.PublisherID = P.PublisherID
);

------------------------------------------------------------

-- Report 18: Publisher Performance Report

SELECT
    P.PublisherID,
    P.PublisherName,
    PB.TotalBooks
FROM Publishers P
INNER JOIN
(
    SELECT
        PublisherID,
        COUNT(*) AS TotalBooks
    FROM Books
    GROUP BY PublisherID
) PB
ON P.PublisherID = PB.PublisherID
ORDER BY PB.TotalBooks DESC;

GO

/*==========================================================
PART 6 - CATEGORY ANALYTICS
==========================================================*/

-- Report 19: Categories With Books

SELECT
    C.*
FROM Categories C
WHERE EXISTS
(
    SELECT 1
    FROM Books B
    WHERE B.CategoryID = C.CategoryID
);

------------------------------------------------------------

-- Report 20: Categories Without Books

SELECT
    C.*
FROM Categories C
WHERE NOT EXISTS
(
    SELECT 1
    FROM Books B
    WHERE B.CategoryID = C.CategoryID
);

------------------------------------------------------------

-- Report 21: Category Performance Report

SELECT
    C.CategoryName,
    CS.TotalBooks,
    CS.AveragePrice
FROM Categories C
INNER JOIN
(
    SELECT
        CategoryID,
        COUNT(*) AS TotalBooks,
        AVG(BookPrice) AS AveragePrice
    FROM Books
    GROUP BY CategoryID
) CS
ON C.CategoryID = CS.CategoryID
ORDER BY CS.TotalBooks DESC;

GO

/*==========================================================
PART 7 - BORROWING ANALYTICS
==========================================================*/

-- Report 22: Borrow Count Per Member

SELECT
    MemberID,
    COUNT(*) AS BorrowCount
FROM BorrowRecords
GROUP BY MemberID
ORDER BY BorrowCount DESC;

------------------------------------------------------------

-- Report 23: Average Borrow Activity

SELECT
    AVG(CAST(BorrowCount AS DECIMAL(10,2))) AS AverageBorrowActivity
FROM
(
    SELECT
        MemberID,
        COUNT(*) AS BorrowCount
    FROM BorrowRecords
    GROUP BY MemberID
) BorrowStats;

------------------------------------------------------------

-- Report 24: Members Above Average Activity

SELECT
    M.MemberID,
    M.FirstName,
    M.LastName,
    (
        SELECT COUNT(*)
        FROM BorrowRecords BR
        WHERE BR.MemberID = M.MemberID
    ) AS BorrowCount
FROM Members M
WHERE
(
    SELECT COUNT(*)
    FROM BorrowRecords BR
    WHERE BR.MemberID = M.MemberID
)
>
(
    SELECT AVG(CAST(BorrowCount AS DECIMAL(10,2)))
    FROM
    (
        SELECT
            COUNT(*) AS BorrowCount
        FROM BorrowRecords
        GROUP BY MemberID
    ) BorrowStats
);

GO

/*==========================================================
PART 8 - EXECUTIVE KPI DASHBOARD
==========================================================*/

SELECT
(
    SELECT COUNT(*)
    FROM Books
) AS TotalBooks,

(
    SELECT COUNT(*)
    FROM Members
) AS TotalMembers,

(
    SELECT COUNT(*)
    FROM Authors
) AS TotalAuthors,

(
    SELECT COUNT(*)
    FROM Publishers
) AS TotalPublishers,

(
    SELECT COUNT(*)
    FROM Categories
) AS TotalCategories,

(
    SELECT COUNT(*)
    FROM Reservations
) AS TotalReservations,

(
    SELECT COUNT(*)
    FROM BorrowRecords
) AS TotalBorrowRecords;

GO

/*==========================================================
PART 9 - INVENTORY KPI DASHBOARD
==========================================================*/

SELECT
(
    SELECT COUNT(*)
    FROM Books
) AS TotalBooks,

(
    SELECT SUM(BookPrice)
    FROM Books
) AS InventoryValue,

(
    SELECT AVG(BookPrice)
    FROM Books
) AS AverageBookPrice,

(
    SELECT MAX(BookPrice)
    FROM Books
) AS HighestBookPrice,

(
    SELECT MIN(BookPrice)
    FROM Books
) AS LowestBookPrice;

GO

/*==========================================================
PART 10 - ADVANCED ANALYTICS DASHBOARD
==========================================================*/

-- Books Never Borrowed

SELECT
    COUNT(*) AS BooksNeverBorrowed
FROM Books B
WHERE NOT EXISTS
(
    SELECT 1
    FROM BorrowRecords BR
    WHERE BR.BookID = B.BookID
);

------------------------------------------------------------

-- Inactive Members

SELECT
    COUNT(*) AS InactiveMembers
FROM Members M
WHERE NOT EXISTS
(
    SELECT 1
    FROM BorrowRecords BR
    WHERE BR.MemberID = M.MemberID
);

------------------------------------------------------------

-- Authors Without Books

SELECT
    COUNT(*) AS AuthorsWithoutBooks
FROM Authors A
WHERE NOT EXISTS
(
    SELECT 1
    FROM BookAuthors BA
    WHERE BA.AuthorID = A.AuthorID
);

------------------------------------------------------------

-- Publishers Without Books

SELECT
    COUNT(*) AS PublishersWithoutBooks
FROM Publishers P
WHERE NOT EXISTS
(
    SELECT 1
    FROM Books B
    WHERE B.PublisherID = P.PublisherID
);

------------------------------------------------------------

-- Categories Without Books

SELECT
    COUNT(*) AS CategoriesWithoutBooks
FROM Categories C
WHERE NOT EXISTS
(
    SELECT 1
    FROM Books B
    WHERE B.CategoryID = C.CategoryID
);

GO

/*==========================================================
BONUS CHALLENGE 1
Top 5 Most Active Members
==========================================================*/

SELECT TOP 5
    M.FirstName,
    M.LastName,
    COUNT(*) AS BorrowCount
FROM Members M
INNER JOIN BorrowRecords BR
    ON M.MemberID = BR.MemberID
GROUP BY
    M.FirstName,
    M.LastName
ORDER BY BorrowCount DESC;

GO

/*==========================================================
BONUS CHALLENGE 2
Top 5 Most Reserved Books
==========================================================*/

SELECT TOP 5
    B.Title,
    COUNT(*) AS ReservationCount
FROM Books B
INNER JOIN Reservations R
    ON B.BookID = R.BookID
GROUP BY B.Title
ORDER BY ReservationCount DESC;

GO

/*==========================================================
BONUS CHALLENGE 3
Publishers Above Average Book Count
==========================================================*/

SELECT
    P.PublisherName,
    PB.TotalBooks
FROM Publishers P
INNER JOIN
(
    SELECT
        PublisherID,
        COUNT(*) AS TotalBooks
    FROM Books
    GROUP BY PublisherID
) PB
ON P.PublisherID = PB.PublisherID
WHERE PB.TotalBooks >
(
    SELECT AVG(TotalBooks * 1.0)
    FROM
    (
        SELECT
            COUNT(*) AS TotalBooks
        FROM Books
        GROUP BY PublisherID
    ) AvgPublisherStats
);

GO

/*==========================================================
BONUS CHALLENGE 4
Categories Above Average Book Price
==========================================================*/

SELECT
    C.CategoryName,
    CP.AveragePrice
FROM Categories C
INNER JOIN
(
    SELECT
        CategoryID,
        AVG(BookPrice) AS AveragePrice
    FROM Books
    GROUP BY CategoryID
) CP
ON C.CategoryID = CP.CategoryID
WHERE CP.AveragePrice >
(
    SELECT AVG(BookPrice)
    FROM Books
);

GO

/*==========================================================
BONUS CHALLENGE 5
MASTER LIBRARY EXECUTIVE DASHBOARD
==========================================================*/

SELECT
    (SELECT COUNT(*) FROM Books) AS TotalBooks,
    (SELECT COUNT(*) FROM Members) AS TotalMembers,
    (SELECT COUNT(*) FROM Authors) AS TotalAuthors,
    (SELECT COUNT(*) FROM Publishers) AS TotalPublishers,
    (SELECT COUNT(*) FROM Categories) AS TotalCategories,
    (SELECT COUNT(*) FROM BorrowRecords) AS TotalBorrows,
    (SELECT COUNT(*) FROM Reservations) AS TotalReservations,
    (SELECT AVG(BookPrice) FROM Books) AS AverageBookPrice,
    (SELECT SUM(BookPrice) FROM Books) AS InventoryValue,
    (
        SELECT COUNT(*)
        FROM Books B
        WHERE NOT EXISTS
        (
            SELECT 1
            FROM BorrowRecords BR
            WHERE BR.BookID = B.BookID
        )
    ) AS BooksNeverBorrowed,
    (
        SELECT COUNT(*)
        FROM Members M
        WHERE NOT EXISTS
        (
            SELECT 1
            FROM BorrowRecords BR
            WHERE BR.MemberID = M.MemberID
        )
    ) AS InactiveMembers;

GO