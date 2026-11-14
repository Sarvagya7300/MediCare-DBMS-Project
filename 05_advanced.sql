USE healthcare_management;
-- TCL Implementation
-- Create a temporary table for transaction testing

CREATE TEMPORARY TABLE Transaction_Demo (
    id INT PRIMARY KEY,
    description VARCHAR(100)
);

-- COMMIT Example
START TRANSACTION;
INSERT INTO Transaction_Demo
VALUES (1, 'Patient Registration');
COMMIT;

SELECT * FROM Transaction_Demo;

-- SAVEPOINT Example
START TRANSACTION;
SAVEPOINT before_update;
UPDATE Transaction_Demo
SET description = 'Updated Registration'
WHERE id = 1;

SELECT * FROM Transaction_Demo;
ROLLBACK TO SAVEPOINT before_update;
COMMIT;
SELECT * FROM Transaction_Demo;

-- ROLLBACK Example
START TRANSACTION;
DELETE FROM Transaction_Demo
WHERE id = 1;

SELECT * FROM Transaction_Demo;
ROLLBACK;
SELECT * FROM Transaction_Demo;