-- Create SalesData Table
CREATE TABLE SalesData (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Age INT NOT NULL,
    City VARCHAR(50) NOT NULL,
    PurchaseAmount DECIMAL(10, 2) NOT NULL,
    PurchaseDate DATE NOT NULL
);

-- Stored Procedure to insert 10,000 random rows
DELIMITER $$

CREATE PROCEDURE InsertRandomSalesData()
BEGIN
    DECLARE i INT DEFAULT 0;
    
    WHILE i < 10000 DO
        INSERT INTO SalesData (Name, Age, City, PurchaseAmount, PurchaseDate)
        VALUES (
            CONCAT(
                ELT(FLOOR(1 + RAND() * 20), 'John', 'Sarah', 'Michael', 'Emily', 'Robert', 'Jessica', 'James', 'Amanda', 'David', 'Lisa', 'Christopher', 'Jennifer', 'Daniel', 'Mary', 'Matthew', 'Patricia', 'Anthony', 'Linda', 'Mark', 'Barbara'),
                ' ',
                ELT(FLOOR(1 + RAND() * 10), 'Smith', 'Johnson', 'Brown', 'Davis', 'Wilson', 'Martinez', 'Taylor', 'Anderson', 'Thomas', 'Jackson')
            ),
            FLOOR(18 + RAND() * 65),
            ELT(FLOOR(1 + RAND() * 10), 'New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix', 'Philadelphia', 'San Antonio', 'San Diego', 'Dallas', 'San Jose'),
            ROUND(10 + RAND() * 990, 2),
            DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 365) DAY)
        );
        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;

-- Execute the procedure to insert 10,000 rows
CALL InsertRandomSalesData();

-- Verify data was inserted
SELECT COUNT(*) as TotalRows FROM SalesData;