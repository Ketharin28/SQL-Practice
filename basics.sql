show databases;

create database animals; 
show databases; 
use animals; 

create table cats (name varchar(10) , age int); 
show tables;  
desc cats; 

show columns from cats;  
 
 drop tables cats;  
 
 show tables; 
 
 select database();   
 
 drop database animals; 
 
 create database students;  
 use students; 
 create table student(sid int , name char(50) , age int , course char(30));  
 
 show tables; 
 desc student; 
 
 
insert into student values(1, "excelr", 25 , "MySQL") ; 
select * from student;  

insert into student values(2, "solutions" , 30 , "MySQL"); 

select * from student;  
create table patients(pid int , name varchar(50), dob date , toa datetime); 
show tables; 
desc patients;  
insert into patients values(1, "xyz", "1990-05-10", "2023-12-26 10:00:00");  
select * from patients;  

 -- add column marks to my table student
 alter table student add column marks int; 
 desc student; 
 -- drop column age from my table student
 alter table student drop column age; 
 desc student; 
 
 -- change column name sid to std_id
 alter table student change column sid std_id int;  
 desc student; 
 
 -- modeify column name , change data type to varchar(100)
 alter table student modify column name varchar(100); 
 
 desc student; 
 
 -- rename table student to myclass 
 rename table student to myclass;  

show tables;  
-- to select all the records from table myclass 
select * from myclass;  

-- print statement select 
select(2+2);
select(2+2) as result;

insert into patients values(1, "xyz", "1990-05-10", "2023-12-26 10:00:00");
-- working with now functions
insert into patients values(2, "abc", "1992-07-31", now()); 


select * from patients; 
select 2>3 as result;  
select 2=2 as result;
select 2=null as result; 
select 2 is null as result;  
select 2 is not null as result; 

-- DML commands, insert , delete, update 

select * from myclass;  

insert into myclass values(3, "ltd", "tableau", 70); 

select * from myclass;  
-- entering multiple records using insert command into table 
insert into myclass values(4, "xyz", "tableau", 80), (5, "abc", "MySQL", 90); 
select * from myclass;
SET SQL_SAFE_UPDATES = 0; 
update myclass set course = "Tableau" ; 
-- all the records in table myclass with course as tableau 
select * from myclass;   
update myclass set marks = 75 where std_id = 1;  
update myclass set marks = 80 where std_id = 2; 

select * from myclass; 

-- delete from myclass where std_id = 6
-- delete from myclass;
-- truncate table myclass; 
  
  











 




 
   


 
 
 
 
 
 
 

 





