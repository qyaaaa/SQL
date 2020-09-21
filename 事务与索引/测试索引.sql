-- P31 创建app_user表格
CREATE TABLE `app_user` (
`id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(50) DEFAULT '',
`email` VARCHAR(50) NOT NULL,
`phone` VARCHAR(20) DEFAULT '',
`gender` TINYINT(4) UNSIGNED DEFAULT '0',
`password` VARCHAR(100) NOT NULL DEFAULT '',
`age` TINYINT(4) DEFAULT NULL,
`create_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
`update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8



-- 百万数据插入
DROP FUNCTION IF EXISTS mock_data;
-- 写函数之前必须要写，标志:$$,相当于标志
DELIMITER $$
CREATE FUNCTION mock_data()
RETURNS INT DETERMINISTIC-- 注意returns，否则报错。
BEGIN
    DECLARE num INT DEFAULT 1000000; -- num 作为截止数字，定义为百万，
    DECLARE i INT DEFAULT 0;
    WHILE i < num DO
        INSERT INTO app_user(`name`, `email`, `phone`, `gender`, `password`, `age`)
        VALUES(CONCAT('用户', i), 
        CONCAT('100',i,'@qq.com'), 
        CONCAT('13', FLOOR(RAND()*((999999999-100000000)+100000000))),
        FLOOR(RAND()*2),UUID(), 
        FLOOR(RAND()*100));
        SET i = i + 1;
    END WHILE;
    RETURN i;
END;
-- 生成100万数据
select mock_data();


select * from app_user where `name` = '用户9999' -- 3.158 sec

explain SELECT * FROM app_user WHERE `name` = '用户9999' -- 996000

-- id_表名_字段名
-- CREATE INDEX 索引名 on 表（字段）
create index id_app_user_name on app_user(`name`)

SELECT * FROM app_user WHERE `name` = '用户9999' -- 0 sec

EXPLAIN SELECT * FROM app_user WHERE `name` = '用户9999' -- 1
