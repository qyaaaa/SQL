-- P43的数据库  虽然说有点少 P44会用到
CREATE TABLE account(
    id Int PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(40),
    money FLOAT
);

/*插入测试数据*/
insert into account(name,money) values('A',1000);
insert into account(name,money) values('B',1000);
insert into account(name,money) values('C',1000);