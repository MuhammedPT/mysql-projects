create database cmpny;
use cmpny;
create table department(
ep_id int,
dep_name varchar(50),
dep_location varchar(20)
);
alter table department add primary key(ep_id);
insert into department(ep_id,dep_name,dep_location) values
(1001,'finance','sydney'),
(1002,'audit','melbourne'),
(1003,'marketing','perth'),
(1004,'production','brisbane');

select * from department;


use cmpny;
create table employees(
emp_id int,
emp_name varchar(50),
job_name varchar(50),
manager_id int,
hire_date date,
salary float,
commission float,
dep_id int
);
alter table employees add primary key(emp_id);
select* from employees;
insert into employees(emp_id,emp_name,job_name,hire_date,salary,dep_id) values
(68319,'KAYLING','PRESIDENT','1991-11-18',6000.00,1001 );
insert into employees(emp_id,emp_name,job_name,manager_id,hire_date,salary,dep_id) values
(66928,'BLAZE','MANAGER',68319,'1991-05-01',2750.00,3001),
(67832,'CLARE','MANAGER',68319,'1991-06-09',2550.00,1001),
(65646,'JONAS','MANAGER',68319,'1991-04-02',2957.00,2001), 
(67858,'SCARLET','ANALYST',65646,'1997-04-19',3100.00,2001), 
(69062,'FRANK','ANALYST',65646,'1991-12-03',3100.00,2001), 
(63679,'SANDRINE','CLERK',69062,'1990-12-18',900.00,2001);
insert into employees(emp_id,emp_name,job_name,manager_id,hire_date,salary,commission,dep_id) values 
(64989,'ADELYN','SALESMAN',66928,'1991-02-20',1700.00,400.00,3001),  
(65271,'WADE','SALESMAN',66928,'1991-02-22',1350.00,600.00,3001),
(66564,'MADDEN ','SALESMAN',66928,'1991-09-28',1350.00,1500.00,3001),
(68454,'TUCKER','SALESMAN',66928,'1991-09-08',1600.00,0.00,3001);
insert into employees(emp_id,emp_name,job_name,manager_id,hire_date,salary,dep_id) values
(68736,'ADNRES','CLERK',67858,'1997-05-23',1200.00,2001),
(69000,'JULIUS','CLERK',66928,'1991-12-03',1050.00,3001),
(69324,'MARKER','CLERK',67832,'1992-01-23',1400.00,1001);

select 
	emp_id,
    emp_name,
    job_name,
    manager_id,
    hire_date,
    salary,
    commission,
    dep_id,
    FORMAT(salary, 2) as salary,
	FORMAT(commission, 2) as commission
from employees;

select * from employees2;


use cmpny;
create table salary(
grade int,
min_sal int,
max_sal int
);

insert into salary(grade,min_sal,max_sal) values
(1,800,1300),
(2,1301,1500),
(3,1501,2100),
(4,2101,3100),
(5,3101,9999);

select * from salary;


-- Write a query in SQL to list the employees with Hire date in the format like February 22, 1991.? -- 
select hire_date from employees where hire_date='1991-02-22'; 

-- Write a query in SQL to list the employees who does not belong to department 2001.?--   
select * from employees where dep_id not in (2001); 

-- Write a query in SQL to display the unique department with jobs.? -- 
select distinct dep_id,job_name from employees;          -- distinct unique values from a column or set of columns, eliminating duplicate records in the query result -- 

-- Write a query in SQL to list the employees who joined before 1991.? -- 
select * from employees where hire_date < '1991-01-01';

-- Write a query in SQL to display the average salaries of all the employees who works as ANALYST.? --
select avg(salary) from employees;         -- finding average --

-- Write a query in SQL to list the name of the employees, those having six characters to their name? --
select length(emp_name) from employees;    -- finding length of a character--
 
-- Write a query in SQL to list the employees whose salaries are less than 3500?. -- 
select * from employees where salary<3500; 

-- Write a query in SQL to list the details of the employees whose salary is more than the salary of Jones? -- 
select * from employees where salary> (select salary from employees where emp_name='jonas');  -- this parenthesis means the sub query --

-- Write a query in SQL to list the employees who works in the same designation as FRANK.-- 
select * from employees where job_name=(select job_name from employees where emp_name='frank');

-- Write a query in SQL to list the employees of department ID 2001 who works in the designation 
-- same as department ID 1001. -- 

select * from employees where dep_id=2001 and job_name in(select distinct job_name from employees where dep_id=1001);



