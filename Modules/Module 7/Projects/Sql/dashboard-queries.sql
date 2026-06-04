SELECT
    (SELECT COUNT(*) FROM Books) AS TotalBooks,
    (SELECT COUNT(*) FROM Members) AS TotalMembers,
    (SELECT COUNT(*) FROM Authors) AS TotalAuthors,
    (SELECT COUNT(*) FROM Publishers) AS TotalPublishers,
    (SELECT COUNT(*) FROM Reservations) AS TotalReservations,
    (SELECT COUNT(*) FROM BorrowRecords) AS TotalBorrowRecords;
