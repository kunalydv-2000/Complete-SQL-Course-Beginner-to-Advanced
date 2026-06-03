# Exercise-05-Business-Queries.md

# Exercise 05: Business Queries

> Combine all concepts learned in Module 03 to answer real-world business questions.

---

# Objectives

By completing this exercise, you will:

* Combine multiple SQL clauses
* Build business reports
* Create professional query outputs
* Answer business questions

---

# Scenario

You are a Junior Data Analyst working for the library.

Management requires several reports.

Write SQL queries to answer each request.

---

# Task 1: Newest Books Report

Display:

```text
Title
PublicationYear
```

Requirements:

```text
Newest books first
Top 5 rows only
```

---

# Task 2: Technology Books Report

Display:

```text
BookID
Title
PublicationYear
```

Requirements:

```text
CategoryID = 1
PublicationYear > 2015
```

---

# Task 3: Member Search Report

Display:

```text
FirstName
LastName
```

Requirements:

```text
FirstName starts with S
```

---

# Task 4: Publisher Directory

Display:

```text
PublisherName
Country
```

Requirements:

```text
Sorted by PublisherName
```

---

# Task 5: Books Published During the Last Decade

Display:

```text
Title
PublicationYear
```

Requirements:

```text
PublicationYear BETWEEN 2010 AND 2020
```

---

# Task 6: Approved Reservations

Display all reservations where:

```text
Status = Approved
```

---

# Task 7: Professional Book Report

Display:

```text
Book_ID
Book_Title
Published_Year
```

Use aliases.

---

# Task 8: Category Report

Display all unique:

```text
CategoryID
```

values.

---

# Challenge 1

Display:

```text
Top 3 Technology Books
```

Requirements:

```text
CategoryID = 1
Newest first
```

---

# Challenge 2

Create a report showing:

```text
Member_ID
First_Name
Last_Name
```

for members with:

```text
MemberID BETWEEN 1 AND 10
```

---

# Submission

Save your solutions in:

```text
Exercise-05-Solution.sql
```
