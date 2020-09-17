-- 注意点，使用英文（），表的名称和字段尽量使用``括起来
CREATE TABLE IF NOT EXISTS `student`(
    `id` INT(4) NOT NULL AUTO_INCREMENT COMMENT '学号',
    `name` VARCHAR(30) NOT NULL DEFAULT '匿名' COMMENT '姓名',
    `pwd` VARCHAR(20)NOT NULL DEFAULT '123456' COMMENT '密码',
    `sex` VARCHAR(2) NOT NULL DEFAULT '女' COMMENT '性别',
    `birthday` DATETIME DEFAULT NULL COMMENT '出生日期',
    `gradeid` INT(10) NOT NULL COMMENT '学生的年级',
    `address` VARCHAR(100) DEFAULT NULL COMMENT '家庭住址',
    `email` VARCHAR(50) DEFAULT NULL COMMENT '邮箱',
    PRIMARY KEY(`id`)
)ENGINE=INNODB DEFAULT CHARSET=utf8

CREATE TABLE `grade`(
    `gradeid` INT(10) NOT NULL AUTO_INCREMENT COMMENT '年级id',
    `gradename` VARCHAR(50) NOT NULL COMMENT '年级名称',
    PRIMARY KEY (`gradeid`)
)ENGINE=INNODB DEFAULT CHARSET=utf8

-- 直接加约束
CREATE TABLE IF NOT EXISTS `student`(
    `id` INT(4) NOT NULL AUTO_INCREMENT COMMENT '学号',
    `name` VARCHAR(30) NOT NULL DEFAULT '匿名' COMMENT '姓名',
    `pwd` VARCHAR(20)NOT NULL DEFAULT '123456' COMMENT '密码',
    `sex` VARCHAR(2) NOT NULL DEFAULT '女' COMMENT '性别',
    `birthday` DATETIME DEFAULT NULL COMMENT '出生日期',
    `gradeid` INT(10) NOT NULL COMMENT '学生的年级',
    `address` VARCHAR(100) DEFAULT NULL COMMENT '家庭住址',
    `email` VARCHAR(50) DEFAULT NULL COMMENT '邮箱',
    PRIMARY KEY(`id`),
    KEY `FK_gradeid` (`gradeid`),
    CONSTRAINT `FK_gradeid` FOREIGN KEY (`gradeid`) REFERENCES `grade`(`gradeid`)
)ENGINE=INNODB DEFAULT CHARSET=utf8

-- 创建表的时候没有外键关系(加约束)
ALTER TABLE `student`
ADD CONSTRAINT `FK_gradeid` FOREIGN KEY(`gradeid`) REFERENCES `grade`(`gradeid`);

-- 插入语句（添加）
-- insert into 表名 ([字段1,字段2,字段3])values('值1'),('值2'),(........)
INSERT INTO `grade`(`gradename`) VALUES('大四')

-- 由于主键自增，可以省略（如果不写表的字段就会一一匹配）
INSERT INTO `grade`(gradename) VALUES('大二'),('大三')


INSERT INTO `student`(`name`) VALUES ('张三')

INSERT INTO `student`(`name`,`pwd`,`sex`) VALUES ('李四','123459','男')

INSERT INTO `student`(`name`,`pwd`,`sex`)
VALUES ('李四','123459','男'),('王五','123458','男')

INSERT INTO `student`(`name`,`birthday`) VALUES('借花','2019-5-20')

-- 修改学员的名字
UPDATE `student` SET `name`='缺氧' WHERE id = 1

-- 不指定条件的情况下，会改动所有表
UPDATE `student` SET `name`='长江1号'

UPDATE `student` SET `name`='缺氧',`email`='qy7654@qq.com' WHERE id = 1

UPDATE `student` SET `name`='缺氧' WHERE id >= 1

-- between and
UPDATE `student` SET `name`='长江1号' WHERE id BETWEEN 1 AND 5

-- 通过多个条件定位数据
UPDATE `student` SET `name`='长江1号' WHERE `name`='缺氧' AND `sex`='女'

UPDATE `student` SET `birthday`= CURRENT_TIME WHERE `name`='缺氧' AND `sex`='男'

-- 删除
DELETE FROM `student` WHERE id = 1