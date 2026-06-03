# Exercise 04: Constraints

## Objective

Apply constraints to enforce data integrity.

---

# Part A: PRIMARY KEY

Create a table:

```text
Students
```

Requirements:

* StudentID must be a PRIMARY KEY

---

# Part B: UNIQUE Constraint

Add:

```text
Email
```

Requirement:

* No duplicate email addresses

---

# Part C: NOT NULL

Ensure:

```text
FirstName
LastName
```

cannot contain NULL values.

---

# Part D: DEFAULT Constraint

Create:

```text
RegistrationDate
```

Requirement:

* Default to today's date

---

# Part E: CHECK Constraint

Create:

```text
Age
```

Requirement:

* Age must be between 18 and 60

---

# Challenge

Create a Products table with:

* ProductID
* ProductName
* Price

Requirement:

Price must always be greater than zero.
