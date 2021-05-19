#Show all orders from users from Thessaloniki between dates 2020-12-10 and 2020-12-31.
SELECT * FROM `Order` WHERE (`city` = 'Thessaloniki' AND `orderDate` BETWEEN '2020-12-10' AND '2020-12-31');