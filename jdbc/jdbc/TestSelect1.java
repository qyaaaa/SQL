package com.jdbc;

import com.jdbc.utils.JdbcUtils;

import java.sql.*;

public class TestSelect1 {
    public static void main(String[] args) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            JdbcUtils.getConnection();

            String sql = "select * from users where id = ?"; //编写SQL

            preparedStatement = connection.prepareStatement(sql);//预编译

            preparedStatement.setInt(1,1);//传递参数

            resultSet = preparedStatement.executeQuery();//执行

            if (resultSet.next()){
                System.out.println(resultSet.getString("NAME"));
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            JdbcUtils.release(connection,preparedStatement,resultSet);
        }
    }
}
