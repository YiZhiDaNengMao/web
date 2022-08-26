-- 索引失效 

-- 普通查询 
select * from emp;

-- 使用模糊查询 like关键词
select * from emp where ename like '%S';

-- 给ename添加索引 
create index index_name on emp(ename);

-- %存在开头
select * from emp where ename like '%S';

