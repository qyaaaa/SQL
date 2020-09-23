package com.jdbc;

import com.jdbc.utils.JdbcUtils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class TestSelect {
    public static void main(String[] args) {
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            connection = JdbcUtils.getConnection();
            statement = connection.createStatement();

            //SQL
            String sql = "select * from users where id = 1";
            resultSet = statement.executeQuery(sql);//查询完毕会返回一个结果集

            while (resultSet.next()){
                System.out.println(resultSet.getString("NAME"));
                System.out.println("查询成功");
            }

        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            JdbcUtils.release(connection,statement,resultSet);
        }
    }
}
