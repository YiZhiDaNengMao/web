-- 索引

-- 添加普通索引
create index index_id on stu(id);
-- 删除索引
drop index index_id on stu;

-- 添加唯一索引
create unique index index_name on stu1(name);

-- 单列索引
create index index_id on category1(cname(4));

-- 多列索引
create index index_idn on category1(cid,cname);