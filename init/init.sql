-- init/init.sql
CREATE TABLE designation_master (
    id INT AUTO_INCREMENT PRIMARY KEY,
    designation_name VARCHAR(255) NOT NULL
);

INSERT INTO designation_master (designation_name) VALUES 
('Manager'),
('Developer'),
('Designer');

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    email VARCHAR(100),
    dob DATE,
    designation VARCHAR(100),
    gender VARCHAR(10),
    start_date DATE
);