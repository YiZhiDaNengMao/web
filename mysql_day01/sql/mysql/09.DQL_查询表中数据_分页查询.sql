-- 分页查询 

/*
	语法格式: 
		select 字段列表 from 表名 limit 起始索引,查询条目数量;
	注意: 起始索引是从0开始
    
    分页查询关键词: limit
		startRow: 从0开始,通过当前页面(page)和每页显示条数(rowCount)进行计算
        rowCount: 一般由网站规定
        
		计算公式: startRow = (page-1) * rowCount
				  起始索引 = (当前页码 - 1) * 每页显示的条数
        
	limit 0 , 3
       0:表示开始的行数
       3:表示每页显示条数
*/
select * from emp;

select * from emp limit 0,3;
select * from emp limit 3,3;
select * from emp limit 6,3;
select * from emp limit 9,3;
select * from emp limit 12,3;

-- 排序后进行分页
select * from emp
order by sal
limit 0,3;