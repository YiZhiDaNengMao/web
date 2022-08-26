-- DQL_普通函数 + 聚合函数

-- 普通函数 - 方言(mysql自己拥有的)
/*
	字符串相关 数学相关 时间相关
*/
-- 向上取整 
select ceil(3.14);
-- 向下取整
select floor(3.14);

-- 获取当前系统时间
select now();
-- 获取当前时间的月份
select month(now());

-- 字符串拼接
select concat("小","白") name;

-- 是null,则就取后面的值
select ifnull(null,"null") ifnull;
select ifnull('not null',null) ifnull;

-- --------------------------------------------

-- 聚合函数
/*
	概念: 将一列数据作为一个整体,进行纵向计算.
    分类:
		count(列名)	- 统计总数(一般选中不为null的列,例如:id)
        max(列名) - 最大值
        min(列名) - 最小值
        sum(列名) - 求和
        avg(列名) - 平均值
	
    语法结构:
		select 聚合函数名(列名) from 表;
        
	注意: null值不参与所有聚合函数的运算!!!
*/
-- 需求1：显示emp表中 员工个数（14个）
select count(*) from emp;

-- 需求2：查询员工中的最高薪资
select max(sal) from emp;

-- 需求3：求平均薪资多少
select avg(sal) from emp;

-- 需求4：四舍五入,变成整数
select round(avg(sal)) from emp;

-- 需求5：求平均的奖金
select * from emp;
-- 聚合函数会自动排除null
select avg(comm) from emp;
-- 一定要加上null值进行计算
select avg(ifnull(comm,0)) from emp;

-- 需求6：求所有员工的月薪总和
select sum(sal) from emp;
