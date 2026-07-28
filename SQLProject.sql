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
 select sysdate();
 select current_timestamp();
 select * from customers;
 select year(accountcreation_date) as year_of_creation from customers;
 select month(accountcreation_date) as month_of_creation from customers;
 select day(accountcreation_date) as day_of_creation from customers;
 select hour(now()),minute(now()),second(now());
 
 select datediff(now(),accountcreation_date) as total_days from customers;
 select datediff(now(),accountcreation_date) as total_days from customers
 order by total_days limit 1;
 select * from loans;
 select datediff(EndDate, StartDate) as duration_loan from loans;
 select date_add(now(), interval 6 month);
 select date_add(now(), interval 6 day);
 select customerid,date_add(accountcreation_date, interval 6 month)
 as lokinperiod from customers;
  select greatest("2026-07-16","2026-08-11","2026-01-16","2026-11-26")
 as the_gretest_value from customers limit 1;
  select least("2026-07-16","2026-08-11","2026-01-16","2026-11-26")
 as the_least_value from customers limit 1;
 
 #string function
 select upper(firstname), lower (lastname),
 lower(concat(firstname," ", lastname)) as full_name from customers;
 select length(firstname) from customers;
 select left(firstname, 2), right(firstname, 2) from customers;
 
 #mathfunction
 select 4+7, 2-8, 4*9, 9/3, 7%4;
 select * from accounts;
 update accounts set Balance=Balance-15000 where AccountID= 101;
 select round(267.45,2), floor(254.76);
 select ceil(254.76), floor(254.76);
 select truncate(400.590,2), round(400.590,2);
 select abs(-456), abs(456);
 select power(2,3);
 select exp(3);
 
 #test
 select * from accounts;
 select min(balance)from accounts;
 select * from accounts order by (balance);
  select * from accounts (balance);
  select * from accounts
 select AccountID,AccountType,Balance from accounts where AccountType="Current" or
 TransactionType= "Savings";
 select avg(Balance) from accounts;
 select avg(Balance),AccountType from accounts;
 
 #JOINTS
 select * from customers;
 select * from accounts;
 
 select c.customerid, c.firstname,a.balance from customers c
 inner join accounts a
 on c.customerid=a.customerid;
 update accounts set AccountID=12 where AccountType="Saving";
 update customers set CustomerID=101 where FirstName="rushi";
 set sql_safe_updates=0;
 update customers set CustomerID=102 where FirstName="dayasagar";
 update customers set CustomerID=103 where FirstName="sumit";
 select c.customerid, c.firstname,a.balance from customers c
 inner join accounts a
 on c.customerid=a.customerid;
update accounts set AccountID=12 where AccountType="Saving";
update accounts set CustomerID=102 where AccountType="Current";
 select c.customerid, c.firstname,a.balance from customers c
 left join accounts a
 on c.customerid=a.customerid;
 select c.customerid, c.firstname,a.balance from customers c
 right join accounts a
 on c.customerid=a.customerid
 ALTER TABLE transactions
 add  column CustomerID INT
 ALTER TABLE transactions
 add  column CustomerID INT
 insert into transactions(CustomerID) values (101),(102),(103)
 select * from transactions;
 
 select c.CustomerID, c.Firstname,t.amount, t.transactionDate from customers c
 inner join transactions t on  c.customerid= t.customerid where c.customerid=2;
 alter table transactions
   add CustomerID varchar(20)
   
   
   select * from transactions;
   select * from transactions;
 
 update transactions set CustomerID=101 where TransactionID="10111";
 update transactions set CustomerID=102 where TransactionID="10222";
 update transactions set CustomerID=103 where TransactionID="10333";
 update transactions set CustomerID=101 where TransactionID="10444";
 update transactions set CustomerID=102 where TransactionID="10555";
 update transactions set CustomerID=103 where TransactionID="10666";
 update transactions set CustomerID=101 where TransactionID="10777";
 update transactions set CustomerID=105 where TransactionID="10888";
 update transactions set CustomerID=104 where TransactionID="10999";
 select c.customerid, c.firstname,a.balance from customers c
 left join accounts a
 on c.customerid=a.customerid union;
 select c.customerid, c.firstname,a.balance from customers c
 left join accounts a
 on c.customerid=a.customerid union;
 select c.customerid, c.firstname,a.balance from customers c
 left join accounts a
 on c.customerid=a.customerid;
 select c.customerid, c.firstname,a.balance from customers c
 right join accounts a 
 
  select c.customerid, c.firstname,a.balance from customers c
 left join accounts a
 on c.customerid=a.customerid union
 select c.customerid, c.firstname,a.balance from customers c
 right join accounts a
 on c.customerid=a.customerid;
  select c.customerid, c.firstname,a.balance from customers c
 left join accounts a
 on c.customerid=a.customerid union
 select c.customerid, c.firstname,a.balance from customers c
 right join accounts a
 on c.customerid=a.customerid;
 
 select c.customerid, c.firstname,c.lastname,t.TransactionDate,t.Amount
 from customers c join transactions t
 on c.customerid= t.customerid;
 
 select c.customerid, c.firstname,c.lastname,t.TransactionDate,t.Amount
 from customers c  right join transactions t
 on c.customerid= t.customerid;
 select c.customerid, c.firstname,c.lastname,t.TransactionDate,t.Amount
 from customers c  left join transactions t
 on c.customerid= t.customerid;
  
  select c.customerid, c.firstname,c.lastname,t.TransactionDate,t.Amount
 from customers c  right join transactions t
 on c.customerid= t.customerid union
 select c.customerid, c.firstname,c.lastname,t.TransactionDate,t.Amount
 from customers c  left join transactions t
 on c.customerid= t.customerid;
 
 #cross join
 select c.customerid, c.firstname,c.lastname,t.TransactionDate,t.Amount
 from customers c  cross join transactions t
 on c.customerid= t.customerid;
 select c.customerid, c.firstname,c.lastname,t.TransactionDate,t.Amount
 from customers c  cross join transactions t;  without on
 
 #group by using joins

 select c.customerid, sum(t.Amount)from customers c 
 inner join transactions t
 on c.customerid= t.customerid
 group by c.customerid;
 
 select c.customerid, max(a.balance)from customers c 
 inner join accounts a
 on c.customerid= a.customerid
 group by c.customerid;

select * from accounts  max(balance);
select * from accounts  max(balance);
select max(balance);
select max(Balance) from accounts;

#subquery

select * from accounts having
balance = (select max(balance) from accounts);
select * from accounts having
balance > (select avg(balance) from accounts);
select * from transactions having
amount > (select avg(amount) from transactions);
select avg(amount) from transactions;

select c.customerid, min(a.balance)from customers c 
 inner join accounts a
 on c.customerid= a.customerid
 having
balance > (select min(balance) from accounts);

select c.customerid,c.firstname, c.lastname, min(a.balance)from customers c 
 inner join accounts a
 on c.customerid= a.customerid
 group by c.customerid;
 
 select c.customerid, c.firstname, min(a.balance)from customers c 
 inner join accounts a
 on c.customerid= a.customerid
 
select customerid, min(balance) from accounts having
amount = (select min(amount) from accounts);
select customerid, min(balance) from accounts 
amount = (select min(amount) from accounts);

 
select customerid, Balance from accounts having
balance = (select max(balance) from accounts);

select customerid, Balance from accounts having
balance = (select min(balance) from accounts);

select * from customer
where customerid in (select customerid from accounts where balance in 
select max(balance) from accounts));

select * from customers
where customerid in (select customerid from accounts where balance =
(select max(balance) from accounts));
 
 select * from customers
where customerid in (select customerid from accounts where balance =
(select min(balance) from accounts));
select * from accounts;

#views
create view top_5 as
Select AccountID,Balance from accounts order by Balance desc limit 5;
select * from top_5;
Select LoanID,LoanAmount from Loans order by LoanAmount desc limit 6;
select * from top_5;

Select TransactionID,CustomerID,Amount from Transactions order by Amount desc limit 2;
select * from top_5;
create view top_2 as
select c.customerid, c.firstname,c.lastname,t.transactionid,t.TransactionDate,t.Amount
 from customers c join transactions t
 on c.customerid= t.customerid
 order by amount desc limit 2;
 select * from top_2;
 
 #create or replace
 
 #Index
 create index idx_firstname on customers(customerid);
 describe customers;
 select idx_firstname from customers;
 select email,phone from customers where idx_firstname="kajal";

#ifnull
select ifnull(email, "Not Available") from customers;
select if(year(now())=2025, "Current Year", "Previous Year");
select Balance,if(Balance>40000, "Maintained", "Not Maintained") from accounts;

#row_number
select accountid, Balance, row_number() over (order by Balance)
from accounts;

select accountid, Balance, sum(Balance) over (order by Balance)
as running_total 
from accounts;

select accountid, Balance,AccountTYpe, row_number() over (partition by AccountType order by Balance desc)
from accounts;

update transactions set Amount=null  where Transactionid="10111";
set sql_safe_updates=0;
select * from transactions;
update transactions set Amount=null  where Transactionid="10333";
update transactions set Amount=null  where Transactionid="10555";


select c.customerid, c.firstname,c.lastname,t.transactionid,t.TransactionDate,t.Amount
 from customers c join transactions t
 on c.customerid= t.customerid
where Amount is null;

#3tablejoins

select c.customerid, c.firstname,c.lastname,t.transactionid,t.TransactionDate,t.Amount,a.balance
 from customers c join transactions t
 on c.customerid= t.customerid
 join accounts a
 on c.customerid=a.customerid
 where a.balance>40000;
 
 #selfjoin
 
 select c.firstname, o.email, o.phone from customers c
 join customers o on
 c.customerID= o.customerID;
 


  