-- 操作的是表，不是表中的数据！！
/* 增：create	删：drop	改：alter*/

/* 案例：创建商品分类表
	表名：category
    字段：
		ID：cid，整型
        名字：cname，字符型

*/

-- ⚪创建表
CREATE TABLE category(
	cid int,
    cname varchar(20)
);

/*案例：创建用户表*/
create table users(
	uid int,
    uname varchar(20)
);

-- 快速创建一个结构相同的表（复制）
/*
	语法结构：
		create table 新表名 like 旧表名;
*/
create table category_test like category;

-- ⚪查看表
-- 查看当前数据库中所有表名
show tables;
-- 显示当前数据库表的结构
desc category;
-- 查看创建表的SQL语句 - 了解
show create table category;

-- ⚪删除表
drop table category_test;
-- 判断表是否存在，存在就删除，不存在就不执行删除
drop table if exists bai;

-- ⚪修改表
-- 修改表的名字
/* 语法格式：rename table 旧表名 to 新表名 */
rename table category to category1;

-- 修改表的字符集
/* 语法格式：alter table 表名 char set 字符集 */
alter table category1 char set utf8;

-- 修改表中字段的类型
/*	关键词：modify
	语法格式：alter table 表名 modify 字段名称 字段类型;
*/
alter table category1 modify cname varchar(10);

-- 向表中添加字段
/*	关键词：add
	语法格式：alter table 表名 add 字段名称 字段类型;
*/
alter table category1 add prize INT;

-- 向表中删除字段
/*	关键词：drop
	语法格式：alter table 表名 drop 字段名称;
*/
alter table category1 drop prize;

-- 修改表中字段名
/*	关键词：change
	语法格式：alter table 表名 change 旧字段名 新字段名 字段类型;
*/
desc category1;
alter table category1 change prize cprize INT;