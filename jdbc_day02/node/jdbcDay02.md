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

7.SQL注入

    1）概念
        SQL注入攻击指的是通过构建 特殊的输入值 作为参数传入到web应用程序中，而这些输入的大都是
        SQL语法中一个组合现象，通过执行SQL语句拼接到代码从，执行的过程中造成攻击现象

    2)存在问题: 用户在输入密码是使用 sql注入攻击方式导致 表达式恒成立
    账号:随意
    密码: a' or '1' = '1 -> 恒成立的值

    select * from user where true = true; 

    3）产生原因
        在sql拼接时,有一些sql的特殊关键词参与了字符串的拼接造成安全性问题

    4）解决方式
        要解决SQL注入就是不能让用户输入的账号和密码和我们SQL语句进行 简单的字符串拼接.

        需要使用特定格式进行字符串拼接.
        使用PreparedStatement类 解决SQL注入问题.

8.预编译对象：preparedStatement类
    
    1）概念
        一个预编译的SQL语句对象，用于防止注入攻击
    2）特点
        a.因为有预编译的功能,提高SQL的执行效率
        b.可以有效的防止注入攻击,安全性更高.

9.批处理

    当我们有多条sql语句需要发送到数据库执行的时候,有两种方式可以进行处理:
    方式一: 执行一次发送一条sql
    方式二: 执行一次发送多条sql(批处理)
        addBatch()
        executeBatch()
        

    好处:减少与数据库之间的交互次数,效率会有大的提升.

10.JDBC - API总结
    
    1）DriverManager：驱动管理对象
    2）Connection：连接数据库对象
    3）Statement：执行sql的对象
        执行sql的三个方法：
            execute():用于执行DDL
            executeQuery():用于执行DQL
            executeUpdate():用于执行DML

    ☆☆☆
        ExecuteQuery(sql)的返回值 - ： 返回包含给定查询所生成数据的 ResultSet 对象;
        永远不能为 null,如果没有查询到信息,返回一个next()为false的ResultSet 对象

    4）PreparedStatement：执行sql的对象 - 预编译对象
        解决了sql注入问题 （具体实现?) 
        执行sql的三个方法：与Statement一样

        预编译SQL：使用 ？ 作为占位符进行拼接

        setXxx(参数1,参数2)：设置占位符?的值
            参数1：?的位置，从1开始
            参数2：?的值
            
    5）ResultSet：结果集对象，用于封装查询结果
        next()：游标向下一动一行
        
        getXxx(参数)：获取数据
            Xxx:代表参数类型
        参数：
            int:当前字段的下标，从1开始
            String：表示当前字段名称


------------------------------------------------------------
面试题：
    
    1.Statement 和 PrepareStatement的区别？