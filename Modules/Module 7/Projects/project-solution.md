# Project Solution

# Module 07 Project

## Library Reporting & Automation System

---

# Solution Overview

This project implements a complete reporting and automation framework using SQL Server Views and Stored Procedures.

The architecture follows an enterprise reporting design pattern:

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

# Implemented Views

## vw_BookCatalog

Purpose:

Provides a centralized catalog report containing book, category, and publisher information.

Tables:

```text
Books
Categories
Publishers
```

Business Users:

```text
Librarians
Analysts
Management
```

---

## vw_ActiveMembers

Purpose:

Displays members who have borrowed at least one book.

Tables:

```text
Members
BorrowRecords
```

Business Users:

```text
Library Staff
Management
```

---

## vw_PublisherPerformance

Purpose:

Measures publisher contribution and average pricing.

KPIs:

```text
TotalBooks
AverageBookPrice
```

---

## vw_InventorySummary

Purpose:

Provides inventory-level KPI metrics.

KPIs:

```text
TotalBooks
InventoryValue
AveragePrice
HighestPrice
LowestPrice
```

---

# Implemented Stored Procedures

## GetBookCatalog

Purpose:

Returns complete book catalog information.

Data Source:

```text
vw_BookCatalog
```

---

## GetActiveMembers

Purpose:

Returns members with borrowing activity.

Data Source:

```text
vw_ActiveMembers
```

---

## GetPublisherPerformance

Purpose:

Provides publisher-level reporting.

---

## GetInventoryKPIs

Purpose:

Returns inventory KPIs for dashboards.

---

# Parameterized Procedures

## GetBooksByCategory

Input:

```sql
@CategoryID INT
```

Purpose:

Returns books belonging to a selected category.

---

## GetBooksByPublisher

Input:

```sql
@PublisherID INT
```

Purpose:

Returns books published by a selected publisher.

---

## GetMemberBorrowHistory

Input:

```sql
@MemberID INT
```

Purpose:

Returns borrowing history for a selected member.

---

# KPI Procedures

## GetTotalBooks

Output:

```sql
@TotalBooks INT OUTPUT
```

Purpose:

Returns total number of books.

---

## GetTotalMembers

Output:

```sql
@TotalMembers INT OUTPUT
```

Purpose:

Returns total number of registered members.

---

## GetAverageBookPrice

Output:

```sql
@AverageBookPrice DECIMAL(10,2) OUTPUT
```

Purpose:

Returns average book price.

---

## GetLibraryKPIs

Outputs:

```sql
@TotalBooks INT OUTPUT

@TotalMembers INT OUTPUT

@AverageBookPrice DECIMAL(10,2) OUTPUT
```

Purpose:

Provides consolidated KPI reporting.

---

# Dynamic SQL Implementation

## SearchBooksDynamic

Purpose:

Search books using keyword input.

Technology:

```sql
sp_executesql
```

Security:

```text
Parameterized Dynamic SQL
```

---

## GetBooksSorted

Purpose:

Allow users to dynamically sort reports.

Supported Columns:

```text
Title
BookPrice
PublicationYear
```

Validation:

```text
Column Name Validation
```

---

## GenerateDynamicReport

Purpose:

Generate reports dynamically from approved tables.

Security Controls:

```text
Table Validation

Column Validation

sp_executesql
```

---

# Executive Dashboard

## GetExecutiveDashboard

Purpose:

Provides a one-click management dashboard.

Returned Metrics:

```text
TotalBooks

TotalMembers

TotalAuthors

TotalPublishers

TotalReservations

TotalBorrowRecords
```

Target Users:

```text
Library Managers

Administrators

Business Stakeholders
```

---

# Security Features

Implemented Controls:

✅ Parameter Validation

✅ Controlled Table Access

✅ Reusable Procedures

✅ Dynamic SQL Validation

✅ sp_executesql Usage

---

# Business Benefits

The implemented solution provides:

### Reusability

Business logic written once and reused everywhere.

---

### Maintainability

Changes are made centrally.

---

### Security

Users access procedures rather than tables.

---

### Reporting Consistency

All reports use the same logic.

---

### Automation

Supports dashboards and reporting systems.

---

# Testing Summary

The following objects were tested successfully:

```text
vw_BookCatalog

vw_ActiveMembers

vw_PublisherPerformance

vw_InventorySummary

GetBookCatalog

GetInventoryKPIs

GetExecutiveDashboard

SearchBooksDynamic
```

---

# Conclusion

The Library Reporting & Automation System successfully demonstrates:

* SQL Views
* Stored Procedures
* Input Parameters
* Output Parameters
* Dynamic SQL
* KPI Reporting
* Business Automation

The final solution follows enterprise SQL development practices and provides a scalable foundation for reporting, analytics, and dashboard integration.
