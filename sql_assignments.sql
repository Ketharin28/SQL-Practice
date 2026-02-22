use classicmodels; 

SELECT customerNumber, customerName, state, creditLimit 
FROM customers 
WHERE state IS NOT NULL AND creditLimit BETWEEN 50000 AND 100000
ORDER BY creditLimit DESC;

SELECT DISTINCT productLine
FROM products
WHERE productLine LIKE '%cars'; 

SELECT orderNumber, status, COALESCE(comments, '-') AS comments
FROM orders
WHERE status = 'Shipped'; 


SELECT employeeNumber, firstName, jobTitle,
    CASE
        WHEN jobTitle = 'President' THEN 'P'
        WHEN jobTitle = '%Sales Manager%' OR jobTitle = '%Sale Manager%' THEN 'SM'
        WHEN jobTitle = 'Sales Rep' THEN 'SR'
        WHEN jobTitle LIKE '%VP%' THEN 'VP'
        ELSE jobTitle
    END AS jobTitleAbbreviation
FROM employees;


SELECT employeeNumber, firstName, jobTitle,
    CASE
        WHEN jobTitle = 'President' THEN 'P'
        WHEN jobTitle IN ('Sales Manager (APAC)', 'Sales Manager(EMEA)', 'Sales Manager(NA)', 'Sale Manager') THEN 'SM'
        WHEN jobTitle = 'Sales Rep' THEN 'SR'
        WHEN jobTitle LIKE '%VP%' THEN 'VP'
        ELSE NULL
    END AS jobTitleAbbreviation
FROM employees;


SELECT employeeNumber, firstName, jobTitle,
    CASE
        WHEN jobTitle = 'President' THEN 'P'
        WHEN jobTitle IN ('Sales Manager (APAC)', 'Sale Manager (EMEA)', 'Sales Manager (NA)', 'Sale Manager') THEN 'SM'
        WHEN jobTitle = 'Sales Rep' THEN 'SR'
        WHEN jobTitle LIKE '%VP%' THEN 'VP'
        ELSE NULL
    END AS jobTitleAbbreviation
FROM employees; 

SELECT YEAR(paymentDate) AS year, MIN(amount) AS minAmount
FROM payments
GROUP BY YEAR(paymentDate)
ORDER BY YEAR(paymentDate); 

SELECT 
    YEAR(orderDate) AS Year, 
    CONCAT('Q', QUARTER(orderDate)) AS Quarter, 
    COUNT(DISTINCT customerNumber) AS UniqueCustomers,
    COUNT(orderNumber) AS TotalOrders
FROM orders
GROUP BY YEAR(orderDate), QUARTER(orderDate)
ORDER BY YEAR(orderDate), QUARTER(orderDate); 

SELECT 
    DATE_FORMAT(paymentDate, '%b') AS Month, 
    CONCAT(ROUND(SUM(amount) / 1000), 'K') AS FormattedAmount
FROM payments
GROUP BY YEAR(paymentDate), MONTH(paymentDate)
HAVING SUM(amount) BETWEEN 500000 AND 1000000
ORDER BY SUM(amount) DESC; 

CREATE TABLE journey (
    Bus_ID INT NOT NULL,
    Bus_Name VARCHAR(255) NOT NULL,
    Source_Station VARCHAR(255) NOT NULL,
    Destination VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    PRIMARY KEY (Bus_ID)
); 

desc journey; 

SELECT 
    e.employeeNumber, 
    CONCAT(e.firstName, ' ', e.lastName) AS SalesPerson, 
    COUNT(DISTINCT c.customerNumber) AS UniqueCustomers
FROM Employees e
JOIN Customers c ON e.employeeNumber = c.salesRepEmployeeNumber
GROUP BY e.employeeNumber
ORDER BY UniqueCustomers DESC; 


SELECT 
    c.customerNumber,
    c.customerName,
    od.productCode,
    p.productName,
    SUM(od.quantityOrdered) AS TotalOrderedQuantities,
    p.quantityInStock AS TotalQuantitiesInStock,
    (p.quantityInStock - SUM(od.quantityOrdered)) AS LeftOverQuantities
FROM Customers c
JOIN Orders o ON c.customerNumber = o.customerNumber
JOIN OrderDetails od ON o.orderNumber = od.orderNumber
JOIN Products p ON od.productCode = p.productCode
GROUP BY c.customerNumber, od.productCode, p.quantityInStock
ORDER BY c.customerNumber; 

WITH YearlyMonthlyOrders AS (
    SELECT 
        YEAR(orderDate) AS Year,
        MONTHNAME(orderDate) AS Month,
        COUNT(*) AS OrderCount
    FROM Orders
    GROUP BY YEAR(orderDate), MONTHNAME(orderDate)
),
YoYComparison AS (
    SELECT 
        a.Year,
        a.Month,
        a.OrderCount,
        b.OrderCount AS PreviousYearCount,
        ((a.OrderCount - IFNULL(b.OrderCount, 0)) / IFNULL(b.OrderCount, 1)) * 100 AS YoYChange
    FROM YearlyMonthlyOrders a
    LEFT JOIN YearlyMonthlyOrders b ON a.Month = b.Month AND a.Year = b.Year + 1
)
SELECT 
    Year,
    Month,
    OrderCount,
    CONCAT(ROUND(YoYChange), '%') AS YoYChangePercentage
FROM YoYComparison
ORDER BY Year, Month; 

WITH RankedQuantities AS (
    SELECT 
        orderNumber, 
        quantityOrdered, 
        RANK() OVER (PARTITION BY orderNumber ORDER BY quantityOrdered DESC) as QtyRank
    FROM Orderdetails
)
SELECT orderNumber, quantityOrdered
FROM RankedQuantities
WHERE QtyRank = 2; 


WITH OrderCounts AS (
    SELECT 
        orderNumber, 
        COUNT(productCode) AS ProductCount
    FROM Orderdetails
    GROUP BY orderNumber
)
SELECT 
    MIN(ProductCount) AS MinProductCount,
    MAX(ProductCount) AS MaxProductCount
FROM OrderCounts; 

SELECT productLine, COUNT(*) AS CountAboveAverage
FROM Products
WHERE buyPrice > (SELECT AVG(buyPrice) FROM Products)
GROUP BY productLine; 










