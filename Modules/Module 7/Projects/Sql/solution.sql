```sql
/*
=========================================================
MODULE 07 PROJECT
Library Reporting & Automation System
Views + Stored Procedures + Parameters + Dynamic SQL
=========================================================
*/

/*
=========================================================
PHASE 1 - REPORTING VIEWS
=========================================================
*/

-- View 1: Book Catalog

CREATE VIEW vw_BookCatalog
AS
SELECT
    B.BookID,
    B.Title,
    C.CategoryName,
    P.PublisherName,
    B.BookPrice,
    B.PublicationYear
FROM Books B
INNER JOIN Categories C
    ON B.CategoryID = C.CategoryID
INNER JOIN Publishers P
    ON B.PublisherID = P.PublisherID;
GO


-- View 2: Active Members

CREATE VIEW vw_ActiveMembers
AS
SELECT DISTINCT
    M.MemberID,
    M.FirstName,
    M.LastName
FROM Members M
INNER JOIN BorrowRecords BR
    ON M.MemberID = BR.MemberID;
GO


-- View 3: Publisher Performance

CREATE VIEW vw_PublisherPerformance
AS
SELECT
    P.PublisherName,
    COUNT(B.BookID) AS TotalBooks,
    AVG(B.BookPrice) AS AverageBookPrice
FROM Publishers P
LEFT JOIN Books B
    ON P.PublisherID = B.PublisherID
GROUP BY P.PublisherName;
GO


-- View 4: Inventory Summary

CREATE VIEW vw_InventorySummary
AS
SELECT
    COUNT(*) AS TotalBooks,
    SUM(BookPrice) AS InventoryValue,
    AVG(BookPrice) AS AveragePrice,
    MAX(BookPrice) AS HighestPrice,
    MIN(BookPrice) AS LowestPrice
FROM Books;
GO


/*
=========================================================
PHASE 2 - REPORTING PROCEDURES
=========================================================
*/

CREATE PROCEDURE GetBookCatalog
AS
BEGIN
    SELECT *
    FROM vw_BookCatalog;
END;
GO


CREATE PROCEDURE GetActiveMembers
AS
BEGIN
    SELECT *
    FROM vw_ActiveMembers;
END;
GO


CREATE PROCEDURE GetPublisherPerformance
AS
BEGIN
    SELECT *
    FROM vw_PublisherPerformance
    ORDER BY TotalBooks DESC;
END;
GO


CREATE PROCEDURE GetInventoryKPIs
AS
BEGIN
    SELECT *
    FROM vw_InventorySummary;
END;
GO


/*
=========================================================
PHASE 3 - PARAMETERIZED PROCEDURES
=========================================================
*/

CREATE PROCEDURE GetBooksByCategory
    @CategoryID INT
AS
BEGIN

    SELECT
        BookID,
        Title,
        BookPrice,
        PublicationYear
    FROM Books
    WHERE CategoryID = @CategoryID;

END;
GO


CREATE PROCEDURE GetBooksByPublisher
    @PublisherID INT
AS
BEGIN

    SELECT
        BookID,
        Title,
        BookPrice,
        PublicationYear
    FROM Books
    WHERE PublisherID = @PublisherID;

END;
GO


CREATE PROCEDURE GetMemberBorrowHistory
    @MemberID INT
AS
BEGIN

    SELECT
        B.Title,
        BR.BorrowDate,
        BR.DueDate
    FROM BorrowRecords BR
    INNER JOIN Books B
        ON BR.BookID = B.BookID
    WHERE BR.MemberID = @MemberID
    ORDER BY BR.BorrowDate DESC;

END;
GO


/*
=========================================================
PHASE 4 - OUTPUT PARAMETER PROCEDURES
=========================================================
*/

CREATE PROCEDURE GetTotalBooks
    @TotalBooks INT OUTPUT
AS
BEGIN

    SELECT
        @TotalBooks = COUNT(*)
    FROM Books;

END;
GO


CREATE PROCEDURE GetTotalMembers
    @TotalMembers INT OUTPUT
AS
BEGIN

    SELECT
        @TotalMembers = COUNT(*)
    FROM Members;

END;
GO


CREATE PROCEDURE GetAverageBookPrice
    @AveragePrice DECIMAL(10,2) OUTPUT
AS
BEGIN

    SELECT
        @AveragePrice = AVG(BookPrice)
    FROM Books;

END;
GO


CREATE PROCEDURE GetLibraryKPIs
    @TotalBooks INT OUTPUT,
    @TotalMembers INT OUTPUT,
    @AverageBookPrice DECIMAL(10,2) OUTPUT
AS
BEGIN

    SELECT
        @TotalBooks = COUNT(*)
    FROM Books;

    SELECT
        @TotalMembers = COUNT(*)
    FROM Members;

    SELECT
        @AverageBookPrice = AVG(BookPrice)
    FROM Books;

END;
GO


/*
=========================================================
PHASE 5 - DYNAMIC SQL PROCEDURES
=========================================================
*/

CREATE PROCEDURE SearchBooksDynamic
    @Keyword VARCHAR(100)
AS
BEGIN

    DECLARE @SQL NVARCHAR(MAX);

    SET @SQL =
    N'
    SELECT
        BookID,
        Title,
        BookPrice
    FROM Books
    WHERE Title LIKE ''%'' + @Keyword + ''%''
    ';

    EXEC sp_executesql
        @SQL,
        N'@Keyword VARCHAR(100)',
        @Keyword;

END;
GO


CREATE PROCEDURE GetBooksSorted
    @SortColumn VARCHAR(50)
AS
BEGIN

    IF @SortColumn NOT IN
    (
        'Title',
        'BookPrice',
        'PublicationYear'
    )
    BEGIN
        RAISERROR('Invalid Sort Column',16,1);
        RETURN;
    END

    DECLARE @SQL NVARCHAR(MAX);

    SET @SQL =
    N'
    SELECT
        BookID,
        Title,
        BookPrice,
        PublicationYear
    FROM Books
    ORDER BY ' + QUOTENAME(@SortColumn);

    EXEC(@SQL);

END;
GO


CREATE PROCEDURE GenerateDynamicReport
    @TableName VARCHAR(50),
    @SortColumn VARCHAR(50)
AS
BEGIN

    IF @TableName NOT IN
    (
        'Books',
        'Members',
        'Authors',
        'Publishers',
        'Categories'
    )
    BEGIN
        RAISERROR('Invalid Table Name',16,1);
        RETURN;
    END

    DECLARE @SQL NVARCHAR(MAX);

    SET @SQL =
    N'
    SELECT *
    FROM ' + QUOTENAME(@TableName) +
    N' ORDER BY ' + QUOTENAME(@SortColumn);

    EXEC(@SQL);

END;
GO


/*
=========================================================
PHASE 6 - EXECUTIVE DASHBOARD
=========================================================
*/

CREATE PROCEDURE GetExecutiveDashboard
AS
BEGIN

    SELECT

        (SELECT COUNT(*)
         FROM Books) AS TotalBooks,

        (SELECT COUNT(*)
         FROM Members) AS TotalMembers,

        (SELECT COUNT(*)
         FROM Authors) AS TotalAuthors,

        (SELECT COUNT(*)
         FROM Publishers) AS TotalPublishers,

        (SELECT COUNT(*)
         FROM Reservations) AS TotalReservations,

        (SELECT COUNT(*)
         FROM BorrowRecords) AS TotalBorrowRecords;

END;
GO


/*
=========================================================
BONUS PROCEDURES
=========================================================
*/

CREATE PROCEDURE GetTopBorrowedBooks
AS
BEGIN

    SELECT TOP 10
        B.BookID,
        B.Title,
        COUNT(*) AS BorrowCount
    FROM BorrowRecords BR
    INNER JOIN Books B
        ON BR.BookID = B.BookID
    GROUP BY
        B.BookID,
        B.Title
    ORDER BY BorrowCount DESC;

END;
GO


CREATE PROCEDURE GetInactiveMembers
AS
BEGIN

    SELECT
        M.MemberID,
        M.FirstName,
        M.LastName
    FROM Members M
    LEFT JOIN BorrowRecords BR
        ON M.MemberID = BR.MemberID
    WHERE BR.MemberID IS NULL;

END;
GO


CREATE PROCEDURE CheckBookAvailability
    @BookID INT,
    @Status VARCHAR(50) OUTPUT
AS
BEGIN

    IF EXISTS
    (
        SELECT 1
        FROM Reservations
        WHERE BookID = @BookID
    )
        SET @Status = 'Reserved';
    ELSE
        SET @Status = 'Available';

END;
GO


/*
=========================================================
TESTING SECTION
=========================================================
*/

EXEC GetBookCatalog;
EXEC GetActiveMembers;
EXEC GetPublisherPerformance;
EXEC GetInventoryKPIs;

EXEC GetBooksByCategory
    @CategoryID = 1;

EXEC GetBooksByPublisher
    @PublisherID = 1;

EXEC GetMemberBorrowHistory
    @MemberID = 1;

EXEC SearchBooksDynamic
    @Keyword = 'SQL';

EXEC GetBooksSorted
    @SortColumn = 'Title';

EXEC GetExecutiveDashboard;


DECLARE @Books INT;
EXEC GetTotalBooks
    @TotalBooks = @Books OUTPUT;
SELECT @Books AS TotalBooks;


DECLARE @Members INT;
EXEC GetTotalMembers
    @TotalMembers = @Members OUTPUT;
SELECT @Members AS TotalMembers;


DECLARE @AvgPrice DECIMAL(10,2);
EXEC GetAverageBookPrice
    @AveragePrice = @AvgPrice OUTPUT;
SELECT @AvgPrice AS AveragePrice;


DECLARE @Status VARCHAR(50);
EXEC CheckBookAvailability
    @BookID = 1,
    @Status = @Status OUTPUT;
SELECT @Status AS BookStatus;
GO
```
