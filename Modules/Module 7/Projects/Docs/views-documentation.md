# Views Documentation

## Overview

This document describes all Views used in the Library Reporting & Automation System.

---

# vw_BookCatalog

## Purpose

Provides a complete book catalog report for reporting and dashboarding.

## Tables Used

* Books
* Categories
* Publishers

## Columns Returned

* BookID
* Title
* CategoryName
* PublisherName
* BookPrice
* PublicationYear

## Business Users

* Librarians
* Analysts
* Managers

---

# vw_ActiveMembers

## Purpose

Displays members who have borrowed at least one book.

## Tables Used

* Members
* BorrowRecords

## Columns Returned

* MemberID
* FirstName
* LastName

---

# vw_PublisherPerformance

## Purpose

Measures publisher contribution to inventory.

## Metrics

* TotalBooks
* AverageBookPrice

---

# vw_InventorySummary

## Purpose

Provides inventory KPIs.

## Metrics

* TotalBooks
* InventoryValue
* AveragePrice
* HighestPrice
* LowestPrice

---

# View Design Standards

✅ Meaningful names

✅ No SELECT *

✅ Single business purpose

✅ Reporting-focused design

✅ Reusable business logic
