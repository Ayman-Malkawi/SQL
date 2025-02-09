Create DataBase Library ;
CREATE TABLE Authors (                                                
    AuthorID INT PRIMARY KEY,                         
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthYear INT
);

Create Table Books (

BookID int Primary KEY , 
Title Varchar (30),
AuthorID INT , 
PublishedYear int , 
CopiesAvailable int ,
BookCategory varchar(90),
FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)

);

INSERT INTO Authors (AuthorID, FirstName, LastName, BirthYear) VALUES
(1, 'George', 'Orwell', 1903),
(2, 'J.K.', 'Rowling', 1965),
(3, 'J.R.R.', 'Tolkien', 1892),
(4, 'Agatha', 'Christie', 1890),
(5, 'Mark', 'Twain', 1835);

INSERT INTO Books (BookID, Title, AuthorID, PublishedYear, CopiesAvailable, BookCategory) VALUES
(1, 'the lord of the rings', 1, 1949, 10, 'Dystopian'),
(2, 'Harry Potter and the Sorcerer, Stone', 2, 1997, 20, 'Fantasy'),
(3, 'The Hobbit', 3, 1937, 15, 'Fantasy'),
(4, 'Murder on the Orient Express', 4, 1934, 8, 'Mystery'),
(5, 'The Adventures of Huckleberry Finn', 5, 1885, 12, 'Adventure');




SELECT Books.BookID, Books.Title, Authors.FirstName, Authors.LastName, Books.PublishedYear, Books.CopiesAvailable, Books.BookCategory
FROM Books
JOIN Authors ON Books.AuthorID = Authors.AuthorID;

SELECT AVG(PublishedYear) AS AveragePublicationYear
FROM Books;


SELECT COUNT(*) AS TotalBooksCount
FROM Books;


DELETE FROM Books;



ALTER TABLE Authors
ADD Email VARCHAR(255),
    Phone_Number VARCHAR(20);
