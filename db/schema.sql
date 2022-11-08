DROP DATABASE IF EXISTS Employee_Tracker_db;
CREATE DATABASE Employee_Tracker_db;

USE Employee_Tracker_db;

CREATE TABLE department(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR (50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE employee_role(
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    salary DECIMAL,
    department_id INT NOT null,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) 
    REFERENCES department(id)
    ON DELETE SET NULL
);                                                                                
CREATE TABLE employee(
    id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    employee_role_id INT NOT NULL,
    manager_id INT NOT NULL AUTO_INCREMENT
    FOREIGN KEY (employee_role_id)
    REFERENCES employee_role(id)
    ON DELETE SET NULL
);