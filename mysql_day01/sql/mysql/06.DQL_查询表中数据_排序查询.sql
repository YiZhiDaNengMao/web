-- 排序查询

/*
	通过 order by 子句,可以查询出结果进行排序
    
    语法结构:
		select 字段名 from 表名 where 字段 = 值
        order by 字段名[ASC / DESC]
	
    升序:asc
    倒序:desc
*/
-- 需求1：查询员工月薪，并且按照月薪由大到小排序
select sal '月薪' from emp
order by sal desc;

-- 需求2：查询员工姓名，以及月薪，并且按照月薪由大到小排序，如果薪水相同就以id 做降序排序
select empno,ename,sal from emp
order by sal desc, empno desc;

