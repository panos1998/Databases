#Find the average value of daily income (per order) for random day 2020-10-20
SELECT AVG(`totalAmount`) FROM `Payment` WHERE `paymentDate` = '2020-10-20';