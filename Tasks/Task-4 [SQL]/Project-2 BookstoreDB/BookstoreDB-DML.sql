-- Task 1: Inserting Initial Data with Conditions
-- Populate Initial Data
INSERT INTO Authors (AuthorID, Name, Bio) VALUES
(1, 'John Doe', 'Renowned author with numerous bestsellers'),
(2, 'Jane Smith', 'Award-winning novelist known for literary fiction');

INSERT INTO Books (BookID, Title, AuthorID, Price, PublicationDate, Genre) VALUES
(1, 'The Art of Coding', 1, 29.99, '2023-01-15', 'Programming'),
(2, 'Data Science Unleashed', 1, 39.99, '2022-05-20', 'Data Science'),
(3, 'Eloquent SQL', 2, 24.99, '2023-02-10', 'Database');

INSERT INTO Sales (SaleID, BookID, QuantitySold, SaleDate) VALUES
(1, 1, 30, '2023-01-20'),
(2, 2, 15, '2022-06-01'),
(3, 3, 50, '2023-02-15');

-- Conditional Insertion for Promotions
INSERT INTO NewReleases (BookID)
SELECT BookID
FROM Books
WHERE PublicationDate >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);



-- Task 2: Updating Inventory and Pricing Based on Sales Performance

-- Dynamic Pricing Update
UPDATE Books
SET Price = Price * 1.10
WHERE BookID IN (
    SELECT BookID
    FROM Sales
    WHERE QuantitySold > 50 AND SaleDate >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
);

UPDATE Books
SET Price = Price * 0.95
WHERE BookID NOT IN (
    SELECT BookID
    FROM Sales
    WHERE QuantitySold > 0 AND SaleDate >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
);


-- Task 3: Managing Stock and Sales Records

-- Stock Adjustment
UPDATE Books
SET StockQuantity = StockQuantity - (
    SELECT QuantitySold
    FROM Sales
    WHERE Books.BookID = Sales.BookID
);

-- Sales Record Cleanup
DELETE FROM Sales
WHERE SaleDate < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

-- TRUNCATE TABLE for new fiscal year
TRUNCATE TABLE Sales;