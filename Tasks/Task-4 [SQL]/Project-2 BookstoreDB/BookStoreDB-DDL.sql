-- 1. Database and Table Creation
-- Create Authors Table
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    Name VARCHAR(255),
    Bio TEXT
);

-- Create Books Table
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255),
    AuthorID INT,
    Price DECIMAL(10,2),
    PublicationDate DATE,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Create Sales Table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    BookID INT,
    QuantitySold INT,
    SaleDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- 2. Schema Modification
-- Add Genre column to Books Table
ALTER TABLE Books
ADD COLUMN Genre VARCHAR(100);

-- Modify data types if necessary (if any changes in requirements)
-- Add constraints for data integrity (if necessary)


-- 3. Data Management
-- Prepare for end-of-year data reset
TRUNCATE TABLE Sales;

-- 4. Schema Cleanup
-- If author details are integrated into the Books table
-- Drop the Authors Table
DROP TABLE Authors;


-- 5. Database Restructuring
-- Rename Books Table
ALTER TABLE Books
RENAME TO Materials;





