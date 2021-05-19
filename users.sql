# Create user guestuser that can perform select queries in the DB
CREATE USER 'guestuser'@'localhost' IDENTIFIED BY 'mypassword';
CREATE USER 'guestuser'@'%' IDENTIFIED BY 'mypassword';
GRANT SELECT ON student.* TO 'guestuser'@'localhost';
GRANT SELECT ON student.* TO 'guestuser'@'%';

# Create user authenticateduser that can perform select and insert queries in the DB
CREATE USER 'authenticateduser'@'localhost' IDENTIFIED BY 'myauthpassword';
CREATE USER 'authenticateduser'@'%' IDENTIFIED BY 'myauthpassword';
GRANT SELECT, INSERT ON student.* TO 'authenticateduser'@'localhost';
GRANT SELECT, INSERT ON student.* TO 'authenticateduser'@'%';

# Create user employee that can perform select, insert, update and delete but only from the server of the DB (localhost)
CREATE USER 'employee'@'localhost' IDENTIFIED BY 'myemppassword';
GRANT SELECT, INSERT, UPDATE, DELETE ON student.* TO 'employee'@'localhost';

# ...
