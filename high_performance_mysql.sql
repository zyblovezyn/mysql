
-- 第五章 创建高性能索引

-- 5.5.3
ALTER TABLE tablename ENGINE=tableengine

-- 第六章 查询性能优化
-- 6.1
-- 6.2

EXPLAIN SELECT * FROM date_func

DELETE FROM messages WHERE created<DATE_SUB(NOW(),INTERVAL 3 MONTH);
-- 如果数据量过大，定期地清除大量数据时，如果用一个大的语句
-- 一次性完成的话，则可能需要一次锁住很多数据、
-- 占满整个事务日志、耗尽系统资源、阻塞很多小的但重要的查询。
-- 将一个大的DELETE语句切分成多个较小的查询可以
-- 尽可能小地影响MySQL性能，同时还可以减少MySQL复制的延迟。

-- 但是一次删除一万行数据,比较高效对服务器影响最小
DELETE FROM messages WHERE created< DATE_SUB(NOW(),INTERVAL 3 MONTH) LIMIT 10000;

-- 6.3.3
-- 分解关联查询
SELECT * FROM tag 
JOIN tag_post ON tag_post.tag_id=tag.id
JOIN post ON tag_post.id=post.id
WHERE tag.tag='mysql'
-- 以上查询分解成下面查询来替代：
SELECT * FROM tag_post WHERE tag_id='1'
SELECT * FROM tag_post WHERE tag_id='1234'
SELECT * FROM post WHERE post.id IN (1,2,3,4)

-- 客户端发送一条查询给服务器。
-- 服务器先检查查询缓存，如果命中了缓存，则立刻返回存储在缓存中的结果。否则进入下一阶段。
-- 服务器端进行SQL解析、预处理，再由优化器生成对应的执行计划。
-- MySQL根据优化器生成的执行计划，调用存储引擎的API来执行查询。
-- 将结果返回给客户端。

-- 7.2.2 视图对性能的影响

CREATE VIEW public.employeeinfo AS 
	SELECT firstname,lastname
	FROM private.employeeinfo;
GRANT SELECT ON public.* TO public.user;

SELECT CONNECTION_ID()

CREATE VIEW temp.cost_per_day_8 AS 
SELECT DATE(ts) AS DAY,SUM(cost) AS cost
FROM logs.cost
GROUP BY DAY;
SELECT c.day,c.cost,s.sales
FROM temp.cost_per_day_8 AS c
INNER JOIN sales.sales_per_day AS s USING(DAY);
DROP VIEW temp.cost_per_day_8;



BEGIN -- 7.5 cursor

DELIMITER //

DROP PROCEDURE IF EXISTS mydata_on_mysql_v8.bad_cursor //

CREATE PROCEDURE bad_cursor () loopout :
BEGIN
      DECLARE film_id INT;
      DECLARE f CURSOR FOR
      SELECT
            film_id
      FROM
            mydata_on_mysql_v8.files;
      OPEN f;
      FETCH f INTO film_id;
      CLOSE f;
END loopout //

DELIMITER;

SHOW STATUS WHERE Variable_name='tmp_table_size';



SELECT * FROM world.country

SHOW COLUMNS FROM world.country

DELIMITER //

DROP PROCEDURE IF EXISTS mydata_on_mysql_v8.sp_testvaliable //

CREATE PROCEDURE mydata_on_mysql_v8.sp_testvaliable (code1 CHAR(3)) loopout :
BEGIN
	 SET @code=code1;
      SET @sql = 'select * from world.country where code=?';
      PREPARE stmt FROM @sql;
      EXECUTE stmt USING @code;
END loopout //

DELIMITER ;


CALL mydata_on_mysql_v8.sp_testvaliable('AFG');
SELECT * FROM information_schema.tables



DROP PROCEDURE IF EXISTS mydata_on_mysql_v8.optimize_tables;
DELIMITER //
CREATE PROCEDURE mydata_on_mysql_v8.optimize_tables(db_name VARCHAR(64))
BEGIN
	DECLARE t VARCHAR(64);
	DECLARE done INT DEFAULT 0;
	DECLARE c CURSOR FOR 
		SELECT table_name FROM information_schema.tables
		WHERE table_schema=db_name AND table_type='BASE TABLE';
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done=1;
	OPEN c;
	tables_loop:LOOP
	
		FETCH c INTO t;
		IF done THEN
			LEAVE tables_loop;
		END IF;
		SET @stmt_text=CONCAT('optimize table ',db_name,'.',t);-- select @stmt_text;
		PREPARE stmt FROM @stmt_text;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;	
	END LOOP;
	CLOSE c;
END //
DELIMITER ;



CALL mydata_on_mysql_v8.optimize_tables('mydata_on_mysql_v8');




SHOW TABLES

CREATE TABLE 2018_12_31(
 a CHAR(1) NOT NULL,
 b CHAR(1) NOT NULL,
 c  TINYINT UNSIGNED NOT NULL
);

INSERT INTO 2018_12_31 VALUES('A','a',1),('A','a',1),('A','b',1),('B','a',1),('B','b',1)

SELECT * FROM 2018_12_31

SET @@sql_mode='';

SELECT t.a,t.b,SUM(t.c) AS total 
FROM 2018_12_31 t GROUP BY t.a,t.b 
ORDER BY t.order_no DESC;


END -- 7.5


select conv(16,10,16);
select conv(16,10,2);
select conv(16,10,8);

select hex(16);
select oct(16);
select bin(16);

drop table if exists test;
create table test(
	id int unsigned not null auto_increment,
	data varchar(64) default null,
	ts timestamp not null default current_timestamp on update current_timestamp,
	primary key(id)
	);

replace into test values(1,'Old',now());
replace into test values(1,'New',now());

select * from test;

drop table if exists test2;
create table test2(
	id int unsigned not null auto_increment,
	data varchar(64) default null,
	ts timestamp not null default current_timestamp on update current_timestamp,
	primary key(id,ts));
	
replace into test2 values(1,'old',current_timestamp());
REPLACE INTO test2 values(1,'new',CURRENT_TIMESTAMP());

select * from test2;

# default current_timestamp on update current_timestamp;

select round(12.33321,2);

select round(13.123456789,4);



