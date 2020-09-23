package com.jdbc.utils;


import org.apache.commons.dbcp.BasicDataSourceFactory;

import javax.sql.DataSource;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class JdbcUtils_DBCP {

    private static DataSource dataSource = null;

    static {
        try {
            InputStream in = JdbcUtils_DBCP.class.getClassLoader().getResourceAsStream("dbcp.properties");
            Properties properties = new Properties();
            properties.load(in);

            //创建数据源  工厂模式 --> 创建
            dataSource = BasicDataSourceFactory.createDataSource(properties);

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    //获取连接
    public static Connection getConnection() throws SQLException {
        return dataSource.getConnection();//从数据源中获取连接
    }

    //释放连接资源
    public static void release(Connection connection, Statement statement, ResultSet resultSet){
        if (resultSet != null){
            try {
                resultSet.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }

        if (statement != null){
            try {
                statement.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }

        if (connection != null){
            try {
                connection.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    }

}
