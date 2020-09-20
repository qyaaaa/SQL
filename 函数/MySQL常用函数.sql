-- 常用函数
-- 数学运算
SELECT ABS(-8) -- 绝对值
SELECT CEILING(9.4) -- 向上取整
SELECT FLOOR(9.4) -- 向下取整
SELECT RAND() -- 返回0~1之间的随机数
SELECT SIGN(-10)  -- 判断一个数的符号 0-0,负数返回-1，正数返回1

-- 字符串函数
SELECT CHAR_LENGTH('十大首富地方撒') -- 字符串长度
SELECT CONCAT('我','爱','你') -- 拼接字符串
SELECT INSERT('我爱编程',1,2,'超级热爱') -- 查询、从某个位置开始替换某个长度
SELECT LOWER('ZHANGjieHua') -- 转换成小写
SELECT UPPER('ZHANGjieHua') -- 转换成大写

SELECT INSTR('zhangjieh','j') -- 返回第一次出现的子串的索引
SELECT REPLACE('洁华说他是咸鱼','他','她') -- 替换出现的指定字符串

SELECT SUBSTR('洁华说他是咸鱼','4','4') -- 返回指定的子字符串（源字符串，截取的位置，截取到长度）
SELECT REVERSE('洁华说他是咸鱼') -- 反转

-- 查询姓张的同学，名字
SELECT REPLACE(studentname,'张','长')FROM student
WHERE studentname LIKE '张%'

-- 时间和日期的函数（记住）
SELECT CURRENT_DATE() -- 获取当前日期
SELECT CURDATE()    -- 获取当前日期
SELECT NOW() -- 获取当前的时间
SELECT LOCALTIME() -- 本地时间
SELECT SYSDATE() -- 系统时间

-- 年月日时分秒
SELECT YEAR(NOW())
SELECT MONTH(NOW())
SELECT DAY(NOW())
SELECT HOUR(NOW())
SELECT MINUTE(NOW())
SELECT SECOND(NOW())

-- 系统
SELECT SYSTEM_USER()
SELECT USER()
SELECT VERSION()
