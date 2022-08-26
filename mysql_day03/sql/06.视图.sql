-- 创建视图
CREATE VIEW ev AS
	(SELECT empno, ename FROM emp);
	
-- 查询ev视图
SELECT * FROM ev;

-- 复制dept表
CREATE TABLE dept_bak
	SELECT * FROM dept;
	
-- 给dept_bak创建视图
CREATE VIEW dv AS
	(SELECT * FROM dept_bak);

-- 查询dv视图	
SELECT * FROM dv;

-- 通过dv视图 往 dept_bak插入数据
INSERT INTO dv VALUES(50,'JAVA','TOKYO');

-- 查询dept_bak
SELECT * FROM dept_bak;

-- ★重点 - ☆查询☆
-- 需求：查询薪资高于部门的平均薪资的员工

-- 将经常使用的结果作为视图	
CREATE OR REPLACE VIEW ev AS
SELECT deptno, AVG(sal)
	FROM emp  GROUP BY deptno;

SELECT * FROM ev;

-- 通过视图查询
SELECT * FROM emp e JOIN  ev
ON e.deptno=ev.deptno
WHERE e.`sal` > ev.`AVG(sal)`;
