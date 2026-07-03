create database model;
use model;

						

-- select * from salesman order by commission asc;

-- select * from salesman; 
-- alter table salesman add contact int(10) not null;
-- alter table salesman modify contact varchar(10) null;

-- select * from salesman;
-- alter table salesman;
-- alter table salesman rename column contact to pincode;
-- alter table salesman drop column pincode;-- 


-- select * from salesman;
-- -- truncate table salesman;  --          truncate is removing the fields in a table not the entire table 

-- select * from salesman order by commission asc limit 5;
-- select * from salesman order by rand() limit 1;


-- select name as 'first_name',city as 'city_names',commission from salesman; 


-- select name from salesman  s join customer c on s.salesman_id=c.salesman_id;
-- select * from customer c left outer join salesman s on c.city=s.commission;
-- select * from customer c right outer join salesman s on c. city=s.commission;


