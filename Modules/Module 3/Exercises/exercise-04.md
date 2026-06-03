# Exercise-04-LIKE-BETWEEN-IN.md

# Exercise 04: LIKE, BETWEEN, and IN

> Practice advanced filtering using IN, BETWEEN, and LIKE operators.

---

# Objectives

By completing this exercise, you will:

* Use the IN operator
* Use the BETWEEN operator
* Use the LIKE operator
* Perform advanced searches
* Build flexible reports

---

# Task 1: Books in Multiple Categories

Display books where:

```text
CategoryID = 1, 2, or 3
```

Use:

```sql
IN
```

---

# Task 2: Selected Members

Display members where:

```text
MemberID = 1, 3, 5, 7
```

Use:

```sql
IN
```

---

# Task 3: Books Published Between 2010 and 2020

Display books where:

```text
PublicationYear BETWEEN 2010 AND 2020
```

---

# Task 4: Members with IDs Between 1 and 10

Display members where:

```text
MemberID BETWEEN 1 AND 10
```

---

# Task 5: Names Starting with J

Display members where:

```text
FirstName starts with J
```

Use:

```sql
LIKE
```

---

# Task 6: Names Starting with S

Display members where:

```text
FirstName starts with S
```

---

# Task 7: Publishers Containing "Media"

Display publishers where:

```text
PublisherName contains Media
```

---

# Task 8: Authors Ending with N

Display authors whose:

```text
LastName ends with n
```

---

# Challenge 1

Display books where:

```text
CategoryID IN (1,2)
AND
PublicationYear BETWEEN 2015 AND 2025
```

---

# Challenge 2

Display members whose first names start with:

```text
A
```

---

# Submission

Save your solutions in:

```text
Exercise-04-Solution.sql
```
