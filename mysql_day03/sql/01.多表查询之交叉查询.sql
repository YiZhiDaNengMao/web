-- 笛卡尔积现象 
SELECT ename,dname FROM emp,dept;


/* 交叉连接: 
	语法格式1: select 字段名 表1 cross join 表2 where 子句
    语法格式2: select 字段名 表1,表2 where 子句
*/
SELECT ename,dname 
FROM emp,dept
WHERE emp.deptno = dept.deptno;

-- 提升查询效率
SELECT emp.deptno , dept.deptno
FROM emp,dept
WHERE emp.deptno = dept.deptno;

-- 继续优化 -> 给表添加别名
SELECT e.deptno , d.deptno
FROM emp AS e , dept AS d
WHERE e.deptno = d.deptno;