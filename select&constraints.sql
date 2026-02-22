-- select * from myemp where first_name like "C%"; 
-- select * from myemp where first_name like "%C"; 
-- select * from myemp where first_name like "%d"; 
-- select * from myemp where first_name like "%C%"
-- select * from myemp where first_name like "J____"; 
-- row level functions , group/aggregate functions -sum(), avg(), min(), max(), count(), stdev()
-- select sum(salary) from myemp; 
-- select avg(salary) from myemp; 
-- select avg(salary), min(salary), max(salary) from myemp; 
 -- select count(*) from myemp;  
 -- select dep_id, avg(salary) from myemp group by dep_id; 
 -- select dep_id, mgr_id, avg(salary) from myemp group by dep_id, mgr_id; 
 -- select count(*) from myemp where dep_id=50; 
 -- select count(*) from myemp where salary>10000; 
 -- select count(*) from myemp where salary>10000 group by dep_id; 
 -- select dep_id,count(*) from myemp where salary>10000 group by dep_id;
-- select dep_id, avg(salary) from myemp where dep_id in (30,50,90) group by dep_id;  
-- select dep_id, avg(salary) from myemp group by dep_id having dep_id in (30,50,90); 
-- select dep_id, avg(salary) from myemp group by dep_id having dep_id in (30,50,90) order by avg(salary); 
-- constraints -domain, key, referential integrity 
-- domain - unique, not null, check, default 
-- students table - sid, sname, age, course 
-- make sure there are no duplicate records
-- unique constraint on sid, not null values in sname , check constraint age>25 , default constraint ="MySQL"
-- create new table learners 
-- create table learners(sid int unique , sname, varchar(50) not null, age int check(age>21), course varchar(50) default "MySQL"); 


-- desc learners; 
-- insert into learners(sid, sname, age) values( 1, "Akash", 30); 
-- insert into learners(sid, sname, age) values( 1, "Akash", 30); 
-- no duplicate records
-- no null values in name column 
-- insert into learners(sid, sname, age) values( 2, null, 30); 
-- insert into learners(sid, sname, age) values( 2, "suresh", 20); 
-- change default value
-- insert into learners values(2, "suresh", 25, "Tableau"); 
-- select * from learners; 
-- key constraint - primary key and unique key 
-- primary key can allow unique and not null values 
-- unique key can allow unique and null values 
-- there should always be one primary key column 
-- select * from myemp; 
-- desc myemp; 
-- referential integrity constraint 
-- for example we have a new table students with columns sid, name, age, course, fee, duration , then check for repeating columns, bulk repeating columns like course, fee, duration 
-- so it is better to create a new table called as course and include cid, name , fee and duration as columns
-- similary create another students table sid, sname, age and cid to make the relationship 
-- effort is reduced , primary key is cid in course table and sid in students table 
-- foreign key is cid in students table
-- primary key will not have duplicates , foreign key will have duplicates 
-- students table is child and course table is parent 
-- cannot delete a parent row , need permissions from child , say on delete cascade , on update cascade 


 
 
 
 