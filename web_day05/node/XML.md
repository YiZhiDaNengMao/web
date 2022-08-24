1.xml概述
    XML（EXtensible Markup Language）：可扩展标记语言
    可扩展：标签都是自定义的 student name

2.作用
    1）用于进行数据存储和传输
    2）作为配置文件使用
        好处：可读性好，可维护性高！！

3.语法格式
    1）xml文件的后缀名 xxx.xml
    2）xml第一行必须定义为文档声明
    3）xml文件中有且只有一个根标签
    4）属性值必须用引号（单双都可）引起来
    5）xml标签名称区分大小写

4.xml解析
    1）xml解析就是从xml中获取数据 - DOM（文档对象模型）
    2）常见的解析工具
        a Jsoup：java的html解析器
        b dom4j：服务器经常使用的xml文件解析器，因为基于dom思想实现

5.约束（重要★★★★★）
    1)概念：用来限定xml文件的书写规则
    2）分类
        a DTD：简单的约束技术
        b Schema：复杂的约束技术

6.DTD约束
    1）引入约束的方式
        a 本地：<!DOCTYPE 根标签名 SYSTEM "DTD文件位置">
        b 网络：<!DOCTYPE 根标签名 PUBLIC "DTD文件名字" "DTD文件位置URL">
        b 文件：<!DOCTYPE 根标签名[DTD文件内容]>