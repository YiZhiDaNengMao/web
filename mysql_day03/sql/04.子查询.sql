-- 需求1：找出比 最低工资 高的员工姓名和工资
/*
	where子句中的子查询：
	思路分析：
		1.查询出最低工资（800）
		2.找出 sal > 800 的员工
		3.合并
*/
SELECT ename, sal
FROM emp
WHERE sal > (SELECT MIN(sal) FROM emp);

-- 需求2：找出每个岗位的平均工资的薪资等级
/*
	from子句中的子查询：
	思路分析：
		1.找出每个岗位的平均薪资（根据岗位job）	-t表
		2.把以上的查询结果当作一张表使用
		3.将t表和s表进行结合
*/
SELECT t.*, s.grade
FROM 
	( SELECT job,AVG(sal) a
	  FROM emp
	  GROUP BY job ) t
JOIN salary s
ON t.a BETWEEN s.losal AND s.hisal;

-- 需求3：找出每个员工的部门名称，要求显示员工名，部门名
/*
	select子句中的子查询
	☆☆☆ 字段值不能出现多列，所以子查询必须保证是1行
	思路分析
		1.找出部门名称
		2.显示员工名,部门名

*/

SELECT e.ename,(SELECT dname FROM dept d
		WHERE e.`deptno` = d.deptno) '部门名'
FROM emp e;
