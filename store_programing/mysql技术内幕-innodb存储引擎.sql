`departments`SELECT SQL_CALC_FOUND_ROWS * FROM a;
SELECT FOUND_ROWS();




DELIMITER //
-- drop procedure load_t;
CREATE PROCEDURE load_t(COUNT INT UNSIGNED)
BEGIN

	SET @c=0;
	WHILE @c<COUNT DO
		INSERT INTO t SELECT NULL,
			REPEAT(CHAR(97+RAND()*26),10);
		SET @c=@c+1;
		END WHILE;
END //

CALL load_t(100);

SELECT * FROM t;

CREATE TABLE u(
id INT,
NAME VARCHAR(20),
id_card CHAR(18),
PRIMARY KEY(id),
UNIQUE KEY(NAME));

SELECT constraint_name,constraint_type
FROM
information_schema.`TABLE_CONSTRAINTS`
WHERE table_schema='test' AND table_name='u';


ALTER TABLE u ADD UNIQUE KEY uk_id_card(id_card);

SELECT constraint_name,constraint_type FROM
information_schema.`TABLE_CONSTRAINTS`
WHERE table_schema='test' AND table_name='u';


DROP TABLE IF EXISTS p;
CREATE TABLE p(
id INT,
u_id INT,
PRIMARY KEY(id),
FOREIGN KEY(u_id) REFERENCES p(id));


SELECT constraint_name,constraint_type FROM
information_schema.`TABLE_CONSTRAINTS`
WHERE table_schema='test' AND table_name='p';



SELECT * FROM information_schema.`REFERENTIAL_CONSTRAINTS`
WHERE constraint_schema='test';

DROP TABLE IF EXISTS t;
CREATE TABLE t(id INT);
CREATE VIEW v_t AS SELECT * FROM t WHERE id<10;
INSERT INTO v_t SELECT 20;

SELECT * FROM v_t;

ALTER VIEW v_t 
AS 
SELECT * FROM t WHERE id<10
WITH CHECK OPTION;

INSERT INTO v_t SELECT 20;

SELECT DATABASE();

SELECT * FROM information_schema.`TABLES`
WHERE table_type=UPPER('base table');

SELECT * FROM information_schema.`VIEWS`
WHERE table_schema=DATABASE();

SHOW VARIABLES LIKE '%parttion%';
SHOW PLUGINS;

# 分区的类型
# RANGE分区 常用于对日期列的分区
DROP TABLE IF EXISTS t;
CREATE TABLE t(
id INT
)ENGINE=INNODB
PARTITION BY RANGE(id)(
	PARTITION p0 VALUES LESS THAN(10),
	PARTITION p1 VALUES LESS THAN(20));
	
INSERT INTO t SELECT 9;
INSERT INTO t SELECT 10;
INSERT INTO t SELECT 15;

SELECT * FROM information_schema.`PARTITIONS`
WHERE table_schema='test' AND table_name='t';

# 会报错 因为没有分区存储30
INSERT INTO t SELECT 30;

# 新建分区 1<<63 代表最大值(其实不是，相当于的意思)
SELECT 1<<32;
ALTER TABLE t ADD PARTITION(
PARTITION p2 VALUES LESS THAN(4294967296));

# 按时间分区
DROP TABLE IF EXISTS sales;
CREATE TABLE sales(
	money INT UNSIGNED NOT NULL,
	DATE DATETIME)ENGINE=INNODB
	PARTITION BY RANGE(YEAR(DATE))(
		PARTITION p2008 VALUES LESS THAN(2009),
		PARTITION p2009 VALUES LESS THAN(2010),
		PARTITION p2010 VALUES LESS THAN(2011));
		
INSERT INTO sales SELECT 100,'2008-01-01';
INSERT INTO sales SELECT 100,'2008-02-01';
INSERT INTO sales SELECT 200,'2008-01-02';
INSERT INTO sales SELECT 100,'2009-03-01';
INSERT INTO sales SELECT 200,'2010-03-01';

# 删除分区 会把分区中的数据全部删除
ALTER TABLE sales DROP PARTITION p2008;

# 分析使用分区情况
EXPLAIN PARTITIONS
SELECT * FROM sales WHERE DATE>='2008-01-01' AND DATE<'2008-12-31';

# 分区优化器只能对Year() to_days() to_seconds() unix_timestamp() 进行优化选择

#----------------------------------------------------------------------------

# list 分区 分区列的值是离散的，而非连续的。
DROP TABLE IF EXISTS t;
CREATE TABLE t(
	a INT,
	b INT)ENGINE=INNODB
	PARTITION BY LIST(b)(
		PARTITION p0 VALUES IN(1,3,5,7,9),
		PARTITION p1 VALUES IN(0,2,4,6,8)
		);
		
INSERT INTO t SELECT 1,1;
INSERT INTO t SELECT 1,2;
INSERT INTO t SELECT 1,3;
INSERT INTO t SELECT 1,4;
INSERT INTO t SELECT 1,5;

SELECT table_name,partition_name,table_rows FROM
information_schema.`PARTITIONS`
WHERE table_name='t' AND table_schema=DATABASE();




 