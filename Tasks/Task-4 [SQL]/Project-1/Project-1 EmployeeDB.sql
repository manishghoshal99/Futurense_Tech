create database Futurense;

use Futurense;

CREATE TABLE Students(
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    roll_number VARCHAR(15) UNIQUE NOT NULL,
    class VARCHAR(10) NOT NULL,
    birthday DATE NOT NULL,
    age INT CHECK (age >= 0) NOT NULL
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE employees (
    employee_id INT auto_increment PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    hire_date DATE NOT NULL,
    department_id INT,
    salary DECIMAL(10, 2) CHECK (salary >= 0) NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);


INSERT INTO departments (department_id, department_name)
VALUES
  (1, 'Marketing'),
  (2, 'Sales'),
  (3, 'Finance'),
  (4, 'Human Resources'),
  (5, 'Information Technology');
  
INSERT INTO employees (first_name, last_name, email, hire_date, department_id, salary)
VALUES ('Jane', 'Smith', 'jane.smith@example.com', '2023-02-20', 2, 60000.00); 

INSERT INTO employees (first_name, last_name, email, hire_date, department_id, salary)
VALUES ('Manish', 'Ghoshal', 'mgcostheta@example.com', '2023-01-24', 3, 90000.00); 

SELECT * FROM departments;

SELECT * FROM employees;

-- Adding New column to existing table
ALTER table employees add gender varchar(10) not null;

desc employees;

-- Altering the table to put last_name as varchar(25)
alter table employees
modify last_name VARCHAR(25) NOT NULL;

alter table employees drop gender;


-- Renaming the Table
RENAME TABLE `students` TO `NewTableName`;

-- Renaming columns
ALTER TABLE `NewTableName` RENAME COLUMN `roll_number` TO `new_roll_number`;

-- Renaming Database

-- Inserting Values using Insert into DML Command
INSERT INTO employees (first_name, last_name, email, hire_date, department_id, salary)
VALUES ('Alice', 'Johnson', 'alice.j@example.com', '2022-11-15', 1, 80000.00),
('Bob', 'Smith', 'bob.smith@example.com', '2023-02-10', 2, 75000.00),
('Eva', 'Williams', 'eva.w@example.com', '2021-09-03', 3, 82000.00),
('David', 'Lee', 'david.lee@example.com', '2022-05-20', 1, 88000.00),
('Sophia', 'Brown', 'sophia.b@example.com', '2023-04-08', 2, 76000.00);

-- Using Update command
UPDATE employees
SET first_name = 'Robert'
WHERE first_name = 'Bob';

-- Using the Delete command
DELETE FROM employees
WHERE first_name = 'Bob';





