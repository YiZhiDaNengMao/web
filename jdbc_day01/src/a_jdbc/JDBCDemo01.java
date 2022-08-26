package a_jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @author Jiang
 * @Date 2022-08-25 15:34
 */
public class JDBCDemo01 {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/db_bai",
                "root",
                "jiang"
        );

        Statement sta = conn.createStatement();

        String sql = "create table dao(id int primary key,name varchar(10)";

        boolean execute = sta.execute(sql);
        System.out.println(execute);

        sta.close();
        conn.close();


    }

}
