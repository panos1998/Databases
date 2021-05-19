#Create and show a catalog (userID,orderID,orderDate) with all possible orders 
#on the Christmas day 2020-12-25.
SELECT `userID`,`orderID`,`orderDate` 
FROM (`User` CROSS JOIN `Order` ) 
WHERE `userID` = `user` AND `orderDate` = '2020-12-25';