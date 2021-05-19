#Increase by 30% all AMD products' prices. (15 days before BlackFriday).
#SET SQL_SAFE_UPDATES = 0;
UPDATE `Product` 
SET `price` = 1.3 * `price`
WHERE `manufacturer` = 'AMD';