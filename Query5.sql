# Show all builds in which the Intel-i7-10700k CPU (pid = 0001721) is included
# and MSI Gaming X motherboard (pid = 0001699) is not.
DROP TABLE A, B, C;
CREATE TEMPORARY TABLE A
SELECT `buildID` AS `bid1`, `productID` AS `pid1`, `quantity` AS `q1`
FROM `buildconsistsofproduct`
WHERE `productID` = '0001721';
CREATE TEMPORARY TABLE B
SELECT `buildID` AS `bid2`, `productID` AS `pid2`, `quantity` AS `q2`
FROM `buildconsistsofproduct`
WHERE `productID` = '0001699';
CREATE TEMPORARY TABLE C
SELECT `bid1` AS `bid3`, `pid1` AS `pid3`, `q1` AS `q3`
FROM `A`
WHERE `bid1` IN (SELECT `bid2` FROM `B`);
SELECT DISTINCT *
FROM A
WHERE `bid1` NOT IN (SELECT `bid3` FROM `C`) ;