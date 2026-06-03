# Exercise 07: Business Reports with Joins

## Objective

Build professional business reports using SQL JOINs, aggregate functions, and sorting techniques.

---

# Database

```sql id="h7a1f3"
USE LibraryManagementSystem;
GO
```

---

# Report 1: Book Catalog

Create a report displaying:

```text id="v8w2r4"
Book Title
Category Name
Publisher Name
Publication Year
Book Price
```

---

# Report 2: Author Catalog

Create a report displaying:

```text id="j3s6q1"
Book Title
Author Name
```

---

# Report 3: Borrowing Activity

Create a report displaying:

```text id="n4c8y2"
Member Name
Book Title
Borrow Date
Due Date
Return Date
```

---

# Report 4: Reservation Activity

Create a report displaying:

```text id="m7u9k5"
Member Name
Book Title
Reservation Date
Status
```

---

# Report 5: Most Borrowed Books

Create a report displaying:

```text id="a2p7r8"
Book Title
Borrow Count
```

Sort by:

```text id="z5w4t6"
Highest Borrow Count First
```

---

# Report 6: Most Active Members

Create a report displaying:

```text id="g9b2n1"
Member Name
Borrow Count
```

Sort by:

```text id="d7q5m4"
Highest Borrow Count First
```

---

# Report 7: Most Popular Categories

Create a report displaying:

```text id="f8j6u3"
Category Name
Borrow Count
```

Sort by:

```text id="c1r8v2"
Highest Borrow Count First
```

---

# Report 8: Publisher Performance

Create a report displaying:

```text id="x4m9y7"
Publisher Name
Total Books
Average Book Price
```

---

# Report 9: Author Productivity

Create a report displaying:

```text id="l6s3h8"
Author Name
Total Books Written
```

---

# Report 10: Library Dashboard

Create a dashboard showing:

```text id="u5k1e9"
Total Books
Total Authors
Total Members
Total Reservations
Total Borrow Records
```

---

# Executive Challenge

Build an Executive Summary Report showing:

```text id="o2w6q4"
Total Books
Total Members
Total Authors
Most Borrowed Book
Most Active Member
Most Popular Category
```

---

# Business Scenario

The Library Director requires monthly management reports to monitor:

* Collection growth
* Member activity
* Author productivity
* Publisher performance
* Book popularity

Create reports that support executive decision-making.

---

# Success Criteria

✅ Uses JOINs correctly

✅ Uses aggregate functions

✅ Uses GROUP BY

✅ Uses ORDER BY

✅ Produces dashboard-ready reports
