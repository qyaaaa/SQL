-- 聚合函数
-- 都能统计表中的数据 （想查询一个表中有多少个记录，就使用这个count（））
SELECT COUNT(studentname) FROM student -- count(字段)，会忽略所有的null值
SELECT COUNT(*) FROM student  -- count(*)，不会忽略null值，本质 计算行数
SELECT COUNT(1) FROM student  -- count(1)，不会忽略null值 本质 计算行数

SELECT SUM(`studentresult`) AS 总和 FROM result
SELECT AVG(`studentresult`) AS 平均分 FROM result
SELECT MAX(`studentresult`) AS 最高分 FROM result
SELECT MIN(`studentresult`) AS 最低分 FROM result

-- 查询不同课程的平均分，最高分，最低分，平均分大于80分
-- 核心：（根据不同的课程分组）
SELECT `subjectname`,AVG(studentresult) AS 平均分,MAX(studentresult),MIN(studentresult)
FROM result r
INNER JOIN `subject` s
ON r.`subjectno` = s.`subjectno`
GROUP BY r.subjectno -- 通过什们字段来分组
HAVING 平均分>80

