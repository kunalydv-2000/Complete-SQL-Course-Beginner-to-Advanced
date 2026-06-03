# Lesson 03: Using DISTINCT

> Learn how to remove duplicate values from query results using the DISTINCT keyword and create cleaner, more meaningful reports.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand duplicate data in query results
* Use the DISTINCT keyword
* Retrieve unique values
* Apply DISTINCT to one or more columns
* Improve report quality
* Understand common DISTINCT use cases
* Avoid common mistakes

---

# Introduction

When querying data, you may encounter duplicate values.

Consider a Books table:

| BookID | Title         | CategoryID |
| ------ | ------------- | ---------- |
| 1      | Learning SQL  | 1          |
| 2      | Clean Code    | 1          |
| 3      | Sapiens       | 4          |
| 4      | Atomic Habits | 3          |

If you retrieve CategoryID values, duplicates may appear.

Example:

```sql id="dist001"
SELECT
    CategoryID
FROM Books;
```

Result:

| CategoryID |
| ---------- |
| 1          |
| 1          |
| 4          |
| 3          |

Sometimes we only want unique values.

This is where DISTINCT becomes useful.

---

# What is DISTINCT?

DISTINCT removes duplicate values from query results.

Basic idea:

```text id="dist002"
Duplicate Values
        ↓
    DISTINCT
        ↓
 Unique Values
```

---

# Basic Syntax

```sql id="dist003"
SELECT DISTINCT
    ColumnName
FROM TableName;
```

---

# Example

Without DISTINCT:

```sql id="dist004"
SELECT
    CategoryID
FROM Books;
```

Result:

| CategoryID |
| ---------- |
| 1          |
| 1          |
| 4          |
| 3          |

---

With DISTINCT:

```sql id="dist005"
SELECT DISTINCT
    CategoryID
FROM Books;
```

Result:

| CategoryID |
| ---------- |
| 1          |
| 3          |
| 4          |

Duplicates are removed.

---

# Why Use DISTINCT?

DISTINCT helps:

✅ Remove duplicate values

✅ Create cleaner reports

✅ Identify unique categories

✅ Analyze business data

✅ Improve readability

---

# Real-World Example

Suppose management asks:

```text id="dist006"
What categories exist in our library?
```

Instead of:

```sql id="dist007"
SELECT
    CategoryID
FROM Books;
```

Use:

```sql id="dist008"
SELECT DISTINCT
    CategoryID
FROM Books;
```

---

# DISTINCT with Names

Example:

Members table:

| MemberID | City   |
| -------- | ------ |
| 1        | Delhi  |
| 2        | Mumbai |
| 3        | Delhi  |
| 4        | Pune   |

---

Query:

```sql id="dist009"
SELECT DISTINCT
    City
FROM Members;
```

Result:

| City   |
| ------ |
| Delhi  |
| Mumbai |
| Pune   |

---

# DISTINCT on Multiple Columns

DISTINCT can be applied to multiple columns.

---

# Example

```sql id="dist010"
SELECT DISTINCT
    FirstName,
    LastName
FROM Authors;
```

---

Result:

| FirstName | LastName |
| --------- | -------- |
| Alan      | Beaulieu |
| Robert    | Martin   |
| Andrew    | Ng       |

Only unique combinations are returned.

---

# Understanding Multiple Columns

Consider:

| FirstName | LastName |
| --------- | -------- |
| John      | Smith    |
| John      | Smith    |
| John      | Brown    |

---

Query:

```sql id="dist011"
SELECT DISTINCT
    FirstName,
    LastName
FROM Members;
```

Result:

| FirstName | LastName |
| --------- | -------- |
| John      | Smith    |
| John      | Brown    |

DISTINCT evaluates the entire row combination.

---

# DISTINCT vs SELECT

Normal query:

```sql id="dist012"
SELECT
    PublisherID
FROM Books;
```

May return:

```text id="dist013"
1
1
1
2
2
3
```

---

DISTINCT query:

```sql id="dist014"
SELECT DISTINCT
    PublisherID
FROM Books;
```

Returns:

```text id="dist015"
1
2
3
```

---

# Business Reporting Examples

---

## Unique Categories

```sql id="dist016"
SELECT DISTINCT
    CategoryID
FROM Books;
```

---

## Unique Publishers

```sql id="dist017"
SELECT DISTINCT
    PublisherID
FROM Books;
```

---

## Unique Reservation Statuses

```sql id="dist018"
SELECT DISTINCT
    Status
FROM Reservations;
```

Possible result:

| Status    |
| --------- |
| Pending   |
| Approved  |
| Cancelled |

---

# DISTINCT with ORDER BY

DISTINCT can be combined with ORDER BY.

---

Example:

```sql id="dist019"
SELECT DISTINCT
    CategoryID
FROM Books
ORDER BY CategoryID;
```

---

Result:

```text id="dist020"
1
2
3
4
5
```

Sorted and unique.

---

# Query Execution Flow

```text id="dist021"
Table
   ↓
SELECT
   ↓
DISTINCT
   ↓
Result Set
```

---

# Common Use Cases

### Reporting

```sql id="dist022"
SELECT DISTINCT
    Country
FROM Publishers;
```

---

### Analysis

```sql id="dist023"
SELECT DISTINCT
    PublicationYear
FROM Books;
```

---

### Validation

```sql id="dist024"
SELECT DISTINCT
    Status
FROM Reservations;
```

---

# Common Beginner Mistakes

---

## Forgetting DISTINCT

Bad:

```sql id="dist025"
SELECT
    CategoryID
FROM Books;
```

Duplicates remain.

---

Correct:

```sql id="dist026"
SELECT DISTINCT
    CategoryID
FROM Books;
```

---

## Using DISTINCT Unnecessarily

Bad:

```sql id="dist027"
SELECT DISTINCT
    BookID
FROM Books;
```

BookID is already unique.

DISTINCT adds no value.

---

## Assuming DISTINCT Sorts Data

Bad assumption:

```sql id="dist028"
SELECT DISTINCT
    CategoryID
FROM Books;
```

DISTINCT removes duplicates but does not guarantee sorting.

Use:

```sql id="dist029"
SELECT DISTINCT
    CategoryID
FROM Books
ORDER BY CategoryID;
```

---

# Performance Considerations

DISTINCT requires SQL Server to compare values.

For small tables:

```text id="dist030"
No noticeable impact
```

For large tables:

```text id="dist031"
Additional processing required
```

Use DISTINCT only when needed.

---

# Hands-On Practice

Run:

```sql id="dist032"
SELECT DISTINCT
    CategoryID
FROM Books;
```

---

Run:

```sql id="dist033"
SELECT DISTINCT
    PublisherID
FROM Books;
```

---

Run:

```sql id="dist034"
SELECT DISTINCT
    Status
FROM Reservations;
```

---

Run:

```sql id="dist035"
SELECT DISTINCT
    Country
FROM Publishers;
```

---

# Mini Exercise

Write queries to display:

### Task 1

Unique publication years.

---

### Task 2

Unique member cities.

---

### Task 3

Unique reservation statuses.

---

### Task 4

Unique publisher countries.

---

# Best Practices

✅ Use DISTINCT only when necessary

✅ Combine with ORDER BY for cleaner reports

✅ Use for reporting and analysis

✅ Avoid using on already unique columns

✅ Verify results after execution

---

# Summary

In this lesson, you learned:

* What DISTINCT does
* How to remove duplicate values
* DISTINCT syntax
* Using DISTINCT with multiple columns
* Combining DISTINCT and ORDER BY
* Real-world reporting examples
* Common mistakes to avoid

DISTINCT is an essential SQL tool for producing cleaner, more meaningful reports and analyses.

---

# Knowledge Check

### Question 1

What is the purpose of DISTINCT?

A. Sort data

B. Delete rows

C. Remove duplicate values

D. Create tables

---

### Question 2

Which query returns unique CategoryIDs?

A.

```sql id="q1"
SELECT CategoryID
FROM Books;
```

B.

```sql id="q2"
SELECT DISTINCT CategoryID
FROM Books;
```

C.

```sql id="q3"
DELETE CategoryID
FROM Books;
```

D.

```sql id="q4"
SHOW CategoryID
FROM Books;
```

---

### Question 3

Can DISTINCT be used with multiple columns?

A. No

B. Yes

---

### Question 4

Which clause should be used to sort DISTINCT results?

A. GROUP BY

B. HAVING

C. ORDER BY

D. WHERE

---

# Next Lesson

➡️ 04-Filtering-with-WHERE.md

In the next lesson, you'll learn how to filter records using the WHERE clause and retrieve only the data that meets specific conditions.
