-- 表关系 一对多

-- 部门表（主表）
create table tb_dept(
	did int primary key auto_increment,
    dname varchar(10),
    address varchar(20)
);

-- 员工表（从表）
create table tb_emp(
	eid int primary key auto_increment,
	ename varchar(10),
    age int,
    dept_id int,
    -- 添加外键
    constraint fk_emp_dept foreign key (dept_id) references tb_dept(did)
);