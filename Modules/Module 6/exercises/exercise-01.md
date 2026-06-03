# Exercise 01: Introduction to Subqueries

## Objective

Practice identifying subqueries, outer queries, and execution order.

---

## Questions

### Question 1

Identify the outer query and subquery.

```sql
SELECT *
FROM Books
WHERE BookPrice >
(
    SELECT AVG(BookPrice)
    FROM Books
);
```

---

### Question 2

What value does this subquery return?

```sql
SELECT AVG(BookPrice)
FROM Books;
```

---

### Question 3

Explain the execution order of:

```sql
SELECT *
FROM Books
WHERE PublicationYear >
(
    SELECT AVG(PublicationYear)
    FROM Books
);
```

---

### Question 4

Write a subquery to find books published after the average publication year.

---

### Question 5

List three business use cases for subqueries.

---

## Challenge

Explain the difference between:

```sql
SELECT *
FROM Books
WHERE BookPrice > 500;
```

and

```sql
SELECT *
FROM Books
WHERE BookPrice >
(
    SELECT AVG(BookPrice)
    FROM Books
);
```
