# Lesson 04: AVG() Function

> Learn how to calculate averages using the AVG() function and create analytical reports that reveal trends, performance, and business insights.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand the AVG() function
* Calculate average values
* Use AVG() with numeric columns
* Create analytical reports
* Use AVG() with filters
* Build KPI metrics
* Avoid common AVG() mistakes

---

# Introduction

Businesses often need to know the average value of something.

Examples:

```text
What is the average book price?

What is the average fine amount?

What is the average number of pages per book?

What is the average borrowing duration?
```

Instead of calculating manually, SQL provides:

```sql
AVG()
```

AVG() calculates the arithmetic mean of a set of values.

---

# What is AVG()?

AVG() calculates the average value of a numeric column.

Basic idea:

```text
Values
 ↓
AVG()
 ↓
Average
```

---

# Mathematical Formula

Average is calculated as:

Average = \frac{Sum\ of\ Values}{Number\ of\ Values}

---

# Basic Syntax

```sql
SELECT AVG(ColumnName)
FROM TableName;
```

---

# Example

Books Table:

| BookID | BookPrice |
| ------ | --------- |
| 1      | 20        |
| 2      | 30        |
| 3      | 40        |

Query:

```sql
SELECT AVG(BookPrice)
FROM Books;
```

---

Result:

```text
30
```

Because:

```text
(20 + 30 + 40) ÷ 3 = 30
```

---

# Understanding AVG()

Example values:

```text
10
20
30
40
50
```

AVG():

```text
150 ÷ 5 = 30
```

Result:

```text
30
```

---

# AVG with Aliases

Professional reports should always use aliases.

Example:

```sql
SELECT
    AVG(BookPrice) AS AverageBookPrice
FROM Books;
```

---

Result:

| AverageBookPrice |
| ---------------- |
| 30.00            |

---

# Real-World Example

Library manager asks:

```text
What is the average book price?
```

Query:

```sql
SELECT
    AVG(BookPrice) AS AverageBookPrice
FROM Books;
```

---

# AVG with Decimal Results

Example:

Values:

```text
10
15
20
```

Query:

```sql
SELECT AVG(ValueColumn)
FROM SampleTable;
```

---

Result:

```text
15.00
```

AVG often returns decimal values.

---

# AVG and NULL Values

AVG ignores NULL values.

Example:

| BookPrice |
| --------- |
| 20        |
| 30        |
| NULL      |

Query:

```sql
SELECT AVG(BookPrice)
FROM Books;
```

---

Result:

```text
25
```

Calculation:

```text
(20 + 30) ÷ 2
```

NULL is ignored.

---

# AVG with WHERE

AVG can calculate averages for filtered records.

Example:

```sql
SELECT
    AVG(BookPrice) AS RecentBookAverage
FROM Books
WHERE PublicationYear > 2020;
```

---

Execution:

```text
Filter Rows
     ↓
Apply AVG()
     ↓
Return Average
```

---

# AVG with Multiple Conditions

Example:

```sql
SELECT
    AVG(FineAmount) AS AverageFine
FROM BorrowRecords
WHERE Status = 'Approved';
```

---

Result:

Average fine for approved borrow records.

---

# Business KPI Examples

---

## Average Book Price

```sql
SELECT
    AVG(BookPrice) AS AverageBookPrice
FROM Books;
```

---

## Average Fine Amount

```sql
SELECT
    AVG(FineAmount) AS AverageFine
FROM BorrowRecords;
```

---

## Average Reservation Fee

```sql
SELECT
    AVG(ReservationFee) AS AverageReservationFee
FROM Reservations;
```

---

## Average Publication Year

```sql
SELECT
    AVG(PublicationYear) AS AveragePublicationYear
FROM Books;
```

---

# AVG with GROUP BY Preview

AVG becomes more powerful when combined with GROUP BY.

Example:

```sql
SELECT
    CategoryID,
    AVG(BookPrice) AS AveragePrice
FROM Books
GROUP BY CategoryID;
```

---

Result:

| CategoryID | AveragePrice |
| ---------- | ------------ |
| 1          | 35.50        |
| 2          | 28.75        |
| 3          | 42.00        |

---

# Query Execution Flow

```text
Rows
 ↓
WHERE
 ↓
AVG()
 ↓
Result
```

---

# Real-World Scenario

Management asks:

```text
What is the average fine collected?
```

Query:

```sql
SELECT
    AVG(FineAmount) AS AverageFineCollected
FROM BorrowRecords;
```

---

Management asks:

```text
What is the average price of books published after 2015?
```

Query:

```sql
SELECT
    AVG(BookPrice) AS AverageModernBookPrice
FROM Books
WHERE PublicationYear > 2015;
```

---

# AVG vs SUM vs COUNT

| Function | Purpose           |
| -------- | ----------------- |
| COUNT()  | Count rows        |
| SUM()    | Calculate total   |
| AVG()    | Calculate average |

---

Example:

```sql
SELECT COUNT(BookPrice)
FROM Books;
```

Returns:

```text
Number of Books
```

---

```sql
SELECT SUM(BookPrice)
FROM Books;
```

Returns:

```text
Total Value
```

---

```sql
SELECT AVG(BookPrice)
FROM Books;
```

Returns:

```text
Average Value
```

---

# Common Beginner Mistakes

---

## Using AVG on Text Columns

Bad:

```sql
SELECT AVG(Title)
FROM Books;
```

---

AVG requires numeric data.

---

## Forgetting Alias

Bad:

```sql
SELECT AVG(BookPrice)
FROM Books;
```

---

Better:

```sql
SELECT
    AVG(BookPrice) AS AverageBookPrice
FROM Books;
```

---

## Assuming NULL Equals Zero

Bad assumption:

```text
NULL contributes 0
```

---

Reality:

```text
NULL is ignored
```

---

## Confusing AVG with SUM

Bad:

```sql
SELECT SUM(BookPrice)
FROM Books;
```

when the question asks for:

```text
Average Price
```

---

Correct:

```sql
SELECT AVG(BookPrice)
FROM Books;
```

---

# Performance Note

AVG is optimized by SQL Server and performs efficiently even on large datasets.

Example:

```sql
SELECT AVG(BookPrice)
FROM Books;
```

---

# Hands-On Practice

Run:

```sql
SELECT AVG(BookPrice)
FROM Books;
```

---

Run:

```sql
SELECT AVG(FineAmount)
FROM BorrowRecords;
```

---

Run:

```sql
SELECT AVG(BookPrice)
FROM Books
WHERE PublicationYear > 2020;
```

---

Run:

```sql
SELECT AVG(FineAmount)
FROM BorrowRecords
WHERE Status = 'Approved';
```

---

# Mini Exercise

Write queries to find:

### Task 1

Average book price.

---

### Task 2

Average fine amount.

---

### Task 3

Average reservation fee.

---

### Task 4

Average price of books published after 2015.

---

### Task 5

Average fine amount for approved borrow records.

---

# Best Practices

✅ Use AVG only on numeric columns

✅ Always use aliases

✅ Understand NULL handling

✅ Combine AVG with WHERE when needed

✅ Use meaningful KPI names

---

# Summary

In this lesson, you learned:

* AVG() syntax
* Calculating averages
* Using aliases
* NULL handling
* AVG with WHERE
* KPI reporting
* Business analytics

AVG() is one of the most valuable analytical functions because it helps identify trends, benchmarks, and performance metrics.

---

# Knowledge Check

### Question 1

Which function calculates averages?

A. COUNT()

B. SUM()

C. AVG()

D. MAX()

---

### Question 2

Which query calculates the average book price?

A.

```sql
SELECT SUM(BookPrice)
FROM Books;
```

B.

```sql
SELECT AVG(BookPrice)
FROM Books;
```

C.

```sql
SELECT COUNT(BookPrice)
FROM Books;
```

D.

```sql
SELECT MAX(BookPrice)
FROM Books;
```

---

### Question 3

Does AVG ignore NULL values?

A. Yes

B. No

---

### Question 4

Can AVG be combined with WHERE?

A. No

B. Yes

---

### Question 5

Which query creates a professional KPI report?

```sql
SELECT
    AVG(BookPrice) AS AverageBookPrice
FROM Books;
```

A. Correct

B. Incorrect

---

# Next Lesson

➡️ 05-MIN-and-MAX-Functions.md

In the next lesson, you'll learn how to find the smallest and largest values using MIN() and MAX() and create trend analysis and business insight reports.
