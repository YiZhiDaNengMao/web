-- 分组查询
-- 1.使用 decode 函数，按照下面的条件：（oracle）
-- switch-case
-- decode(field, case1, value1, case2, value2 ...)
/**
PRESIDENT      A
MANAGER 	   B
ANALYST        C
SALESMAN       D
CLERK          E
*/
select ename, job, 
	decode(job, 'PRESIDENT', 'A'
			'MANAGER', 'B',
            'ANALYST', 'C'
    ) from emp;

-- 2. 查询公司员工工资的最大值，最小值，平均值，总和
select max(sal), min(sal), avg(sal), sum(sal) from emp;
-- 3. 查询每个部门中各个职位的最高薪水。
select max(sal),deptno from emp group by deptno;
select avg(sal),deptno from emp group by deptno;
-- 4. 选择具有各个 job 的员工人数（提示：对 job 进行分组）
select count(ename), job from emp group by job;
-- 5. 查询员工最高工资和最低工资的差距，列名为 DIFFERENCE
select max(sal) - min(sal) DIFFERENCE from emp;
-- 6. 查询各个管理者属下员工的最低工资，其中最低工资不能低于 2000，没有管理者的员工不计算在内
select min(sal), mgr from emp 
where mgr is not null 
group by mgr
having min(sal) >= 2000;
-- 7. 查询各个部门中工资大于1500的员工人数
select deptno, count(*) from emp where sal > 1500 group by deptno;


-- 8. 查询各部门的平均绩效，如果绩效为null，则按数值0进行统计
select avg(ifnull(comm,0)), deptno from emp group by deptno;
-- 11. 查询每个班级中每个科目的最高成绩
select classid, subject, max(score) from students group by classid,subject;
-- 12. 查询出每门课都大于80分的学生姓名。
select name from student_score group by name having min(score) > 80; 