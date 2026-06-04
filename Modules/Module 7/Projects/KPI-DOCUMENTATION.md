# KPI Documentation

# Library Reporting & Automation System

---

# Overview

This document defines all Key Performance Indicators (KPIs) used throughout the reporting and automation framework.

These KPIs are consumed by:

* Stored Procedures
* Dashboards
* Reports
* Business Analytics
* Management Systems

---

# KPI Categories

The project contains KPIs for:

```text
Inventory Management

Member Management

Borrowing Activity

Reservation Activity

Executive Reporting
```

---

# KPI 1: Total Books

## Description

Represents the total number of books currently stored in the library database.

---

## Business Value

Measures inventory size.

Used by:

* Library Managers
* Administrators
* Executive Dashboard

---

## Formula

```sql
COUNT(*)
```

---

## SQL Example

```sql
SELECT COUNT(*)
FROM Books;
```

---

# KPI 2: Inventory Value

## Description

Total monetary value of all books.

---

## Business Value

Measures library asset value.

Used by:

* Finance Teams
* Library Management

---

## Formula

```sql
SUM(BookPrice)
```

---

## SQL Example

```sql
SELECT SUM(BookPrice)
FROM Books;
```

---

# KPI 3: Average Book Price

## Description

Average cost of books in the library.

---

## Business Value

Helps analyze pricing trends.

---

## Formula

```sql
AVG(BookPrice)
```

---

## SQL Example

```sql
SELECT AVG(BookPrice)
FROM Books;
```

---

# KPI 4: Highest Book Price

## Description

Most expensive book in the inventory.

---

## Business Value

Identifies premium inventory.

---

## Formula

```sql
MAX(BookPrice)
```

---

## SQL Example

```sql
SELECT MAX(BookPrice)
FROM Books;
```

---

# KPI 5: Lowest Book Price

## Description

Least expensive book in inventory.

---

## Business Value

Identifies minimum pricing level.

---

## Formula

```sql
MIN(BookPrice)
```

---

## SQL Example

```sql
SELECT MIN(BookPrice)
FROM Books;
```

---

# KPI 6: Total Members

## Description

Total registered library members.

---

## Business Value

Measures customer base size.

---

## Formula

```sql
COUNT(*)
```

---

## SQL Example

```sql
SELECT COUNT(*)
FROM Members;
```

---

# KPI 7: Active Members

## Description

Members who have borrowed at least one book.

---

## Business Value

Measures member engagement.

---

## Formula

```sql
COUNT(DISTINCT MemberID)
```

---

## SQL Example

```sql
SELECT COUNT(DISTINCT MemberID)
FROM BorrowRecords;
```

---

# KPI 8: Total Borrow Records

## Description

Total borrowing transactions.

---

## Business Value

Measures library usage.

---

## Formula

```sql
COUNT(*)
```

---

## SQL Example

```sql
SELECT COUNT(*)
FROM BorrowRecords;
```

---

# KPI 9: Total Reservations

## Description

Total book reservation requests.

---

## Business Value

Measures demand for books.

---

## Formula

```sql
COUNT(*)
```

---

## SQL Example

```sql
SELECT COUNT(*)
FROM Reservations;
```

---

# KPI 10: Borrow Count Per Member

## Description

Number of books borrowed by a specific member.

---

## Business Value

Tracks member activity.

---

## Formula

```sql
COUNT(*)
```

---

## SQL Example

```sql
SELECT COUNT(*)
FROM BorrowRecords
WHERE MemberID = @MemberID;
```

---

# KPI 11: Reservation Count Per Book

## Description

Number of reservations made for a specific book.

---

## Business Value

Identifies popular books.

---

## Formula

```sql
COUNT(*)
```

---

## SQL Example

```sql
SELECT COUNT(*)
FROM Reservations
WHERE BookID = @BookID;
```

---

# KPI 12: Publisher Performance

## Description

Measures publisher contribution to the library collection.

---

## Metrics

```text
TotalBooks

AverageBookPrice
```

---

## SQL Example

```sql
SELECT
    PublisherID,
    COUNT(*) AS TotalBooks,
    AVG(BookPrice) AS AverageBookPrice
FROM Books
GROUP BY PublisherID;
```

---

# KPI 13: Category Performance

## Description

Measures category growth and pricing.

---

## Metrics

```text
TotalBooks

AveragePrice
```

---

## SQL Example

```sql
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks,
    AVG(BookPrice) AS AveragePrice
FROM Books
GROUP BY CategoryID;
```

---

# Executive Dashboard KPIs

The Executive Dashboard procedure returns:

| KPI                | Source Table  |
| ------------------ | ------------- |
| TotalBooks         | Books         |
| TotalMembers       | Members       |
| TotalAuthors       | Authors       |
| TotalPublishers    | Publishers    |
| TotalReservations  | Reservations  |
| TotalBorrowRecords | BorrowRecords |

---

# KPI Refresh Frequency

| KPI Type                 | Frequency |
| ------------------------ | --------- |
| Inventory KPIs           | Daily     |
| Member KPIs              | Daily     |
| Borrow KPIs              | Real-Time |
| Reservation KPIs         | Real-Time |
| Executive Dashboard KPIs | Daily     |

---

# KPI Consumers

## Library Management

Uses:

```text
Inventory Value

Total Books

Publisher Performance
```

---

## Librarians

Uses:

```text
Borrow Counts

Reservation Counts

Active Members
```

---

## Executives

Uses:

```text
Executive Dashboard

Growth Metrics

Operational KPIs
```

---

# KPI Best Practices

✅ Use aggregate functions

✅ Validate KPI calculations

✅ Document KPI formulas

✅ Keep KPI definitions consistent

✅ Reuse KPI logic in procedures

✅ Centralize KPI reporting

---

# KPI Summary

```text
Inventory KPIs
----------------
Total Books
Inventory Value
Average Book Price
Highest Price
Lowest Price

Member KPIs
------------
Total Members
Active Members

Borrowing KPIs
---------------
Borrow Count
Total Borrow Records

Reservation KPIs
-----------------
Reservation Count
Total Reservations

Executive KPIs
---------------
Total Books
Total Members
Total Authors
Total Publishers
Total Reservations
Total Borrow Records
```
