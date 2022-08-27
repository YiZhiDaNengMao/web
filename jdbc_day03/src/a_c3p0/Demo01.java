package a_c3p0;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.junit.Test;

import java.beans.PropertyVetoException;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * @author Jiang
 * @Date 2022-08-26 19:37
 */
public class Demo01 {

    @Test
    public void test01() throws PropertyVetoException, SQLException {
        ComboPooledDataSource cpds = new ComboPooledDataSource();
        cpds.setDriverClass( "com.mysql.cj.jdbc.Driver" ); //loads the jdbc driver
        cpds.setJdbcUrl( "jdbc:mysql:///db_bai" );
        cpds.setUser("root");
        cpds.setPassword("jiang");

        //2.通过连接池对象获取Connection连接
        Connection conn = cpds.getConnection();
        System.out.println(conn);

    }






}
