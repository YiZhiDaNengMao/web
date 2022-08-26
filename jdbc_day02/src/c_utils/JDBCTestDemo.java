package c_utils;

import b_pojo.Emp;

import java.sql.*;

/**
 * @author Jiang
 * @Date 2022-08-26 11:32
 */
public class JDBCTestDemo {
    public static void main(String[] args) {
        Connection conn = JDBCUtils.getConnection();
        Statement sta = null;
        ResultSet rs = null;
        try {
            sta = conn.createStatement();
            rs = sta.executeQuery("select * from emp");
            while(rs.next()){
                int empno = rs.getInt(1);
                String ename = rs.getString(2);
                String job = rs.getString(3);
                int mgr = rs.getInt(4);
                Date hiredate = rs.getDate(5);
                double sal = rs.getDouble(6);
                double comm = rs.getDouble(7);
                int deptno = rs.getInt(8);
                Emp emp = new Emp(
                        empno,
                        ename,
                        job,
                        mgr,
                        hiredate,
                        sal,
                        comm,
                        deptno
                );
                System.out.println(emp.toString());

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JDBCUtils.close(conn,sta,rs);
        }

    }
}
