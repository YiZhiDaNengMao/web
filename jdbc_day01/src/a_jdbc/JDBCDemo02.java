package a_jdbc;

import org.junit.Test;

import java.sql.*;

/**
 *  Statement对象中处理sql语句的方法：
 *      boolean execute(String sql)
 *      ResultSet executeQuery(String sql)
 *      int executeUpdate(String sql)
 */
public class JDBCDemo02 {
    public  void test01() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection conn = DriverManager.getConnection(
                "jdbc:mysql:///db_bai",
                "root" ,
                "jiang"
        );

        Statement sta = conn.createStatement();
        String sql = "select * from dept";
        ResultSet rs = sta.executeQuery(sql);
        while(rs.next()){
            int deptno = rs.getInt(1);
            String dname = rs.getString(2);
            String loc = rs.getString(3);
            System.out.println(deptno + "," + dname + "," + "loc");
        }
    }

    @Test
    public void test02() {

        Connection conn = null;
        Statement stat = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(
                    "jdbc:mysql:///db_bai",
                    "root",
                    "jiang"
            );
            stat = conn.createStatement();
            String sql = "insert into bai values (60,'MYSQL','HANGZHOU')";
            int execute = stat.executeUpdate(sql);
            System.out.println(execute);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } finally {
            if(stat != null){
                try {
                    stat.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }

            if(conn != null){
                try {
                    conn.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }

        }


    }


}
