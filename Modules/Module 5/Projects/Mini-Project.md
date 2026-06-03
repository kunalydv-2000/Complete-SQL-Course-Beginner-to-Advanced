# Module 05 Project: Library Analytics and Reporting System

> Build a complete relational reporting system using SQL Joins to generate business reports from a Library Management Database.

---

# Project Overview

In this project, you will use:

* INNER JOIN
* LEFT JOIN
* RIGHT JOIN
* FULL OUTER JOIN
* SELF JOIN
* Multi-Table Joins

to create professional reports that combine information from multiple tables.

The goal is to simulate real-world reporting requirements commonly found in:

* Libraries
* Inventory Systems
* ERP Applications
* CRM Platforms
* Business Intelligence Dashboards

---

# Project Scenario

You have been hired as a Junior Data Analyst for a large library.

The Library Director wants a reporting system that can answer questions such as:

```text
Which books belong to each category?

Which publisher published each book?

Which author wrote each book?

Which members borrowed books?

Which books are currently borrowed?

Which books have never been borrowed?

Which members have active reservations?

Which categories are most popular?
```

Your task is to build SQL reports using JOINs.

---

# Database

Use:

```sql
LibraryManagementSystem
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

# Database Relationship Diagram

```text
Categories
    │
    └── Books
            │
            ├── BorrowRecords
            │
            ├── Reservations
            │
            └── BookAuthors
                    │
                    └── Authors

Publishers
    │
    └── Books

Members
    │
    ├── BorrowRecords
    │
    └── Reservations
```

---

# Project Requirements

Create all reports listed below.

---

# Report 01: Book Catalog Report

Display:

```text
Book ID
Book Title
Category Name
Publisher Name
Publication Year
Book Price
```

Skills:

```text
INNER JOIN
Multiple Tables
```

---

# Report 02: Author Catalog Report

Display:

```text
Book Title
Author Name
```

Skills:

```text
Many-to-Many Relationship
INNER JOIN
```

Tables:

```text
Books
BookAuthors
Authors
```

---

# Report 03: Complete Library Inventory Report

Display:

```text
Book Title
Category Name
Publisher Name
Author Name
Book Price
Publication Year
```

Skills:

```text
Multiple INNER JOINs
```

---

# Report 04: Borrowing Activity Report

Display:

```text
Member Name
Book Title
Borrow Date
Due Date
Return Date
```

Skills:

```text
INNER JOIN
```

Tables:

```text
Members
BorrowRecords
Books
```

---

# Report 05: Reservation Report

Display:

```text
Member Name
Book Title
Reservation Date
Status
```

Skills:

```text
INNER JOIN
```

---

# Report 06: Books Never Borrowed

Display:

```text
Book Title
Category Name
```

Skills:

```text
LEFT JOIN
NULL Filtering
```

Business Value:

Identify books with low usage.

---

# Report 07: Members Without Borrow Records

Display:

```text
Member Name
Email
```

Skills:

```text
LEFT JOIN
```

Business Value:

Identify inactive members.

---

# Report 08: Members Without Reservations

Display:

```text
Member Name
Email
```

Skills:

```text
LEFT JOIN
```

---

# Report 09: Borrowing Summary by Member

Display:

```text
Member Name
Total Borrowed Books
```

Skills:

```text
INNER JOIN
GROUP BY
COUNT()
```

---

# Report 10: Reservation Summary by Member

Display:

```text
Member Name
Total Reservations
```

Skills:

```text
INNER JOIN
GROUP BY
COUNT()
```

---

# Report 11: Most Borrowed Books

Display:

```text
Book Title
Borrow Count
```

Skills:

```text
JOIN
GROUP BY
COUNT()
ORDER BY
```

Sort:

```text
Highest Borrow Count First
```

---

# Report 12: Most Popular Categories

Display:

```text
Category Name
Borrow Count
```

Skills:

```text
Multi-Table JOIN
GROUP BY
```

---

# Report 13: Publisher Performance Report

Display:

```text
Publisher Name
Total Books
Average Book Price
```

Skills:

```text
GROUP BY
COUNT()
AVG()
```

---

# Report 14: Author Productivity Report

Display:

```text
Author Name
Total Books Written
```

Skills:

```text
Many-to-Many Analysis
GROUP BY
```

---

# Report 15: Executive Dashboard

Create a dashboard showing:

```text
Total Books

Total Authors

Total Members

Total Reservations

Total Borrow Records

Oldest Publication Year

Newest Publication Year
```

Skills:

```text
Aggregate Functions
Subqueries
```

---

# Bonus Challenge 01

Create a report showing:

```text
Top 5 Most Borrowed Books
```

Requirements:

```text
ORDER BY
TOP
COUNT()
```

---

# Bonus Challenge 02

Create a report showing:

```text
Top 5 Most Active Members
```

Requirements:

```text
ORDER BY
COUNT()
```

---

# Bonus Challenge 03

Create a report showing:

```text
Categories With No Books
```

Requirements:

```text
LEFT JOIN
NULL Filtering
```

---

# Bonus Challenge 04

Create a report showing:

```text
Publishers Without Books
```

Requirements:

```text
LEFT JOIN
RIGHT JOIN
```

---

# Deliverables

Create:

```text
01-Book-Catalog.sql

02-Author-Catalog.sql

03-Library-Inventory.sql

04-Borrowing-Activity.sql

05-Reservation-Report.sql

06-Books-Never-Borrowed.sql

07-Members-Without-Borrows.sql

08-Members-Without-Reservations.sql

09-Borrowing-Summary.sql

10-Reservation-Summary.sql

11-Most-Borrowed-Books.sql

12-Popular-Categories.sql

13-Publisher-Performance.sql

14-Author-Productivity.sql

15-Executive-Dashboard.sql
```

---

# Evaluation Criteria

| Criteria                 | Weight |
| ------------------------ | ------ |
| Correct JOIN Usage       | 30%    |
| Query Accuracy           | 25%    |
| Formatting & Readability | 15%    |
| Alias Usage              | 10%    |
| Business Logic           | 20%    |

---

# Expected Skills After Completion

By completing this project, you will be able to:

✅ Understand relational database design

✅ Work with Primary Keys and Foreign Keys

✅ Use INNER JOIN confidently

✅ Use LEFT JOIN for missing-data analysis

✅ Build multi-table reports

✅ Analyze many-to-many relationships

✅ Create management dashboards

✅ Build real-world business reporting solutions

---

# Project Outcome

This project serves as a portfolio-quality SQL project demonstrating your ability to work with relational databases and create professional business reports using SQL Joins.
