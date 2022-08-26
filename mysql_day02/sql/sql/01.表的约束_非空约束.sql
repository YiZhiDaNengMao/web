-- 非空约束 not null

-- 创建表时添加约束
create table stu(
	id INT,
    name varchar(20) not null
);

-- 创建完表后，添加非空约束，关键词：modify - 修改
alter table stu modify id INT not null;

-- 删除name的非空约束，关键词：modify - 修改
alter table stu modify name varchar(20);

-- 给stu新增字段，新增字段上添加非空约束
alter table stu add sex varchar(1) not null;

-- 给非空字段添加默认值 关键词：default
alter table stu modify name varchar(20) not null default '猪霸天';

insert into stu(id,sex) values(1,'女');
