package com.jdbc;

import com.jdbc.utils.JdbcUtils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class TestInsert {
    public static void main(String[] args) {
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try{
            connection = JdbcUtils.getConnection();
            statement = connection.createStatement();
            String sql = "INSERT INTO `users`(`id`,`NAME`,`PASSWORD`,`email`,`birthday`)\n" +
                    "VALUES(4,'zjh','123456','zjh@qq.com','2020-11-11')";

            int i = statement.executeUpdate(sql);
            if (i > 0){
                System.out.println("插入成功");
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            JdbcUtils.release(connection,statement,resultSet);
        }
    }
}
