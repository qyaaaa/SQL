-- 索引的使用：
-- 1.在创建表的时候给字段增加索引
-- 2.创建完毕后，增加索引

-- 显示所有的索引信息
SHOW INDEX FROM student

-- 增加一个全文索引（列名）
ALTER TABLE `student` ADD FULLTEXT INDEX `studentname`(`studentname`) 

-- explain 分析sql执行的状况

EXPLAIN SELECT * FROM student -- 非全文索引

SELECT * FROM student WHERE MATCH(studentname) AGAINST('刘')

