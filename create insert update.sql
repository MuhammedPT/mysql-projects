create database mydatabase;
use mydatabase;
create table marks(
stud_id int,
sub1 int,
sub2 int
);
insert into marks(stud_id,sub1,sub2) values
(3,40,47);
select * from marks;
create table studentdata(
	roll int,
	name varchar(50),
    phone int    
);

drop table studentdata;
select * from tblstudent;
alter table tblstudent add city varchar(50);
alter table tblstudent modify city varchar(50);
alter table tblstudent drop city;
alter table tblstudent rename to studentdata;


insert into studentdata values
(1,'abc',578940),
(3,'rohan',7865940),
(4,'john',56789);

select * from studentdata;
select * from marks;
select count(*)as total_student from student_data;
select count(name)from studentdata;
select max(sub1)from marks;
select min(sub2)from marks;
select sum(sub1)from marks;
select avg(sub2)from marks;




 

