SELECT COUNT(*) AS TotalBooks
FROM Books;

SELECT COUNT(*) AS TotalMembers
FROM Members;

SELECT AVG(BookPrice) AS AveragePrice
FROM Books;

SELECT SUM(BookPrice) AS InventoryValue
FROM Books;