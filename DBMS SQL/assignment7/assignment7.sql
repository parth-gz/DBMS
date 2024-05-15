create database stud1;
use stud1;
create table student(rollno int primary key, name varchar(20), class varchar(20));
create table student2(roll_no int primary key, name varchar(20),class varchar(20));
insert into student values(43,'Parth','SY');
insert into student values(37,'Shivraj','SY');
insert into student values(41,'Shubham','SY');

delimiter //
create procedure proc_copy()
begin
declare vfinished int default 0;
declare r int;
declare n varchar(20);
declare c varchar(20);
declare stud_cursor cursor for select * from student;
declare continue handler for not found set vfinished=1;
open stud_cursor;
getdata:Loop
fetch stud_cursor into r,n,c;
if vfinished=1 then leave getdata;
end if;
insert into student2 values(r,n,c);
end loop getdata;
close stud_cursor;
end 
//
delimiter ;
call proc_copy();
select * from student2;
select * from student;