-- joins 
-- select * from authors; 
-- select * from books; 
-- delete from authors where authorid = 1 ;
-- drop table books; 
-- show tables; 
-- CREATE TABLE Books(
             -- BookId INTEGER primary key, 
             -- Title VARCHAR(50),
             -- AuthorId INTEGER, foreign key (authorid) references authors(authorid)on delete cascade on update cascade);
-- delete from authors where authorid = 1 ;
-- select * from authors; 
-- select * from books; 
-- update author id 7 to 70 ; 
-- update authors set authorid=70 where authorid=7; 
-- select * from authors; 
-- select * from books; 


-- joins - inner join, left join, right join, cross join , self join
-- select * from movies; 
-- select * from members; 
-- inner join
-- select * from movies inner join members on movies.id = members.movieid; 
-- select * from movies left join members on movies.id = members.movieid;
-- select id, title, ifnull(first_name, '-') as first_name, ifnull(last_name, '-') as last_name from movies left join members on movies.id = members.movieid;
-- select * from movies right join members on movies.id = members.movieid;

-- cross join , no common columns are required, only purpose is to create combinations 
-- select * from meals; 
-- select * from drinks; 
-- select * from meals cross join drinks; 

-- select mealname, drinkname, rate, rate from meals cross join drinks; 
-- select meals.mealname, drinks.drinkname , meals.rate, drinks.rate from meals cross join drinks; 
-- select m.mealname, d.drinkname, m.rate, d.rate from meals as m cross join drinks as d;

-- select * from memp limit 20; 
-- inner join query
-- select emp.emp_id, emp.first_name, emp.last_name, mgr.first_name, mgr.last_name from myemp as emp inner join myemp as mgr on mgr.emp_id = emp.mgr_id;  





