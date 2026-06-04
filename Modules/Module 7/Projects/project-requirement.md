# Project Requirements

# Module 07 Project

## Library Reporting & Automation System

---

# Project Overview

The objective of this project is to design and implement a complete SQL-based reporting and automation framework for a Library Management System.

Students will apply concepts learned throughout Module 07, including:

* Views
* Stored Procedures
* Input Parameters
* Output Parameters
* Dynamic SQL
* Business Automation

The final solution should allow business users to generate reports and dashboards without directly accessing database tables.

---

# Business Problem

The library currently relies on manually written SQL queries for reporting and analytics.

This creates several challenges:

* Duplicate SQL code
* Inconsistent reports
* Increased maintenance effort
* Limited security controls
* Lack of automation

Management wants a centralized reporting system that provides reusable database objects and automated reporting capabilities.

---

# Project Objectives

The solution must:

* Centralize reporting logic
* Reduce duplicate SQL code
* Improve security
* Support business reporting
* Enable KPI reporting
* Support flexible search capabilities
* Demonstrate enterprise SQL development practices

---

# Database Environment

Use the existing Library Management System database.

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

# Functional Requirements

## Requirement 1: Reporting Views

Create the following Views:

### vw_BookCatalog

Display:

* BookID
* Title
* CategoryName
* PublisherName
* BookPrice
* PublicationYear

---

### vw_ActiveMembers

Display:

* MemberID
* FirstName
* LastName

Only include members who have borrowed books.

---

### vw_PublisherPerformance

Display:

* PublisherName
* TotalBooks
* AverageBookPrice

---

### vw_InventorySummary

Display:

* TotalBooks
* InventoryValue
* AveragePrice
* HighestPrice
* LowestPrice

---

# Requirement 2: Reporting Procedures

Create:

```text
GetBookCatalog
GetActiveMembers
GetPublisherPerformance
GetInventoryKPIs
```

Each procedure should return business-ready reports.

---

# Requirement 3: Parameterized Procedures

Create:

### GetBooksByCategory

Input:

```sql
@CategoryID INT
```

---

### GetBooksByPublisher

Input:

```sql
@PublisherID INT
```

---

### GetMemberBorrowHistory

Input:

```sql
@MemberID INT
```

---

# Requirement 4: KPI Procedures

Create procedures that return KPI values using OUTPUT parameters.

Required KPIs:

```text
TotalBooks
TotalMembers
AverageBookPrice
```

---

# Requirement 5: Dynamic SQL

Create:

### SearchBooksDynamic

Search books using keywords.

---

### GetBooksSorted

Allow dynamic sorting.

---

### GenerateDynamicReport

Generate reports dynamically using:

```sql
sp_executesql
```

---

# Requirement 6: Executive Dashboard

Create:

```text
GetExecutiveDashboard
```

Return:

* TotalBooks
* TotalMembers
* TotalAuthors
* TotalPublishers
* TotalReservations
* TotalBorrowRecords

---

# Technical Requirements

Students must:

✅ Use meaningful object names

✅ Use proper formatting

✅ Avoid SELECT *

✅ Use aliases where appropriate

✅ Validate user inputs

✅ Use sp_executesql for Dynamic SQL

✅ Document all objects

---

# Deliverables

## SQL Script

```text
Module07_Project.sql
```

Contains:

* Views
* Procedures
* Test Scripts

---

## Documentation

```text
PROJECT-SOLUTION.md
```

---

## Testing Evidence

Provide successful execution results for:

```sql
EXEC GetBookCatalog;

EXEC GetInventoryKPIs;

EXEC GetExecutiveDashboard;

EXEC SearchBooksDynamic
    @Keyword = 'SQL';
```

---

# Success Criteria

The project will be considered complete when:

```text
All Views Created

All Procedures Created

Dynamic SQL Implemented

KPIs Generated

Dashboard Created

Documentation Completed

Testing Completed
```

---

# Project Outcomes

Upon successful completion, students will demonstrate the ability to:

* Design reporting Views
* Build reusable Stored Procedures
* Implement parameterized reporting
* Create KPI dashboards
* Build Dynamic SQL solutions
* Develop business automation frameworks
