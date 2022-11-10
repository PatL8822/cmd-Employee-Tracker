DROP DATABASE IF EXISTS EmployeeTracker_db;
CREATE DATABASE EmployeeTracker_db;

USE EmployeeTracker_db;

CREATE TABLE department(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR (50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE role(
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    salary DECIMAL(11, 2),
    department_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) 
    REFERENCES department(id)
    ON DELETE SET NULL
);                                                                                
CREATE TABLE employee(
    id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    role_id INT,
    manager_id INT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (role_id)
    REFERENCES role(id)
    ON DELETE SET NULL
);