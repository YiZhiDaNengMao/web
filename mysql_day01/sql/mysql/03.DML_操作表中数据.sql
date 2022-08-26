/* 增：insert	删：delete	改：update */

-- 数据准备，创建一个学生表
CREATE TABLE student(
	sid INT,
    sname VARCHAR(20),
    age INT,
    sex CHAR(1),
    address VARCHAR(36)
);

-- 向表中添加数据，3中方式
/*
语法格式：
	insert into 表名 (字段名1,字段名2,...) values(字段值1,字段值2,...)
*/
-- 方式一：插入全部字段，将所有字段名都写出来
insert into student (sid,sname,age,sex,address) values(1,"小白",5,'男',"地球");
-- 方式二：插入全部字段，不写字段名
insert into student values(2,"小黑",6,'男',"地球");
-- 方式三：插入部分字段
insert into student (sname) values("小道");

select * from student;

-- ------------------------------------------------------------

-- 修改数据
/*
语法格式1：
	update 表名 set 列名 = 值
语法格式2：带条件的修改
	update 表名 set 列名 = 值 [where 条件表达式]
*/

-- 不带条件的修改，建议不要使用
update student set address="China";

/*
有条件的更新：
	条件：where 根据什么条件更新
    
    注意：MySQL8中新增安全模式
		安全模式：非主键条件下无法执行update或delete
*/
-- 带条件的修改
update student set sid=3 where sname="小道";

show variables like 'sql_safe_updates';
set sql_safe_updates = 0;

-- 一次修改多列
update student set age=7,sex="无" where sid=3;

select * from student;

-- ------------------------------------------------------------

-- 删除数据
/*
语法格式1：删除所有数据
	delete from 表名
语法格式2：根据指定条件 删除数据
	delete from 表名 [where 列名=值]
*/
insert into student (sid) values(4); 
-- 删除sid 为 4 的数据
delete from student where sid=4;

/*
需求：删除id = 2 和 (or) id = null 的字段
	null特殊值：表示无穷大 或无穷小，不能 == 比较
	问 是不是 null -> is null
    问 是不是 非null -> is not null
*/
delete from student where sid is null;

-- 删除表中所有数据：2 种方式
-- 方式一：delete from 表名
-- 不推荐，有多少条数据，就执行多少次删除操作，效率低
delete from student;

-- 方式二：truncate  table 表名
-- 推荐，先删除整张表，然后再重新创建一张一模一样的表，效率高
truncate table student;

select * from student;