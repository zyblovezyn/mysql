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

# 没有分区的值报错
INSERT INTO t SELECT 1,10;

# hash分区

DROP TABLE IF EXISTS t_hash;
CREATE TABLE t_hash(
	 a INT,
	 b DATETIME
	 )ENGINE=INNODB
	 PARTITION BY HASH(YEAR(b))
	 PARTITIONS 4;

INSERT INTO t_hash SELECT 1,'2010-04-01'

SELECT table_name,partition_name,table_rows
FROM information_schema.`PARTITIONS`
WHERE table_schema=DATABASE() AND table_name='t_hash';


# linear hash 分区
#LINEAR HASH 分区 的 优点 在于， 
#增加、 删除、 合并 和 拆分 分区 将 变得 更加 快捷， 
#这有 利于 处理 含有 大量 数据 的 表。 它的 缺点 在于， 
#与 使用 HASH 分区 得到 的 数据 分布 相比， 
#各个 分区 间 数据 的 分布 可能 不大 均衡。

 DROP TABLE IF EXISTS t_linear_hash;
CREATE TABLE t_linear_hash(
	a INT,
	b DATETIME
	)ENGINE=INNODB
	PARTITION BY LINEAR HASH(YEAR(b))
	PARTITIONS 4;

INSERT INTO t_linear_hash SELECT 1,'2014-04-01';

SELECT * FROM information_schema.`PARTITIONS`;

SELECT table_name,table_rows,PARTITION_NAME FROM information_schema.`PARTITIONS`
WHERE table_schema=DATABASE() AND table_name='t_linear_hash';


# key 分区
CREATE TABLE t_key(
	a INT,
	b DATETIME)ENGINE=INNODB
	PARTITION BY KEY(b)
	PARTITIONS 4;
 
 
 # linear key 分区
CREATE TABLE t_key(
	a INT,
	b DATETIME)ENGINE=INNODB
	PARTITION BY LINEAR KEY(b)
	PARTITIONS 4;
	
	
# columns 分区 时间分区
CREATE TABLE t_ columns_ RANGE(
	a INT,
	b DATETIME) ENGINE = INNODB 
PARTITION BY RANGE COLUMNS (B) (
	PARTITION p0 VALUES LESS THAN (' 2009- 01- 01'),
    PARTITION p1 VALUES LESS THAN (' 2010- 01- 01')
    );
    
 # columns 分区 字符串分区  
   CREATE TABLE customers_ 1 (
  first_ NAME VARCHAR (25),
  last_ NAME VARCHAR (25),
  street_ 1 VARCHAR (30),
  street_ 2 VARCHAR (30),
  city VARCHAR (15),
  renewal DATE
) PARTITION BY LIST COLUMNS (city) (
  PARTITION pRegion_ 1
  VALUES
    IN (
      ' Oskarshamn',
      ' H ö gsby',
      ' M ö nster å s'
    ),
    PARTITION pRegion_ 2
    VALUES
      IN (
        ' Vimmerby',
        ' Hultsfred',
        ' V ä stervik'
      ),
      PARTITION pRegion_ 3
      VALUES
        IN (
          ' N ä ssj ö',
          ' Eksj ö',
          ' Vetlanda'
        ),
        PARTITION pRegion_ 4
        VALUES
          IN (
            ' Uppvidinge',
            ' Alvesta',
            ' V ä xjo'
          )
        );
        
# columns 分区  range分区 对多个列进行分区
CREATE TABLE rcx (
	a INT, 
	b INT, 
	c CHAR(3), 
	d INT) ENGINE = INNODB 
	PARTITION BY RANGE COLUMNS (a, d, c) (
		PARTITION p0 VALUES LESS THAN (5, 10, ' ggg'),
		PARTITION p1 VALUES LESS THAN (10, 20, ' mmmm'),
		PARTITION p2 VALUES LESS THAN (15, 30, ' sss'),
        PARTITION p3 VALUES LESS THAN (MAXVALUE, MAXVALUE, MAXVALUE)
        );
  # mysql 允许在range和list的分区上在进行hash或key分区
CREATE TABLE ts(
	a INT,
	b DATE)ENGINE=INNODB
	PARTITION BY RANGE(YEAR(b))
	SUBPARTITION BY HASH(TO_DAYS(b))
	SUBPARTITIONS 2(
	PARTITION p0 VALUES LESS THAN(1990),
	PARTITION p1 VALUES LESS THAN(2000),
	PARTITION p2 VALUES LESS THAN(2019)
	);
# mysql 允许在range和list的分区上在进行hash或key分区
# 自分区名称必须唯一 个数必须相同
DROP TABLE IF EXISTS ts;
CREATE TABLE ts(
	a INT,
	b DATE)
PARTITION BY RANGE(YEAR(b))
SUBPARTITION BY HASH(TO_DAYS(b))(
PARTITION p0 VALUES LESS THAN(1990)(
	SUBPARTITION s0,
	SUBPARTITION s1
	),
PARTITION p1 VALUES LESS THAN(2000)(
	SUBPARTITION s2,
	SUBPARTITION s3
	),
PARTITION p2 VALUES LESS THAN(2000)(
	SUBPARTITION s4,
	SUBPARTITION s5
	))
	
# 分区中的null值 在range、hash、key分区中null放在最小分区中
# 在list分区 必须指定那个分区存放null值
#  任何分区函数都将含有null的记录返回0

	
  
        
        
        