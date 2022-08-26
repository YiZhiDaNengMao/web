-- 分组查询 
/*
	概念: 分组查询指的是使用 group by语句,对查询的信息进行分组,相同数据作为一组.
	
    语法格式:
	  select 分组字段/聚合函数 from 表名 group by 分组字段 [having 条件];
	
    注意: having效率低,不推荐使用
*/

-- 公司中的平均薪资(可以视作 将整张表作为一组)
select avg(sal) from emp;

-- 需求1：查询每个部门的平均薪资(相同的部门号作为一组)
select deptno '部门编号',avg(sal) '平均薪资' from emp
group by deptno;

-- select avg(sal),deptno,ename from emp group by deptno; 错误写法 

-- 需求2：查询除了10部门以外其他部门的平均薪资
-- 先筛选,后分组
select deptno '部门编号',avg(sal) '平均薪资' from emp
where deptno <> 10
group by deptno;
-- 先分组,后筛选
select deptno '部门编号',avg(sal) '平均薪资' 
from emp
group by deptno
having deptno <> 10;

-- 需求3：查询平均薪资高于1600的部门
-- ⚪组函数不能用在where里，只能用于分组条件having
select deptno dn,avg(sal) a
from emp
group by deptno
having a > 1600;


/* ⚪单表查询完整sql的结构:
select 
	字段、函数
from 
	表名
where
	条件
group by
	分组字段
having
	组函数条件 
order by
	排序方式
limit
	startRow，pageSize 分页
*/