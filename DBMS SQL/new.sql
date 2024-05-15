show databases;
use student;
delimiter //
create PROCEDURE addition2(IN a int,IN b int,OUT c)
BEGIN
    set c=a+b;
    SELECT CONCAT("Addition= ",c);
    END
    //
delimiter ;
call addition1(1,2,@c);
use parth;
show tables;
use student;
