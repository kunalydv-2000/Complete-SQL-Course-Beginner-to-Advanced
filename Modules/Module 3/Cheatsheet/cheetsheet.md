# SQL Query Fundamentals Cheat Sheet

> Quick Reference Guide for Module 03: Query Fundamentals

---

# SELECT Statement

Used to retrieve data from a table.

## Syntax

```sql
SELECT *
FROM TableName;
```

## Example

```sql
SELECT *
FROM Members;
```

---

# Selecting Specific Columns

Retrieve only the columns you need.

## Syntax

```sql
SELECT
    Column1,
    Column2
FROM TableName;
```

## Example

```sql
SELECT
    FirstName,
    LastName
FROM Members;
```

---

# SELECT vs SELECT *

## SELECT *

```sql
SELECT *
FROM Books;
```

Returns all columns.

---

## Specific Columns

```sql
SELECT
    Title,
    PublicationYear
FROM Books;
```

Returns only required columns.

---

# DISTINCT

Removes duplicate values.

## Syntax

```sql
SELECT DISTINCT
    ColumnName
FROM TableName;
```

## Example

```sql
SELECT DISTINCT
    CategoryID
FROM Books;
```

---

# WHERE Clause

Filters rows based on a condition.

## Syntax

```sql
SELECT *
FROM TableName
WHERE Condition;
```

## Example

```sql
SELECT *
FROM Books
WHERE PublicationYear > 2015;
```

---

# Comparison Operators

| Operator | Meaning                  |
| -------- | ------------------------ |
| =        | Equal To                 |
| <>       | Not Equal To             |
| >        | Greater Than             |
| <        | Less Than                |
| >=       | Greater Than or Equal To |
| <=       | Less Than or Equal To    |

---

# Examples

## Equal To

```sql
SELECT *
FROM Books
WHERE CategoryID = 1;
```

---

## Not Equal To

```sql
SELECT *
FROM Books
WHERE CategoryID <> 1;
```

---

## Greater Than

```sql
SELECT *
FROM Books
WHERE PublicationYear > 2020;
```

---

## Less Than

```sql
SELECT *
FROM Books
WHERE PublicationYear < 2010;
```

---

# AND Operator

All conditions must be true.

## Example

```sql
SELECT *
FROM Books
WHERE CategoryID = 1
AND PublicationYear > 2015;
```

---

# OR Operator

At least one condition must be true.

## Example

```sql
SELECT *
FROM Books
WHERE CategoryID = 1
OR CategoryID = 2;
```

---

# ORDER BY

Sorts query results.

## Syntax

```sql
SELECT *
FROM TableName
ORDER BY ColumnName;
```

---

# Ascending Order

```sql
SELECT *
FROM Books
ORDER BY Title ASC;
```

### Default

```sql
SELECT *
FROM Books
ORDER BY Title;
```

ASC is the default.

---

# Descending Order

```sql
SELECT *
FROM Books
ORDER BY PublicationYear DESC;
```

---

# Multiple Column Sorting

```sql
SELECT *
FROM Members
ORDER BY
    LastName,
    FirstName;
```

---

# TOP

Limits returned rows.

## Syntax

```sql
SELECT TOP 5 *
FROM TableName;
```

---

# Example

```sql
SELECT TOP 5 *
FROM Books;
```

---

# TOP with ORDER BY

Newest books:

```sql
SELECT TOP 5
    Title,
    PublicationYear
FROM Books
ORDER BY PublicationYear DESC;
```

---

# TOP PERCENT

```sql
SELECT TOP 50 PERCENT *
FROM Books;
```

---

# TOP WITH TIES

```sql
SELECT TOP 5 WITH TIES *
FROM Books
ORDER BY PublicationYear DESC;
```

---

# Aliases

Rename columns in query output.

## Syntax

```sql
SELECT
    ColumnName AS AliasName
FROM TableName;
```

---

# Example

```sql
SELECT
    FirstName AS First_Name
FROM Members;
```

---

# Multiple Aliases

```sql
SELECT
    FirstName AS First_Name,
    LastName AS Last_Name
FROM Members;
```

---

# Aliases with Spaces

```sql
SELECT
    FirstName AS [First Name]
FROM Members;
```

---

# IN Operator

Matches multiple values.

## Syntax

```sql
SELECT *
FROM TableName
WHERE ColumnName IN
(
    Value1,
    Value2,
    Value3
);
```

---

# Example

```sql
SELECT *
FROM Books
WHERE CategoryID IN (1,2,3);
```

---

# IN with Text Values

```sql
SELECT *
FROM Reservations
WHERE Status IN
(
    'Approved',
    'Pending'
);
```

---

# BETWEEN Operator

Filters values within a range.

## Syntax

```sql
SELECT *
FROM TableName
WHERE ColumnName
BETWEEN Value1 AND Value2;
```

---

# Example

```sql
SELECT *
FROM Books
WHERE PublicationYear
BETWEEN 2010 AND 2020;
```

---

# BETWEEN with Dates

```sql
SELECT *
FROM BorrowRecords
WHERE BorrowDate
BETWEEN '2025-01-01'
AND '2025-12-31';
```

---

# LIKE Operator

Searches text patterns.

## Syntax

```sql
SELECT *
FROM TableName
WHERE ColumnName LIKE Pattern;
```

---

# Wildcards

| Wildcard | Meaning                  |
| -------- | ------------------------ |
| %        | Any number of characters |
| _        | Single character         |

---

# Starts With

```sql
SELECT *
FROM Members
WHERE FirstName LIKE 'J%';
```

Examples:

```text
John
James
Jack
Jennifer
```

---

# Ends With

```sql
SELECT *
FROM Authors
WHERE LastName LIKE '%n';
```

Examples:

```text
Martin
Brown
Wilson
```

---

# Contains

```sql
SELECT *
FROM Publishers
WHERE PublisherName LIKE '%Media%';
```

---

# Single Character

```sql
SELECT *
FROM Members
WHERE FirstName LIKE 'J___';
```

Matches:

```text
John
Jake
```

---

# Query Execution Order

Logical SQL Processing Order:

```text
FROM
 ↓
WHERE
 ↓
SELECT
 ↓
ORDER BY
 ↓
TOP
```

---

# Common Query Patterns

## Find Recent Books

```sql
SELECT *
FROM Books
WHERE PublicationYear > 2020;
```

---

## Find Technology Books

```sql
SELECT *
FROM Books
WHERE CategoryID = 1;
```

---

## Find Approved Reservations

```sql
SELECT *
FROM Reservations
WHERE Status = 'Approved';
```

---

## Find Newest Books

```sql
SELECT TOP 5 *
FROM Books
ORDER BY PublicationYear DESC;
```

---

## Search Members

```sql
SELECT *
FROM Members
WHERE FirstName LIKE 'S%';
```

---

## Books in Multiple Categories

```sql
SELECT *
FROM Books
WHERE CategoryID IN (1,2,3);
```

---

## Books Published in a Range

```sql
SELECT *
FROM Books
WHERE PublicationYear
BETWEEN 2010 AND 2020;
```

---

# Business Query Template

```sql
SELECT TOP N
    Column1 AS Alias1,
    Column2 AS Alias2
FROM TableName
WHERE Condition
ORDER BY ColumnName DESC;
```

---

# Example

```sql
SELECT TOP 5
    Title AS Book_Title,
    PublicationYear AS Published_Year
FROM Books
WHERE CategoryID = 1
AND PublicationYear > 2015
ORDER BY PublicationYear DESC;
```

---

# Common Mistakes

## Missing Quotes

❌

```sql
WHERE Status = Approved
```

✅

```sql
WHERE Status = 'Approved'
```

---

## Missing ORDER BY with TOP

❌

```sql
SELECT TOP 5 *
FROM Books;
```

✅

```sql
SELECT TOP 5 *
FROM Books
ORDER BY PublicationYear DESC;
```

---

## Wrong LIKE Pattern

❌

```sql
LIKE 'J'
```

✅

```sql
LIKE 'J%'
```

---

## Reversed BETWEEN

❌

```sql
BETWEEN 2025 AND 2010
```

✅

```sql
BETWEEN 2010 AND 2025
```

---

# Module 03 Summary

You should now understand:

✅ SELECT

✅ Specific Columns

✅ DISTINCT

✅ WHERE

✅ Comparison Operators

✅ AND / OR

✅ ORDER BY

✅ TOP

✅ Aliases

✅ IN

✅ BETWEEN

✅ LIKE

✅ Wildcards

✅ Business Query Design

---

# Next Module

## Module 04: Aggregate Functions and Grouping

Topics:

```text
COUNT()
SUM()
AVG()
MIN()
MAX()
GROUP BY
HAVING
```

You'll begin transforming raw data into meaningful business insights and analytical reports.
