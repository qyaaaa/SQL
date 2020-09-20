-- 查询全部的学生 select字段 from表
SELECT * FROM student

-- 查询指定字段
SELECT `studentno`,`studentname` FROM student

-- 别名，给结果起一个名字 AS(可以省略)  可以给字段起别名、也可以给表起别名
SELECT `studentno` AS 学号,`studentname` AS 学生姓名 FROM student s

-- 函数 Concat(a,b)
SELECT CONCAT ('姓名:',studentname) AS 新名字 FROM student

-- 查询那些同学有成绩
SELECT * FROM result -- 查询全部的考试成绩
-- 查询有哪些同学参加了考试
SELECT `studentno` FROM result
-- 去重
SELECT DISTINCT `studentno` FROM result

-- 查看系统版本(函数)
SELECT VERSION()

-- 计算结果(表达式)
SELECT 100*3-1

-- 查询自增的步长(变量)
SELECT @@auto_increment_increment

-- 所有分数加1
SELECT `studentno`,`studentresult`+1 AS '提分后' FROM result

-- ============================= where ==========================
SELECT studentno,`studentresult` FROM result -- 查询所有学生成绩

-- 查询成绩在95~100分之间
SELECT studentno,`studentresult` FROM result 
WHERE studentresult>=95 AND studentresult<=100

-- 除了1000号学生之外的同学的成绩
SELECT studentno,`studentresult` FROM result
WHERE studentno != 1000; -- ！= 或 not

-- 模糊查询 （比较运算符）
-- like
-- 查询姓张的同学
SELECT `studentno`,`studentname` FROM `student`
WHERE studentname LIKE '张%'

-- 查询姓张的同学,后边只有一个字的
SELECT `studentno`,`studentname` FROM `student`
WHERE studentname LIKE '张_'

-- 查询姓张的同学,后边有两个字的
SELECT `studentno`,`studentname` FROM `student`
WHERE studentname LIKE '张__'

-- 查询名字中带嘉的同学  %嘉%
SELECT `studentno`,`studentname` FROM `student`
WHERE studentname LIKE '%嘉%'

-- =================in
-- 查询1001、1002、1003学员
SELECT `studentno`,`studentname` FROM `student`
WHERE studentno IN (1001,1002,1003);

-- 查询在北京的学生
SELECT `studentno`,`studentname` FROM `student`
WHERE `address` IN ('北京朝阳');

-- null and not null
-- 查询地址为空的学生 null
SELECT `studentno`,`studentname` FROM `student`
WHERE `address`='' OR `address` IS NULL

-- 查询有出生日期的同学   不为空
SELECT `studentno`,`studentname` FROM `student`
WHERE `borndate` IS NOT NULL

-- 联表查询 join   7种查询    (left join INNER JOIN right join)  
-- 查询参加了考试的同学（学号、姓名、科目编号、分数）
-- 如果表中至少有一个匹配，就返回行
SELECT s.studentno,`studentname`,`subjectno`,`studentresult`
FROM student AS s 
INNER JOIN result AS r
WHERE s.studentno = r.studentno

/* 思路
1.分析需求、分析查询的字段来自哪些表 （连接查询）
2.确定使用哪种连接查询？ 7种
确定交叉点 （这两个表中那个数据是相同的）
判断的条件：学生表中 studentno = 成绩表 studentno
*/

-- 即使左表中没有匹配，也会从右表中返回所有的值
SELECT s.studentno,`studentname`,`subjectno`,`studentresult`
FROM student AS s 
RIGHT JOIN result AS r
WHERE s.studentno = r.studentno

-- 即使右表中没有匹配，也会从左表中返回所有的值
SELECT s.studentno,`studentname`,`subjectno`,`studentresult`
FROM student AS s 
LEFT JOIN result AS r
WHERE s.studentno = r.studentno

-- join（连接的表）on（判断的条件）连接查询
-- where 等值查询

-- 查询缺考的同学
SELECT s.studentno,`studentname`,`subjectno`,`studentresult`
FROM student AS s 
LEFT JOIN result AS r
ON s.studentno = r.studentno
WHERE studentresult IS NULL

-- 查询参加了考试的同学信息：学号、学生姓名、科目名、分数
SELECT s.studentno,`studentname`,`subjectname`,`studentresult`
FROM student s
RIGHT JOIN result r
ON r.studentno = s.studentno
INNER JOIN `subject` sub
ON r.subjectno = sub.subjectno

