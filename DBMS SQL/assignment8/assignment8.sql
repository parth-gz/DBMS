create database shop;
use shop;
create table product(pid int primary key,pname varchar(20), supplier varchar(20), unit_price float);
insert into product values(1,'pen','Bally',3);
insert into product values(2,'pencil','Nataraj',5);
insert into product values(3,'notebook','classmate',40);
insert into product values(4,'geometry box','Camlin',100);
create table product_price_history(pid int primary key,pname varchar(20), supplier varchar(20), unit_price float);
select * from product;
select * from product_price_history;
delimiter //
create trigger pricehistory_trigger
before update on product 
for each row
begin
    insert into product_price_history values(old.pid, old.pname, old.supplier, old.unit_price);
end
//
delimiter ;
update product set unit_price=110 where pid=4;
update product set unit_price=5 where pid=1;
select * from product_price_history;
