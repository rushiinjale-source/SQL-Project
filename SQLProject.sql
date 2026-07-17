show databases;
create database BankingDB;
use bankingDB;

CREATE TABLE Customers
(
		CustomerID INT,
        FirstName VARCHAR(50),
        LastName VARCHAR(50),
        Email VARCHAR(100),
        Phone VARCHAR(15),
        accountcreation_date date
        );
 Drop table Customers; 
 create table Accounts
 (
	AccountID INT,
    AccountType VARCHAR (20),
    Balance DECIMAL(10,2)
    );
    
CREATE TABLE Transactions (
    TransactionID INT,
    transactionDate DATE,
    Amount DECIMAL(10,2),
    transactionType VARCHAR(20)
    );
create table Branches (
	BranchID INT,
    BranchName VARCHAR(100),
    Branchaddress VARCHAR(200),
    BranchPhone VARCHAR(15)
    );
create table AccountBranches (
	assignmentDate DATE);
create table Loans (
	LoanID INT,
    LoanAmount DECIMAL (10,2),
    InterestRate DECIMAL (5,2),
    StartDate DATE,
    EndDate date
    );
    
ALTER TABLE Customers ADD DateOfBirth DATE;
select * from customers;
ALTER TABLE Customers MODIFY Phone VARCHAR(20);
ALTER TABLE Customers Drop DateOfBirth;
select * from customers;
alter table Accounts add primary key (AccountID); 

CREATE TABLE DR332(
	LearnerID int primary key,
    first_name varchar(50) not null,
    last_name varchar(50) unique,
    progress decimal(5,2) check (progress>75),
    branch varchar(50) default "Dadar"
    );

	
    
		
