package a_c3p0;

import java.sql.*;

/**
 *  JDBC工具类
 *
 *封装方式一：
 * ·把常用的字符串定义成常量：用户名，密码，URL，驱动类
 * ·得到连接：getConnection()
 * ·关闭连接：colse()
 */
public class JDBCUtils {
    //封装=>静态变量
    public static final String USERNAME = "root";
    public static final String PASSWORD = "jiang";
    public static final String URL = "jdbc:mysql:///db_bai";
    public static final String DRIVER = "com.mysql.cj.jdbc.Driver";

    //获取连接 - 静态方法
    public static Connection getConnection() {

        try {
            //1.注册驱动
            Class.forName(DRIVER);
            //2.获取连接
            Connection conn = DriverManager.getConnection(
                    URL,
                    USERNAME,
                    PASSWORD
            );
            return conn;
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //关闭连接
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
