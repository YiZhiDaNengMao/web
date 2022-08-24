-- 内连接

-- SQL92  / SQL99

-- 等值连接
-- 需求1：查询每个员工所在部门名称,显示员工名和部门名
SELECT 
	e.ename , d.dname
FROM 
	emp e 
-- join表示连接
JOIN
	dept d
-- on:表示表连接的条件
ON
	e.deptno = d.deptno;
-- where 查询的条件;


/* 需求2：找出每个员工的薪资等级,
	要求显示员工名,薪资,薪资等级  */
SELECT 
	e.ename,e.sal,s.grade
FROM 
	emp e
JOIN
	salary s 
ON
	e.sal BETWEEN s.losal AND s.hisal;

-- 全连接
/* 需求3：查询员工的上级领导，
	要求显示员工名和对应的领导名 

emp a ->    员工名
emp b ->    上级领导
一张表当两张表使用
*/
SELECT 
	a.ename AS '员工名' , b.ename AS '领导名'
FROM 
	emp a
JOIN
	emp b
ON
	a.mgr = b.empno;