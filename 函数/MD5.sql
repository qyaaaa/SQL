-- 测试表MD5加密
CREATE TABLE `testmd5`(
    `id` INT(4) NOT NULL,
    `name` VARCHAR(20) NOT NULL,
    `pwd` VARCHAR(50) NOT NULL ,
    PRIMARY KEY(`id`)
)ENGINE=INNODB DEFAULT CHARSET=utf8

-- 明文密码
INSERT INTO `testmd5` VALUES(1,'zhangmouhua','123456'),(2,'wangmouwei','123456'),(3,'liumouqian','123456')

-- 加密
UPDATE testmd5 SET pwd=MD5(pwd) WHERE id!=1

UPDATE testmd5 SET pwd=MD5(pwd) -- 加密全部密码

-- 插入的时候加密
INSERT INTO `testmd5` VALUES(4,'xiaoming',MD5('123456'))

-- 如何校验，将用户传进来的密码进行MD5加密，然后比对加密后的值
SELECT * FROM testmd5 WHERE `name`='xiaoming' AND pwd=MD5('123456')
