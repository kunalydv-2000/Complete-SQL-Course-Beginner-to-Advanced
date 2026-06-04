# Parameter Guide

## Overview

This guide explains all input and output parameters used in the project.

---

# Input Parameters

## @CategoryID

### Data Type

```sql
INT
```

### Used By

```text
GetBooksByCategory
```

---

## @PublisherID

### Data Type

```sql
INT
```

### Used By

```text
GetBooksByPublisher
```

---

## @MemberID

### Data Type

```sql
INT
```

### Used By

```text
GetMemberBorrowHistory
CheckMemberExists
```

---

## @Keyword

### Data Type

```sql
VARCHAR(100)
```

### Used By

```text
SearchBooksDynamic
```

---

## @SortColumn

### Data Type

```sql
VARCHAR(50)
```

### Used By

```text
GetBooksSorted
```

---

# Output Parameters

## @TotalBooks

```sql
INT OUTPUT
```

---

## @TotalMembers

```sql
INT OUTPUT
```

---

## @AverageBookPrice

```sql
DECIMAL(10,2) OUTPUT
```

---

# Best Practices

✅ Validate parameters

✅ Use correct data types

✅ Use meaningful names

✅ Document all parameters

✅ Avoid unnecessary parameters
