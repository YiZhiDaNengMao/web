-- 唯一约束 
-- 添加唯一约束
alter table stu1 add(snum int(10) unique);
-- 特点:允许有多个null值,但是不允许有重复值
insert into stu1(name,age)values('张飞',23);
insert into stu1(name,age)values('刘备',24);

-- 删除唯一约束 index 索引
alter table stu1 drop index snum;

/* 在已有的表中 添加唯一约束 
	多列唯一: 必须是指定的两个列的内容一样的情况下才是一样
    001 张三
    001 李四
*/
-- 将两列先进行绑定
alter table stu1 add unique index(snum,name);
-- 给snum添加唯一约束
alter table stu1 add unique index(snum);