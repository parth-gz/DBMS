create database Library_DB;
use Library_DB;
create table library(rollno int primary key, dateofissue date, nameofbook varchar(20), status varchar(1));
create table fine(rollno int, dateofreturn date, amount int);
insert into library values(1,'2023-03-01','DBMS','I');
insert into library values(2,'2022-12-23','OSA','I');
insert into library values(3,'2023-01-11','COA','R');
insert into library values(4,'2022-11-29','OOP','R');
insert into library values(5,'2023-02-04','DSA','I');
insert into library values(6,'2023-03-07','DEDC','I');
insert into library values(7,'2023-01-21','Python','I');
delimiter //
create procedure calfine(rno int, n_book varchar(20))
begin
	declare no_ofdays int;
    declare date1 date;
    declare fineamount int;
    select dateofissue into date1 from library where rollno=rno;
    set no_ofdays=datediff(curdate(),date1);
    if no_ofdays>15 and no_ofdays<30 then set fineamount=(no_ofdays-15)*5;
    end if;
    if no_ofdays>30 then set fineamount= (no_ofdays-30)*50;
    end if;
    select concat("Fine= Rs.",fineamount);
    if fineamount>0 then insert into fine values(rno, curdate(),fineamount);
    end if;
    update library set status='R' where rollno=rno;
end
//
call calfine(1,'DBMS');
select * from fine;
select * from library;