一、JDBC连接池
1.概述
    
    实际开发中“获取连接”和“释放资源”是非常消耗系统资源的两个过程，为了解决此类问题，通常情况我们会
    采用连接池技术来共享Connection

2.好处
    
    a 节约资源
    b 用户访问效率高
    
3.常见的连接池
   
    1）DBCP连接池: Tomcat内置连接池 => Apache
    2）C3P0连接池
    3）Druid连接池：阿狸

4.C3P0连接池
    
    1)使用c3p0所需jar包
        c3p0-0.9.5.2.jar
        mchange-commons-java-0.2.12.jar

    2)配置文件 配合使用c3p0连接池
        ①.名称(固定形式)
        c3p0.properties 或 c3p0-config.xml
        ②.路径
        直接存放在src下,也可以存放在资源文件中

5.Druid连接池(德鲁伊)
    
    1)使用Druid所需jar包
        druid-1.1.16.jar
    
    2)配置文件
        ①.名称(任意名称)
        ②.路径
        可以放在任意目录下(意味着需要手动调用)
    
    3)使用步骤
        a.导入jar包
        b.定义配置文件
        c.加载配置文件 -> Properties类
        d.获取数据库连接
        e.获取执行sql的对象
        f.执行sql


6.连接池工具类
    
    1)工具类库
        ①.DBUtils(不使用)
        ②.JDBCTemplate
         a.是Spring框架对JDBC的简单封装


7.JDBCTemplate
    
    1)使用步骤
        a.导入第三方jar包

    2)常用方法 - 用于优化CURD操作
        ①.update(): 执行DML语句,增,删,改
    
        ②.queryForMap():执行DQL语句,将查询结果封装到map集合中
          a.将列名作为key，将值作为value 将这条记录封装为一个map集合。
          b.注意:注意:这个方法查询的结果集长度只能是1

        ③.queryForList():执行DQL语句,将查询结果封装到list集合中
          a.将每一条记录封装为一个Map集合，再将Map集合装载到List集合中
    
        ④.query():执行DQL语句,将查询结果封装成JavaBean对象
          a.query的参数：RowMapper(I)
            一般我们使用`BeanPropertyRowMapper`实现类,可以完成数据到JavaBean的自动封装。
    
            语法格式：new BeanPropertyRowMapper<类型>([实现类]类型.class)
    
            注意:实现类中的所有成员变量名字必须和数据库中的字段名字一致!
    
        ⑤.queryForObject():执行DQL语句,将查询结果封装成对象
          a.一般用于聚合函数的查询.

    ————————————————————————————————————————————————————————————————————————————————

二、DAO模式
1.概念

    DAO(Data Access Object):数据访问接口
    数据访问：
        与数据库进行交互，夹在业务逻辑与数据库中间

    M: 模型
    V: 视图
    C: 逻辑层

2.Dao模式的结构
    
    1）实体类
        a 实体类和数据库中的表一一对应
        b 包名: entity / pojo / domain / bean
    
    2）dao层
        a 定义对数据要执行的操作 的接口和实现类
        b 包名: dao / mapper
