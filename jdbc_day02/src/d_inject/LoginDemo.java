package d_inject;

import b_pojo.User;
import c_utils.JDBCUtils;

import javax.swing.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
public class LoginDemo {
    public static void main(String[] args) {
        //1.通过控制台输入用户名、密码
        Scanner sc = new Scanner(System.in);
        System.out.print("用户名：");
        String username = sc.nextLine();
        System.out.print("密码：");
        String password = sc.nextLine();
        
        //2.调用登录的方法 => 用户信息
        LoginDemo ld = new LoginDemo();
        User user = ld.login(username, password);
        
        //3.判断用户是否存在
        if(user.getUsername() == null){
            System.out.println("Login failed！！");
        } else {
            System.out.println("Login success!!");
            System.out.println(user.toString());
        }
    }
    
    //登录的方法
    public User login(String username, String password){
        Connection conn = null;
        Statement sta = null;
        ResultSet rs = null;


        try {
            //1.连接数据库
            conn = JDBCUtils.getConnection();
            //2.获取执行SQL对象
            sta = conn.createStatement();
            //3.编写SQL
            String sql = "select * from user " +
                    "where username = '"+username+"' and password = '"+password+"'";
            //4.执行SQL
            rs = sta.executeQuery(sql);
            //5.处理结果集
            while(rs.next()){
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                return user;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JDBCUtils.close(conn,sta,rs);
        }
//        return user;
        return null;
    }
}
