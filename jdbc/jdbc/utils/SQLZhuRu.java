package com.jdbc.utils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * PreparedStatement防止SQL注入的本质，把传递进来的参数当做字符
 * 假设其中存在转义字符，就直接忽略，‘会被直接转义
 *
 * PreparedStatement效率高，防注入
 */

public class SQLZhuRu {
    public static void main(String[] args) {
        //login("lisi","123456");
        login("'or'1=1","123456");//SQL注入本质就是SQL会被拼接
    }

    //登录业务
    public static void login(String username,String password){
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            connection = JdbcUtils.getConnection();
            statement = connection.createStatement();

            //SQL   SELECT * FROM users WHERE `NAME` = 'lisi' AND `password` = '123456'
            String sql = "SELECT * FROM users WHERE `NAME` = '"+ username +"'AND `password` = '" + password + "'";
            resultSet = statement.executeQuery(sql);//查询完毕会返回一个结果集

            while (resultSet.next()){
                System.out.println(resultSet.getString("NAME"));
                System.out.println(resultSet.getString("password"));
                System.out.println("查询成功");
            }

        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            JdbcUtils.release(connection,statement,resultSet);
        }
    }
}
