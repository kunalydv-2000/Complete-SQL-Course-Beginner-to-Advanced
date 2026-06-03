```sql
/*====================================================
  MODULE 03 PROJECT
  Library Reporting System
  SQL Server (SSMS)
====================================================*/

USE [Library_Management_System_];
GO

/*====================================================
  PART 1: BASIC REPORTS
====================================================*/

-- Report 01
SELECT *
FROM _Books_;

-- Report 02
SELECT *
FROM Members_Table;

-- Report 03
SELECT *
FROM _Authors_;

-- Report 04
SELECT
    BookID,
    Title,
    PublicationYear
FROM _Books_;

-- Report 05
SELECT
    MemberID,
    FirstName,
    LastName
FROM Members_Table;




/*====================================================
  PART 2: DISTINCT REPORTS
====================================================*/

-- Report 06
SELECT DISTINCT CategoryID
FROM _Books_;

-- Report 07
SELECT DISTINCT PublisherID
FROM _Books_;

-- Report 08
SELECT DISTINCT Status
FROM Reservations_Table;




/*====================================================
  PART 3: WHERE CLAUSE REPORTS
====================================================*/

-- Report 09
SELECT *
FROM _Books_
WHERE PublicationYear > 2015;

-- Report 10
SELECT *
FROM _Books_
WHERE PublicationYear < 2010;

-- Report 11
SELECT *
FROM Members_Table
WHERE MemberID > 5;

-- Report 12
SELECT *
FROM Reservations_Table
WHERE Status = 'Approved';

-- Report 13
SELECT *
FROM _Books_
WHERE CategoryID = 1;




/*====================================================
  PART 4: ORDER BY REPORTS
====================================================*/

-- Report 14
SELECT *
FROM _Books_
ORDER BY Title ASC;

-- Report 15
SELECT *
FROM _Books_
ORDER BY PublicationYear DESC;

-- Report 16
SELECT *
FROM Members_Table
ORDER BY LastName ASC;

-- Report 17
SELECT *
FROM _Publishers_
ORDER BY PublisherName ASC;




/*====================================================
  PART 5: TOP REPORTS
====================================================*/

-- Report 18
SELECT TOP 5 *
FROM _Books_;

-- Report 19
SELECT TOP 3 *
FROM _Books_
ORDER BY PublicationYear DESC;

-- Report 20
SELECT TOP 5 *
FROM Members_Table;

-- Report 21
SELECT TOP 10 *
FROM Reservations_Table;




/*====================================================
  PART 6: ALIAS REPORTS
====================================================*/

-- Report 22
SELECT
    FirstName AS First_Name,
    LastName AS Last_Name
FROM Members_Table;

-- Report 23
SELECT
    Title,
    PublicationYear AS Published_Year
FROM _Books_;

-- Report 24
SELECT
    PublisherName AS Publisher
FROM _Publishers_;




/*====================================================
  PART 7: IN OPERATOR REPORTS
====================================================*/

-- Report 25
SELECT *
FROM _Books_
WHERE CategoryID IN (1,2,3);

-- Report 26
SELECT *
FROM Members_Table
WHERE MemberID IN (1,3,5,7);

-- Report 27
SELECT *
FROM _Books_
WHERE PublisherID IN (1,2);




/*====================================================
  PART 8: BETWEEN REPORTS
====================================================*/

-- Report 28
SELECT *
FROM _Books_
WHERE PublicationYear BETWEEN 2010 AND 2020;

-- Report 29
SELECT *
FROM Members_Table
WHERE MemberID BETWEEN 1 AND 10;

-- Report 30
SELECT *
FROM _Books_
WHERE BookID BETWEEN 5 AND 15;




/*====================================================
  PART 9: LIKE REPORTS
====================================================*/

-- Report 31
SELECT *
FROM Members_Table
WHERE FirstName LIKE 'J%';

-- Report 32
SELECT *
FROM _Books_
WHERE Title LIKE 'L%';

-- Report 33
SELECT *
FROM _Publishers_
WHERE PublisherName LIKE '%Media%';

-- Report 34
SELECT *
FROM _Authors_
WHERE LastName LIKE '%n';




/*====================================================
  PART 10: BUSINESS REPORTS
====================================================*/

-- Report 35
SELECT
    Title,
    PublicationYear
FROM _Books_
WHERE PublicationYear > 2018
ORDER BY PublicationYear DESC;

-- Report 36
SELECT
    FirstName,
    LastName
FROM Members_Table
WHERE FirstName LIKE 'S%';

-- Report 37
SELECT TOP 5
    Title,
    PublicationYear
FROM _Books_
ORDER BY PublicationYear DESC;

-- Report 38
SELECT *
FROM _Books_
WHERE CategoryID = 1
AND PublicationYear > 2015;

-- Report 39
SELECT *
FROM Reservations_Table
WHERE Status = 'Approved';

-- Report 40
SELECT *
FROM _Books_
ORDER BY Title ASC;




/*====================================================
  CHALLENGE QUERIES
====================================================*/

-- Challenge 01
SELECT *
FROM _Books_
WHERE PublicationYear IN (2018,2019,2020);

-- Challenge 02
SELECT *
FROM Members_Table
WHERE LastName LIKE 'W%';

-- Challenge 03
SELECT TOP 5 *
FROM _Books_
ORDER BY PublicationYear ASC;

-- Challenge 04
SELECT *
FROM _Books_
WHERE PublicationYear BETWEEN 2000 AND 2010
ORDER BY PublicationYear ASC;

-- Challenge 05
SELECT
    BookID AS Book_ID,
    Title AS Book_Title,
    PublicationYear AS Published_Year
FROM _Books_;




/*====================================================
  BONUS BUSINESS REPORTS
====================================================*/

-- Newest Books
SELECT TOP 10
    Title,
    PublicationYear
FROM _Books_
ORDER BY PublicationYear DESC;

-- Members Joined Recently
SELECT
    FirstName,
    LastName,
    MembershipDate
FROM Members_Table
ORDER BY MembershipDate DESC;

-- Technology Books
SELECT
    BookID,
    Title,
    PublicationYear
FROM _Books_
WHERE CategoryID = 1
ORDER BY PublicationYear DESC;

-- Approved Reservations
SELECT
    ReservationID,
    MemberID,
    BookID,
    Status
FROM Reservations_Table
WHERE Status = 'Approved';

-- Books Published This Century
SELECT
    BookID,
    Title,
    PublicationYear
FROM _Books_
WHERE PublicationYear >= 2000
ORDER BY PublicationYear;
```
