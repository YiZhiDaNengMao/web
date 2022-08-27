package a_c3p0;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.junit.Test;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * @author Jiang
 * @Date 2022-08-26 20:22
 */
public class Demo02 {
    @Test
    public void test02() throws SQLException {
//        ComboPooledDataSource cpds = new ComboPooledDataSource();
//        Connection conn = cpds.getConnection();
//        System.out.println(conn);

        ComboPooledDataSource cpds = new ComboPooledDataSource("otherc3p0");
        Connection conn = cpds.getConnection();
        System.out.println(conn);
    }
}
