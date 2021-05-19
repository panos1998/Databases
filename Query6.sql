# Show all the users that have made orders from at least 2 different cities.
DROP TABLE A, B;
CREATE TEMPORARY TABLE A 
SELECT * FROM (`User` JOIN `Order`ON `userID` = `user`);
CREATE TEMPORARY TABLE B
SELECT  `userID` AS `uid`,`userName` AS `name`,`userEmail` AS `email`,
		`userPhone` AS `phone`,`orderID` AS `oid`,`orderDate` AS `date`,
        `city` AS `city2`,`address` AS `address2`,`daysCount` AS `count` 
FROM A;
SELECT DISTINCT `userID`,`userName`,`city`
FROM ( B JOIN A ON (B.uid = A.userID) AND (B.city2 != A.city))
ORDER BY `userID` ASC;