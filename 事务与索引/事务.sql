-- 事务原则：ACID原则 原子性，一致性，隔离性，持久性  （脏读、幻读）
-- mysql是默认开启事务自动提交的
SET autocommit=0 /*关闭*/
SET autocommit=1 /*开启*/

-- 手动处理事务
SET autocommit=0 -- 关闭自动提交

-- 事务开启
SELECT TRANSACTION -- 标记一个事物的开始，从这个之后的sql都在同一个事务内

INSERT xx

-- 提交：持久化（成功）
COMMIT
-- 回滚：回到原来的样子（失败）
ROLLBACK

-- 事务结束
SET autocommit=1 -- 开启自动提交

-- 了解
SAVEPOINT 保存点名 -- 设置一个事务的保存点
ROLLBACK TO SAVEPOINT 保存点名 -- 回滚到指定保存点
DELETE SAVEPOINT 保存点名 -- 撤销保存点

-- 转账
CREATE DATABASE shop CHARACTER SET utf8 COLLATE utf8_general_ci
USE shop

CREATE TABLE `account`(
    `id` INT(3) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(30) NOT NULL,
    `money` DECIMAL(9,2) NOT NULL,
    PRIMARY KEY (`id`)
)ENGINE=INNODB DEFAULT CHARSET=utf8

INSERT INTO account(`name`,`money`)
VALUES ('A',2000.00),('B',10000.00)

-- 模拟转账
SET autocommit=0; -- 关闭自动提交
START TRANSACTION -- 开启一个事务
UPDATE account SET money=money-500 WHERE `name` ='A' -- A减少500
UPDATE account SET money=money+500 WHERE `name` ='B' -- B增加500

COMMIT; -- 提交事务
ROLLBACK -- 回滚
SET autocommit=1 -- 恢复默认值