# Create schema

drop database adminappdb;
create database adminappdb;
use adminappdb;

SET SQL_SAFE_UPDATES = 0;

#AUTO_INCREMENT

# Create tables

CREATE TABLE IF NOT EXISTS student
(
    studentID INT NOT NULL AUTO_INCREMENT,
    firstname VARCHAR(40),
    lastname VARCHAR(40),
    email VARCHAR(40),
    status VARCHAR(20),
    createby VARCHAR(40),
    createdt DATE,
    updateby VARCHAR(40),
    updatedt DATE,
    PRIMARY KEY(studentID)
);

CREATE TABLE IF NOT EXISTS user
(
    userID INT NOT NULL AUTO_INCREMENT,
    firstname VARCHAR(40),
    lastname VARCHAR(40),
    username VARCHAR(40),
    password VARCHAR(40),
    emailaddress VARCHAR(40),
    userrole VARCHAR(40),
    permission VARCHAR(40),
    createby VARCHAR(40),
    createdt DATE,
    updateby VARCHAR(40),
    updatedt DATE,
    PRIMARY KEY(userID)
);

CREATE TABLE IF NOT EXISTS program
(
    programID INT NOT NULL AUTO_INCREMENT,
    programname VARCHAR(40),
    createby VARCHAR(40),
    createdt DATE,
    updateby VARCHAR(40),
    updatedt DATE,
    PRIMARY KEY(programID)
);

CREATE TABLE IF NOT EXISTS course
(
    courseID INT NOT NULL AUTO_INCREMENT,
    program_programID INT,
    coursename VARCHAR(50),
    coursestartdate VARCHAR(15),
    courseenddate VARCHAR(15),
    createby VARCHAR(40),
    createdt DATE,
    updateby VARCHAR(40),
    updatedt INT,
    PRIMARY KEY(courseID)
);

CREATE TABLE IF NOT EXISTS enrollment
(
    student_studentID INT,
    course_courseID INT,
    coursecompleted TINYINT(1),
    createby VARCHAR(40),
    createdt DATE,
    updateby VARCHAR(40),
    updatedt DATE    
);


CREATE TABLE IF NOT EXISTS certificate
(
    student_studentID INT,
    course_courseID INT,
    GenerateDate DATE,
    CertificateURL VARCHAR(255),
    createby VARCHAR(40),
    createdt DATE,
    updateby VARCHAR(40),
    updatedt DATE    
);


CREATE TABLE IF NOT EXISTS student_type
(
    student_studentID INT,
    stustatus VARCHAR(20) NOT NULL,
    stutype VARCHAR(20),
    createby VARCHAR(40),
    createdt DATE,
    updateby VARCHAR(40),
    updatedt DATE,
    PRIMARY KEY(stustatus)
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
    
ALTER TABLE certificate
    ADD    FOREIGN KEY (student_studentID)
    REFERENCES student(studentID)
;
    
ALTER TABLE certificate
    ADD    FOREIGN KEY (course_courseID)
    REFERENCES course (courseID)
;
    
ALTER TABLE student_type
    ADD    FOREIGN KEY (student_studentID)
    REFERENCES student(studentID)
;
    
ALTER TABLE student
    ADD    FOREIGN KEY (status)
    REFERENCES student_type(stustatus)
;
    
ALTER TABLE course
    ADD    FOREIGN KEY (program_programID)
    REFERENCES program(programID)
;
    

# Create tables

select * from student;
select * from course;
select * from enrollment;
select * from user;
select * from certificate;
select * from student_type;
select * from program;

