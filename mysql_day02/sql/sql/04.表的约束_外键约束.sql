create table `class`(
	cid INT(6) primary key, 
    cname varchar(10),
    sid INT not null unique
);

-- 创建时添加外键约束 但没有指定外键名 系统会默认指定，如：student_ibfk_1
-- 创建时添加外键约束并指定外建名，索引名也会与之一样
create table `student`(
	id int(6) primary key,
    sname varchar(10),
    sid int not null unique,
    foreign key (sid) references class(sid)
);

-- 创建后添加外键约束
-- 语法：[CONSTRAINT <外键约束名称>] FOREIGN KEY（从表的某个字段) references 主表名(被参考字段)

alter table student add 
foreign key (sid) references `class`(sid);

-- 插入失败
insert into student values(2,'hei',3);

-- 先创建主表外键字段值，再创建从表外键字段对应值
insert into class values(1,'bai',2);
insert into student values(1,'bai',2);
insert into class values(2,'hei',3);

-- 查看某个表的约束名（创建时没有指定约束名，系统指定，需要查询）
SELECT * FROM information_schema.table_constraints WHERE table_name = 'student';

-- 删除外键约束名
-- 语法：ALTER TABLE 从表名 DROP FOREIGN KEY 外键约束名;
alter table student drop foreign key student_ibfk_1;

-- 查看某个表的索引名(创建时没有指定约束名，索引名默认为外键字段名）
show index from student;

-- 删除外键索引
-- 语法：ALTER TABLE 从表名 DROP INDEX 索引名;
alter table student drop index sid;
