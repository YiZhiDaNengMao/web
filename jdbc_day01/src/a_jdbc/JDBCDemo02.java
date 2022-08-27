package a_jdbc;

import org.junit.Test;

import java.sql.*;

/*
    Statement对象中处理sql语句的方法:
        boolean execute(String sql)
            主要用于:DDL / DML
        ResultSet executeQuery(String sql)
            主要用于: DQL
        int executeUpdate(String sql)
            主要用于:DML
 */
public class JDBCDemo02 {
    @Test
    public void test01DML() throws ClassNotFoundException, SQLException {
        //1.注册驱动 - 加载驱动类
        Class.forName("com.mysql.cj.jdbc.Driver");
        //2.获取连接对象
        Connection conn = DriverManager.getConnection(
                "jdbc:mysql:///db_bai",
                "root",
                "jiang"
        );
        //3.获取执行sql对象
        Statement sta = conn.createStatement();
        //4.定义sql - 插入数据DML
        String sql = "insert into hei values(1,'lucy')";
        //5.执行DML语句
        boolean execute = sta.execute(sql);
        System.out.println(execute);
    }

    @Test
    public void test02DQL() throws ClassNotFoundException, SQLException {
        //1.注册驱动 - 加载驱动类
        Class.forName("com.mysql.cj.jdbc.Driver");
        //2.获取连接对象
        Connection conn = DriverManager.getConnection(
                "jdbc:mysql:///db_bai",
                "root",
                "jiang"
        );
        //3.获取执行sql对象
        Statement sta = conn.createStatement();
        //4.定义sql - 查询语句DQL
        String sql = "select * from hei";
        //5.执行DQL语句 execute()
        boolean execute = sta.execute(sql);
        System.out.println(execute);
    }


    @Test
    public void test03DML() throws ClassNotFoundException, SQLException {
        //1.注册驱动 - 加载驱动类
        Class.forName("com.mysql.cj.jdbc.Driver");
        //2.获取连接对象
        Connection conn = DriverManager.getConnection(
                "jdbc:mysql:///db_bai",
                "root",
                "jiang"
        );
        //3.获取执行sql对象
        Statement sta = conn.createStatement();
        //4.定义sql - 查询语句DML
        String sql = "insert into hei values(3,'tom')";
        int i = sta.executeUpdate(sql);
        /*
            1表示影响的行数
         */
        System.out.println(i);//1
    }

    @Test
    public void test04DQL() throws ClassNotFoundException, SQLException {
        //1.注册驱动 - 加载驱动类
        Class.forName("com.mysql.cj.jdbc.Driver");
        //2.获取连接对象
        Connection conn = DriverManager.getConnection(
                "jdbc:mysql:///db_bai",
                "root",
                "jiang"
        );
        //3.获取执行sql对象
        Statement sta = conn.createStatement();
        //4.定义sql - 查询语句DQL
        String sql = "select * from hei";
        //5.执行DQL语句
        ResultSet rs = sta.executeQuery(sql);
        //6.处理结果集
        while (rs.next()){
            /*获取数据库中所对应的列的类型
                注意: 下标从1开始
             */
            //id -> int
            int id = rs.getInt(1);
            //name -> String
            String name = rs.getString(2);
            System.out.println(id + ":" + name);
        }
    }


    @Test
    public void test05DQL() throws ClassNotFoundException, SQLException {
        //1.注册驱动 - 加载驱动类
        Class.forName("com.mysql.cj.jdbc.Driver");
        //2.获取连接对象
        Connection conn = DriverManager.getConnection(
                "jdbc:mysql:///db_bai",
                "root",
                "jiang"
        );
        //3.获取执行sql对象
        Statement sta = conn.createStatement();
        //4.定义sql - 查询语句DQL
        String sql = "select id as i,name from hei";
        ResultSet rs = sta.executeQuery(sql);
        while (rs.next()){
            int i = rs.getInt("i");
            String name = rs.getString("name");
            System.out.println(i +" : "+ name);
        }
    }
}




