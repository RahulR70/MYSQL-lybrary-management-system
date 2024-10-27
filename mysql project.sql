CREATE DATABASE Library;

USE Library;

CREATE TABLE Branch (
  Branch_no INT PRIMARY KEY,
  Manager_Id INT,
  Branch_address VARCHAR(200),
  Contact_no VARCHAR(20)
);

CREATE TABLE Employee (
  Emp_Id INT PRIMARY KEY,
  Emp_name VARCHAR(50),
  Position VARCHAR(50),
  Salary DECIMAL(10, 2),
  Branch_no INT,
  FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

CREATE TABLE Books (
  ISBN VARCHAR(20) PRIMARY KEY,
  Book_title VARCHAR(100),
  Category VARCHAR(50),
  Rental_Price DECIMAL(10, 2),
  Status VARCHAR(10),
  Author VARCHAR(50),
  Publisher VARCHAR(50)
);

CREATE TABLE Customer (
  Customer_Id INT PRIMARY KEY,
  Customer_name VARCHAR(50),
  Customer_address VARCHAR(200),
  Reg_date DATE
);

CREATE TABLE IssueStatus (
  Issue_Id INT PRIMARY KEY,
  Issued_cust INT,
  Issued_book_name VARCHAR(100),
  Issue_date DATE,
  Isbn_book VARCHAR(20),
  FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
  FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

CREATE TABLE ReturnStatus (
  Return_Id INT PRIMARY KEY,
  Return_cust INT,
  Return_book_name VARCHAR(100),
  Return_date DATE,
  Isbn_book2 VARCHAR(20),
  FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);




-- 1


SELECT Book_title, Category, Rental_Price 
FROM Books 
WHERE Status = 'yes';


-- 2


SELECT Emp_name, Salary 
FROM Employee 
ORDER BY Salary DESC;


-- 3


SELECT B.Book_title, C.Customer_name 
FROM Books B 
JOIN IssueStatus I ON B.ISBN = I.Isbn_book 
JOIN Customer C ON I.Issued_cust = C.Customer_Id;


-- 4


SELECT Category, COUNT(*) 
FROM Books 
GROUP BY Category;


-- 5


SELECT Emp_name, Position 
FROM Employee 
WHERE Salary > 50000;


-- 6


SELECT Customer_name 
FROM Customer 
WHERE Reg_date < '2022-01-01' 
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);


-- 7


SELECT B.Branch_no, COUNT(*) 
FROM Branch B 
JOIN Employee E ON B.Branch_no = E.Branch_no 
GROUP BY B.Branch_no;


 -- 8


SELECT C.Customer_name 
FROM Customer C 
JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust 
WHERE MONTH(Issue_date) = 6 AND YEAR(Issue_date) = 2023;


-- 9


SELECT Book_title 
FROM Books 
WHERE Book_title LIKE '%history%';


-- 10


SELECT B.Branch_no, COUNT(*) 
FROM Branch B 
JOIN Employee E ON B.Branch_no = E.Branch_no 
GROUP BY B.Branch_no 
HAVING COUNT(*) > 5;


-- 11


SELECT E.Emp_name, B.Branch_address 
FROM Employee E 
JOIN Branch B ON E.Emp_Id = B.Manager_Id;


-- 12


SELECT C.Customer_name 
FROM Customer C 
JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust 
JOIN Books B ON I.Isbn_book = B.ISBN 
WHERE B.Rental_Price > 25;


                                                       
                                                       