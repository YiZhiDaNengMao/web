/*
左外连接（左连接）
	语法格式：
		SELECT 字段列表
		FROM A表 LEFT [OUTER] JOIN B表
		ON 关联条件
		WHERE 等其他子句;

右外连接（右连接）
	语法格式：
		SELECT 字段列表
		FROM A表 RIGHT [OUTER] JOIN B表
		ON 关联条件
		WHERE 等其他子句;
*/

-- 右外连接 主表 = 驱动表

-- 需求1：查询每个员工的上级领导,要求显示所有员工的名字和领导名
SELECT e.ename '员工名', m.ename '领导名'
FROM emp e
LEFT JOIN emp m
ON e.mgr = m.empno;

-- 需求2：找出每个员工的部门名称以及工资等级，
-- 			要求显示员工名，部门名，薪资，薪资等级
SELECT e.ename, d.dname, e.sal, s.grade
FROM emp e
JOIN dept d
ON e.deptno = d.deptno
JOIN salary s
ON e.sal BETWEEN s.losal AND s.hisal;


