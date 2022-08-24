-- 事务（commit 和 rollback)

/* 注意：
	mysql中的事务默认是自动提交的
	只要执行一条DML语句就会自动执行一次commit
	关闭自动提交：starttransaction

*/
CREATE TABLE t_transaction(
	tid INT PRIMARY KEY AUTO_INCREMENT,
	tname VARCHAR(10)
);


-- 自动提交了数据
INSERT INTO t_transaction(tname) VALUES("小白");

-- 关闭自动提交：start transaction / begin
BEGIN;

-- 取消自动提交：set autocommit = 0 / 1
SET autocommit = 1;

-- 插入数据
INSERT INTO t_transaction(tname) VALUES("小白02");

-- 事务提交
COMMIT;

-- 事务回滚
ROLLBACK;

TRUNCATE TABLE t_transaction;
