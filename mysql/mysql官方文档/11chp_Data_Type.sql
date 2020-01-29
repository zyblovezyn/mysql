BEGIN -- Chapter 11 Data Type ok but some section need perfect

-- MySQL supports a number of SQL data types in several categories: numeric types, 
-- date and time types, string (character and byte) types, and spatial types. 

BEGIN -- 11.1 Data Type Overview 

BEGIN -- 11.1.1 Numeric Type Overview  ok

-- M indicates the maximum display width for integer types. The maximum display width is 255. 
-- For floating-point and fixed-point types, M is the total number of digits that can be stored.

-- If you specify ZEROFILL for a numeric column, MySQL automatically adds the UNSIGNED attribute 
-- to the column.

-- Numeric data types that permit the UNSIGNED attribute also permit SIGNED. 
-- However, these data types are signed by default, so the SIGNED attribute has no effect.

-- SERIAL is an alias for BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE.

-- BIT[(M)]

-- A bit-value type. M indicates the number of bits per value, from 1 to 64. 
-- The default is 1 if M is omitted.

-- TINTINT[(M)] [UNSIGNED] [ZEROFILL]
-- A very small integer. The signed range is -128 to 127. The unsigned range is 0 to 255.

-- BOOL, BOOLEAN

-- These types are synonyms for TINYINT(1). A value of zero is considered false. 
-- Nonzero values are considered true:

SELECT IF(0,'true','false');

SELECT IF(1,'true','false');

SELECT IF(2,'true','false');

SELECT IF(0=FALSE,'true','false');

SELECT IF(1=TRUE,'true','false');

SELECT IF(2=TRUE,'true','false');

SELECT IF(2=FALSE,'true','false');

-- SMALLINT[(M)] [UNSIGNED] [ZEROFILL]
 
-- A small integer. The signed range is -32768 to 32767. The unsigned range is 0 to 65535.
 
-- MEDIUMINT[(M)] [UNSIGNED] [ZEROFILL]
 
-- A medium-sized integer. The signed range is -8388608 to 8388607. The unsigned range is 0 to 16777215.
 
-- INT[(M)] [UNSIGNED] [ZEROFILL]
 
-- A normal-size integer. The signed range is -2147483648 to 2147483647. The unsigned range is 0 to 4294967295.
 
-- INTEGER[(M)] [UNSIGNED] [ZEROFILL]
 
-- This type is a synonym for INT.
 
-- BIGINT[(M)] [UNSIGNED] [ZEROFILL]
 
-- A large integer. The signed range is -9223372036854775808 to 9223372036854775807. The unsigned range is 0 to 18446744073709551615.
 
-- SERIAL is an alias for BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE.

-- The maximum number of digits (M) for DECIMAL is 65. The maximum number of supported decimals (D) is 30. If D is omitted, 
-- the default is 0. If M is omitted, the default is 10.



END -- 11.1.1 Numeric Type Overview

BEGIN -- 11.1.2 Date and Time Type Overview ok

-- Date and DateTime range

-- The Date range is 1000-01-01 to 9999-12-31
-- DateTime 1000-01-01 00:00:00 9999-12-31 23:59:59
-- TimeStamp 1970-01-01 00:00:01 2038-01-19 01:14:07
-- Time,The range is -838:59:59 to 838:59:59
-- Year[2|4] Year[2] 70-69 Year[4] 1901-2155

SELECT SEC_TO_TIME(TIME_TO_SEC(time_col)) FROM tbl_name;
SELECT FROM_DAYS(TO_DAYS(date_col)) FROM tbl_name;

SELECT FROM_DAYS(TO_DAYS(CURRENT_TIMESTAMP));

# 获取当前时间
SELECT NOW(),SLEEP(3),NOW(); #两个时间相等
SELECT SYSDATE(),SLEEP(3),SYSDATE(); #时间不等
# NOW() 和SYSDATE() 的区别：NOW() 在开始执行时就得到了时间，SYSDATE()是在运行时动态得到

# 获取时间戳
SELECT CURRENT_TIMESTAMP,CURRENT_TIMESTAMP();

# 日期时间转换成字符串
SELECT DATE_FORMAT('2008-08-08 22:23:01','%Y%m%d%H%i%s'),TIME_FORMAT('2008-08-08 22:23:01','%H%i%s');

# 字符串转化成日期
SELECT STR_TO_DATE('08/09/2008', '%m/%d/%Y'); -- 2008-08-09
SELECT STR_TO_DATE('08/09/08' , '%m/%d/%y'); -- 2008-08-09
SELECT STR_TO_DATE('08.09.2008', '%m.%d.%Y'); -- 2008-08-09
SELECT STR_TO_DATE('08:09:30', '%h:%i:%s'); -- 08:09:30
SELECT STR_TO_DATE('08.09.2008 08:09:30', '%m.%d.%Y %h:%i:%s'); -- 2008-08-09 08:09:30

# 日期 天数
SELECT TO_DAYS('0000-00-00');
SELECT TO_DAYS('2008-08-09');

# 时间 秒转换
SELECT TIME_TO_SEC('01:00:05');
SELECT SEC_TO_TIME(3605);

# 拼凑日期 时间

SELECT MAKEDATE(2001,31);
SELECT MAKEDATE(2001,32);
SELECT MAKETIME(12,15,30);

# unix 时间戳 日期 转换

SELECT UNIX_TIMESTAMP(); # 1565526673
SELECT UNIX_TIMESTAMP('2019-08-11')
SELECT UNIX_TIMESTAMP('2019-08-11 12:12:12')

SELECT FROM_UNIXTIME(1565526673);

END -- 11.1.2 Date and Time Type Overview

BEGIN -- 11.1.3 String Type Overview ok
 
CREATE TABLE t
(
	c1 VARCHAR(20) CHARACTER SET utf8,
	c2 TEXT CHARACTER SET latin1 COLLATION latin1_general_cs
);

-- CHARSET is synonym for CHARACTER SET

CREATE TABLE t
(
	c1 VARCHAR(10) CHARACTER SET BINARY,
	c2 TEXT CHARACTER SET BINARY,
	c3 ENUM('a','b','c') CHARACTER SET BINARY
);

SHOW CREATE TABLE t;

-- The ASCII attribute is shorthand for CHARACTER SET latin1.
-- The UNICODE attribute is shorthand for CHATACTER SET ucs2.

-- [NATIONAL] CHAR[(M)] [CHARACTER SET charset_name] [COLLATE collation_name]
-- The range of M is 0 to 255,if M is omitted,the length is 1.

-- [NATIONAL] VARCHAR(M) [CHARACTER SET charset_name] [COLLATE collation_name]
-- 65535 bytes,which is shared among all columns.
-- utf8 characters can require up to three bytes per character, 
-- so a VARCHAR column that uses the utf8 character set can be declared to be 
-- a maximum of 21,844 characters.
SELECT LENGTH('张元伯');

-- BINARY[(M)]

-- VARBINARY[(M)]

-- TIMYBLOB 	255 bytes

-- TINYTEXT 	255 characters

-- BLOB[(M)]	65,535 bytes. 

-- TEXT[(M)] [CHARACTER SET charset_name] [COLLATE collation_name]
-- A TEXT column with a maximum length of 65,535 (216 − 1) characters.

-- MEDIUMBLOB

-- MEDIUMTEXT [CHARACTER SET charset_name] [COLLATE collation_name]

-- LONGBLOB

-- LONGTEXT [CHARACTER SET charset_name] [COLLATE collation_name]

-- ENUM('value1','value2',...) [CHARACTER SET charset_name] [COLLATE collation_name]
-- An ENUM column can have a maximum of 65,535 distinct elements. (The practical limit is less than 3000.)
-- A table can have no more than 255 unique element list definitions among its ENUM and 
-- SET columns considered as a group. For more information on these limits, 

-- SET('value1','value2',...) [CHARACTER SET charset_name] [COLLATE collation_name]



END -- 11.1.3 String Type Overview

END -- 11.1 Data Type Overview

BEGIN -- 11.2 Numeric Types ok

BEGIN -- 11.2.1 Integer Types (Exact Value) - INTEGER, INT, SMALLINT, TINYINT, MEDIUMINT, BIGINT ok

END -- 11.2.1 Integer Types (Exact Value) - INTEGER, INT, SMALLINT, TINYINT, MEDIUMINT, BIGINT

BEGIN -- 11.2.2 Fixed-Point Types (Exact Value) - DECIMAL, NUMERIC ok

END -- 11.2.2 Fixed-Point Types (Exact Value) - DECIMAL, NUMERIC

BEGIN -- 11.2.3 Floating-Point Types (Approximate Value) - FLOAT, DOUBLE ok

END -- 11.2.3 Floating-Point Types (Approximate Value) - FLOAT, DOUBLE

BEGIN -- 11.2.4 Bit-Value Type - BIT ok

END -- 11.2.4 Bit-Value Type - BIT

BEGIN -- 11.2.5 Numeric Type Attributes ok

-- If you specify ZEROFILL for a numeric column, MySQL automatically adds the UNSIGNED attribute to the column.
-- AUTO_INCREMENT sequnces begin with 1.

END -- 11.2.5 Numeric Type Attributes

BEGIN -- 11.2.6 Out-of-Range and Overflow Handling ok

CREATE TABLE t1(i1 TINYINT,i2 TINYINT UNSIGNED);
SELECT @@sql_mode;
SET @@sql_mode='TRADITIONAL';
INSERT INTO t1(i1,i2) VALUES(256,256);
SELECT * FROM t1;

SET @@sql_mode='';
INSERT INTO t1(i1,i2) VALUES(256,256);
SHOW WARNINGS;
SELECT * FROM t1;

SELECT 9223372036854775807 + 1;
SELECT CAST(9223372036854775807 AS UNSIGNED)+1;

SELECT 9223372036854775807.0 +1

SET @@sql_mode='';
SELECT CAST(0 AS UNSIGNED)-1;

SET @@sql_mode='NO_UNSIGNED_SUBTRACTION';
SELECT CAST(0 AS UNSIGNED)-1;



END -- 11.2.6 Out-of-Range and Overflow Handling

END -- 11.2 Numeric Types

BEGIN -- 11.3 Date and Time Types ok

-- The date and time types for representing temporal values are DATE, TIME, DATETIME, TIMESTAMP, and YEAR.


BEGIN -- 11.3.1 The DATE, DATETIME, and TIMESTAMP Types ok

END -- 11.3.1 The DATE, DATETIME, and TIMESTAMP Types

BEGIN -- 11.3.2 The TIME Type ok

SELECT CAST('11:12' AS TIME);

END -- 11.3.2 The TIME Type

BEGIN -- 11.3.3 The YEAR Type ok

-- The Year type is a 1-byte type used to represent year values
-- YEAR(4) and YEAR(2) differ in display format, but have the same 
-- range of values. For 4-digit format, MySQL displays YEAR values in YYYY format, 
-- with a range of 1901 to 2155, or 0000. For 2-digit format, 
-- MySQL displays only the last two (least significant) digits; 
-- for example, 70 (1970 or 2070) or 69 (2069).

END -- 11.3.3 The YEAR Type

BEGIN -- 11.3.4 YEAR(2) Limitations and Migrating to YEAR(4) ok

CREATE TABLE ty(y2 YEAR,y4 YEAR(4));

INSERT INTO ty(y2) VALUES(1912),(2012),(2112);

UPDATE ty SET y4=y2;

SELECT * FROM ty;

END -- 11.3.4 YEAR(2) Limitations and Migrating to YEAR(4)

BEGIN -- 11.3.5 Automatic Initialization and Updating for TIMESTAMP ok

DROP TABLE t1;
CREATE TABLE t1(
	ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
	);

DROP TABLE t1;
CREATE TABLE t1(ts TIMESTAMP);

CREATE TABLE t1(
	ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	);
	
CREATE TABLE t1(
	ts TIMESTAMP DEFAULT 0
);

CREATE TABLE t1(
	ts TIMESTAMP DEFAULT 0 ON UPDATE CURRENT_TIMESTAMP
	);
	

END -- 11.3.5 Automatic Initialization and Updating for TIMESTAMP

BEGIN -- 11.3.6 Fractional Seconds in Time Values ok

SELECT MICROSECOND('2010-12-10 14:12:09.019473');

-- However, when MySQL stores a value into a column of any temporal data type, it discards any fractional part and does not store it.

END -- 11.3.6 Fractional Seconds in Time Values

BEGIN -- 11.3.7 Conversion Between Date and Time Types ok

date_col=CAST(DATETIME AS DATE);

SELECT CURTIME(),CURTIME()+0;
SELECT NOW(),NOW()+0;


END -- 11.3.7 Conversion Between Date and Time Types

BEGIN -- 11.3.8 Two-Digit Years in Dates ok

END -- 11.3.8 Two-Digit Years in Dates

END -- 11.3 Date and Time Types

BEGIN -- 11.4 String Types ok

BEGIN -- 11.4.1 The CHAR and VARCHAR Types ok

-- the length of char is from 0 to 255
-- Values in VARCHAR columns are variable-length 
-- strings. The length can be specified as a value from 0 to 65,535. 

CREATE TABLE vc(v VARCHAR(4),c CHAR(4));
INSERT INTO vc VALUES('ab  ','ab  ');
SELECT CONCAT('(',v,')'),CONCAT('(',c,')') FROM vc;

CREATE TABLE NAMES(myname CHAR(10));
INSERT INTO NAMES VALUES('Monty');

SELECT myname='Monty',myname='Monty    ' FROM NAMES;

SELECT myname LIKE 'Monty',myname LIKE 'monty   ' FROM NAMES;


END -- 11.4.1 The CHAR and VARCHAR Types

BEGIN -- 11.4.2 The BINARY and VARBINARY Types ok

-- the length for BINARY and VARBINARY is a length in bytes rather than in characters.
CREATE TABLE tb (c BINARY(3));
SELECT * FROM tb;
INSERT INTO tb SET c='a';
SELECT HEX(c),c='a',c='a\0\0' FROM tb;

END -- 11.4.2 The BINARY and VARBINARY Types

BEGIN -- 11.4.3 The BLOB and TEXT Types ok

-- BLOB values are treated as binary strings (byte strings). 
-- TEXT values are treated as nonbinary strings (character strings).
 
-- BLOB and TEXT differ from VARBINARY and VARCHAR in the following ways: 
-- 1.For indexes on BLOB and TEXT columns, you must specify an index prefix length. For CHAR and VARCHAR, a prefix length is optional. See Section 8.3.4, “Column Indexes”.
-- 2.BLOB and TEXT columns cannot have DEFAULT values.

CREATE TABLE shirts(
	NAME VARCHAR(40),
	size ENUM('x-small','small','medium','large','x-large')
);

INSERT INTO shirts(NAME,size) VALUES('dress shirt','large'), ('t-shirt','medium'),
  ('polo shirt','small');
 
 SELECT NAME,size FROM shirts WHERE size='medium';
 
--  For example, a column specified as ENUM('Mercury', 'Venus', 'Earth') can have any of the values shown here. The index of each value is also shown.
-- Value	Index
-- NULL	NULL
-- ''	0
-- 'Mercury'	1
-- 'Venus'	2
-- 'Earth'	3

-- An ENUM column can have a maximum of 65,535 distinct elements. (The practical limit is less than 3000.) A table can have no more than 255 unique element list definitions among its ENUM and SET columns considered as a group. For more information on these limits


END -- 11.4.3 The BLOB and TEXT Types

BEGIN -- 11.4.4 The ENUM Type ok

END -- 11.4.4 The ENUM Type

BEGIN -- 11.4.5 The SET Type ok

-- For example, a column specified as SET('one', 'two') NOT NULL can have any of these values:
-- ''
-- 'one'
-- 'two'
-- 'one,two'

-- A SET column can have a maximum of 64 distinct members. A table can have no more than 255 unique element list definitions among its ENUM and SET columns considered as a group.
DROP TABLE myset;
CREATE TABLE myset (col SET('a','b','c','d'));
INSERT INTO myset (col) VALUES ('a,d'), ('d,a'), ('a,d,a'), ('a,d,d'), ('d,a,d');
SELECT col FROM myset;

-- If you set a SET column to an unsupported value, the value is ignored and a warning is issued:
SET @@sql_mode='';
INSERT INTO myset(col) VALUES('a,d,d,s');
SHOW WARNINGS;
SELECT col FROM myset;

-- use find_in_set or like searching set value.
SELECT * FROM tbl_name WHERE FIND_IN_SET('value',set_col);
SELECT * FROM tbl_name WHERE set_col LIKE '%value%'

SELECT * FROM tbl_name WHERE set_col&1;
SELECT * FROM tbl_name WHERE set_col='val1,val2';





END -- 11.4.5 The SET Type

END -- 11.4 String Types

BEGIN -- 11.5 Spatial Data Types 

BEGIN -- 11.5.1 Spatial Data Types 

END -- 11.5.1 Spatial Data Types

BEGIN -- 11.5.2 The OpenGIS Geometry Model 

END -- 11.5.2 The OpenGIS Geometry Model

BEGIN -- 11.5.3 Supported Spatial Data Formats 

END -- 11.5.3 Supported Spatial Data Formats

BEGIN -- 11.5.4 Creating Spatial Columns 

END -- 11.5.4 Creating Spatial Columns

BEGIN -- 11.5.5 Populating Spatial Columns 

END -- 11.5.5 Populating Spatial Columns

BEGIN -- 11.5.6 Fetching Spatial Data 

END -- 11.5.6 Fetching Spatial Data

BEGIN -- 11.5.7 Optimizing Spatial Analysis 

END -- 11.5.7 Optimizing Spatial Analysis

BEGIN -- 11.5.8 Creating Spatial Indexes 

END -- 11.5.8 Creating Spatial Indexes

BEGIN -- 11.5.9 Using Spatial Indexes 

END -- 11.5.9 Using Spatial Indexes

END -- 11.5 Spatial Data Types

BEGIN -- 11.6 Data Type Default Values 

-- the default value must be a constant; it cannot be a function or an expression. 
-- you can specify CURRENT_TIMESTAMP as the default for a TIMESTAMP column
-- BLOB and TEXT columns cannot be assigned a default value.
-- PRIMARY KEY columns must be NOT NULL


END -- 11.6 Data Type Default Values

BEGIN -- 11.7 Data Type Storage Requirements ok

-- Numeric Type Storage Requirements
-- Data Type	Storage Required
-- TINYINT	1 byte
-- SMALLINT	2 bytes
-- MEDIUMINT	3 bytes
-- INT, INTEGER	4 bytes
-- BIGINT	8 bytes
-- FLOAT(p)	4 bytes if 0 <= p <= 24, 8 bytes if 25 <= p <= 53
-- FLOAT	4 bytes
-- DOUBLE [PRECISION], REAL	8 bytes
-- DECIMAL(M,D), NUMERIC(M,D)	Varies; see following discussion
-- BIT(M)	approximately (M+7)/8 bytes

-- Date and Time Type Storage Requirements
-- Data Type	Storage Required
-- DATE	3 bytes
-- TIME	3 bytes
-- DATETIME	8 bytes
-- TIMESTAMP	4 bytes
-- YEAR	1 byte

END -- 11.7 Data Type Storage Requirements

BEGIN -- 11.8 Choosing the Right Type for a Column 

END -- 11.8 Choosing the Right Type for a Column

BEGIN -- 11.9 Using Data Types from Other Database Engines 



-- Other Vendor Type	MySQL Type
-- BOOL	TINYINT
-- BOOLEAN	TINYINT
-- CHARACTER VARYING(M)	VARCHAR(M)
-- FIXED	DECIMAL
-- FLOAT4	FLOAT
-- FLOAT8	DOUBLE
-- INT1	TINYINT
-- INT2	SMALLINT
-- INT3	MEDIUMINT
-- INT4	INT
-- INT8	BIGINT
-- LONG VARBINARY	MEDIUMBLOB
-- LONG VARCHAR	MEDIUMTEXT
-- LONG	MEDIUMTEXT
-- MIDDLEINT	MEDIUMINT
-- NUMERIC	DECIMAL
DROP TABLE t;
CREATE TABLE t(a BOOL,b FLOAT8,c LONG VARCHAR,d NUMERIC);
DESCRIBE t;

END -- 11.9 Using Data Types from Other Database Engines

END -- Chapter 11 Data Type
