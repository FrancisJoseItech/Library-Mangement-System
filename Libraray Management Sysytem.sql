/*
Topic : Library Management System
You are going to build a project based on Library Management System. It keeps track of all information about books in the library, their cost, status and total number of books available in the library.
Create a database named library and following TABLES in the database:
1. Branch
2. Employee
3. Books
4. Customer
5. IssueStatus
5. ReturnStatus
Attributes for the tables:
1. Branch
Branch_no - Set as PRIMARY KEY 
Manager_Id 
Branch_address 
Contact_no
2. Employee 
Emp_Id – Set as PRIMARY KEY 
Emp_name 
Position 
Salary
Branch_no - Set as FOREIGN KEY and it refer Branch_no in Branch table 
3. Books 
ISBN - Set as PRIMARY KEY 
Book_title 
Category 
Rental_Price 
Status [Give yes if book available and no if book not available] 
Author 
Publisher
4. Customer 
Customer_Id - Set as PRIMARY KEY 
Customer_name 
Customer_address 
Reg_date
5. IssueStatus 
Issue_Id - Set as PRIMARY KEY 
Issued_cust – Set as FOREIGN KEY and it refer customer_id in CUSTOMER table  Issued_book_name
Issue_date
Isbn_book – Set as FOREIGN KEY and it should refer isbn in BOOKS table
6. ReturnStatus 
Return_Id - Set as PRIMARY KEY 
Return_cust 
Return_book_name 
Return_date 
Isbn_book2 - Set as FOREIGN KEY and it should refer isbn in BOOKS table
Display all the tables and Write the queries for the following :
1. Retrieve the book title, category, and rental price of all available books.
2. List the employee names and their respective salaries in descending order of salary.
3. Retrieve the book titles and the corresponding customers who have issued those books.
4. Display the total count of books in each category.
5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
7. Display the branch numbers and the total count of employees in each branch.
8. Display the names of customers who have issued books in the month of June 2023.
9. Retrieve book_title from book table containing history.
10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
*/
-- Create the database
CREATE DATABASE library;
-- Use the library database
USE library;
-- Create Branch table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);
-- Insert  records into Branch table
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 101, '123 Main St, Springfield', '555-1234'),
(2, 102, '456 Elm St, Shelbyville', '555-5678'),
(3, 103, '789 Maple St, Ogdenville', '555-8765'),
(4, 104, '101 Oak St, Capital City', '555-2345'),
(5, 105, '202 Pine St, North Haverbrook', '555-3456'),
(6, 106, '303 Birch St, Brockway', '555-4567'),
(7, 107, '404 Cedar St, Cypress Creek', '555-5678'),
(8, 108, '505 Willow St, West Springfield', '555-6789'),
(9, 109, '606 Aspen St, Monorail City', '555-7890'),
(10, 110, '707 Redwood St, South Haverbrook', '555-8901');

/*
Create Employee table
This table contains information about the employees working in various branches
*/
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(255),
    Position VARCHAR(255),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- Insert Records into Employee Table
iNSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(201, 'Alice Johnson', 'Manager', 60000, 1),
(202, 'Bob Smith', 'Clerk', 30000, 2),
(203, 'Charlie Davis', 'Assistant', 35000, 3),
(204, 'Diana Evans', 'Librarian', 45000, 4),
(205, 'Edward Harris', 'Manager', 65000, 5),
(206, 'Fiona Green', 'Clerk', 32000, 6),
(207, 'George White', 'Assistant', 34000, 7),
(208, 'Hannah King', 'Librarian', 47000, 8),
(209, 'Ian Wright', 'Manager', 62000, 9),
(210, 'Jane Brown', 'Clerk', 31000, 10);

/* 
Create Books table
This table stores information about the books available in the library 
including their title, category, rental price, etc.
*/
CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(255),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3),
    Author VARCHAR(255),
    Publisher VARCHAR(255)
);

-- Insert Records into Books Table
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
(301, 'The Great Gatsby', 'Fiction', 50, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
(302, 'To Kill a Mockingbird', 'Fiction', 55, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
(303, '1984', 'Dystopian', 60, 'no', 'George Orwell', 'Secker & Warburg'),
(304, 'Moby-Dick', 'Adventure', 65, 'yes', 'Herman Melville', 'Harper & Brothers'),
(305, 'War and Peace', 'Historical', 70, 'no', 'Leo Tolstoy', 'The Russian Messenger'),
(306, 'Pride and Prejudice', 'Romance', 45, 'yes', 'Jane Austen', 'T. Egerton'),
(307, 'The Catcher in the Rye', 'Fiction', 50, 'no', 'J.D. Salinger', 'Little, Brown and Company'),
(308, 'The Hobbit', 'Fantasy', 55, 'yes', 'J.R.R. Tolkien', 'George Allen & Unwin'),
(309, 'Crime and Punishment', 'Psychological', 60, 'no', 'Fyodor Dostoevsky', 'The Russian Messenger'),
(310, 'The Odyssey', 'Epic', 65, 'yes', 'Homer', 'Ancient Greece');

-- Create Customer table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(255),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

-- Insert Records into Customer Table
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(401, 'John Doe', '123 Elm St, Springfield', '2021-05-10'),
(402, 'Jane Smith', '456 Oak St, Shelbyville', '2020-11-23'),
(403, 'Michael Brown', '789 Pine St, Ogdenville', '2019-07-15'),
(404, 'Emily Davis', '101 Maple St, Capital City', '2018-03-30'),
(405, 'Sarah Wilson', '202 Birch St, North Haverbrook', '2017-12-05'),
(406, 'David Moore', '303 Cedar St, Brockway', '2016-08-19'),
(407, 'Laura Taylor', '404 Willow St, Cypress Creek', '2022-01-14'),
(408, 'James Anderson', '505 Redwood St, West Springfield', '2023-06-25'),
(409, 'Linda Martinez', '606 Aspen St, Monorail City', '2022-04-11'),
(410, 'Robert Jackson', '707 Fir St, South Haverbrook', '2021-09-09');

-- Create IssueStatus table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

-- Insert Records into IssueStatus Table
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(501, 401, 'The Great Gatsby', '2023-01-15', 301),
(502, 402, 'To Kill a Mockingbird', '2023-02-10', 302),
(503, 403, '1984', '2023-03-05', 303),
(504, 404, 'Moby-Dick', '2023-04-20', 304),
(505, 405, 'War and Peace', '2023-05-17', 305),
(506, 406, 'Pride and Prejudice', '2023-06-14', 306),
(507, 407, 'The Catcher in the Rye', '2023-07-01', 307),
(508, 408, 'The Hobbit', '2023-08-08', 308),
(509, 409, 'Crime and Punishment', '2023-09-23', 309),
(510, 410, 'The Odyssey', '2023-10-10', 310);

-- Create ReturnStatus table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 INT,
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

-- Insert Records into ReturnStatus Table
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(601, 401, 'The Great Gatsby', '2023-02-15', 301),
(602, 402, 'To Kill a Mockingbird', '2023-03-10', 302),
(603, 403, '1984', '2023-04-05', 303),
(604, 404, 'Moby-Dick', '2023-05-20', 304),
(605, 405, 'War and Peace', '2023-06-17', 305),
(606, 406, 'Pride and Prejudice', '2023-07-14', 306),
(607, 407, 'The Catcher in the Rye', '2023-08-01', 307),
(608, 408, 'The Hobbit', '2023-09-08', 308),
(609, 409, 'Crime and Punishment', '2023-10-23', 309),
(610, 410, 'The Odyssey', '2023-11-10', 310);

/* Queries
Retrieve the book title, category, and rental price of all available books.*/
SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';

-- List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;

-- Retrieve the book titles and the corresponding customers who have issued those books.
SELECT Books.Book_title, Customer.Customer_name
FROM IssueStatus
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id;

-- Display the total count of books in each category.
SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;

-- Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

-- List the customer names who registered before 2022-01-01 and have not issued any books yet.
-- Insert additional customers
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(411, 'Olivia Parker', '808 Willow St, Springfield', '2021-11-25'),
(412, 'Ethan Hall', '909 Oak St, Shelbyville', '2020-10-10'),
(413, 'Sophia Martinez', '111 Elm St, Ogdenville', '2019-09-05'),
(414, 'Mason Wright', '222 Pine St, Capital City', '2021-08-15'),
(415, 'Ava Allen', '333 Maple St, North Haverbrook', '2018-07-20');
SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

-- Display the branch numbers and the total count of employees in each branch.
-- Insert additional employees into Employee table
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(211, 'Chris Black', 'Clerk', 32000, 1),
(212, 'Megan Brown', 'Assistant', 34000, 1),
(213, 'Samuel Green', 'Librarian', 47000, 2),
(214, 'Isabella Johnson', 'Clerk', 31000, 2),
(215, 'Matthew Lee', 'Assistant', 35000, 3),
(216, 'Ava Taylor', 'Librarian', 46000, 3),
(217, 'Oliver Martinez', 'Clerk', 33000, 4),
(218, 'Sophia White', 'Assistant', 36000, 4),
(219, 'Elijah Harris', 'Librarian', 48000, 5),
(220, 'Lucas Walker', 'Clerk', 32000, 5),
(221, 'Mia Young', 'Assistant', 34000, 6),
(222, 'Amelia Hall', 'Librarian', 47000, 6),
(223, 'Charlotte Lewis', 'Clerk', 31000, 7),
(224, 'Evelyn King', 'Assistant', 35000, 7),
(225, 'Harper Allen', 'Librarian', 46000, 8),
(226, 'Benjamin Scott', 'Clerk', 33000, 8),
(227, 'James Adams', 'Assistant', 36000, 9),
(228, 'Henry Nelson', 'Librarian', 48000, 9),
(229, 'Alexander Carter', 'Clerk', 32000, 10),
(230, 'Grace Mitchell', 'Assistant', 34000, 10);
SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no;

-- Display the names of customers who have issued books in the month of June 2023.
SELECT Customer.Customer_name
FROM IssueStatus
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id
WHERE Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

-- Retrieve book_title from book table containing history.
-- Insert additional books containing 'history' in the title
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
(311, 'A Brief History of Time', 'Science', 70, 'yes', 'Stephen Hawking', 'Bantam Books'),
(312, 'The History of the Ancient World', 'History', 75, 'yes', 'Susan Wise Bauer', 'W. W. Norton & Company'),
(313, 'History of Western Philosophy', 'Philosophy', 80, 'yes', 'Bertrand Russell', 'Routledge');
SELECT Book_title
FROM Books
WHERE Book_title LIKE '%history%';

-- Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
-- Insert additional employees into Employee table to ensure some branches have more than 5 employees
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(231, 'Mason Wright', 'Clerk', 33000, 1),
(232, 'Logan Hill', 'Assistant', 35000, 1),
(233, 'Zoey Harris', 'Librarian', 47000, 2),
(234, 'Lily Clark', 'Clerk', 31000, 2),
(235, 'Jack Lewis', 'Assistant', 36000, 3),
(236, 'Ella Robinson', 'Librarian', 46000, 3),
(237, 'Daniel Perez', 'Clerk', 33000, 4),
(238, 'Aiden Martinez', 'Assistant', 36000, 5),
(239, 'Chloe King', 'Librarian', 48000, 5),
(240, 'Sophie White', 'Clerk', 32000, 6),
(241, 'Lucas Turner', 'Assistant', 34000, 6),
(242, 'Emily Moore', 'Librarian', 47000, 6),
(243, 'Ella Scott', 'Clerk', 31000, 7),
(244, 'Harper Thomas', 'Assistant', 35000, 7),
(245, 'Liam Anderson', 'Librarian', 46000, 8),
(246, 'Amelia Martinez', 'Clerk', 33000, 8),
(247, 'Ethan Brown', 'Assistant', 36000, 9),
(248, 'Mia Johnson', 'Librarian', 48000, 9),
(249, 'Benjamin Carter', 'Clerk', 32000, 10),
(250, 'Avery Wilson', 'Assistant', 34000, 10);
SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;