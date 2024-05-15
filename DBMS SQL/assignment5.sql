create database shop;
use shop;
create table product(pid int, pname varchar(20),sname varchar(10),unit_price int);
create table pricehistory(pid int, pname varchar(20),sname varchar(10),unit_price int);
insert into product values(1,'PHONE','Parth',200);
insert into product values(2,'PENCIL','Yash',250);
insert into product values(3,'PHONE','Ishwar',300);

