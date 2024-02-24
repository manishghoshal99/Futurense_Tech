-- STUDENT DATABASE TASK - 19TH FEBRUARY, 2024

CREATE DATABASE Futurense_Students;
use Futurense_Students;

CREATE TABLE students (
    Student_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(25) NOT NULL,
    Course VARCHAR(50) NOT NULL,
    Age INT CHECK (Age > 10),
    Gender VARCHAR(2) NOT NULL
);


ALTER TABLE students
ADD COLUMN Address VARCHAR(255);


ALTER TABLE students
MODIFY COLUMN Name VARCHAR(50);

ALTER TABLE students
RENAME TO TBL_StudentInfo;

ALTER TABLE TBL_StudentInfo
CHANGE COLUMN Name Student_Name VARCHAR(50);



INSERT INTO TBL_StudentInfo (Student_Name, Course, Age, Gender)
VALUES ('John Doe', 'Math', 20, 'M'),
       ('Jane Smith', 'History', 22, 'F'),
       ('Alice Johnson', 'Biology', 25, 'F'),
       ('Bob Anderson', 'Physics', 23, 'M'),
       ('Charlie Brown', 'Chemistry', 21, 'M');

SELECT * FROM TBL_StudentInfo;


UPDATE TBL_StudentInfo
SET Address = '123 Main Street'
WHERE Student_ID = 3;


DELETE FROM TBL_StudentInfo
WHERE Student_ID = 2;


-- Alter the table to increase the length of the Gender column
ALTER TABLE TBL_StudentInfo
MODIFY COLUMN Gender VARCHAR(10);


UPDATE TBL_StudentInfo
SET Gender = 'Male'
WHERE Gender = 'M';

UPDATE TBL_StudentInfo
SET Gender = 'Female'
WHERE Gender = 'F';

-- Truncate the table
TRUNCATE TABLE TBL_StudentInfo;

DESCRIBE TBL_StudentInfo;

SELECT * FROM TBL_StudentInfo;

