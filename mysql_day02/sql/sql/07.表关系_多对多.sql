-- 表关系 多对多

-- 订单表
create table tb_order(
	id int primary key auto_increment,
    prize double(10,2),
    payment tinyint,
	state tinyint
);

-- 商品表
create table tb_product(
	id int primary key auto_increment,
    title varchar(100),
    prize double(10,2)
);

-- 第三张表（中间表）
create table tb_order_product(
	id int primary key auto_increment,
    -- 外键
    order_id int,
    product_id int
);

-- 创建完成后添加外键
alter table tb_order_product add 
constraint fk_order_id foreign key (order_id) references tb_order(id);

alter table tb_order_product add 
constraint fk_product_id foreign key (product_id) references tb_product(id);