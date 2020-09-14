# Create schema
create database adminappdb;

use adminappdb;

SET SQL_SAFE_UPDATES = 0;

# Create tables

CREATE TABLE IF NOT EXISTS student
(
    studentID INT NOT NULL,
    firstname VARCHAR(40),
    lastname VARCHAR(40),
    email VARCHAR(40),
    stuuniqueID VARCHAR(40),
    PRIMARY KEY(studentID)
);

CREATE TABLE IF NOT EXISTS  course
(
    courseID INT NOT NULL,
    coursename VARCHAR(50),
    coursestartdate VARCHAR(15),
    courseenddate VARCHAR(15),
    coursefee DECIMAL(6, 2),
    PRIMARY KEY(courseID)
);

CREATE TABLE IF NOT EXISTS enrollment
(
    student_studentID INT,
    course_courseID INT,
    coursecompleted TINYINT(1)    
);


CREATE TABLE IF NOT EXISTS certgeneratorlog
(
    student_studentID INT,
    course_courseID INT,
    GenerateDate DATETIME,
    CertificateURL VARCHAR(255)    
);

CREATE TABLE IF NOT EXISTS user
(
    firstname VARCHAR(40),
    lastname VARCHAR(40),
    username VARCHAR(40),
    password VARCHAR(40),
    userrole VARCHAR(40),
    permission VARCHAR(40)    
);


# Create FKs
ALTER TABLE enrollment
    ADD    FOREIGN KEY (student_studentID)
    REFERENCES student(studentID)
;
    
ALTER TABLE enrollment
    ADD    FOREIGN KEY (course_courseID)
    REFERENCES course (courseID)
;
    
ALTER TABLE certgeneratorlog
    ADD    FOREIGN KEY (student_studentID)
    REFERENCES student(studentID)
;
    
ALTER TABLE certgeneratorlog
    ADD    FOREIGN KEY (course_courseID)
    REFERENCES course (courseID)
;
  
select * from student;
select * from course;
select * from enrollment;
select * from user;
select * from certgeneratorlog;


