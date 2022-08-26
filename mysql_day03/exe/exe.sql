-- 1-------------------------------
SELECT e.ename,d.dname,d.loc
FROM emp e, dept d
WHERE e.`deptno` = d.`deptno`;

-- 2-------------------------------
SELECT e.ename '员工名',m.ename '管理者'
FROM emp e
JOIN emp m
ON e.mgr = m.empno;

-- 3-------------------------------
SELECT e.empno,e.ename,e.deptno,d.dname,d.loc
FROM emp e
LEFT JOIN dept d
ON e.`deptno`=d.`deptno`;

-- 4-------------------------------
SELECT e.*, d.*
FROM emp e
RIGHT JOIN dept d
ON d.`deptno`=e.`deptno`;

-- 5-------------------------------
-- ①
SELECT e.*, d.*
FROM emp e
RIGHT JOIN dept d
ON d.`deptno`=e.`deptno`
WHERE e.deptno IS NULL;

-- ② NOT EXISTS
SELECT *
FROM dept d
WHERE NOT EXISTS(SELECT * FROM emp e 
	WHERE e.`deptno`=d.`deptno`);
	
-- 6-------------------------------
SELECT e.job
FROM emp e
RIGHT JOIN dept d
ON e.`deptno`=d.`deptno`
WHERE d.`dname`="SALES";


-- 7-------------------------------
SELECT d.dname, d.loc, IFNULL(s.c,0) '员工数量', IFNULL(s.a,0.0000) '平均工资'
FROM dept d
LEFT JOIN (SELECT e.`deptno`,IFNULL(COUNT(e.`empno`),0) c, AVG(e.sal) a
		FROM emp e
		GROUP BY e.deptno) s
ON d.`deptno`=s.deptno;

-- 8-------------------------------
SELECT e1.ename, e2.ename FROM emp e1, emp e2 WHERE e1.mgr = e2.empno;
SELECT e1.ename, e2.ename FROM emp e1, emp e2 WHERE e1.empno = e2.mgr;

-- 9-------------------------------
