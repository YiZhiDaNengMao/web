-- DQL 之 条件查询

/* 语法格式: select 列名 from 表名 where 条件表达式 */

-- 需求1：查询部门在20的所有人
select * from emp
where deptno=20;

-- 需求2：查询月薪大于1000的人
select ename,sal from emp
where sal > 1000;

-- 需求3：查询月薪大于1000，并且小于2000的人
-- 方式一: 关键词: and
select ename,sal from emp 
where sal > 1000 and sal < 2000;
-- 方式二(推荐使用): 关键词 between 在....之间
select ename,sal from emp 
where sal between 1000 and 2000;

-- 需求4：查询在20或者30部门的人
-- 方式一: 关键词 or
select ename,deptno from emp
where deptno=20 or deptno=30;
-- 方式二: 关键词 in(参数1,参数2)
select ename,deptno from emp
where deptno in (20,30);

-- 需求5：查询所有没有奖金的人
select ename,comm from emp 
where comm is null;

-- 需求6：查询名字是SCOTT的人
-- 方式一:
select * from emp
where ename="SCOTT";
-- 方式二: 模糊查询 关键词: like
select * from emp
where ename like "SCOTT";

-- 需求7：查询名字是以S开头的人
/*
	模糊查询: 查询使用like关键词,可以使用 通配符进行占位 
		1) _ :表示单个 任意字符
        2) % :表示任意个数 字符
*/
select * from emp
where ename like "S%";

-- 需求8：查询名字有S的人
select * from emp 
where ename like "%S%";

-- 需求9：查询名字中第二个字母是A的人
select * from emp
where ename like "_A%";
