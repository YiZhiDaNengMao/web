package b_utils;

import b_utils.JDBCUtils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @author Jiang
 * @Date 2022-08-26 10:13
 */
public class JDBCTestDemo {
    public static void main(String[] args) {
        Connection conn = null;
        Statement sta = null;
        ResultSet rs = null;
        try{
            conn = JDBCUtils.getConnection();
            sta = conn.createStatement();
            String sql = "select * from bai";
            rs = sta.executeQuery(sql);

            System.out.println(rs);
            while(rs.next()){
                int deptno = rs.getInt("deptno");
                String dname = rs.getString("dname");
                String loc = rs.getString("loc");
                System.out.println(deptno + " " + dname + " " + loc);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JDBCUtils.close(conn,sta,rs);
        }

    }
}
