#Show orders that have been completed in less than 60 days for users who come from 
#Heraklion or Ierapetra (and their payment information).

DROP TABLE A;
CREATE TEMPORARY TABLE A 
SELECT `orderID`,`city`,`orderDate` 
FROM `Order`
WHERE (`city` = 'Ierapetra' OR  `city` = 'Heraklion') AND (`daysCount` < 61);

SELECT * 
FROM Payment RIGHT JOIN A
ON Payment.order = A.orderID; 