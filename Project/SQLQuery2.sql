CREATE TABLE BookCategories (
    CategoryID INT PRIMARY KEY,             
    CategoryName VARCHAR(100),          
    CategoryDescription TEXT            
);

CREATE TABLE Books (
    ID INT PRIMARY KEY,
    title VARCHAR(20),
    Author VARCHAR(20),
    Genre VARCHAR(20),
    PublicationYear DATE,
    AvailabilityStatus VARCHAR(20),
    Books_categories INT,
    FOREIGN KEY (Books_categories) REFERENCES BookCategories(CategoryID)
);

CREATE TABLE Members(
    ID INT PRIMARY KEY,
    name VARCHAR(20),
    ContactInformation VARCHAR(20),
    MembershipType VARCHAR(20),
    RegistrationDate DATE
);

CREATE TABLE Borrowing (
    ID INT PRIMARY KEY,
    Member_ID INT,
    Book_ID INT,
    BorrowingDate DATE,
    dueDate DATE,
    returnDate DATE,
    FOREIGN KEY (Member_ID) REFERENCES Members(ID),
    FOREIGN KEY (Book_ID) REFERENCES Books(ID)
);

CREATE TABLE LibraryStaff(
    ID INT PRIMARY KEY,
    Staff_Name VARCHAR(20),
    Contact_Info VARCHAR(20),
    Assigned_Section VARCHAR(20),
    Employment_Date DATE
);

CREATE TABLE Reservations (
    ID INT PRIMARY KEY, 
    MemberID INT,
    BookID INT,
    ReservationDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (MemberID) REFERENCES Members(ID),
    FOREIGN KEY (BookID) REFERENCES Books(ID)
);

UPDATE Borrowing  set returnDate ='2025-02-24' where ID=1;

INSERT INTO BookCategories (CategoryID, CategoryName, CategoryDescription) VALUES
(1, 'Fantasy', 'Books that explore futuristic concepts and imaginative worlds'),
(2, 'Science Fiction', 'Books that deal with futuristic technology, space exploration, and advanced sciences'),
(3, 'Historical Fiction', 'Books that blend historical events with fictional characters and narratives'),
(4, 'Mystery', 'Books that involve suspenseful investigations or crime-solving stories'),
(5, 'Romance', 'Books that focus on romantic relationships and emotional connections');

INSERT INTO Books (ID, title, Author, Genre, PublicationYear, AvailabilityStatus, Books_categories) VALUES
(1, 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy', '1937-09-21', 'Available', 1),
(2, '1984', 'George Orwell', 'Science Fiction', '1949-06-08', 'Available', 2),
(3, 'Pride and Prejudice', 'Jane Austen', 'Romance', '1813-01-28', 'Checked Out', 5),
(4, 'Sherlock Holmes', 'Arthur Conan Doyle', 'Mystery', '1887-10-14', 'Available', 4),
(5, 'War and Peace', 'Leo Tolstoy', 'Historical Fiction', '1869-01-01', 'Available', 3);

INSERT INTO Members (ID, name, ContactInformation, MembershipType, RegistrationDate) VALUES
(1, 'Alice Johnson', 'alice@email.com', 'Regular', '2025-02-01'),
(2, 'Bob Smith', 'bob@email.com', 'Premium', '2025-02-05'),
(3, 'Charlie Brown', 'charlie@email.com', 'Regular', '2025-01-20'),
(4, 'David Lee', 'david@email.com', 'Premium', '2025-02-10'),
(5, 'Eva Green', 'eva@email.com', 'Regular', '2025-01-30');

INSERT INTO Borrowing (ID, Member_ID, Book_ID, BorrowingDate, dueDate, returnDate) VALUES
(1, 1, 1, '2025-02-10', '2025-02-24', NULL),
(2, 2, 3, '2025-02-12', '2025-02-26', NULL),
(3, 3, 4, '2025-02-13', '2025-02-27', NULL),
(4, 4, 5, '2025-02-14', '2025-02-28', NULL),
(5, 5, 2, '2025-02-15', '2025-03-01', NULL);

INSERT INTO LibraryStaff (ID, Staff_Name, Contact_Info, Assigned_Section, Employment_Date) VALUES
(1, 'John Doe', 'john@email.com', 'Reference', '2020-06-15'),
(2, 'Sarah Parker', 'sarah@email.com', 'Childrens Section', '2022-09-05'),
(3, 'Emily Davis', 'emily@email.com', 'Science Fiction', '2021-03-20'),
(4, 'James Miller', 'james@email.com', 'Literature', '2019-11-10'),
(5, 'Olivia Taylor', 'olivia@email.com', 'Mystery', '2024-01-01');

INSERT INTO Reservations (ID, MemberID, BookID, ReservationDate, Status) VALUES
(1, 1, 1, '2025-02-10', 'Active'),
(2, 2, 3, '2025-02-12', 'Active'),
(3, 3, 4, '2025-02-13', 'Completed'),
(4, 4, 5, '2025-02-14', 'Active'),
(5, 5, 2, '2025-02-15', 'Active');


--1
select * from Members where  RegistrationDate= '2025-02-01';


--2
select * from Books where title ='The Hobbit';


--3
alter table Members ADD Email Varchar(20);


--4
INSERT INTO Members (ID, name, ContactInformation, MembershipType, RegistrationDate) values 

(6,'laith','0799999999','student','2-2-2020');



--5


Select*from Reservations join Members on MemberID = Members.ID;


--6

select*from Members join Borrowing on Member_ID = Members.ID
join Books on Book_ID = Books.ID

where title = 'Pride and Prejudice';



--7

select*from  Members join  Borrowing on Member_ID= Members.ID

join Books on Book_ID =Book_ID

where title  = 'The Hobbit'  and returnDate is not Null;


--8
select*from  Members join  Borrowing on Member_ID= Members.ID

join Books on Book_ID =Book_ID

where returnDate > dueDate;



--9

select COUNT(Borrowing.ID) as Book_count,title from Borrowing join Books on Book_ID=Books.ID

group by title having COUNT(Borrowing.ID)>3;



--10

select*from  Members join  Borrowing on Member_ID= Members.ID
join Books on Book_ID = Books.ID
where BorrowingDate between  '2025-02-10' and '2025-02-13' ;




--11

SELECT COUNT(*) 
FROM Books
WHERE AvailabilityStatus = 'Available';














