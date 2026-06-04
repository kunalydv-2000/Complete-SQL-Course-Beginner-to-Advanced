# Database Schema

# Library Reporting & Automation System

---

# Overview

This document describes the database structure used in the Library Reporting & Automation System project.

The database is designed to manage:

* Books
* Authors
* Categories
* Publishers
* Members
* Borrowing Activities
* Reservations

---

# Entity Relationship Overview

```text
Authors
   │
   └── Books
           │
           ├── Categories
           │
           ├── Publishers
           │
           ├── BorrowRecords
           │
           └── Reservations

Members
   │
   ├── BorrowRecords
   │
   └── Reservations
```

---

# Table: Authors

## Purpose

Stores information about book authors.

---

| Column     | Data Type    | Constraint  |
| ---------- | ------------ | ----------- |
| AuthorID   | INT          | Primary Key |
| AuthorName | VARCHAR(100) | NOT NULL    |
| Country    | VARCHAR(100) | NULL        |

---

# Table: Categories

## Purpose

Stores book categories.

---

| Column       | Data Type    | Constraint  |
| ------------ | ------------ | ----------- |
| CategoryID   | INT          | Primary Key |
| CategoryName | VARCHAR(100) | NOT NULL    |

---

# Table: Publishers

## Purpose

Stores publisher information.

---

| Column        | Data Type    | Constraint  |
| ------------- | ------------ | ----------- |
| PublisherID   | INT          | Primary Key |
| PublisherName | VARCHAR(100) | NOT NULL    |
| City          | VARCHAR(100) | NULL        |

---

# Table: Books

## Purpose

Stores library book information.

---

| Column          | Data Type     | Constraint  |
| --------------- | ------------- | ----------- |
| BookID          | INT           | Primary Key |
| Title           | VARCHAR(200)  | NOT NULL    |
| AuthorID        | INT           | Foreign Key |
| CategoryID      | INT           | Foreign Key |
| PublisherID     | INT           | Foreign Key |
| PublicationYear | INT           | NULL        |
| BookPrice       | DECIMAL(10,2) | NOT NULL    |

---

## Foreign Keys

| Column      | References             |
| ----------- | ---------------------- |
| AuthorID    | Authors.AuthorID       |
| CategoryID  | Categories.CategoryID  |
| PublisherID | Publishers.PublisherID |

---

# Table: Members

## Purpose

Stores member information.

---

| Column      | Data Type    | Constraint  |
| ----------- | ------------ | ----------- |
| MemberID    | INT          | Primary Key |
| FirstName   | VARCHAR(100) | NOT NULL    |
| LastName    | VARCHAR(100) | NOT NULL    |
| Email       | VARCHAR(255) | NULL        |
| PhoneNumber | VARCHAR(50)  | NULL        |
| JoinDate    | DATE         | NULL        |

---

# Table: BorrowRecords

## Purpose

Stores borrowing transactions.

---

| Column     | Data Type | Constraint  |
| ---------- | --------- | ----------- |
| BorrowID   | INT       | Primary Key |
| MemberID   | INT       | Foreign Key |
| BookID     | INT       | Foreign Key |
| BorrowDate | DATE      | NOT NULL    |
| DueDate    | DATE      | NOT NULL    |
| ReturnDate | DATE      | NULL        |

---

## Foreign Keys

| Column   | References       |
| -------- | ---------------- |
| MemberID | Members.MemberID |
| BookID   | Books.BookID     |

---

# Table: Reservations

## Purpose

Stores book reservation transactions.

---

| Column          | Data Type | Constraint  |
| --------------- | --------- | ----------- |
| ReservationID   | INT       | Primary Key |
| MemberID        | INT       | Foreign Key |
| BookID          | INT       | Foreign Key |
| ReservationDate | DATE      | NOT NULL    |

---

## Foreign Keys

| Column   | References       |
| -------- | ---------------- |
| MemberID | Members.MemberID |
| BookID   | Books.BookID     |

---

# Relationship Summary

| Parent Table | Child Table   | Relationship |
| ------------ | ------------- | ------------ |
| Authors      | Books         | One-to-Many  |
| Categories   | Books         | One-to-Many  |
| Publishers   | Books         | One-to-Many  |
| Members      | BorrowRecords | One-to-Many  |
| Books        | BorrowRecords | One-to-Many  |
| Members      | Reservations  | One-to-Many  |
| Books        | Reservations  | One-to-Many  |

---

# Reporting Objects

The following Views are built from this schema:

```text
vw_BookCatalog

vw_ActiveMembers

vw_PublisherPerformance

vw_InventorySummary
```

---

# Automation Objects

The following Stored Procedures are built from this schema:

```text
GetBookCatalog

GetActiveMembers

GetPublisherPerformance

GetInventoryKPIs

GetBooksByCategory

GetBooksByPublisher

GetMemberBorrowHistory

GetExecutiveDashboard
```

---

# Schema Design Goals

The database is designed to provide:

✅ Data Integrity

✅ Referential Integrity

✅ Reporting Support

✅ Business Automation

✅ Dashboard Integration

✅ Scalable Architecture

---

# Database Summary

```text
Total Tables: 7

Master Tables:
- Authors
- Categories
- Publishers
- Books
- Members

Transaction Tables:
- BorrowRecords
- Reservations
```
