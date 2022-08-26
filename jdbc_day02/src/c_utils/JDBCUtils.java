package c_utils;

import java.io.IOException;
import java.sql.*;
import java.util.Properties;

/**
 * @author Jiang
 * @Date 2022-08-26 10:54
 */
public class JDBCUtils {

    static String driver;
    static String url;
    static String username;
    static String password;

    //1.在程序启动后就需要进行加载 - 静态代码块
    static{
        //1.1加载配置文件 - 获取配置文件类
        Properties pro = new Properties();
        //1.2获取配置文件
        try {
            pro.load(JDBCUtils.class.
                    getResourceAsStream("db.properties"));
            driver = pro.getProperty("driver");
            url = pro.getProperty("url");
            username = pro.getProperty("username");
            password = pro.getProperty("password");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    //2.get连接
    public static Connection getConnection(){
        try {
            //2.1注册驱动
            Class.forName(driver);
            //2.2获取连接
            Connection conn = DriverManager.getConnection(
                    url,
                    username,
                    password
            );
            return conn;
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //3.close连接
    public static void close(Connection conn, Statement sta) {
        if(conn != null){
            try {
                conn.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        if(sta != null){
            try {
                sta.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

    }

    public static void close(Connection conn, Statement sta, ResultSet rs) {
        close(conn,sta);
        if(rs != null){
            try {
                rs.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }


}
