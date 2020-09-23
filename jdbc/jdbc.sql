-- P38的那个数据库
CREATE DATABASE jdbcStudy CHARACTER SET utf8 COLLATE utf8_general_ci;

USE jdbcStudy;

CREATE TABLE `users`(
 id INT PRIMARY KEY,
 NAME VARCHAR(40),
 PASSWORD VARCHAR(40),
 email VARCHAR(60),
 birthday DATE
);

INSERT INTO `users`(id,NAME,PASSWORD,email,birthday)
VALUES(1,'zhansan','123456','zs@sina.com','1980-12-04'),
(2,'lisi','123456','lisi@sina.com','1981-12-04'),
(3,'wangwu','123456','wangwu@sina.com','1979-12-04')

SELECT * FROM users

INSERT INTO `users`(`id`,`NAME`,`PASSWORD`,`email`,`birthday`)
VALUES(4,'zjh','123456','zjh@qq.com','2020-11-11')

DELETE FROM users WHERE id = 4

UPDATE users SET `NAME`='liuqian',`email`='liuqian@qq.com' WHERE id=1

SELECT * FROM users WHERE `NAME` = 'lisi' AND `password` = '123456'