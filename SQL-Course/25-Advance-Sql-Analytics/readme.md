# Module 25: Advanced SQL Analytics

> Advanced SQL Analytics combines SQL techniques such as JOINS, CTEs, Window Functions, CASE Statements, and Aggregations to solve real-world business problems. This module focuses on analytics scenarios commonly used by Data Analysts, Business Analysts, Product Analysts, and Analytics Engineers.

---

# 📖 Introduction

In previous modules, you learned:

```text
SELECT
WHERE
GROUP BY
HAVING
JOINS
Subqueries
CTEs
Window Functions
```

Now it's time to combine them to answer business questions such as:

- How many customers return every month?
- Which products generate the most revenue?
- What is customer retention?
- Where are users dropping from the sales funnel?
- What are the monthly growth trends?

These are Advanced SQL Analytics problems.

---

# 🎯 Learning Objectives

After completing this module, you will be able to:

✅ Perform Cohort Analysis

✅ Perform Retention Analysis

✅ Build Funnel Analysis

✅ Create Pivot Reports

✅ Calculate Business KPIs

✅ Solve Real Analytics Case Studies

✅ Write Production-Level SQL Queries

---

# 📚 Table of Contents

1. Advanced Analytics Overview
2. Business KPIs
3. Cohort Analysis
4. Retention Analysis
5. Funnel Analysis
6. Pivoting Data
7. Customer Segmentation
8. RFM Analysis
9. Growth Analysis
10. Revenue Analytics
11. Top-N Analysis
12. Advanced Dashboard Queries
13. Real Interview Case Studies
14. Best Practices
15. Summary
16. Practice Questions

---

# 1️⃣ Advanced Analytics Overview

Most analytics projects involve:

```text
Raw Data
     ↓
Cleaning
     ↓
Transformation
     ↓
Aggregation
     ↓
Insights
```

---

# Common SQL Analytics Workflow

```sql
SELECT
JOIN
CASE
GROUP BY
WINDOW FUNCTIONS
```

---

# Example Business Question

```text
Top 10 customers by revenue
```

Solution:

```sql
JOIN
GROUP BY
SUM()
RANK()
```

---

# 2️⃣ Business KPIs

KPI = Key Performance Indicator

---

# Common KPIs

| KPI | Formula |
|-------|---------|
| Revenue | SUM(SalesAmount) |
| Customers | COUNT(DISTINCT CustomerID) |
| Orders | COUNT(OrderID) |
| Average Order Value | Revenue / Orders |
| Retention Rate | Returning Users / Total Users |
| Conversion Rate | Purchases / Visitors |

---

# Revenue KPI

```sql
SELECT
SUM(SalesAmount) AS Revenue
FROM Sales;
```

---

# Average Order Value

```sql
SELECT
SUM(SalesAmount) /
COUNT(OrderID) AS AvgOrderValue
FROM Orders;
```

---

# 3️⃣ Cohort Analysis

One of the most common analytics techniques.

---

# Purpose

Track users based on when they first joined.

---

Example

| Customer | Join Month |
|-----------|-----------|
| C1 | Jan |
| C2 | Jan |
| C3 | Feb |

---

Question

```text
How many January users returned in February?
```

---

# Cohort Query

```sql
WITH CustomerCohort AS
(
    SELECT CustomerID,
           MIN(OrderDate) AS FirstOrderDate

    FROM Orders

    GROUP BY CustomerID
)

SELECT *
FROM CustomerCohort;
```

---

# Business Uses

- Customer Retention
- Product Adoption
- Subscription Analysis

---

# 4️⃣ Retention Analysis

Measures customer return behavior.

---

# Formula

```text
Returning Customers
--------------------
Total Customers
```

---

Example

```sql
WITH MonthlyCustomers AS
(
    SELECT
        CustomerID,
        MONTH(OrderDate) AS OrderMonth

    FROM Orders
)

SELECT *
FROM MonthlyCustomers;
```

---

# Uses

- SaaS Products
- E-commerce
- Mobile Apps

---

# Important KPI

```text
Retention Rate
```

---

# 5️⃣ Funnel Analysis

Tracks user journey.

---

Example Funnel

```text
Visit Website
      ↓
Sign Up
      ↓
Add Product
      ↓
Purchase
```

---

# Example Data

| CustomerID | Stage |
|------------|--------|
| 1 | Visit |
| 1 | Signup |
| 1 | Purchase |

---

# Query

```sql
SELECT Stage,
       COUNT(DISTINCT CustomerID)
FROM FunnelData
GROUP BY Stage;
```

---

# Output

| Stage | Users |
|--------|--------|
| Visit | 1000 |
| Signup | 500 |
| Purchase | 200 |

---

# Conversion Rate

```sql
Purchase Users
--------------
Visit Users
```

---

# Business Uses

- Product Analytics
- Marketing Analytics
- Sales Optimization

---

# 6️⃣ Pivoting Data

Converts rows into columns.

---

Example

| Month | Revenue |
|---------|---------|
| Jan | 1000 |
| Feb | 1500 |

---

# SQL Server PIVOT

```sql
SELECT *
FROM Sales
PIVOT
(
    SUM(Revenue)
    FOR Month IN
    (
        [Jan],
        [Feb],
        [Mar]
    )
) P;
```

---

# Alternative Using CASE

```sql
SELECT

SUM(
CASE
WHEN Month='Jan'
THEN Revenue
ELSE 0
END
) AS JanuaryRevenue,

SUM(
CASE
WHEN Month='Feb'
THEN Revenue
ELSE 0
END
) AS FebruaryRevenue

FROM Sales;
```

---

# Used In

- Dashboards
- Reports
- Excel-style Tables

---

# 7️⃣ Customer Segmentation

Divide customers into groups.

---

Example

| Purchase Amount | Segment |
|-----------------|---------|
| >100000 | Premium |
| >50000 | Gold |
| Otherwise | Regular |

---

Query

```sql
SELECT CustomerID,

CASE

WHEN TotalPurchase > 100000
THEN 'Premium'

WHEN TotalPurchase > 50000
THEN 'Gold'

ELSE 'Regular'

END AS Segment

FROM Customers;
```

---

# Business Uses

- Marketing Campaigns
- Customer Targeting
- Loyalty Programs

---

# 8️⃣ RFM Analysis

Very common interview topic.

---

# RFM

```text
Recency
Frequency
Monetary
```

---

# Recency

How recently customer purchased.

---

# Frequency

How often customer purchases.

---

# Monetary

How much customer spends.

---

Query

```sql
SELECT

CustomerID,

DATEDIFF
(
DAY,
MAX(OrderDate),
GETDATE()
) AS Recency,

COUNT(*) AS Frequency,

SUM(SalesAmount) AS Monetary

FROM Orders

GROUP BY CustomerID;
```

---

# Uses

- Customer Scoring
- Marketing Segmentation

---

# 9️⃣ Growth Analysis

Measures business growth.

---

Example

Monthly Revenue

| Month | Revenue |
|---------|---------|
| Jan | 1000 |
| Feb | 1500 |

---

Growth

```text
1500 - 1000 = 500
```

---

# SQL Query

```sql
SELECT

Month,
Revenue,

Revenue -

LAG(Revenue)
OVER
(
    ORDER BY Month
)

AS Growth

FROM Sales;
```

---

# Percentage Growth

```sql
SELECT

Month,

(
Revenue -
LAG(Revenue)
OVER
(
ORDER BY Month
)
)

* 100.0

/

LAG(Revenue)
OVER
(
ORDER BY Month
)

AS GrowthPercent

FROM Sales;
```

---

# 1️⃣0️⃣ Revenue Analytics

Most common business metric.

---

# Revenue by Product

```sql
SELECT ProductID,
       SUM(SalesAmount)

FROM Sales

GROUP BY ProductID;
```

---

# Revenue Ranking

```sql
SELECT ProductID,

SUM(SalesAmount) AS Revenue,

RANK()
OVER
(
ORDER BY SUM(SalesAmount) DESC
)

AS RevenueRank

FROM Sales

GROUP BY ProductID;
```

---

# Revenue Contribution %

```sql
SELECT ProductID,

SUM(SalesAmount) * 100.0

/

SUM(SUM(SalesAmount))
OVER()

AS ContributionPercent

FROM Sales

GROUP BY ProductID;
```

---

# 1️⃣1️⃣ Top-N Analysis

Frequently asked in interviews.

---

# Top 5 Customers

```sql
WITH CustomerRevenue AS
(
    SELECT CustomerID,

           SUM(SalesAmount) AS Revenue

    FROM Sales

    GROUP BY CustomerID
)

SELECT *

FROM
(
    SELECT *,

           ROW_NUMBER()
           OVER
           (
               ORDER BY Revenue DESC
           ) AS RN

    FROM CustomerRevenue
) A

WHERE RN <= 5;
```

---

# Bottom 5 Products

Same logic using ascending order.

---

# 1️⃣2️⃣ Advanced Dashboard Queries

Real dashboard metrics often combine:

```text
CTEs
Window Functions
CASE
GROUP BY
```

---

Example

```sql
WITH MonthlyRevenue AS
(
    SELECT
        MONTH(OrderDate) AS SalesMonth,

        SUM(SalesAmount) AS Revenue

    FROM Sales

    GROUP BY MONTH(OrderDate)
)

SELECT

SalesMonth,
Revenue,

Revenue -

LAG(Revenue)
OVER
(
ORDER BY SalesMonth
)

AS MonthlyGrowth

FROM MonthlyRevenue;
```

---

# Dashboard Output

| Month | Revenue | Growth |
|---------|---------|---------|
| Jan | 1000 | NULL |
| Feb | 1500 | 500 |

---

# 1️⃣3️⃣ Real Interview Case Studies

---

# Case Study 1

Find Top 3 Highest-Paying Departments.

Skills:

```text
GROUP BY
SUM
RANK
```

---

# Case Study 2

Find Customers Who Never Ordered.

Skills:

```text
LEFT JOIN
IS NULL
```

---

# Case Study 3

Calculate Running Revenue.

Skills:

```text
SUM OVER
```

---

# Case Study 4

Find Second Highest Salary.

Skills:

```text
DENSE_RANK
```

---

# Case Study 5

Month-over-Month Growth.

Skills:

```text
LAG
```

---

# 1️⃣4️⃣ Best Practices

---

## Use CTEs for Readability

---

## Use Window Functions for Analytics

---

## Avoid Deep Nested Queries

---

## Use Meaningful Aliases

---

## Verify KPI Logic

Business definitions matter.

---

## Test Edge Cases

NULL values.

Missing months.

Duplicate rows.

---

# SQL Analytics Toolkit

A strong analyst should master:

```text
JOINS
GROUP BY
HAVING
CASE
CTEs
Window Functions
Subqueries
```

---

# 📝 Summary

In this module, you learned:

✅ Cohort Analysis

✅ Retention Analysis

✅ Funnel Analysis

✅ Pivot Reports

✅ Customer Segmentation

✅ RFM Analysis

✅ Growth Analysis

✅ Revenue Analytics

✅ Top-N Analysis

✅ Dashboard Queries

✅ Interview Case Studies

---

# 🎯 Complete SQL Roadmap Summary

You have now completed:

### SQL Fundamentals

```text
SELECT
WHERE
ORDER BY
INSERT
UPDATE
DELETE
```

---

### Database Design

```text
Tables
Constraints
Keys
ALTER TABLE
```

---

### Data Retrieval

```text
JOINS
Subqueries
Views
```

---

### Programming

```text
Stored Procedures
Functions
```

---

### Performance

```text
Indexes
```

---

### Analytics

```text
GROUP BY
HAVING
CASE
CTEs
Window Functions
Advanced Analytics
```

---

# 🧠 Final Practice Projects

## Project 1

HR Analytics Dashboard

Features:

- Employee KPIs
- Department Rankings
- Salary Analysis
- Attrition Metrics

---

## Project 2

E-Commerce Analytics

Features:

- Revenue Analysis
- Customer Segmentation
- Product Rankings
- Retention Analysis

---

## Project 3

Sales Analytics Dashboard

Features:

- Running Revenue
- Growth Analysis
- Top Products
- Regional Performance

---

## Project 4

Customer Analytics

Features:

- RFM Analysis
- Cohort Analysis
- Funnel Analysis
- Customer Lifetime Value

---

# 📂 Final Repository Structure

```text
SQL-Zero-to-Hero/
│
├── Module_01_SQL_Fundamentals/
├── Module_02_Database_Objects/
├── Module_03_SQL_Data_Types/
├── Module_04_Create_Table/
├── Module_05_Constraints/
├── Module_06_Insert/
├── Module_07_Select/
├── Module_08_Where/
├── Module_09_Order_By/
├── Module_10_Aggregates/
├── Module_11_Group_By/
├── Module_12_Having/
├── Module_13_Update/
├── Module_14_Delete/
├── Module_15_Alter_Table/
├── Module_16_Joins/
├── Module_17_Subqueries/
├── Module_18_Case_Statement/
├── Module_19_Views/
├── Module_20_Indexes/
├── Module_21_Stored_Procedures/
├── Module_22_Functions/
├── Module_23_CTEs/
├── Module_24_Window_Functions/
├── Module_25_Advanced_SQL_Analytics/
│
├── Projects/
│   ├── HR_Analytics/
│   ├── Sales_Analytics/
│   ├── Customer_Analytics/
│   └── Ecommerce_Analytics/
│
├── Datasets/
├── Interview_Questions/
├── CheatSheets/
└── README.md
```
