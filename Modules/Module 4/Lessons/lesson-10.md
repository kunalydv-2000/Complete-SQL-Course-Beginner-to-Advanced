# Lesson 10: Aggregation Best Practices

> Learn professional techniques, optimization strategies, and reporting standards for writing efficient, readable, and maintainable SQL aggregation queries.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Write professional aggregation queries
* Improve query readability
* Use meaningful aliases
* Optimize aggregate reports
* Follow reporting standards
* Avoid common aggregation mistakes
* Build maintainable analytical SQL solutions

---

# Introduction

Aggregate functions are powerful tools for data analysis.

However, professional SQL developers focus on more than just getting correct results.

Good SQL should be:

```text id="abp001"
Correct
Readable
Maintainable
Efficient
Scalable
```

This lesson covers best practices used by data analysts, BI developers, and database professionals.

---

# Why Best Practices Matter

Two queries can produce the same result.

Example:

Poor Query:

```sql id="abp002"
SELECT COUNT(*)
FROM Books;
```

---

Professional Query:

```sql id="abp003"
SELECT
    COUNT(*) AS TotalBooks
FROM Books;
```

---

Both return the same answer.

The second query is easier to understand.

---

# Best Practice 1: Always Use Meaningful Aliases

Bad:

```sql id="abp004"
SELECT
    COUNT(*)
FROM Books;
```

---

Result:

```text id="abp005"
(No Column Name)
```

---

Better:

```sql id="abp006"
SELECT
    COUNT(*) AS TotalBooks
FROM Books;
```

---

Result:

| TotalBooks |
| ---------- |
| 250        |

---

# Best Practice 2: Format Queries Consistently

Poor Formatting:

```sql id="abp007"
SELECT CategoryID,COUNT(*) FROM Books GROUP BY CategoryID;
```

---

Professional Formatting:

```sql id="abp008"
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID;
```

---

Benefits:

```text id="abp009"
Easier to read
Easier to maintain
Easier to debug
```

---

# Best Practice 3: Use Descriptive KPI Names

Bad:

```sql id="abp010"
SELECT
    AVG(BookPrice) AS Avg
FROM Books;
```

---

Better:

```sql id="abp011"
SELECT
    AVG(BookPrice) AS AverageBookPrice
FROM Books;
```

---

# Best Practice 4: Always Ask the Business Question

Before writing SQL:

```text id="abp012"
What problem am I solving?
```

Example:

Business Question:

```text id="abp013"
Which category has the most books?
```

Query:

```sql id="abp014"
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID
ORDER BY TotalBooks DESC;
```

---

# Best Practice 5: Use ORDER BY in Reports

Bad:

```sql id="abp015"
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID;
```

---

Result order may be unpredictable.

---

Better:

```sql id="abp016"
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID
ORDER BY TotalBooks DESC;
```

---

This highlights the most important results first.

---

# Best Practice 6: Use Multiple Aggregates Together

Instead of:

```sql id="abp017"
SELECT COUNT(*) FROM Books;

SELECT AVG(BookPrice) FROM Books;

SELECT MAX(PublicationYear) FROM Books;
```

---

Combine them:

```sql id="abp018"
SELECT
    COUNT(*) AS TotalBooks,
    AVG(BookPrice) AS AverageBookPrice,
    MIN(PublicationYear) AS OldestBook,
    MAX(PublicationYear) AS NewestBook
FROM Books;
```

---

Benefits:

```text id="abp019"
Fewer queries
Faster reporting
Cleaner dashboards
```

---

# Best Practice 7: Filter Early with WHERE

Bad:

```sql id="abp020"
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID;
```

when only recent books matter.

---

Better:

```sql id="abp021"
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
WHERE PublicationYear >= 2020
GROUP BY CategoryID;
```

---

Benefits:

```text id="abp022"
Less data processed
Better performance
```

---

# Best Practice 8: Use HAVING Only for Group Filters

Bad:

```sql id="abp023"
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID
HAVING PublicationYear > 2020;
```

---

Correct:

```sql id="abp024"
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
WHERE PublicationYear > 2020
GROUP BY CategoryID;
```

---

Remember:

```text id="abp025"
WHERE → Rows

HAVING → Groups
```

---

# Best Practice 9: Avoid Unnecessary GROUP BY Columns

Bad:

```sql id="abp026"
SELECT
    CategoryID,
    PublisherID,
    Title,
    COUNT(*)
FROM Books
GROUP BY
    CategoryID,
    PublisherID,
    Title;
```

---

Problem:

```text id="abp027"
Too many groups created
```

---

Better:

```sql id="abp028"
SELECT
    CategoryID,
    PublisherID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY
    CategoryID,
    PublisherID;
```

---

# Best Practice 10: Use Comments in Reports

Example:

```sql id="abp029"
-- Books by Category
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID;
```

---

Benefits:

```text id="abp030"
Better documentation
Easier maintenance
Team collaboration
```

---

# Professional KPI Dashboard Example

```sql id="abp031"
-- Library Dashboard

SELECT
    COUNT(*) AS TotalBooks,
    AVG(BookPrice) AS AverageBookPrice,
    MIN(PublicationYear) AS OldestBook,
    MAX(PublicationYear) AS NewestBook
FROM Books;
```

---

# Professional Category Report

```sql id="abp032"
SELECT
    CategoryID,
    COUNT(*) AS TotalBooks,
    AVG(BookPrice) AS AveragePrice,
    SUM(BookPrice) AS TotalValue
FROM Books
GROUP BY CategoryID
ORDER BY TotalBooks DESC;
```

---

# Professional Publisher Report

```sql id="abp033"
SELECT
    PublisherID,
    COUNT(*) AS TotalBooks,
    MIN(PublicationYear) AS FirstPublication,
    MAX(PublicationYear) AS LatestPublication
FROM Books
GROUP BY PublisherID
ORDER BY TotalBooks DESC;
```

---

# Query Optimization Tips

## Tip 1

Filter early.

```sql id="abp034"
WHERE PublicationYear > 2020
```

before GROUP BY.

---

## Tip 2

Group only required columns.

---

## Tip 3

Avoid duplicate calculations.

Bad:

```sql id="abp035"
COUNT(*)
COUNT(*)
COUNT(*)
```

---

Calculate once and reuse.

---

## Tip 4

Use indexes on frequently grouped columns.

Examples:

```text id="abp036"
CategoryID
PublisherID
MemberID
Status
```

---

# Common Beginner Mistakes

---

## Missing Alias

Bad:

```sql id="abp037"
SELECT COUNT(*)
FROM Books;
```

---

## Overusing HAVING

Bad:

```sql id="abp038"
HAVING PublicationYear > 2020
```

Use WHERE instead.

---

## Forgetting ORDER BY

Reports become difficult to analyze.

---

## Selecting Unnecessary Columns

Adds complexity and reduces readability.

---

## Poor Formatting

Hard to maintain and debug.

---

# Reporting Standards

Professional reports should include:

✅ Meaningful aliases

✅ Consistent formatting

✅ Business-friendly names

✅ Appropriate sorting

✅ Comments where necessary

---

# Real-World Example

Executive Dashboard

```sql id="abp039"
SELECT
    COUNT(*) AS TotalBooks,
    COUNT(DISTINCT CategoryID) AS TotalCategories,
    AVG(BookPrice) AS AverageBookPrice,
    MIN(PublicationYear) AS OldestBook,
    MAX(PublicationYear) AS NewestBook
FROM Books;
```

---

Result:

| Metric        | Value |
| ------------- | ----- |
| Total Books   | 250   |
| Categories    | 12    |
| Average Price | 42.75 |
| Oldest Book   | 1998  |
| Newest Book   | 2025  |

---

# Hands-On Practice

Improve the following query:

```sql id="abp040"
SELECT COUNT(*)
FROM Books;
```

---

Improve:

```sql id="abp041"
SELECT CategoryID,COUNT(*)
FROM Books
GROUP BY CategoryID;
```

---

Add:

```text id="abp042"
Aliases
Formatting
ORDER BY
Comments
```

---

# Mini Exercise

Rewrite the following professionally:

### Task 1

```sql id="abp043"
SELECT AVG(BookPrice)
FROM Books;
```

---

### Task 2

```sql id="abp044"
SELECT COUNT(*)
FROM Members;
```

---

### Task 3

```sql id="abp045"
SELECT PublisherID,COUNT(*)
FROM Books
GROUP BY PublisherID;
```

---

### Task 4

Create a KPI dashboard showing:

```text id="abp046"
Total Books
Average Price
Oldest Book
Newest Book
```

---

# Best Practices Checklist

Before publishing a report, verify:

| Check                       | Status |
| --------------------------- | ------ |
| Aliases Added               | □      |
| Formatting Applied          | □      |
| ORDER BY Included           | □      |
| Comments Added              | □      |
| Business Question Answered  | □      |
| Unnecessary Columns Removed | □      |
| Query Readable              | □      |

---

# Summary

In this lesson, you learned:

* Professional aggregation standards
* Query formatting
* Meaningful aliases
* Dashboard design principles
* Performance optimization
* Reporting best practices
* Common mistakes to avoid

These practices separate beginner SQL users from professional analysts and database developers.

---

# Knowledge Check

### Question 1

Why should aliases be used?

A. To make reports readable

B. To delete rows

C. To improve storage

D. To create tables

---

### Question 2

Which clause should be used to filter rows before grouping?

A. HAVING

B. WHERE

C. ORDER BY

D. DISTINCT

---

### Question 3

Which query is more professional?

A.

```sql id="q1"
SELECT COUNT(*)
FROM Books;
```

B.

```sql id="q2"
SELECT
    COUNT(*) AS TotalBooks
FROM Books;
```

---

### Question 4

Should reports usually include ORDER BY?

A. Yes

B. No

---

### Question 5

What is the primary goal of aggregation reports?

A. Insert data

B. Delete data

C. Summarize data for decision-making

D. Update tables

---

# Module 04 Completion

Congratulations!

You have completed **Module 04: Aggregate Functions and Grouping**.

You can now:

✅ Count records

✅ Calculate totals

✅ Calculate averages

✅ Find minimum and maximum values

✅ Create grouped reports

✅ Filter groups with HAVING

✅ Build KPI dashboards

✅ Create business intelligence reports

---

# Next Module

➡️ **Module 05: SQL Joins and Relationships**

You will learn:

* INNER JOIN
* LEFT JOIN
* RIGHT JOIN
* FULL OUTER JOIN
* SELF JOIN
* Multi-table reporting
* Relational data analysis

These skills will allow you to combine data from multiple tables and build real-world business reports.
