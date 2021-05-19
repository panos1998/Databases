# Show list with all builds that include ALL of the following products:
# 1) AMD Ryzen 5 (pid 0004200), 2) AM4 Asrock motherboard (pid 0001600) 
# 3) and Corsair 16GB 3200Mhz (pid 0006510).
DROP TABLE A, B, C, D;
CREATE TEMPORARY TABLE A
SELECT `buildID` AS `bid1`, `productID` AS `pid1`, `quantity` AS `q1`
FROM `buildconsistsofproduct`
WHERE `productID` = '0004200';
CREATE TEMPORARY TABLE B
SELECT `buildID` AS `bid2`, `productID` AS `pid2`, `quantity` AS `q2`
FROM `buildconsistsofproduct`
WHERE `productID` = '0001600';
CREATE TEMPORARY TABLE C
SELECT `buildID` AS `bid3`, `productID` AS `pid3`, `quantity` AS `q3`
FROM `buildconsistsofproduct`
WHERE `productID` = '0006510';
CREATE TEMPORARY TABLE D
SELECT * FROM `A`
WHERE `bid1` IN (SELECT `bid2` FROM `B`);
SELECT DISTINCT * FROM D
WHERE `bid1` IN (SELECT `bid3` FROM `C`);
