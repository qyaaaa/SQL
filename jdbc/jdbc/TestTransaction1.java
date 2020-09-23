package com.jdbc;

import com.jdbc.utils.JdbcUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TestTransaction1 {
    public static void main(String[] args) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = JdbcUtils.getConnection();
            //关闭数据库的自动提交，自动会开启事务
            connection.setAutoCommit(false);
            //
            String sql1 = "update account set money = money - 100 where name = 'A'";
            preparedStatement = connection.prepareStatement(sql1);
            preparedStatement.executeUpdate();

            String sql2 = "update account set money = money + 100 where name = 'B'";
            preparedStatement = connection.prepareStatement(sql2);
            preparedStatement.executeUpdate();

            //业务完毕、提交事务
            connection.commit();
            System.out.println("成功");

        }catch (SQLException e){
            try {
                //可以省略，如果失败自动回滚
                connection.rollback();//失败，自动回滚
            } catch (SQLException throwables) {

                throwables.printStackTrace();
            }
            e.printStackTrace();
        }finally {
            JdbcUtils.release(connection,preparedStatement,resultSet);
        }
    }
}
