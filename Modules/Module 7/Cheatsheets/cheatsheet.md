# Module 07 Cheatsheet – Views and Stored Procedures

## Quick Reference Guide

This cheatsheet summarizes the most important concepts, syntax, commands, and best practices from Module 07.

---

# 1. SQL Views

## What is a View?

A View is a virtual table based on a SQL query.

```sql
CREATE VIEW ViewName
AS
SELECT Column1, Column2
FROM TableName;
```

---

## Create a View

```sql
CREATE VIEW vw_AllBooks
AS
SELECT
    BookID,
    Title,
    BookPrice
FROM Books;
```

---

## Query a View

```sql
SELECT *
FROM vw_AllBooks;
```

---

## Modify a View

```sql
ALTER VIEW vw_AllBooks
AS
SELECT
    BookID,
    Title,
    BookPrice,
    PublicationYear
FROM Books;
```

---

## Delete a View

```sql
DROP VIEW vw_AllBooks;
```

---

## View Definition

```sql
EXEC sp_helptext 'vw_AllBooks';
```

OR

```sql
SELECT OBJECT_DEFINITION
(
    OBJECT_ID('vw_AllBooks')
);
```

---

## Refresh View Metadata

```sql
EXEC sp_refreshview
'vw_AllBooks';
```

---

# View Best Practices

✅ Use meaningful names

```text
vw_BookCatalog
vw_ActiveMembers
vw_PublisherPerformance
```

---

✅ Avoid SELECT *

```sql
SELECT
    BookID,
    Title,
    BookPrice
```

---

✅ Create focused Views

One business purpose per View.

---

✅ Use Views for reporting and dashboards.

---

# Common View Examples

## Book Catalog

```sql
CREATE VIEW vw_BookCatalog
AS
SELECT
    B.Title,
    C.CategoryName,
    P.PublisherName,
    B.BookPrice
FROM Books B
INNER JOIN Categories C
    ON B.CategoryID = C.CategoryID
INNER JOIN Publishers P
    ON B.PublisherID = P.PublisherID;
```

---

## Inventory Summary

```sql
CREATE VIEW vw_InventorySummary
AS
SELECT
    COUNT(*) AS TotalBooks,
    SUM(BookPrice) AS InventoryValue,
    AVG(BookPrice) AS AveragePrice,
    MAX(BookPrice) AS HighestPrice,
    MIN(BookPrice) AS LowestPrice
FROM Books;
```

---

# 2. Stored Procedures

## What is a Stored Procedure?

A Stored Procedure is a saved SQL program stored in the database.

---

## Create Procedure

```sql
CREATE PROCEDURE GetAllBooks
AS
BEGIN

    SELECT *
    FROM Books;

END;
```

---

## Execute Procedure

```sql
EXEC GetAllBooks;
```

OR

```sql
EXECUTE GetAllBooks;
```

---

## Modify Procedure

```sql
ALTER PROCEDURE GetAllBooks
AS
BEGIN

    SELECT
        BookID,
        Title,
        BookPrice
    FROM Books;

END;
```

---

## Delete Procedure

```sql
DROP PROCEDURE GetAllBooks;
```

---

## View Procedure Source

```sql
EXEC sp_helptext
'GetAllBooks';
```

---

## List Procedures

```sql
SELECT
    name
FROM sys.procedures;
```

---

# Procedure Lifecycle

```text
CREATE PROCEDURE
        ↓
EXECUTE
        ↓
ALTER PROCEDURE
        ↓
MAINTAIN
        ↓
DROP PROCEDURE
```

---

# Procedure Naming Standards

Recommended:

```text
GetAllBooks

GetBookCatalog

GetInventoryReport

GetLibraryKPIs
```

Enterprise Style:

```text
usp_GetAllBooks

usp_GetAllMembers

usp_GetInventoryReport
```

---

# 3. Input Parameters

## Syntax

```sql
CREATE PROCEDURE ProcedureName
    @Parameter DataType
AS
BEGIN

END;
```

---

## Example

```sql
CREATE PROCEDURE GetBooksByCategory
    @CategoryID INT
AS
BEGIN

    SELECT *
    FROM Books
    WHERE CategoryID = @CategoryID;

END;
```

---

## Execute

```sql
EXEC GetBooksByCategory
    @CategoryID = 1;
```

---

## Multiple Parameters

```sql
CREATE PROCEDURE GetBooksByCategoryAndPrice
    @CategoryID INT,
    @MaxPrice DECIMAL(10,2)
AS
BEGIN

    SELECT *
    FROM Books
    WHERE CategoryID = @CategoryID
      AND BookPrice <= @MaxPrice;

END;
```

---

## Default Values

```sql
@CategoryID INT = 1
```

---

## Parameter Validation

```sql
IF @MemberID <= 0
BEGIN
    PRINT 'Invalid Member ID';
    RETURN;
END
```

---

# Common Data Types

| Data Type     | Example |
| ------------- | ------- |
| INT           | IDs     |
| DECIMAL(10,2) | Prices  |
| VARCHAR(100)  | Names   |
| DATE          | Dates   |

---

# 4. Output Parameters

## Syntax

```sql
CREATE PROCEDURE ProcedureName
    @OutputVariable INT OUTPUT
AS
BEGIN

END;
```

---

## Example

```sql
CREATE PROCEDURE GetTotalBooks
    @TotalBooks INT OUTPUT
AS
BEGIN

    SELECT
        @TotalBooks = COUNT(*)
    FROM Books;

END;
```

---

## Execute

```sql
DECLARE @Count INT;

EXEC GetTotalBooks
    @TotalBooks = @Count OUTPUT;

SELECT @Count;
```

---

## Multiple Output Parameters

```sql
CREATE PROCEDURE GetInventoryStats
    @TotalBooks INT OUTPUT,
    @AveragePrice DECIMAL(10,2) OUTPUT
AS
BEGIN

    SELECT
        @TotalBooks = COUNT(*),
        @AveragePrice = AVG(BookPrice)
    FROM Books;

END;
```

---

# Common KPI Functions

```sql
COUNT()

SUM()

AVG()

MAX()

MIN()
```

---

# 5. Dynamic SQL

## EXEC()

```sql
DECLARE @SQL VARCHAR(MAX);

SET @SQL =
'SELECT *
 FROM Books';

EXEC(@SQL);
```

---

## sp_executesql

```sql
DECLARE @SQL NVARCHAR(MAX);

SET @SQL =
N'SELECT *
  FROM Books
  WHERE CategoryID = @CategoryID';

EXEC sp_executesql
    @SQL,
    N'@CategoryID INT',
    @CategoryID = 1;
```

---

# Dynamic Search

```sql
CREATE PROCEDURE SearchBooksDynamic
    @Keyword VARCHAR(100)
AS
BEGIN

    DECLARE @SQL NVARCHAR(MAX);

    SET @SQL =
    N'SELECT *
      FROM Books
      WHERE Title LIKE ''%' +
      @Keyword +
      '%''';

    EXEC(@SQL);

END;
```

---

# SQL Injection Example

Dangerous:

```sql
SET @SQL =
'SELECT *
 FROM Books
 WHERE Title = '''
+ @Title + '''';
```

---

Safe:

```sql
SET @SQL =
N'SELECT *
  FROM Books
  WHERE Title = @Title';

EXEC sp_executesql
    @SQL,
    N'@Title VARCHAR(100)',
    @Title;
```

---

# EXEC vs sp_executesql

| Feature                  | EXEC() | sp_executesql |
| ------------------------ | ------ | ------------- |
| Dynamic SQL              | Yes    | Yes           |
| Parameters               | No     | Yes           |
| SQL Injection Protection | Poor   | Better        |
| Enterprise Recommended   | No     | Yes           |

---

# 6. Business Automation

## Architecture

```text
Tables
   ↓
Views
   ↓
Stored Procedures
   ↓
Applications
   ↓
Users
```

---

## Automated Reporting Examples

### Book Catalog Report

```sql
EXEC GetBookCatalog;
```

---

### Inventory Dashboard

```sql
EXEC GetInventoryKPIs;
```

---

### Executive Dashboard

```sql
EXEC GetExecutiveDashboard;
```

---

# Frequently Used Commands

| Purpose           | Command          |
| ----------------- | ---------------- |
| Create View       | CREATE VIEW      |
| Modify View       | ALTER VIEW       |
| Delete View       | DROP VIEW        |
| Create Procedure  | CREATE PROCEDURE |
| Modify Procedure  | ALTER PROCEDURE  |
| Delete Procedure  | DROP PROCEDURE   |
| Execute Procedure | EXEC             |
| Show Source Code  | sp_helptext      |
| Refresh View      | sp_refreshview   |
| Dynamic SQL       | EXEC()           |
| Safe Dynamic SQL  | sp_executesql    |

---

# Module 07 Formula Sheet

## Count Rows

```sql
COUNT(*)
```

---

## Total Value

```sql
SUM(Column)
```

---

## Average Value

```sql
AVG(Column)
```

---

## Maximum Value

```sql
MAX(Column)
```

---

## Minimum Value

```sql
MIN(Column)
```

---

# Module 07 Summary

```text
Views
    → Virtual Tables

Stored Procedures
    → Saved SQL Programs

Input Parameters
    → Send Values Into Procedures

Output Parameters
    → Return Values From Procedures

Dynamic SQL
    → Build Queries At Runtime

Business Automation
    → Automate Reports & Dashboards
```

---

# Exam Quick Notes

✅ Views = Virtual Tables

✅ Stored Procedures = Saved Programs

✅ EXEC executes procedures

✅ ALTER modifies existing objects

✅ DROP removes objects

✅ Use parameters for flexibility

✅ Use OUTPUT for KPIs

✅ Prefer sp_executesql over EXEC()

✅ Avoid SELECT *

✅ Validate user inputs

✅ Use Views + Procedures for reporting solutions
