-- 主键约束 

-- 在创建表时,添加主键约束 + 自动增长
create table stu(
	id int(6) primary key auto_increment,
    name varchar(20),
    age int (3),
    sex char(1) not null default '男',
    score int(5) comment '学分'
);
-- 往表中添加数据
insert into stu values(2,'李四','18','女',23);

insert into stu values(null,'王五','18','女',23);

-- 查询最后一次添加进来的id值 
select last_insert_id();

-- ---------------------------------------------------------------

-- 在已有的表中添加主键约束
alter table stu modify id INT primary key auto_increment;

-- 有自增约束的主键字段，删除主键约束前必须先删除自增约束，否则删除失败
alter table stu modify id INT;
alter table stu drop primary key;

-- ---------------------------------------------------------------
-- auto_increment 默认从 1 开始
-- 设置开始值为 36
create table yao(
	id int(6) primary key auto_increment,
    name varchar(10),
    sex char(1) default '男'
)auto_increment = 36;

-- 插入数据
insert into yao(name) values("猪霸天");
insert into yao(name) values("牛破天");
insert into yao(name) values("熊魔天");
