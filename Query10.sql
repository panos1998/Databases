#Show info for the supplier, whose products are 'Best Sellers'.
DROP TABLE A, B;
CREATE TEMPORARY TABLE A 
SELECT  `productID`, COUNT(DISTINCT `orderID`) AS `numberOfOrders` 
FROM `OrderContainsProduct` 
GROUP BY `productID`
ORDER BY `numberOfOrders` DESC
LIMIT 10;

CREATE TEMPORARY TABLE B
SELECT `productID` AS `product`, MAX(`numberOfOrders`) AS `BestSeller`
FROM A;

SELECT supplierID, supplierURL, supplierName, supplierPhone, productID, BestSeller
FROM ((B JOIN Product ON B.product = Product.productID)
JOIN Supplier ON supplier = supplierID);
