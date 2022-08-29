package b_druid;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

/**
 * @author Jiang
 * @Date 2022-08-29 9:40
 */
public class DruidDemo01 {
    public static void main(String[] args) {
        Properties pro = new Properties();
        try {
            pro.load(DruidDemo01.class.getClassLoader().
                    getResourceAsStream("druid.properties"));
            DataSource ds = DruidDataSourceFactory.createDataSource(pro);
            Connection conn = ds.getConnection();
            String sql = "select * from bai";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery(sql);
            while(rs.next()){
                int deptno = rs.getInt(1);
                System.out.println(deptno);
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
