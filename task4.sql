


CREATE TABLE Students (
    ID INT PRIMARY KEY,
    Name VARCHAR(20) NOT NULL,
    dateOfBirthday DATE,
    address VARCHAR(20)
);

CREATE TABLE family_info (
    ID INT PRIMARY KEY,
    student_ID INT,
    father_name VARCHAR(20),
    Phone VARCHAR(20),
    FOREIGN KEY (student_ID) REFERENCES Students(ID)
);

CREATE TABLE Courses (
    course_ID INT PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL,
    description VARCHAR(20),
    resource VARCHAR(100)
);

CREATE TABLE Classes (
    class_ID INT PRIMARY KEY,
    classcode INT NOT NULL,
    ClassName VARCHAR(20),
    RoomNumber INT NOT NULL,
    schedule VARCHAR(20)
);

CREATE TABLE Assignments (
    assignment_ID INT PRIMARY KEY,
    nameAssignments VARCHAR(20),
    description VARCHAR(50),
    dueDate DATE,
    States VARCHAR(10)
);

CREATE TABLE Attendance (
    attendance_ID INT PRIMARY KEY,
    student_ID INT,
    attendance_date DATE,
    absence_type VARCHAR(20),
    reason VARCHAR(100),
    FOREIGN KEY (student_ID) REFERENCES Students(ID)
);

CREATE TABLE StudentCourses (
    student_ID INT,
    course_ID INT,
    FOREIGN KEY (student_ID) REFERENCES Students(ID),
    FOREIGN KEY (course_ID) REFERENCES Courses(course_ID)
);

CREATE TABLE student_assignments (
    student_ID INT,
    assignment_ID INT,
    submission_date DATE,
    status VARCHAR(10),
    FOREIGN KEY (student_ID) REFERENCES Students(ID),
    FOREIGN KEY (assignment_ID) REFERENCES Assignments(assignment_ID)
);

CREATE TABLE student_classes (
    student_ID INT,
    classID INT,   
    FOREIGN KEY (student_ID) REFERENCES Students(ID),
    FOREIGN KEY (classID) REFERENCES Classes(class_ID)
);


INSERT INTO Students (ID, Name, dateOfBirthday, address) VALUES 
(1, 'Khaled', '2000-10-24', 'Irbid'),
(2, 'Bilal', '1997-10-24', 'Amman'),
(3, 'Ayman', '1996-10-23', 'UAE');

INSERT INTO family_info(ID, student_ID, father_name, Phone) VALUES
(1, 1, 'ahmed', '07999999999'),
(2, 2, 'laith', '077777777'),
(3, 3, 'bashar', '07888888888');

INSERT INTO Courses(course_ID, course_name, description, resource) VALUES
(1, 'c#', 'basic', 'zero'),
(2, 'html', 'middle', 'Gamal'),
(3, 'css', 'native', 'tarmeez');

INSERT INTO Classes(class_ID, classcode, ClassName, RoomNumber, schedule) VALUES
(1, 101, 'math 101', 201, 'sunday 8:00-9:00'),
(2, 102, 'total 101', 202, 'monday 8:00-9:00'),
(3, 103, 'rtc 101', 203, 'friday 8:00-9:00');

INSERT INTO Assignments(assignment_ID, nameAssignments, description, dueDate, States) VALUES
(1, 'Math Homework 1', 'Solve algebra problems', '2024-02-15', 'pending'),
(2, 'Physics Lab 1', 'Conduct physics experiment', '2024-02-20', 'pending'),
(3, 'CS Project 1', 'Create a small program', '2024-02-25', 'completed');

INSERT INTO Attendance(attendance_ID, student_ID, attendance_date, absence_type, reason) VALUES
(1, 1, '2024-02-01', 'absence', 'Sick'),
(2, 2, '2024-02-02', 'late', 'Traffic'),
(3, 3, '2024-02-03', 'leaving', 'Personal matter');

INSERT INTO StudentCourses(student_ID, course_ID) VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO student_assignments(student_ID, assignment_ID, submission_date, status) VALUES
(1, 1, '2024-02-14', 'submitted'),
(2, 2, '2024-02-18', 'not submitted'),
(3, 3, '2024-02-24', 'submitted');


INsert INTO student_classes (student_ID,classID) Values 
(1, 1),
(2, 2),
(3, 3);


select*from Students Where dateOfBirthday ='2000-24-10';


select*from Courses Where course_name='c#';


Alter Table Students ADD Email Varchar(50);


Insert INTO Students (ID,Name,dateOfBirthday,address ) values
(4,'Ali','15-4-2001','KSA');




Select *

from Students 
Where ID IN (Select student_ID From family_info)

