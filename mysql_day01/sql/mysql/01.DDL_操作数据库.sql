-- DDL操作数据库

/* 方式一：直接创建数据库*/
create database db_dao;

/* 方式二：创建数据库，并指定字符集
	一般都是指定utf-8，与java中的编码保持一只
*/
create database db_bai character set utf8;

/* 方式三：创建数据库，判断不存在，再创建*/
create database if not exists db_hei;
create database db_hei;

-- 切换数据库
use db_bai;

-- 查看当前正在使用的数据库
select database();

-- 查看当前mysql中有哪些数据库
show databases;

-- 查看数据库的定义信息  
show create database db_dao;

-- 修改数据库 alter
alter database db_hei char set utf8;
show create database db_hei;

-- 删除数据库 drop
drop database db_hei;
show databases;