# Project: Library Analytics Dashboard

> Build analytical SQL reports using aggregate functions and grouping techniques to help library management make data-driven decisions.

---

# Project Overview

In this project, you will act as a Data Analyst for a library.

Management needs summary reports instead of detailed records.

Your task is to use:

* COUNT()
* SUM()
* AVG()
* MIN()
* MAX()
* GROUP BY
* HAVING

to create meaningful business insights.

---

# Learning Outcomes

After completing this project, you will be able to:

* Count records
* Calculate totals
* Calculate averages
* Find highest and lowest values
* Create grouped reports
* Filter grouped data
* Build dashboard-ready SQL queries
* Answer business questions using aggregation

---

# Database

Use:

```sql
USE LibraryManagementSystem;
GO
```

---

# Tables Available

```text
Categories
Publishers
Authors
Books
BookAuthors
Members
BorrowRecords
Reservations
```

---

# Project Scenario

The library management team wants a dashboard that answers key business questions.

You must write SQL queries that generate all requested reports.

---

# Part 1: COUNT Reports

## Report 1

Count total books.

Expected Output:

```text
TotalBooks
```

---

## Report 2

Count total members.

Expected Output:

```text
TotalMembers
```

---

## Report 3

Count total authors.

Expected Output:

```text
TotalAuthors
```

---

## Report 4

Count total reservations.

Expected Output:

```text
TotalReservations
```

---

## Report 5

Count total borrow records.

Expected Output:

```text
TotalBorrows
```

---

# Part 2: MIN and MAX Reports

## Report 6

Find the oldest publication year.

Expected Output:

```text
OldestPublicationYear
```

---

## Report 7

Find the newest publication year.

Expected Output:

```text
NewestPublicationYear
```

---

## Report 8

Find the earliest membership date.

Expected Output:

```text
EarliestMembershipDate
```

---

## Report 9

Find the latest membership date.

Expected Output:

```text
LatestMembershipDate
```

---

# Part 3: GROUP BY Reports

## Report 10

Count books by category.

Expected Output:

```text
CategoryID
TotalBooks
```

---

## Report 11

Count books by publisher.

Expected Output:

```text
PublisherID
TotalBooks
```

---

## Report 12

Count reservations by status.

Expected Output:

```text
Status
TotalReservations
```

---

## Report 13

Count borrow records by member.

Expected Output:

```text
MemberID
TotalBorrows
```

---

## Report 14

Count books by publication year.

Expected Output:

```text
PublicationYear
TotalBooks
```

---

# Part 4: Multiple Aggregate Functions

## Report 15

For each category display:

```text
CategoryID
TotalBooks
OldestBookYear
NewestBookYear
```

---

## Report 16

For each publisher display:

```text
PublisherID
TotalBooks
OldestPublication
NewestPublication
```

---

## Report 17

For each publication year display:

```text
PublicationYear
BooksPublished
```

---

# Part 5: HAVING Reports

## Report 18

Display categories having more than 2 books.

---

## Report 19

Display publishers having more than 2 books.

---

## Report 20

Display publication years containing more than 1 book.

---

## Report 21

Display members having more than 1 borrow record.

---

# Part 6: Business KPI Reports

## Report 22

Show total books in the library.

Alias:

```text
LibraryBookCount
```

---

## Report 23

Show total registered members.

Alias:

```text
RegisteredMembers
```

---

## Report 24

Show newest publication year.

Alias:

```text
LatestBookYear
```

---

## Report 25

Show oldest publication year.

Alias:

```text
OldestBookYear
```

---

# Part 7: Management Dashboard Reports

## Report 26

Display categories ranked by book count.

Requirements:

```text
CategoryID
TotalBooks
Highest First
```

---

## Report 27

Display publishers ranked by total books.

Requirements:

```text
PublisherID
TotalBooks
Highest First
```

---

## Report 28

Display reservation statuses ranked by count.

Requirements:

```text
Status
TotalReservations
Highest First
```

---

## Report 29

Display top 5 members with the most borrow records.

Requirements:

```text
MemberID
TotalBorrows
```

---

## Report 30

Display publication years ranked by books published.

Requirements:

```text
PublicationYear
TotalBooks
```

---

# Challenge Reports

## Challenge 1

Find the category with the most books.

Requirements:

```text
CategoryID
TotalBooks
```

Return only the top category.

---

## Challenge 2

Find the publisher with the most books.

Requirements:

```text
PublisherID
TotalBooks
```

Return only the top publisher.

---

## Challenge 3

Find the publication year with the highest number of books.

Requirements:

```text
PublicationYear
TotalBooks
```

---

## Challenge 4

Find members who borrowed more than 2 books.

Requirements:

```text
MemberID
BorrowCount
```

---

## Challenge 5

Create an executive summary report showing:

```text
Total Books
Total Members
Total Reservations
Oldest Publication Year
Newest Publication Year
```

in a single query.

---

# Deliverables

Submit:

```text
LibraryAnalyticsDashboard.sql
```

The script must include:

* All 30 reports
* All challenge reports
* Proper comments
* Consistent formatting
* Meaningful aliases

---

# Sample Submission Format

```sql
-- Report 01
SELECT
    COUNT(*) AS TotalBooks
FROM Books;

-- Report 02
SELECT
    COUNT(*) AS TotalMembers
FROM Members;
```

---

# Evaluation Rubric

| Criteria                 | Points |
| ------------------------ | ------ |
| COUNT() Usage            | 15     |
| MIN/MAX Usage            | 10     |
| GROUP BY Reports         | 20     |
| HAVING Reports           | 15     |
| KPI Reports              | 10     |
| Dashboard Reports        | 15     |
| Challenge Reports        | 10     |
| Formatting & Readability | 5      |

**Total: 100 Points**

---

# Success Criteria

To successfully complete this project, you should demonstrate the ability to:

✅ Count records

✅ Summarize data

✅ Group records

✅ Filter grouped results

✅ Build KPI reports

✅ Create dashboard metrics

✅ Answer business questions

✅ Use aggregate functions professionally

---

# Project Completion

Congratulations!

You have completed the Module 04 project and built a complete Library Analytics Dashboard using aggregate functions and grouping.

You are now ready for:

➡️ **Module 05: SQL Joins and Relationships**

Where you'll learn:

* INNER JOIN
* LEFT JOIN
* RIGHT JOIN
* FULL JOIN
* Self Joins
* Multi-Table Reporting
* Relational Data Analysis
