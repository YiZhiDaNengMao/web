-- 1. 查询职员表中工资大于 5600 的员工姓名和工资
select ename,sal from emp
where sal > 5600;

-- 2. 查询职员表中员工号为 1008 的员工的姓名和部门号码
select ename,deptno from emp
where empno=1008;

-- 3. 选择职员表中工资不在 6000 到 8000 的员工的姓名和工资
select ename,sal from emp
where not sal between 6000 and 8000;

-- 4. 选择职员表中在 20 和 30 号部门工作的员工姓名和部门号
select ename,deptno from emp
where deptno in (20,30);

-- 5. 选择职员表中没有管理者的员工姓名及职位, 按职位排序
select ename,job from emp
where mgr is null
order by job;

-- 6. 选择职员表中有奖金的员工姓名，工资和奖金，按工资倒序排列
select ename,sal,comm from emp
where comm is not null
order by sal desc;

-- 7. 选择职员表中员工职位的第二个字母是 a 的员工姓名
select ename from emp
where ename like "_a%";

-- 8. 列出部门表中的部门名字和所在城市
select dname,loc from dept;

-- 9. 显示出职员表中的不重复的职位；
select distinct job from emp;

-- 10. 连接职员表中的职员名字、职位、薪资，列之间用逗号连接，列头显示成 OUT_PUT 提示
-- 1: 字符串连接 concat() 提示 2：用别名控制列头显示
select concat(ename,job,sal) OUT_PUT from emp;

-- 11. 查询职员表 emp 中员工号、姓名、工资，以及工资提高百分之 20%后的结果，元为单位进行四舍五入
select empno,ename,sal,concat(round(sal * 1.2),'元') "1.2*sal"
from emp;

-- 12. 查询员工的姓名和工资数,条件限定为工资数必须大于 7200，并对查询结果按入职时间进行
-- 排序，早入职排在前面，晚入职排在后面
select ename,sal,hiredate from emp
where sal > 7200
order by hiredate desc;

-- 13. 列出部门表中除了 ACCOUNTING 部门还有哪些部门
select * from dept
where dname <> "ACCOUNTING";

-- 14. 将员工的姓名按首字母排序，并列出姓名的长度（length）
select ename,length(ename) from emp
order by ename;

-- 15

select * from emp;
select * from dept;