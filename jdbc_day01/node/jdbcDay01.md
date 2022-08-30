JDBC(Java DataBase Connectivity):Java数据库连接

1.概念

    是一种用于执行SQL语句的java API,为多种关系型数据库提供统一访问的方式,它是由一组java接口和类组成.

2.数据库连接的三方: sun公司、数据库厂商、程序员

    1)sun公司:规范(规则)制定者,制定了JDBC连接规范
        实际上就是一套接口(接口本身不能new对象)
        a.DriverManager接口
        作用:管理各种不同的JDBC驱动类
        b.Connection接口
    
    2)数据库厂商: mysql、oracle、sqlserver、db2
    实现JDBC接口,他们的实现类称之为驱动
    
    3)程序员:学习jdbc规范使用相应方法操作数据库.

3.JDBC连接原理

    JDBC是由sun公司定义的一套操作有所关系型数据库的规则(接口),而数据库厂商需要实现这套接口,提供数据库 驱动jar包,我们可以使用这套接口进行连接数据.

4.JDBC的使用步骤

    前提:找到mysql-connector-java-8.0.29.jar
    地址:C:\Program Files (x86)\MySQL\Connector J 8.0
    
    1)往工程中导入驱动jar包
    2)注册(加载)驱动(类)
    3)获取数据库连接对象 Connection
    4)定义sql语句
    5)获取执行sql语句的对象 Statement
    6)执行sql,接收返回结果
    7)处理结果集
    8)释放资源

5.封装实体类

6.JDBC工具类进行优化 - 自己写

    1)把常用的方法封装到JDBC工具类中（JDBCUtils）

    2）封装方式一：
    ·把常用的字符串定义成常量：用户名，密码，URL，驱动类
    ·得到连接：getConnection()
    ·关闭连接：colse()

    3）封装方式二：
        ·使用配置文件完成（properties / xml）
        ·得到连接：getConnection()
        ·关闭连接：colse()
