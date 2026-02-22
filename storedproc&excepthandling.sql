-- parameters example ,user can give any input and mysql will fetch that record using stored procedure 
-- create procedure proc_if (num int)
-- if num>0 then 
-- select "Number is positive" as Message; 
-- elseif num=0 then 
-- select "Number is Zero" as Message;
-- else
-- select "Number is Negative" as Message; 
-- end if; 
-- write this code within begin and end statements 
-- select("hello world") as greeting; print statement

-- loops - simple, repeat until loop, do while loop, first start with loop name: loop and enter the query
-- myloop: loop 
-- select "Hello world" as greeting; 
-- end loop myloop; 
-- write these statements within begin and end statements; 
-- but this loop will get executed infinite times 
-- so if condition to decide how many times you want to print the statement 
-- declare cnt int default 0; 
-- myloop: loop 
-- select "Hello world" as greeting;
-- set cnt=cnt+1; 
-- if cnt=3 then
-- leave myloop; 
-- end if; 
-- end loop myloop;

-- try to use parameter - give num int and change if cnt = num 

-- exception handling or error handling 
-- for example give select * from author; it will throw error , table doesnot exist , we get error code and sql state 
-- we can handle error code or sql state, we have many error codes and many sql states , you can find it 
-- to handle all error codes and sql states, we can give sql exception 
-- simple syntax can be 
-- declare<continue/exit> handles 
-- for error code
-- for sql state
-- for sql exception 
-- begin

-- end 

-- take an example
-- select * from payments; 
-- desc payments; 
-- this will have 2 columns client_id,amount(not null constraint); 
-- we cannot enter null values, if you enter it will throw error , then handle that error , and get the details of this record or customer who is entering null value
-- we can put that customer name in fraud table and give message as fraude transaction 
-- select * from fraud; 
-- desc fraud;   

-- create a stored procedure proc_fraud
-- insert into payments values(1, 2000); 
-- select * from payments; 
-- insert into payments values(2,null); 
-- it will throw error 1048 after executing the stored procedure
-- create a stored procedure proc_fraud(cid int, amt int)  
-- now write exception handling statement
-- BEGIN 
-- declare continue handler for 1048
-- BEGIN
-- insert into fraud(client_id,message,tot) values(cid,"fraud transaction",now()); 
-- END; 
-- insert into payments values(cid,amt); 
-- select "transaction completed" as Message; 
-- END 

-- select * from payments; 
-- select * from fraud; 

-- this will affect records in fraud table 
-- now try this 
-- declare exit instead of continue handler for 1048
-- cursor - whenerver we  want to read data from one table and wrtie data into another table we can use cursor 

-- select * from products; 
-- read entire data from this table, keep focus on qty in stock column , if value is less than 1000 then insert record in orders table , like immediate requirement or needed slowly 
-- writing data into orders table
-- select * from orders; 
-- desc orders; 









