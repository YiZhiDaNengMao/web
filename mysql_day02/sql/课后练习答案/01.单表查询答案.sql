-- 1. 查询职员表中工资大于3000的员工姓名和工资
select ename,sal from emp where sal>2600;

-- 2. 查询职员表中员工号为7369的员工的姓名和部⻔号码
select * from emp where empno = 7369;

-- 3. 选择职员表中工资不在4000到5000的员工的姓名和工资
select ename, sal from emp where sal not between 4000 and 5000;

-- 4. 选择职员表中在20和30号部⻔工作的员工姓名和部⻔号
select ename, deptno from emp where deptno in(20, 30);

-- 5. 选择职员表中没有管理者的员工姓名及职位，按职位排序
select ename,job from emp where mgr is null order by job;

-- 6. 选择职员表中有奖金的员工姓名，工资和奖金，按工资倒序排列
select ename,sal,comm from emp 
where comm is not null 
order by sal desc ;

-- 7. 选择职员表中员工职位的第二个字母是a的员工姓名
select ename from emp where ename like '_a%';

-- 8. 列出部⻔表中的部a名字和所在城市;
select dname,loc from dept;

-- 9. 显示出职员表中的不重复的职位;
select distinct job from emp;

-- 10. 连接职员表中的职员名字、职位、薪水，列之间用逗号连接，列头显示成OUT_PUT提示
-- 1: 字符串连接 concat() 提示 2:用别名控制列头显示
-- oracle 中 字符串的连接可以使用 ||
select concat(ename,',',job,',',sal) as OUt_PUT from emp ;

-- 11. 查询职员表emp中员工号、姓名、工资，以及工资提高百分之20%后的结果，元为单位进 行四舍五入
select empno, ename, sal, round(sal * 1.2) from emp;

-- 12. 查询员工的姓名和工资数,条件限定为工资数必须大于2000，并对查询结果按入职时间进行 排序，早入职排在前面，晚入职排在后面。
select ename, sal, hiredate 
from emp 
where sal > 2000 
order by hiredate;

-- 13. 列出部⻔表中除了ACCOUNTING部⻔还有哪些部⻔。
select * from dept 
where dname <> 'ACCOUNTING'; -- <>不等于
-- 方式二
select dname from dept where dname not in ('ACCOUNTING');


-- 14. 将员工的姓名按首字母排序，并列出姓名的⻓度(length)
select ename, length(ename) as length 
from emp order by ename;

-- 15. 查询各员工的姓名ename，并显示出各员工在公司工作的月份数(即:和当前日期比较，
-- 该员工已经工作了几个月, 用整数表示)。
select ename,timestampdiff(month ,hiredate,now()) from emp;

-- 16题 现有数据表Customer,其中结构如下所示:
-- 16.1)题
select cust_id,cname,ifnull(birthday,'not available'),
	ifnull(account,'no account') from Customer;
-- 16.2)题
select * from Customer where to_char(birthday,'yyyy') = '1987';
select * from Customer where YEAR(birthday)= '1987';
-- 16.3)题
select sum(account) from Customer;

-- 17. 按照”2009-4-11 20:35:10”格式显示系统时间。
select now() as Systemtime;

-- 18. 构造SQL语句查询员工表emp中员工编码empno，姓名ename，以及月收入(薪水+奖金)，
-- 注意有的员工可能没有奖金或薪水。
select empno,ename,(sal+ifnull(comm,0)*0.8) mSal from emp;

-- 19. 查找员工姓名的⻓度是5个字符的员工信息。
select * from emp where length(ename) = 5;

-- 20. 查询员工的姓名和工资，按下面的形式显示:(提示:使用lpad函数)
select ename, 
-- 左边15个符号用$补全
lpad(sal,15,'$') from emp; -- 工资格式按照lpad格式处理

-- 21.查询薪水大于4000元的员工的姓名和薪水，薪水值显示为’$5000.00’这种形式，并对查询 结果按薪水的降序方式进行排列;
select ename,concat(LPAD(sal,5,'$'),'.00') 
from emp where sal>4000 order by sal desc ;

-- 22. 构造查询语句，产生类似于下面形式的结果
select ename, hiredate, 
date_format(hiredate, '%Y年%m月%d日') as review from emp;
