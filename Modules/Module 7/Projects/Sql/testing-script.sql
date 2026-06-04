EXEC GetBookCatalog;

EXEC GetActiveMembers;

EXEC GetPublisherPerformance;

EXEC GetInventoryKPIs;

EXEC GetBooksByCategory
    @CategoryID = 1;

EXEC GetBooksByPublisher
    @PublisherID = 1;

EXEC SearchBooksDynamic
    @Keyword = 'SQL';

EXEC GetBooksSorted
    @SortColumn = 'Title';

EXEC GetExecutiveDashboard;