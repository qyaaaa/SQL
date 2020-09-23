package com.jdbc;

import com.jdbc.utils.JdbcUtils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class TestUpdate {
    public static void main(String[] args) {
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try{
            connection = JdbcUtils.getConnection();
            statement = connection.createStatement();
            String sql = "UPDATE users SET `NAME`='liuqian',`email`='liuqian@qq.com' WHERE id=1";

            int i = statement.executeUpdate(sql);
            if (i > 0){
                System.out.println("更新成功");
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            JdbcUtils.release(connection,statement,resultSet);
        }
    }
}
