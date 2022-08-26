-- 表关系 一对一

-- 用户表
create table tb_user(
	uid int primary key auto_increment,
    name varchar(10),
    age int,
    gender char(1),
    desc_id int unique,
    -- 添加外键
    constraint fk_user_desc foreign key (desc_id) references tb_user_desc(uid)
);

-- 用户详情表
create table tb_user_desc(
	uid int primary key auto_increment,
    address varchar(10),
    hiredate date,
    salary int
);

