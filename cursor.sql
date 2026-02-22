-- cursor is an object , just like views , sequence object
-- reading a data from 1 table and writing the data into another table
-- select * from products limit 10; 
-- desc orders table; in this table prouct id and vendor name we have to give , both these details are available in products table
-- declare the cursor 
-- declare <cursor-name> cursor for select pcode,pvendor,qtyinstock from products; 
-- open the cursor 
-- open <cursor-name> , it will point to the firts record
-- Fetch the data from the cursor and keep it into local variables
-- fetch <cursor-name> into lcl_pcode, lcl_pvendor,lcl_qty
-- if lcl_qty<1000 then insert into orders table
-- elseif lcl_qty between 1000 and 3000 then inser into orders table
-- entire operation we have to give in loop 
-- <loop-name>: loop 
-- declare continue handler for not found , give a logic between BEGIN and END statements
-- select * from orders; 
-- execute sub query , call proc_cursor();  
-- select * from orders; 

-- row level functions , year() 
-- aggregate functions, sum(), avg(), min(), max(); 
-- they are all pre-defined functions  
-- let us find out the experience of employees
-- select emp_id,first_name,last_name,experience(emp_id) from myemp; - it will throw error no such function as experience
-- use hire_date column in myemp table, make use of year function year(now())-year(hire_date)
-- SET GLOBAL log_bin_trust_function_creators = 1; first execute this query , otherwise first time when you are creating function , it will throw error
-- CREATE FUNCTION `experience` (eid int)
-- BEGIN
-- declare exp int default 0; 
-- select year(now())-year(hire_date) into exp from myemp where emp_id=eid; 
-- return exp; 
-- END


-- now execute 


