# Project: Library Reporting System

> Build a collection of business reports using SQL queries to answer real-world questions from a Library Management System database.

---

# Project Overview

In this project, you will act as a Junior Data Analyst for a library.

The library management team needs reports to understand:

* Books
* Members
* Reservations
* Borrowing activity
* Publishers
* Categories

Your task is to write SQL queries that retrieve, filter, sort, and present information from the database.

---

# Learning Outcomes

After completing this project, you will be able to:

* Retrieve data using SELECT
* Filter records using WHERE
* Remove duplicates using DISTINCT
* Sort results using ORDER BY
* Limit records using TOP
* Use aliases for readable reports
* Use IN, BETWEEN, and LIKE operators
* Build business-oriented SQL reports

---

# Database

Use the database created in Module 02.

```text
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

# Project Scenario

The library manager has requested a series of reports.

You must write SQL queries to answer each business question.

---

# Part 1: Basic Reports

## Report 1

Display all books.

Expected Columns:

```text
All Columns
```

---

## Report 2

Display all members.

Expected Columns:

```text
All Columns
```

---

## Report 3

Display all authors.

Expected Columns:

```text
All Columns
```

---

## Report 4

Display only:

```text
BookID
Title
PublicationYear
```

from the Books table.

---

## Report 5

Display only:

```text
MemberID
FirstName
LastName
```

from the Members table.

---

# Part 2: DISTINCT Reports

## Report 6

Show all unique CategoryIDs from the Books table.

---

## Report 7

Show all unique PublisherIDs from the Books table.

---

## Report 8

Show all unique reservation statuses.

Expected Example:

```text
Pending
Approved
Cancelled
```

---

# Part 3: WHERE Clause Reports

## Report 9

Display books published after 2015.

---

## Report 10

Display books published before 2010.

---

## Report 11

Display members with MemberID greater than 5.

---

## Report 12

Display reservations with status:

```text
Approved
```

---

## Report 13

Display books belonging to CategoryID 1.

---

# Part 4: ORDER BY Reports

## Report 14

Display all books sorted by Title.

Ascending order.

---

## Report 15

Display all books sorted by PublicationYear.

Descending order.

---

## Report 16

Display members sorted by LastName.

---

## Report 17

Display publishers sorted by PublisherName.

---

# Part 5: TOP Reports

## Report 18

Display the first 5 books.

---

## Report 19

Display the newest 3 books.

---

## Report 20

Display the first 5 members.

---

## Report 21

Display the top 10 reservations.

---

# Part 6: Alias Reports

## Report 22

Rename:

```text
FirstName → First_Name
LastName → Last_Name
```

---

## Report 23

Rename:

```text
PublicationYear → Published_Year
```

---

## Report 24

Rename:

```text
PublisherName → Publisher
```

---

# Part 7: IN Operator Reports

## Report 25

Display books where CategoryID is:

```text
1
2
3
```

---

## Report 26

Display members where MemberID is:

```text
1
3
5
7
```

---

## Report 27

Display books where PublisherID is:

```text
1
2
```

---

# Part 8: BETWEEN Reports

## Report 28

Display books published between:

```text
2010 and 2020
```

---

## Report 29

Display members with MemberID between:

```text
1 and 10
```

---

## Report 30

Display books with BookID between:

```text
5 and 15
```

---

# Part 9: LIKE Reports

## Report 31

Display members whose first name starts with:

```text
J
```

---

## Report 32

Display books whose title starts with:

```text
L
```

---

## Report 33

Display publishers whose names contain:

```text
Media
```

---

## Report 34

Display authors whose last name ends with:

```text
n
```

---

# Part 10: Business Reports

## Report 35

Display:

```text
Book Title
Publication Year
```

for books published after 2018.

Sort by publication year descending.

---

## Report 36

Display:

```text
Member First Name
Member Last Name
```

for members whose first name starts with:

```text
S
```

---

## Report 37

Display the newest 5 books.

Include:

```text
Title
PublicationYear
```

---

## Report 38

Display books from:

```text
CategoryID 1
```

published after:

```text
2015
```

---

## Report 39

Display all approved reservations.

---

## Report 40

Display all books sorted alphabetically.

---

# Challenge Section

Complete the following advanced reports.

---

## Challenge 1

Find all books published in:

```text
2018
2019
2020
```

using IN.

---

## Challenge 2

Find members whose last names begin with:

```text
W
```

---

## Challenge 3

Display the 5 oldest books.

---

## Challenge 4

Display books published between:

```text
2000 and 2010
```

and sort by year.

---

## Challenge 5

Create a professional report showing:

```text
Book_ID
Book_Title
Published_Year
```

using aliases.

---

# Deliverables

Submit the following file:

```text
LibraryReportingQueries.sql
```

The file should contain:

* All 40 reports
* All challenge queries
* Proper comments
* Consistent formatting

---

# Sample Submission Format

```sql
-- Report 01
SELECT *
FROM Books;

-- Report 02
SELECT *
FROM Members;

-- Report 03
SELECT *
FROM Authors;
```

---

# Evaluation Rubric

| Criteria                 | Points |
| ------------------------ | ------ |
| SELECT Queries           | 15     |
| WHERE Filters            | 20     |
| ORDER BY Usage           | 10     |
| DISTINCT Usage           | 10     |
| TOP Usage                | 10     |
| IN / BETWEEN / LIKE      | 15     |
| Aliases                  | 5      |
| Business Reports         | 10     |
| Formatting & Readability | 5      |

**Total: 100 Points**

---

# Success Criteria

To successfully complete this project, you should demonstrate the ability to:

✅ Retrieve data

✅ Filter records

✅ Sort results

✅ Limit rows

✅ Remove duplicates

✅ Search using patterns

✅ Create readable reports

✅ Answer business questions using SQL

---

# Project Completion

Congratulations!

You have completed the Module 03 project and built a complete reporting solution using SQL query fundamentals.

You are now ready for:

➡️ **Module 04: Aggregate Functions and Grouping**

Where you'll learn:

* COUNT()
* SUM()
* AVG()
* MIN()
* MAX()
* GROUP BY
* HAVING

and begin creating analytical business reports from your data.
