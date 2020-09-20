CREATE TABLE `category` (
    `categoryid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主题id',
    `pid` INT(10) NOT NULL COMMENT '父id',
    `categoryName` VARCHAR(50) NOT NULL COMMENT '主题名字',
    PRIMARY KEY (`categoryid`)
)ENGINE=INNODB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8

INSERT INTO `category` (`categoryid`,`pid`,`categoryName`)
VALUES('2','1','信息技术'),
('3','1','软件开发'),
('4','3','数据库'),
('5','1','美术设计'),
('6','3','web开发'),
('7','5','ps技术'),
('8','2','办公信息');

-- 查询父子信息
SELECT a.`categoryName` AS '父栏目',b.`categoryName` AS '子栏目'
FROM `category` AS a,`category` b
WHERE a.`categoryid`=b.`pid`

-- 查询学员所属的年级（学号、学生的姓名、年级名称）
SELECT `studentno`,`studentname`,`gradename`
FROM student s
INNER JOIN `grade` g
ON s.`gradeid`=g.`gradeid`

-- 查询科目所属的年级（科目名称、年级名称）
SELECT `subjectname`,`gradename`
FROM `subject` s
INNER JOIN `grade` g
WHERE s.`gradeid`=g.`gradeid` 

-- 查询参加了数据库结构-1考试的同学信息，学号，学生姓名，科目名，分数
SELECT s.`studentno`,`studentname`,`subjectname`,`studentresult`
FROM `student` s
INNER JOIN `result` r
ON s.studentno=r.studentno
INNER JOIN `subject` sub
ON r.`subjectno` = sub.`subjectno`
WHERE subjectname='数据库结构-2'

-- 分页limit 和 排序order by
-- 排序： 升序asc ， 降序desc

-- 根据查询到结果降序排序
SELECT s.`studentno`,`studentname`,`subjectname`,`studentresult`
FROM `student` s
INNER JOIN `result` r
ON s.studentno=r.studentno
INNER JOIN `subject` sub
ON r.`subjectno` = sub.`subjectno`
WHERE subjectname='数据库结构-2'
ORDER BY studentresult DESC

-- 为什么要分页？
-- 环境数据库压力，给人的体验更好，瀑布流

-- 分页、每页只显示5条数据
-- 语法：limit 当前页、页面的大小
-- limit 0,5  1~5
-- limit 1,5  2~6 
SELECT s.`studentno`,`studentname`,`subjectname`,`studentresult`
FROM `student` s
INNER JOIN `result` r
ON s.studentno=r.studentno
INNER JOIN `subject` sub
ON r.`subjectno` = sub.`subjectno`
WHERE subjectname='数据库结构-2'
ORDER BY studentresult DESC
LIMIT 0,5

-- 查询java第一学年课程成绩排名前十的学生，并且分数要大于80的学生信息（学号、姓名、课程名称、分数）
SELECT s.`studentno`,`studentname`,`subjectname`,`studentresult`
FROM `student` s
INNER JOIN `result` r
ON s.`studentno`=r.`studentno`
INNER JOIN `subject` sub
ON r.`subjectno`=sub.`subjectno`
WHERE `subjectname`='java程序设计-1' AND studentresult>=80
ORDER BY studentresult DESC
LIMIT 0,10
 
-- 1、查询数据库结构-1的所有考试结果（学号、科目名、成绩），降序排列
-- 方式1：使用连接查询
SELECT s.`studentno`,`subjectname`,`studentresult`
FROM `student` s
INNER JOIN `result` r
ON s.`studentno`=r.`studentno`
INNER JOIN `subject` sub
ON r.`subjectno`=sub.`subjectno`
WHERE subjectname = '高等数学-1' OR subjectname ='高等数学-2' OR subjectname ='高等数学-3' OR subjectname ='高等数学-4'
ORDER BY studentresult DESC

-- 方式2：使用子查询()
SELECT `studentno`,`subjectno`,`studentresult`
FROM `result`
WHERE subjectno = (
    SELECT subjectno FROM `subject` 
    WHERE subjectname = '数据库结构-1'
)
ORDER BY studentresult DESC

-- 查询所有数据库结构-1的学生学号
SELECT subjectno FROM `subject` WHERE subjectname = '数据库结构-1'

-- 分数不小于80分的学生的学号和姓名
SELECT s.`studentno`,`studentname`
FROM `student` s
INNER JOIN `result` r
ON s.`studentno`=r.`studentno`
WHERE `studentresult`>=80

-- 增加科目，高等数学-2
SELECT s.`studentno`,`studentname`
FROM `student` s
INNER JOIN `result` r
ON s.`studentno`=r.`studentno`
WHERE `studentresult`>=80 AND `subjectno`= (
    SELECT `subjectno`
    FROM `subject` 
    WHERE `subjectname`='高等数学-2'
)

-- 改造
SELECT `studentno`,`studentname`
FROM student
WHERE studentno IN (
    SELECT studentno FROM result WHERE studentresult>80 AND subjectno =(
        SELECT `subjectno` FROM `subject` WHERE `subjectname`='高等数学'    
    )
)
