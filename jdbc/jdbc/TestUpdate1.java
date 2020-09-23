package com.jdbc;

import com.jdbc.utils.JdbcUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

public class TestUpdate1 {
    public static void main(String[] args) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;   //可以防止SQL注入
        ResultSet resultSet = null;
        try {
            connection = JdbcUtils.getConnection();

            //区别
            //使用？占位符代替参数，效率更高，防止SQL注入
            String sql = "update users set `name`= ? where id = ? ";

            preparedStatement = connection.prepareStatement(sql);//预编译SQL，先写SQL，然后不执行

            //手动给参数赋值
            preparedStatement.setString(1,"xiaopang");
            preparedStatement.setInt(2,1);

            //执行
            int i = preparedStatement.executeUpdate();
            if (i > 0){
                System.out.println("更新成功");
            }

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            JdbcUtils.release(connection,preparedStatement,resultSet);
        }
    }
}
