# Stored Procedures Documentation

## Overview

This document describes all Stored Procedures used in the project.

---

# GetBookCatalog

## Purpose

Returns the complete book catalog.

## Input Parameters

None

## Output

Book catalog report.

---

# GetActiveMembers

## Purpose

Returns members with borrowing activity.

## Input Parameters

None

---

# GetPublisherPerformance

## Purpose

Returns publisher statistics.

---

# GetInventoryKPIs

## Purpose

Returns inventory KPI metrics.

---

# GetBooksByCategory

## Input

```sql
@CategoryID INT
```

## Purpose

Returns books for a selected category.

---

# GetBooksByPublisher

## Input

```sql
@PublisherID INT
```

## Purpose

Returns books for a selected publisher.

---

# GetMemberBorrowHistory

## Input

```sql
@MemberID INT
```

## Purpose

Returns borrowing history for a member.

---

# GetTotalBooks

## Output

```sql
@TotalBooks INT OUTPUT
```

---

# GetTotalMembers

## Output

```sql
@TotalMembers INT OUTPUT
```

---

# GetAverageBookPrice

## Output

```sql
@AverageBookPrice DECIMAL(10,2) OUTPUT
```

---

# GetLibraryKPIs

## Outputs

* TotalBooks
* TotalMembers
* AverageBookPrice

---

# SearchBooksDynamic

## Purpose

Search books using keywords.

## Technology

sp_executesql

---

# GetBooksSorted

## Purpose

Provides dynamic sorting.

## Allowed Sort Columns

* Title
* BookPrice
* PublicationYear

---

# GetExecutiveDashboard

## Purpose

Returns executive-level KPI metrics.
