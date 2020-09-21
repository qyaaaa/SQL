-- 创建用户 CREATE USER 用户名 IDENTIFIED BY '密码'
CREATE USER qiaoyu IDENTIFIED BY '123456'

-- 修改密码（修改当前用户密码）
SET PASSWORD = PASSWORD('123456')

-- 修改密码（修改指定用户密码）
SET PASSWORD FOR zjh=PASSWORD('123456')

-- 重命名   RENAME USER 原来名字 TO 新名字
RENAME USER zjh TO zjh1

-- 用户授权 ALL PRIVILEGES 全部权限 库、表
-- ALL PRIVILEGES除了给别人授权，其他都能干
CREATE ALL PRIVILEGES ON *.* TO zjh1

-- 查询权限
SHOW GRANTS FOR zjh1 -- 查看指定用户权限
SHOW GRANTS FOR root@localhost -- 查看管理员权限

-- ROOT用户权限：GRANT ALL PRIVILEGES ON *.* TO root@localhost WITH GRANT OPION

-- 撤销权限 REVOKE 哪些权限 ，在哪个库，给谁撤销
REVOKE ALL PRIVILEGES ON *.* FROM zjh1

-- 删除用户
DROP USER zjh1