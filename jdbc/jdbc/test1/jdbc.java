package com.jdbc.test1;

import java.sql.*;

/**
第一个jdbc程序
 */
public class jdbc {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        //1.加载驱动
        Class.forName("com.mysql.cj.jdbc.Driver");//固定写法

        //2.用户信息和url
        //useUnicode=true&characterEncoding=utf8&useSSL=true      时区问题后面加&serverTimezone=GMT%2B8即可
        String url = "jdbc:mysql://localhost:3306/jdbcStudy?useUnicode=true&characterEncoding=utf8&useSSL=true&serverTimezone=GMT%2B8";
        String username = "root";
        String password = "qiaoyu1055575039";

        //3.连接成功，数据库对象  connection代表数据库
        Connection connection = DriverManager.getConnection(url, username, password);

        //4.执行SQL对象  statement执行SQL的对象
        Statement statement = connection.createStatement();

        //5.执行SQL的对象，去执行SQL，可能存在结果，查看返回结果
        String sql = "SELECT * FROM users";

        ResultSet resultSet = statement.executeQuery(sql);//返回的结果集,结果集中封装了我们全部的查询出来的结果

//        resultSet.beforeFirst();//移动到最前面
//        resultSet.afterLast();//移动到最后面
//        resultSet.next();//移动到下一个数据
//        resultSet.previous();//移动到前一行
//        resultSet.absolute(row);//移动到指定行

        while (resultSet.next()){
            System.out.println("id=" + resultSet.getObject("id"));
            System.out.println("name=" + resultSet.getObject("Name"));
            System.out.println("pwd=" + resultSet.getObject("PASSWORD"));
            System.out.println("email=" + resultSet.getObject("email"));
            System.out.println("birth=" + resultSet.getObject("birthday"));
            System.out.println("*************************");
        }

        //6.释放连接
        resultSet.close();
        statement.close();
        connection.close();

    }
}
