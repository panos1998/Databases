CREATE  USER 'admin'@'localhost' identified BY 'password';
GRANT ALL PRIVILEGES ON partexplorerdb.* TO 'admin'@'localhost';

CREATE USER 'employee'@'localhost' identified by 'password2';
GRANT SELECT ON partexplorerdb.`User` TO 'employee'@'localhost';
GRANT SELECT ON partexplorerdb.`Payment` TO 'employee'@'localhost';
GRANT SELECT ON partexplorerdb.`Supplier` TO 'employee'@'localhost';
GRANT SELECT, UPDATE, DELETE ON partexplorerdb.`Order` TO 'employee'@'localhost';
GRANT SELECT, UPDATE, DELETE ON partexplorerdb.`Build` TO 'employee'@'localhost' ;
GRANT SELECT, UPDATE, DELETE ON partexplorerdb.`Guide` TO 'employee'@'localhost' ;
GRANT SELECT, INSERT, UPDATE, DELETE ON partexplorerdb.`Product` TO 'employee'@'localhost';

CREATE USER 'simpleuser'@'localhost' identified by 'password3';
GRANT SELECT ON partexplorerdb.`Product` TO 'simpleuser'@'localhost';
GRANT SELECT ON partexplorerdb.`Payment` TO 'simpleuser'@'localhost';
GRANT SELECT ON partexplorerdb.`Supplier` TO 'simpleuser'@'localhost' ;
GRANT SELECT, INSERT ON  partexplorerdb.`Order` TO 'simpleuser'@'localhost' ;
GRANT SELECT, INSERT, UPDATE ON partexplorerdb.`User` TO 'simpleuser'@'localhost';
GRANT SELECT, INSERT, DELETE ON partexplorerdb.`Build` TO 'simpleuser'@'localhost' ;
GRANT SELECT, INSERT, UPDATE, DELETE ON partexplorer.`Guide` TO 'simpleuser'@'localhost';
