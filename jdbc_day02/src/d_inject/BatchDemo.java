package d_inject;

import b_pojo.User;
import c_utils.JDBCUtils;

import java.sql.*;
import java.util.Scanner;

/**
 * 登录案例：
 * 需求：
 *  1.通过控制台输入用户名、密码
 *  2.判断用户是否登录成功 => 用户输入的账号和密码 跟 数据库中数据匹配
 *  3.获取数据库中的账号和密码
 *      select * from user
 *      where username = "XXX"
 *      and password = "XXX";
 */
public class BatchDemo {
    public static void main(String[] args) {
        //需求: 向user表中插入多条用户数据
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            //1.连接数据库
            conn = JDBCUtils.getConnection();
            //2.编写SQL
            String sql = "insert into user values(null,?,?,?)";
            //3.获取执行SQL对象 - preparedStatement
            ps = conn.prepareStatement(sql);
            //4 给 ? 赋值 -> 给参数赋值
            for(int i = 0; i < 7; i ++){
                ps.setString(1,"user-0" + i);
                ps.setString(2,"666");
                ps.setString(3,"2022-8-26");
                //5.将sql添加到执行队列中
                ps.addBatch();
            }
            //6.批量执行SQL
            ps.executeBatch();
            //7.清空队列
            ps.clearBatch();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JDBCUtils.close(conn,ps);
        }
    }
}
