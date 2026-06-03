# Lesson 03: SUM() Function

> Learn how to calculate totals using the SUM() function and create financial, operational, and business reports from your database.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand the SUM() function
* Calculate totals from numeric columns
* Use SUM() with WHERE
* Build financial reports
* Create KPI metrics
* Use aliases with SUM()
* Avoid common SUM() mistakes

---

# Introduction

Businesses often need to calculate totals.

Examples:

```text id="sum001"
What is the total revenue?

What is the total fine amount collected?

How many pages do all books contain?

What is the total inventory value?
```

To answer these questions, SQL provides:

```sql id="sum002"
SUM()
```

SUM() adds values together and returns a single total.

---

# What is SUM()?

SUM() calculates the total of numeric values in a column.

Basic idea:

```text id="sum003"
Values
 ↓
SUM()
 ↓
Total
```

---

# Basic Syntax

```sql id="sum004"
SELECT SUM(ColumnName)
FROM TableName;
```

---

# Example

Suppose BorrowRecords contains:

| BorrowID | FineAmount |
| -------- | ---------- |
| 1        | 10         |
| 2        | 20         |
| 3        | 15         |

---

Query:

```sql id="sum005"
SELECT SUM(FineAmount)
FROM BorrowRecords;
```

---

Result:

```text id="sum006"
45
```

---

# How SUM Works

```text id="sum007"
10
20
15
----
45
```

SQL performs the addition automatically.

---

# SUM with Aliases

Professional reports should use aliases.

Example:

```sql id="sum008"
SELECT
    SUM(FineAmount) AS TotalFines
FROM BorrowRecords;
```

---

Result:

| TotalFines |
| ---------- |
| 45         |

---

# Real-World Business Example

Library manager asks:

```text id="sum009"
How much money has been collected in fines?
```

Query:

```sql id="sum010"
SELECT
    SUM(FineAmount) AS TotalFineRevenue
FROM BorrowRecords;
```

---

# SUM with Book Prices

Suppose Books table contains:

| Title          | BookPrice |
| -------------- | --------- |
| SQL Basics     | 25        |
| Python Guide   | 30        |
| Data Analytics | 45        |

---

Query:

```sql id="sum011"
SELECT
    SUM(BookPrice)
FROM Books;
```

---

Result:

```text id="sum012"
100
```

---

# SUM and NULL Values

SUM ignores NULL values.

Example:

| BookPrice |
| --------- |
| 20        |
| 30        |
| NULL      |

---

Query:

```sql id="sum013"
SELECT SUM(BookPrice)
FROM Books;
```

---

Result:

```text id="sum014"
50
```

NULL is ignored.

---

# SUM with WHERE

SUM can calculate totals for filtered records.

---

Example

Calculate fines for approved borrow records.

```sql id="sum015"
SELECT
    SUM(FineAmount) AS ApprovedFineTotal
FROM BorrowRecords
WHERE Status = 'Approved';
```

---

Execution:

```text id="sum016"
Filter Rows
    ↓
Apply SUM()
    ↓
Return Total
```

---

# SUM with Multiple Conditions

Example:

```sql id="sum017"
SELECT
    SUM(FineAmount) AS RecentFines
FROM BorrowRecords
WHERE BorrowDate >= '2025-01-01';
```

---

Result:

Total fines for records after January 1, 2025.

---

# SUM with Arithmetic Expressions

SUM can aggregate calculations.

Example:

```sql id="sum018"
SELECT
    SUM(BookPrice * Quantity) AS InventoryValue
FROM Books;
```

---

Result:

Total inventory value.

---

# Business KPI Examples

---

## Total Fine Revenue

```sql id="sum019"
SELECT
    SUM(FineAmount) AS TotalFineRevenue
FROM BorrowRecords;
```

---

## Total Inventory Value

```sql id="sum020"
SELECT
    SUM(BookPrice) AS TotalBookValue
FROM Books;
```

---

## Total Reservation Fees

```sql id="sum021"
SELECT
    SUM(ReservationFee) AS TotalReservationFees
FROM Reservations;
```

---

## Total Annual Revenue

```sql id="sum022"
SELECT
    SUM(Revenue)
FROM Sales;
```

---

# SUM with GROUP BY Preview

SUM becomes even more powerful when combined with GROUP BY.

Example:

```sql id="sum023"
SELECT
    CategoryID,
    SUM(BookPrice) AS TotalCategoryValue
FROM Books
GROUP BY CategoryID;
```

---

Result:

| CategoryID | TotalCategoryValue |
| ---------- | ------------------ |
| 1          | 250                |
| 2          | 400                |
| 3          | 175                |

---

# Query Execution Flow

```text id="sum024"
Rows
 ↓
WHERE
 ↓
SUM()
 ↓
Result
```

---

# Real-World Scenario

Management asks:

```text id="sum025"
What is the total value of books in the library?
```

Query:

```sql id="sum026"
SELECT
    SUM(BookPrice) AS TotalLibraryValue
FROM Books;
```

---

Management asks:

```text id="sum027"
How much fine revenue was generated this year?
```

Query:

```sql id="sum028"
SELECT
    SUM(FineAmount) AS AnnualFineRevenue
FROM BorrowRecords
WHERE YEAR(BorrowDate) = 2025;
```

---

# Common Beginner Mistakes

---

## Using SUM on Text Columns

Bad:

```sql id="sum029"
SELECT SUM(Title)
FROM Books;
```

---

SUM requires numeric values.

---

## Forgetting Alias

Bad:

```sql id="sum030"
SELECT SUM(FineAmount)
FROM BorrowRecords;
```

---

Better:

```sql id="sum031"
SELECT
    SUM(FineAmount) AS TotalFines
FROM BorrowRecords;
```

---

## Assuming NULL Equals Zero

Bad assumption:

```text id="sum032"
NULL is treated as 0
```

---

Reality:

```text id="sum033"
NULL is ignored
```

---

# Performance Note

SUM is highly optimized in SQL Server.

Example:

```sql id="sum034"
SELECT SUM(FineAmount)
FROM BorrowRecords;
```

Even large tables can be processed efficiently.

---

# Hands-On Practice

Run:

```sql id="sum035"
SELECT
    SUM(FineAmount)
FROM BorrowRecords;
```

---

Run:

```sql id="sum036"
SELECT
    SUM(BookPrice)
FROM Books;
```

---

Run:

```sql id="sum037"
SELECT
    SUM(FineAmount)
FROM BorrowRecords
WHERE Status = 'Approved';
```

---

Run:

```sql id="sum038"
SELECT
    SUM(BookPrice)
FROM Books
WHERE PublicationYear > 2015;
```

---

# Mini Exercise

Write queries to find:

### Task 1

Total fine amount.

---

### Task 2

Total value of books.

---

### Task 3

Total fine amount for approved borrow records.

---

### Task 4

Total value of books published after 2020.

---

### Task 5

Total reservation fees.

---

# Best Practices

✅ Use SUM only on numeric columns

✅ Use aliases for reports

✅ Combine SUM with WHERE for filtered totals

✅ Verify NULL handling

✅ Create meaningful KPI names

---

# Summary

In this lesson, you learned:

* SUM() syntax
* Calculating totals
* Using aliases
* NULL handling
* SUM with WHERE
* KPI reporting
* Business metrics

SUM() is one of the most important aggregate functions for financial reporting, operational analysis, and business intelligence.

---

# Knowledge Check

### Question 1

Which function calculates totals?

A. COUNT()

B. AVG()

C. SUM()

D. MAX()

---

### Question 2

Which query calculates total fines?

A.

```sql id="q1"
SELECT COUNT(FineAmount)
FROM BorrowRecords;
```

B.

```sql id="q2"
SELECT SUM(FineAmount)
FROM BorrowRecords;
```

C.

```sql id="q3"
SELECT AVG(FineAmount)
FROM BorrowRecords;
```

D.

```sql id="q4"
SELECT MAX(FineAmount)
FROM BorrowRecords;
```

---

### Question 3

Does SUM ignore NULL values?

A. Yes

B. No

---

### Question 4

Can SUM be combined with WHERE?

A. No

B. Yes

---

### Question 5

Which query creates a professional KPI report?

```sql id="sum039"
SELECT
    SUM(FineAmount) AS TotalFineRevenue
FROM BorrowRecords;
```

A. Correct

B. Incorrect

---

# Next Lesson

➡️ 04-AVG-Function.md

In the next lesson, you'll learn how to calculate averages using AVG() and create analytical reports that reveal trends and performance metrics.
