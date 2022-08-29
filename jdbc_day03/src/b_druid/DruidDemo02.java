package b_druid;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * @author Jiang
 * @Date 2022-08-29 10:23
 */
public class DruidDemo02 {
    public static void main(String[] args) {
        Connection conn = null;
        try {
            conn = DruidUtils.getConnection();
            String sql = "insert into bai values(?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1,70);
            ps.setString(2,"DRUID");
            ps.setString(3,"ZG");
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        System.out.println(conn);
        DruidUtils.close(conn);
        System.out.println(conn);
    }
}
