package a_c3p0;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * 原始JDBC连接和c3p0连接池的区别
 *
 */
public class Demo03 {
    public static void main(String[] args) throws SQLException {
        //原始JDBC连接
        Connection conn1 = JDBCUtils.getConnection();
        System.out.println(conn1);

        //c3p0连接池
        ComboPooledDataSource cpds = new ComboPooledDataSource();
        Connection conn2 = cpds.getConnection();
        System.out.println(conn2);

        System.out.println("关闭后...");
        conn1.close();
        conn2.close();
        System.out.println(conn1);  //原来值
        System.out.println(conn2);  //null
    }

}
