-- select * from myemp limit 10; 
-- select *,max(salary) from myemp;  
-- select first_name,last_name,max(salary) from myemp; 
-- select first_name,last_name from myemp where salary=max(salary); 
-- select first_name,last_name from myemp where salary=24000;
-- select max(salary) from myemp;  
-- sub query - outer and inner 
-- select first_name,last_name from myemp where salary=(select max(salary) from myemp); example of sub query 
-- select * from myemp where salary>(select avg(salary) from myemp) order by salary; -- multiple line of subquery
-- select avg(salary) from myemp; 
-- select dep_id,avg(salary) from myemp group by dep_id; 
-- select * from myemp as e where salary>(select avg(salary) from myemp where dep_id= e.dep_id) order by dep_id; another example 
-- select * from offices; 
-- select * from employees; 
-- for subquery just like joins check for a common column then proceed with writing subquery
-- select * from employees where officecode in(select officecode from offices where country="USA"); 
-- window functions or analytical functions
-- select dep_id,avg(salary) from myemp group by dep_id; ,an example of group by class 
-- for each employee , write the average salary of that dept next to the employee
-- select first_name,last_name,dep_id,salary,avg(salary) from myemp group by dep_id; 
-- window functions are usually used with over function and inside you can say order by or partition by which is just like group by 

-- select first_name,last_name,dep_id,salary,avg(salary) over(partition by dep_id) as Avg_salary from myemp; 
-- select * from sales; 

-- create table marks(namevarchar(50),score int); 
-- insert into marks values("akash",70),("ramesh",75),("swathi",80),("ali",77),("suresh",80); 
-- select * from marks; 
-- select name,score,rank() over(order by score desc) as rnk from marks; 
-- select name,score,dense_rank() over(order by score desc) as rnk from marks;

-- select * from sales; 
-- select *,dense_rank() over(partition by fiscal_year order by sale desc) as rnk from sales; 

