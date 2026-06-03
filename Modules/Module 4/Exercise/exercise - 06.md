# Exercise 06: Business Reports

## Objective

Build business intelligence reports using aggregate functions, GROUP BY, HAVING, and ORDER BY.

---

# Database

```sql
USE LibraryManagementSystem;
GO
```

---

# Tasks

### Report 1

Create a Books by Category report.

Expected Output:

```text
CategoryID
TotalBooks
```

Sort by highest book count.

---

### Report 2

Create a Books by Publisher report.

Expected Output:

```text
PublisherID
TotalBooks
```

Sort by highest book count.

---

### Report 3

Create a Reservations by Status report.

Expected Output:

```text
Status
TotalReservations
```

Sort by highest reservation count.

---

### Report 4

Create an Average Book Price by Category report.

Expected Output:

```text
CategoryID
AverageBookPrice
```

---

### Report 5

Create a Publication Year Analysis report.

Expected Output:

```text
PublicationYear
BooksPublished
```

---

### Report 6

Create a Member Borrowing Activity report.

Expected Output:

```text
MemberID
BorrowCount
```

Sort by highest borrow count.

---

### Report 7

Create a Publisher Performance report.

Expected Output:

```text
PublisherID
TotalBooks
OldestPublication
NewestPublication
```

---

# Executive Summary Challenge

Create a single query returning:

```text
TotalBooks
TotalMembers
TotalReservations
OldestPublicationYear
NewestPublicationYear
AverageBookPrice
```

---

# Business Scenario

Management requires a dashboard showing:

* Library growth
* Publishing activity
* Member activity
* Collection trends
* Reservation statistics

Build reports suitable for executive review.

---

# Success Criteria

✅ Uses multiple aggregate functions

✅ Uses GROUP BY

✅ Uses ORDER BY

✅ Produces dashboard-style reports

✅ Answers business questions
