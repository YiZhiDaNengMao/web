-- DQL 简单查询
/* 语法格式：select 列名 from 表名 */

-- 1.查询单个字段	例如：查询员工名字 ename
select ename from emp;

-- 2.查询多个字段, 例如:员工编号/员工姓名/入职时间
select empno,ename,hiredate from emp;

-- 3.查询所有字段
select * from emp;

-- 4.将查询出来的字段，起别名
/*
关键词：as
语法结构：select 字段名 as 别名
注意：as 可以省略
*/
select ename as name from emp;
select ename name from emp;

-- 5.查询全部员工的年薪
-- 查月薪
select ename,sal from emp;
-- 查年薪
select ename '名字', sal*12 '年薪' from emp;

-- 6.查询员工的年薪 + 奖金
/*
comm(奖金) 有的null 不能直接计算
*/
select ename, sal*12 + comm from emp;

/*
询问是不是null
	Oracle - nvl
	MySQL - ifnull()
*/
select ename '名字', sal*12 + ifnull(comm,0) '年薪＋奖金' from emp;

-- 7.查询emp表中的部门，相同部门只显示一次
select deptno from emp;
-- 去除重复值 关键词：distinct
select distinct deptno from emp;

select ename,deptno from emp 
where deptno in (select distinct deptno from emp);

select * from emp;