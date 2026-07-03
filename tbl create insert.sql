create database mydatabase1;
use mydatabase1;
create table salesman(
	salesman_id int,
    name varchar(50),
    city varchar(20),
    commission float(2)
);

drop table salesman;
insert into salesman values
('5001','james hoog','new york','0.15'),
('5002','nail knite','paris','0.15'),
('5005','pit Alex','London','0.11'),
('5006','Mc Lyon','paris',0.14),
('5003','lauson hen','','0.12'),
('5004','paul Adam','Rome','0.13');
select * from salesman; 

use mydatabase1;
create table customer(
customer_id int,
cust_name varchar(50),
city varchar(50),
grade int,
salesman_id int
);

drop table customer;
insert into customer (customer_id,cust_name,city,grade,salesman_id)values 
(3002,'Nick  Rimando','New York',100,5001),
(3005,'Graham Zusi','California',200,5002);
insert into customer (customer_id,cust_name,city,salesman_id)values
(3001,'Brad Guzan','London',5005);
insert into customer (customer_id,cust_name,city,grade,salesman_id)values 
(3004,'Fabian Johns','Paris',300,5006),
(3007,'Brad Davis','New York',200,5001),
(3009,'Geoff Camero','Berlin',100,5003),
(3008,'Julian Green','LOndon',300,5002),
(3003,'Jozy Altidor','Moscow',200,5007);
select * from customer;


drop table orders;
use mydatabase1;
create table orders(
ord_no int,
purch_amt float,
ord_date date,
customer_id int,
salesman_id int
);

insert into orders values
('70001','150.5','2012-10-05','3005','5002'),
('70009','270.65','2012-09-10','3001','5005'),
('70002','65.26','2012-10-05','3002','5001'),
('70004','110.5','2012-08-17','3009','5003'),
('70007','948.5','2012-09-10','3005','5002'),
('70005','2400.6','2012-07-27','3007','5001'),
('70008','5760','2012-09-10','3002','5001'),
('70010','1983.43','2012-10-10','3004','5006'),
('70003',' 2480.4','2012-10-10','3009','5003'),
('70012','250.45','2012-06-27','3008','5007'),
('70011',' 75.29','2012-08-17','3003','5007'),
('70013','3045.6','2012-04-25','3002','5001');
select * from orders;


-- 1.Write a SQL statement to display names and city of salesman, who belongs to the city of paris? --

select * from salesman;
select name,city from salesman where city='paris';

-- 2.Write a SQL statement to display all the information for those customers with a grade of 200? -- 
select * from customer where grade=200;

-- 3.Write a SQL query to display the order number followed by order date and the purchase 
-- amount for each order which will be delivered by the salesman who is holding the ID 5001 --
select * from orders;
select ord_no,ord_date,purch_amt from orders where salesman_id=5001;

-- Write a SQL statement to find those salesmen with all information who come from the city 
-- either Paris or Rome  --
select * from salesman where city='paris' or city='rome';  -- Or just write using in operator or just write city ='paris' --

-- Write a query to filter those salesmen with all information who comes from any of the cities 
-- Paris and Rome  --
 select * from salesman where city in ('paris','rome');
 
 -- Write a query to produce a list of salesman_id, name, city and commision of each 
-- salesman who live in cities other than Paris and Rome. --
select salesman_id,name,city,commission from salesman where city not in ('paris','rome');

-- Write a query to sort out those customers with all information whose ID value is within any 
-- of 3007, 3008 and 3009 ? --
select * from customer where customer_id in (3007,3008,3009);

-- Write a SQL statement to find those salesmen with all information who gets the 
-- commission within a range of 0.12 and 0.14? -- 
select * from salesman where commission between 0.12 and 0.14;    

-- Write a query to filter all those orders with all information which purchase amount value is--  
-- within the range 500 and 4000 except those orders of purchase amount value 948.5 and -- 
-- 1983.43? -- 
select * from orders where purch_amt between 500 and 4000 and purch_amt not in(948.5,1983.43);
alter table orders modify purch_amt decimal (10,2);

-- Write a SQL statement to find those salesmen with all other information and name started 
-- with any latter within 'A' and 'K'. --

select * from salesman where name between 'A%'and'K%';

select * from customer  where cust_name like 'B%';

select * from salesman where name like'N___I%';


select name from salesman  s join customer c on s.salesman_id=c.salesman_id;
select * from customer c left outer join salesman s on c.city=s.commission;
select * from customer c right outer join salesman s on c.city=s.commission;



select orders.ord_no,purch_amt as "orders", customer.cust_name,city as "customer";



select sum(purch_amt) from orders;

select avg(purch_amt) from orders;

select count(distinct salesman_id)  from salesman;

select * from customer as graded_customer where grade is not null;

select max(purch_amt) from orders;

select max(grade) highest_grade from customer group by city;

select max(purch_amt) from orders group by customer_id;

select customer_id,ord_date,max(purch_amt)from orders group by customer_id,ord_date;

select salesman_id,max(purch_amt) from orders where ord_date = '2012-08-17' group by salesman_id;



-- 1.Write a SQL statement to prepare a list with salesman name, customer name and their 
-- cities for the salesmen and customer who belongs to the same city --  


select salesman.name as "salesmen",customer.cust_name as "customer",customer.city as "customer" from salesman join customer on salesman.city=customer.city;

select orders.order_no as "orders",orders.purch_amt as "orders",customer.cust_name as "customer",customer.city as "customer" where orders.purch_amt between 500 and 3000;
