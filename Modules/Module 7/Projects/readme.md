# Module 07 Project: Library Reporting & Automation System

## Project Overview

In this project, you will build a complete reporting and automation framework for a Library Management System using SQL Server.

You will create:

* Reporting Views
* Stored Procedures
* Parameterized Procedures
* Output Parameter Procedures
* Dynamic SQL Procedures
* Executive Dashboard Reports

This project simulates a real-world enterprise reporting solution.

---

# Project Title

```text
Library Reporting & Automation System
```

---

# Business Scenario

The library management team currently relies on manually written SQL queries for reporting.

Management wants a centralized reporting framework that:

* Simplifies report generation
* Supports dashboards
* Improves security
* Eliminates duplicate SQL code
* Provides KPI reporting
* Supports flexible searches

You have been assigned as the Database Developer responsible for implementing the solution.

---

# Database Tables

Use the Library Management System database.

Required tables:

```text
Books
Authors
Categories
Publishers
Members
BorrowRecords
Reservations
```

---

# Project Requirements

## Phase 1: Reporting Views

Create the following Views.

---

### View 1: Book Catalog

View Name:

```text
vw_BookCatalog
```

Display:

```text
BookID
Title
CategoryName
PublisherName
BookPrice
PublicationYear
```

---

### View 2: Active Members

View Name:

```text
vw_ActiveMembers
```

Display:

```text
MemberID
FirstName
LastName
```

Only members who have borrowed books.

---

### View 3: Publisher Performance

View Name:

```text
vw_PublisherPerformance
```

Display:

```text
PublisherName
TotalBooks
AverageBookPrice
```

---

### View 4: Inventory Summary

View Name:

```text
vw_InventorySummary
```

Display:

```text
TotalBooks
InventoryValue
AveragePrice
HighestPrice
LowestPrice
```

---

# Phase 2: Reporting Procedures

Create the following Stored Procedures.

---

### Procedure 1

```text
GetBookCatalog
```

Returns:

```text
All records from vw_BookCatalog
```

---

### Procedure 2

```text
GetActiveMembers
```

Returns:

```text
All records from vw_ActiveMembers
```

---

### Procedure 3

```text
GetPublisherPerformance
```

Returns:

```text
Publisher performance report
```

---

### Procedure 4

```text
GetInventoryKPIs
```

Returns:

```text
Inventory KPI report
```

---

# Phase 3: Parameterized Procedures

Create the following procedures.

---

### Procedure 5

```text
GetBooksByCategory
```

Parameter:

```sql
@CategoryID INT
```

Return books belonging to the selected category.

---

### Procedure 6

```text
GetBooksByPublisher
```

Parameter:

```sql
@PublisherID INT
```

Return books from the selected publisher.

---

### Procedure 7

```text
GetMemberBorrowHistory
```

Parameter:

```sql
@MemberID INT
```

Return:

```text
Borrow Date
Due Date
Book Title
```

for the specified member.

---

# Phase 4: Output Parameter Procedures

Create KPI procedures.

---

### Procedure 8

```text
GetTotalBooks
```

Output:

```sql
@TotalBooks INT OUTPUT
```

---

### Procedure 9

```text
GetTotalMembers
```

Output:

```sql
@TotalMembers INT OUTPUT
```

---

### Procedure 10

```text
GetAverageBookPrice
```

Output:

```sql
@AveragePrice DECIMAL(10,2) OUTPUT
```

---

### Procedure 11

```text
GetLibraryKPIs
```

Outputs:

```sql
@TotalBooks INT OUTPUT

@TotalMembers INT OUTPUT

@AverageBookPrice DECIMAL(10,2) OUTPUT
```

---

# Phase 5: Dynamic SQL Procedures

Create flexible search procedures.

---

### Procedure 12

```text
SearchBooksDynamic
```

Parameter:

```sql
@Keyword VARCHAR(100)
```

Search books by title.

---

### Procedure 13

```text
GetBooksSorted
```

Parameter:

```sql
@SortColumn VARCHAR(50)
```

Allow sorting by:

```text
Title
BookPrice
PublicationYear
```

Validate input values.

---

### Procedure 14

```text
GenerateDynamicReport
```

Parameters:

```sql
@TableName VARCHAR(50)

@SortColumn VARCHAR(50)
```

Generate a dynamic report using:

```sql
sp_executesql
```

---

# Phase 6: Executive Dashboard

Create a dashboard procedure.

---

### Procedure 15

```text
GetExecutiveDashboard
```

Display:

```text
TotalBooks
TotalMembers
TotalAuthors
TotalPublishers
TotalReservations
TotalBorrowRecords
```

Use:

```text
COUNT()
Subqueries
```

---

# Deliverables

## Deliverable 1

SQL Script File

```text
Module07_Project.sql
```

Contains:

```text
All Views

All Procedures

Testing Queries
```

---

## Deliverable 2

Project Documentation

```text
Project-Documentation.md
```

---

Document:

| Object Name | Type | Purpose |
| ----------- | ---- | ------- |

---

## Deliverable 3

Testing Results

Execute:

```sql
EXEC GetBookCatalog;

EXEC GetInventoryKPIs;

EXEC GetExecutiveDashboard;

EXEC SearchBooksDynamic
    @Keyword = 'SQL';
```

Capture results.

---

# Validation Checklist

## Views

```text
□ vw_BookCatalog

□ vw_ActiveMembers

□ vw_PublisherPerformance

□ vw_InventorySummary
```

---

## Procedures

```text
□ GetBookCatalog

□ GetActiveMembers

□ GetPublisherPerformance

□ GetInventoryKPIs

□ GetBooksByCategory

□ GetBooksByPublisher

□ GetMemberBorrowHistory

□ GetTotalBooks

□ GetTotalMembers

□ GetAverageBookPrice

□ GetLibraryKPIs

□ SearchBooksDynamic

□ GetBooksSorted

□ GenerateDynamicReport

□ GetExecutiveDashboard
```

---

# Bonus Tasks

### Bonus 1

Create:

```text
GetTopBorrowedBooks
```

Return:

```text
Top 10 Most Borrowed Books
```

---

### Bonus 2

Create:

```text
GetInactiveMembers
```

Return members who never borrowed books.

---

### Bonus 3

Create:

```text
CheckBookAvailability
```

Parameters:

```sql
@BookID INT
```

Output:

```sql
@Status VARCHAR(50) OUTPUT
```

Return:

```text
Available

Reserved

Unavailable
```

---

# Learning Outcomes

After completing this project, you will be able to:

✅ Design enterprise reporting Views

✅ Create reusable Stored Procedures

✅ Use Input Parameters

✅ Use Output Parameters

✅ Build Dynamic SQL solutions

✅ Create KPI dashboards

✅ Implement business automation

✅ Develop production-ready SQL Server reporting systems

---

# Project Completion Criteria

To successfully complete this project:

```text
All Views Created                20%

Stored Procedures Created        30%

Parameterized Procedures         15%

Output Parameters                10%

Dynamic SQL                      10%

Executive Dashboard              10%

Documentation                    5%
```

---

# Final Goal

Build a professional reporting framework where business users can generate reports and dashboards simply by executing Stored Procedures without directly accessing underlying tables.
