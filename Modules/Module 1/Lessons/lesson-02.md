# Evolution of Databases

> Understanding how database systems evolved from simple file storage to modern relational database management systems.

---

# Learning Objectives

After completing this lesson, you will be able to:

* Understand the history of data storage
* Explain the limitations of file-based systems
* Describe hierarchical databases
* Describe network databases
* Understand the relational model
* Compare different database models
* Explain why relational databases became the industry standard

---

# Introduction

Before modern databases existed, organizations stored information using paper records and file-based systems.

As businesses grew, managing large amounts of data became increasingly difficult.

To solve these challenges, database systems evolved through several generations:

```text
Paper Records
      ↓
File Systems
      ↓
Hierarchical Databases
      ↓
Network Databases
      ↓
Relational Databases
      ↓
Modern Cloud Databases
```

Understanding this evolution helps explain why SQL and relational databases became so important.

---

# The Era of Paper Records

Before computers, information was stored manually.

Examples included:

* Telephone directories
* Employee records
* Medical records
* Financial ledgers

## Example

```text
Customer Register

Customer ID: 1001
Name: John Smith
Address: New York
Phone: 555-1234
```

---

## Problems with Paper Systems

### Slow Retrieval

Finding information required manually searching through documents.

---

### Difficult Updates

Changes required rewriting records.

---

### Storage Issues

Large organizations required massive storage space.

---

### Data Loss

Paper records could be damaged or destroyed.

---

# File-Based Systems

As computers became popular, organizations started storing data in files.

Common file formats included:

* Text files
* CSV files
* Excel spreadsheets

---

## Example

### Customers.csv

```csv
CustomerID,Name,City
1,John,New York
2,Sarah,Chicago
3,David,Boston
```

---

# Advantages of File Systems

* Faster than paper records
* Easier storage
* Easy duplication
* Basic automation support

---

# Limitations of File Systems

Although file systems improved data storage, they introduced new problems.

---

## Data Redundancy

The same information was often stored in multiple files.

### Example

```text
Customers.csv
Orders.csv
Invoices.csv
```

The customer name might appear in all three files.

---

## Data Inconsistency

Different files could contain conflicting information.

### Example

```text
Customers.csv
John Smith

Orders.csv
Jon Smith
```

This creates confusion and reporting issues.

---

## Difficult Data Sharing

Applications often used different file formats.

Sharing data became complicated.

---

## Security Problems

File-level security was limited.

Anyone with access could potentially modify data.

---

# Hierarchical Databases

In the 1960s, hierarchical databases were introduced.

Data was organized like a tree.

---

## Structure

```text
Customer
 ├── Account
 │      ├── Transaction
 │      ├── Transaction
 │
 └── Account
        ├── Transaction
```

Each child record could have only one parent.

---

# Example

A bank database:

```text
Customer
 ├── Savings Account
 └── Checking Account
```

Accounts belong to one customer.

Transactions belong to one account.

---

# Advantages

✅ Fast navigation

✅ Simple structure

✅ Efficient for predefined relationships

---

# Disadvantages

❌ Difficult to modify

❌ Inflexible relationships

❌ Data duplication

❌ Complex maintenance

---

# Network Databases

Network databases were developed to overcome the limitations of hierarchical systems.

Instead of a tree, records were connected using links.

---

## Structure

```text
Customer
    ↕
 Account
    ↕
 Product
    ↕
Transaction
```

A record could have multiple parents.

---

# Example

A customer may own multiple accounts.

A banking product may be associated with many accounts.

This creates a network of relationships.

---

# Advantages

✅ More flexible

✅ Reduced duplication

✅ Better relationship support

---

# Disadvantages

❌ Complex structure

❌ Difficult to understand

❌ Difficult application development

❌ Navigation-based access

---

# The Relational Revolution

In 1970, IBM researcher Dr. Edgar F. Codd proposed a new model.

His paper:

> "A Relational Model of Data for Large Shared Data Banks"

changed the future of database technology.

---

# The Relational Model

Instead of storing data in trees or networks, data would be stored in tables.

---

## Example

### Customers Table

| CustomerID | FirstName | LastName |
| ---------- | --------- | -------- |
| 1          | John      | Smith    |
| 2          | Sarah     | Wilson   |

---

### Accounts Table

| AccountID | CustomerID | Type     |
| --------- | ---------- | -------- |
| 101       | 1          | Savings  |
| 102       | 2          | Checking |

---

# Why Tables?

Tables are:

* Easy to understand
* Easy to maintain
* Easy to query
* Flexible

This simplicity made relational databases extremely popular.

---

# Key Concepts of Relational Databases

---

## Rows

Rows represent records.

Example:

| CustomerID | Name |
| ---------- | ---- |
| 1          | John |

One row = one customer.

---

## Columns

Columns represent attributes.

Example:

| CustomerID | Name |
| ---------- | ---- |

CustomerID and Name are columns.

---

## Primary Keys

Uniquely identify records.

Example:

```text
CustomerID
```

---

## Foreign Keys

Create relationships between tables.

Example:

```text
CustomerID
```

appears in both Customers and Accounts tables.

---

# Why Relational Databases Won

Relational databases solved many problems.

---

## Reduced Redundancy

Information is stored only once.

---

## Improved Consistency

Updates happen in one location.

---

## Better Data Integrity

Relationships can be enforced.

---

## Powerful Querying

Users can retrieve data using SQL.

---

## Scalability

Handles millions of records efficiently.

---

# SQL Emerges

To interact with relational databases, a standard language was required.

SQL was developed and became the universal language for relational databases.

Examples:

```sql
SELECT *
FROM customers;
```

```sql
SELECT *
FROM orders;
```

---

# Modern Database Systems

Today, relational databases remain dominant.

Popular systems include:

* MySQL
* PostgreSQL
* Oracle Database
* Microsoft SQL Server
* IBM DB2

---

# Cloud Databases

Modern databases are often hosted in the cloud.

Examples:

* Amazon RDS
* Azure SQL Database
* Google Cloud SQL

Benefits include:

* Automatic backups
* High availability
* Scalability
* Managed infrastructure

---

# Database Evolution Timeline

```text
1950s
Paper Records

1960s
File Systems

1960s–1970s
Hierarchical Databases

1970s
Network Databases

1970s–Present
Relational Databases

2000s–Present
Cloud Databases
```

---

# Comparison of Database Models

| Feature        | Hierarchical | Network   | Relational |
| -------------- | ------------ | --------- | ---------- |
| Structure      | Tree         | Graph     | Tables     |
| Flexibility    | Low          | Medium    | High       |
| Complexity     | Medium       | High      | Low        |
| Data Integrity | Limited      | Moderate  | Strong     |
| Querying       | Difficult    | Difficult | Easy       |
| SQL Support    | No           | No        | Yes        |

---

# Summary

In this lesson, you learned:

* How data was stored before databases
* Problems with file-based systems
* Hierarchical database systems
* Network database systems
* Dr. Codd's relational model
* Why relational databases became dominant
* The role of SQL
* Modern cloud database platforms

The relational model forms the foundation of SQL and modern database systems.

---

# Knowledge Check

### Question 1

Which database model organizes data like a tree?

A. Relational

B. Network

C. Hierarchical

D. Cloud

---

### Question 2

Who proposed the relational model?

A. Bill Gates

B. Larry Ellison

C. Edgar F. Codd

D. Michael Stonebraker

---

### Question 3

What is the main structure used in relational databases?

A. Files

B. Trees

C. Networks

D. Tables

---

### Question 4

Which language became the standard for relational databases?

A. Java

B. Python

C. SQL

D. C++

---

# Next Lesson

➡️ 03-Relational-Model.md

In the next lesson, you will explore tables, rows, columns, primary keys, foreign keys, and the core principles that make relational databases work.
