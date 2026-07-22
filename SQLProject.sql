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
 ALTER TABLE branches add primary key(branchID);
    select * from DR332;
    ALTER table BRANCHES
    ADD primary key (BranchID);
    ALTER TABLE BRANCHES
   add branchlocation VARCHAR (50);
   select * from branches;
   alter table accounts
   add customerID varchar(20);
   
   alter table Accounts
   add constraint FK_Accounts_Customers
   foreign key (customerID)
   references Customers(CustomerID);
   alter table accounts
   add CustomerID varchar(20);
   select * from accounts;
   
   ALTER TABLE Accounts
   ADD constraint FK_Accounts_Customers 
   foreign key (customerID)
   references Customers(CustomerID);
   drop table Customers;
   drop table Accounts;
   select * from customers;
   insert into customers(CustomerID,FirstName,LastName,Email,Phone,accountcreation_date)
   values(012,"rushi","injale","rushiinjale@gmail.com",8546930274,'2026-04-07');
   insert into customers(CustomerID,FirstName,LastName,Email,Phone,accountcreation_date)
	values(013,"dayasagar","mestry","dayamestry777gmail.com",8447938394,'2026-04-08');
insert into customers(CustomerID,FirstName,LastName,Email,Phone,accountcreation_date)
values(014,"sumit","khaire","sumitkhaire@gmail.com",8697857654,'2026-08-07');
insert into customers(CustomerID,FirstName,LastName,Email,Phone,accountcreation_date)
values(015,"vishal","potham","vishalpotham@gmail.com",8694039458,'2026-08-04');
insert into customers(CustomerID,FirstName,LastName,Email,Phone,accountcreation_date)
values(016,"prathmesh","ghure","prathughure@gmail.com",8097867656,'2026-09-08');
select * from customers;

#update
update customers set  lastname="patil" where Firstname="dayasagar";
set sql_safe_updates=0;
update customers set email="jojo1212@gmail.com" where customerID="015";
update customers set phone= 999999999 where customerID="012";
update customers set firstname="babu" where customerID="013";

#delete
delete from customers where firstname="sumit";
rollback;


#truncate table to remove all table structure remains same
delete from customers where firstname="sumit";
start transaction;
rollback;
select * from customers;
#DQL
select * from customers where firstname="rushi";
select * from customers where customerID="014";
select email,phone from customers where customerID="013";

#approximate match
select * from customers where firstname like "%i"; #endswitch
select * from customers where firstname like "a%";   
select * from customers where firstname like "b%"; #startswitch

select * from customers order by firstname;
select * from customers order by firstname desc;
select * from customers order by accountcreation_date desc;
select * from customers order by accountcreation_date desc limit 1; # latest customers
select * from customers order by accountcreation_date desc limit 1 offset 2;

insert into accounts(AccountID,AccountType,Balance,CustomerID)
values (101,"Saving",20000,1),
(102,"Current",25000,2),
(103,"Saving",30000,3),
(104,"current",40000,4),
(105,"Salary",50000,5),
(106,"Saving",25000,6),
(107,"Salary",70000,7),
(108,"Saving",90000,8),
(109,"Current",22000,9),
(110,"Saving",80000,10);
select * from accounts;
select * from accounts order by Balance;
select * from accounts order by Balance limit 3;
select * from accounts where Balance >40000;
select * from accounts where Balance >40000 and AccountType="Salary";
show tables;
insert into branches(BranchID,BranchName,Branchaddress,BranchPhone,branchlocation)
values("1","dadar","dadar east",9786758493,"sunshine plaza"),
("2","santacruz","santacruz east",9447589493," royalstone plaza"),
("3","khar","khar west",9365758493,"gold plaza"),
("4","vasai","dadar east",5376758493,"sliver plaza"),
("5","virar","virar east",738758493,"baby plaza"),
("6","thane","dadar west",53786758493,"rose plaza"),
("7","diva","diva east",9786758493,"shine plaza"),
("8","borivali","borivali west",4676758493,"moonshine plaza"),
("9","jogeshvari","thane east",7388798493,"ram plaza"),
("10","churchgate","dadar east",9376758493,"vishal plaza");
insert into branches(BranchID,BranchName,Branchaddress,BranchPhone,branchlocation)
values
("11","diva","dadar east",9376758493,"vishal plaza"),
("12","thane","dadar east",9376758493,"guru plaza"),
("13","dadar","dadar east",9376758493,"gogo plaza");

select * from branches;
# t0 find the unique account type
select distinct(AccountType) from accounts;
#group by
select min(balance) as minimum_amount, max(balance), sum(balance), count(balance), avg(balance),AccountType from accounts group by AccountType;
select (balance), AccountType from accounts group by Accounttype;
select sum(balance), AccountType from accounts group by Accounttype;
select max(balance), AccountType from accounts group by Accounttype;

select distinct(BranchName) from branches;

#NULL handling
select * from customers;
select * from customers where email is null;
select * from customers where last name is null;
select * from customers where email is not null;
insert into loans(LoanID,LoanAmount,InterestRate,StartDate,EndDate)
values("101",500000,5.8,"2022-07-27","2029-06-23"),
("102",150000,2.8,"2021-03-02","2030-06-22"),
("103",2500000,17.8,"2024-04-21","2026-06-20"),
("104",5000000,5.9,"2021-06-6","2027-04-23"),
("105",700000,12.8,"2022-07-25","2023-05-21"),
("106",100000,11.0,"2023-02-7","2029-06-11"),
("107",7500000,7.8,"2024-01-22","2029-07-12");
select * from loans;
select * from loans where StartDate>"2025-10-07";
select max(InterestRate) from loans;
select InterestRate from loans order by InterestRate desc limit 1;

#cases
select LoanID, LoanAmount,
case 
	when LoanAmount>700000 then "premium loan"
    when LoanAmount>150000 then "standard loan"
    else "basic loan"
    end
    as loan_Type from loans;
    
    select AccountID, Balance,
    case	
		when balance>50000 then "excellent balance"
        when balance>25000 then "good balance"
        else "bad balance"
        end
        as Account_Type from Accounts;
        
insert into transactions(TransactionID,transactionDate,Amount,transactionType)
values("10111",'2025-08-07',50000,"credit"),
("10222",'2025-01-02',50000,"cash"),
("10333",'2025-04-07',10000,"credit"),
("10444",'2026-08-22',55000,"cash"),
("10555",'2025-07-07',15000,"credit"),
("10666",'2026-08-27',20000,"cash"),
("10777",'2025-05-07',30000,"credit");
insert into transactions(TransactionID,transactionDate,Amount,transactionType)
values("10888",'2024-08-17',20000,"credit"),
("10999",'2026-06-02',10000,"UPI"),
("10112",'2025-04-09',40000,"credit"),
("10113",'2026-08-22',60000,"UPI"),
("10114",'2024-08-07',80000,"UPI");
select * from transactions;


#windows
#rank without partition
select TransactionID, Amount, rank() over ( order by Amount desc) from transactions;
select TransactionID, Amount, dense_rank() over (order by Amount desc) from transactions;
#rank with partition
select transactionID,Amount,transactiontype, rank() over (partition by transactiontype 
Order by Amount desc) as typewise_ranking from transactions;
select transactionID,Amount,transactiontype, dense_rank() over (partition by transactiontype 
Order by Amount desc) as typewise_ranking from transactions;
select transactionID,Amount,transactiontype, percent_rank() over (partition by transactiontype 
Order by Amount desc) as typewise_ranking from transactions;

#loans table
select LoanID, LoanAmount, rank() over ( order by LoanAmount) from loans;
select LoanID, LoanAmount, rank() over ( order by LoanAmount desc) from loans;
select LoanID, LoanAmount, dense_rank() over ( order by LoanAmount desc) from loans;
select LoanID, LoanAmount, percent_rank() over ( order by LoanAmount desc) from loans;
update loans set LoanAmount = 7500000 where LoanID=104;
set sql_safe_updates=0;


#lead and lag
select transactionID,Amount,lead(Amount) over  
(Order by Amount desc) as lead_Amount from transactions;
select transactionID,Amount,lag(Amount) over  
(Order by Amount desc) as lag_Amount from transactions;

#loans table
select LoanID,LoanAmount,lead(LoanAmount) over  
(Order by LoanAmount desc) as lead_LoanAmount from loans;
select LoanID,LoanAmount,lag(LoanAmount) over  
(Order by LoanAmount desc) as lag_LoanAmount from loans;
  
#membership
select transactionID,TransactionType,Amount from transactions where TransactionType in("Cash","Credit");

 #or
select transactionID,TransactionType,Amount from transactions where TransactionType="Cash" or
 TransactionType= "Credit";
 

#having Clause 
select min(Balance),AccountType from accounts group by AccountType;
select min(Balance),AccountType from accounts group by AccountType order by min(Balance);
select min(Balance),AccountType from accounts group by AccountType having (min(Balance)>22000) order by 
min(Balance);

select min(Amount),TransactionType from transactions group by TransactionType;
select max(Amount),TransactionType from transactions group by TransactionType order by max(Amount);
select min(Amount),TransactionType from transactions group by TransactionType having (min(Amount)>1500)
 order by min(Amount);
 select now();
 select current_date();
 