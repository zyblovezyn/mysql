BEGIN -- 9 Language Structure 

BEGIN -- 9.1 Literal Values ok

BEGIN -- 9.1.1 String Literals ok

SELECT 'a string';
SELECT 'a' ' ' 'string';

SELECT _latin1 'string';
SELECT _binary 'string';
SELECT _utf8 'string' COLLATION utf8_danish_ci;

SELECT N'some text';
SELECT n'some text';
SELECT _utf8'some text';

-- There are several ways to include quote characters within a string:
-- 
-- A ' inside a string quoted with ' may be written as ''.
-- 
-- A " inside a string quoted with " may be written as "".
-- 
-- Precede the quote character by an escape character (\).
-- 
-- A ' inside a string quoted with " needs no special treatment and need not be doubled or escaped. In the same way, " inside a string quoted with ' needs no special treatment.

SELECT 'hello','"hello"','""hello""','hel''lo','\'hello';

SELECT "hello","'hello'","''hello''","hel""lo","\"hello"

SELECT 'This\nIs\nFour\nLines';

SELECT 'disappearing\ backlash'

END -- 9.1.1 String Literals 

BEGIN -- 9.1.2 Numeric Literals ok

-- DECIMAL type has several synonyms: NUMERIC, DEC, FIXED. 

END -- 9.1.2 Numeric Literals 

BEGIN -- 9.1.3 Date and Time Literals ok

SELECT DATE('2012-12-31'),DATE('2012/12/31'),DATE('2012^12^31'),DATE('2012@12@31');

SELECT DATE('20121231'); -- right
SELECT DATE('071231');

-- '2012-12-31 11:30:45' '2012-12-31T11:30:45' are equivalent.


END -- 9.1.3 Date and Time Literals 

BEGIN -- 9.1.4 Hexadecimal Literals ok

-- 十六进制 ox'val' 或 X'val' 0-9 A-F

SET @s=X'0FFF';
SELECT HEX(@s);

SELECT X'4D7953514C',CHARSET(X'4D7953514C');

SELECT 0x4D7953514C,CHARSET(0x4D7953514C);

SET @v1=X'41';

SET @v2=X'41'+0;

SET @v3=CAST(X'41' AS UNSIGNED);

SELECT @v1,@v2,@v3;

SELECT CHARSET(X''),LENGTH(X'');
SELECT X''+0;

SELECT HEX('cat');
SELECT X'636174'


END -- 9.1.4 Hexadecimal Literals 

BEGIN -- 9.1.5 Bit-Value Literals ok

-- Bit-value literals are written using b'val' or 0bval notation. val is a binary value written using zeros and ones. Lettercase of any leading b does not matter. A leading 0b is case sensitive and cannot be written as 0B.

SELECT b'1000001',CHARSET(b'1000001');

SELECT 0b1100001,CHARSET(0b1100001);

SELECT _latin1 b'1000001';
SELECT _utf8 0b1000001 COLLATION utf8_danish_ci;

SET @v1=b'1100001';
SET @v2=b'1100001'+0;
SET @v3=CAST(b'1100001' AS UNSIGNED);
SELECT @v1,@v2,@v3;


SELECT CHARACTER(b''),LENGTH(b'');

SELECT b''+0;

DROP TABLE t;
CREATE TABLE t(b BIT(8));
INSERT INTO t SET b=b'11111111';
INSERT INTO t SET b=b'1010';
INSERT INTO t SET b=b'0101';

SELECT b+0,BIN(b),OCT(b),HEX(b) FROM t;


END -- 9.1.5 Bit-Value Literals 

BEGIN -- 9.1.6 Boolean Literals ok

-- The constants TRUE and FALSE evaluate to 1 and 0

SELECT TRUE,FALSE

END -- 9.1.6 Boolean Literals 

BEGIN -- 9.1.7 NULL Values ok

-- The NULL value means “no data.”
-- For sorting with ORDER BY, NULL values sort before other values for ascending sorts, after other values for descending sorts.


END -- 9.1.7 NULL Values 

END -- 9.1 Literal Values 

BEGIN -- 9.2 Schema Object Names ok

-- Database, table, and column names cannot end with space characters. 

SELECT * FROM `select` WHERE `select`.id>100;

CREATE TABLE "test"(col INT);

SET @@sql_mode='ANSI_QUOTES';
CREATE TABLE "test"(col INT);

SHOW COLUMNS FROM test;

SET @@sql_mode='';

CREATE TABLE `a``b`(`c"d` INT);

SHOW COLUMNS FROM `a``b`;

SELECT 1 AS `one`,2 AS 'two';


-- Identifier Type Maximum Length (characters)
-- 
-- Database 64 (NDB storage engine: 63) 
-- 
-- Table 64 (NDB storage engine: 63) 
-- 
-- Column 64 
-- 
-- Index 64 
-- 
-- Constraint 64 
-- 
-- Stored Program 64 
-- 
-- View 64 
-- 
-- Tablespace 64 
-- 
-- Server 64 
-- 
-- Log File Group 64 
-- 
-- Alias 256 (see exception following table) 
-- 
-- Compound Statement Label 16 
-- 
-- User-Defined Variable 64 
-- 
-- Resource Group 64 

-- Aliases for column names in CREATE VIEW statements are checked 
-- against the maximum column length of 64 characters 
-- (not the maximum alias length of 256 characters). 

BEGIN -- 9.2.1 Identifier Qualifiers ok

DROP TABLE t1;
CREATE TABLE t1(i INT);

DROP TABLE mydata_on_mysql_v8.t1;
CREATE TABLE mydata_on_mysql_v8.t1(i INT);

SELECT I FROM T1;

END -- 9.2.1 Identifier Qualifiers 

BEGIN -- 9.2.2 Identifier Case Sensitivity ok

-- Although database, table, and trigger names are not case sensitive 
-- on some platforms, you should not refer to one of these 
-- using different cases within the same statement. 
-- The following statement would not work because it refers to 
-- a table both as my_table and as MY_TABLE: 
SELECT * FROM my_table WHERE MY_TABLE.col=1;


SELECT * FROM my_table WHERE my_table.col=1;

RENAME TABLE t1 TO t2;


END -- 9.2.2 Identifier Case Sensitivity 

BEGIN -- 9.2.3 Mapping of Identifiers to File Names ok

SHOW TABLES;
SHOW COLUMNS FROM a;

END -- 9.2.3 Mapping of Identifiers to File Names 

BEGIN -- 9.2.4 Function Name Parsing and Resolution ok

CREATE TABLE COUNT(i INT) -- 报错
CREATE TABLE `count`(i INT); -- 家``才能执行成功

SELECT COUNT(*) FROM mytable;
SELECT COUNT (*) FROM mytable;

-- User-defined functions and stored functions share the same namespace, so you cannot create a UDF and a stored function with the same name.

END -- 9.2.4 Function Name Parsing and Resolution 

END -- 9.2 Schema Object Names 

BEGIN -- 9.3 Keywords and Reserved Words ok

END -- 9.3 Keywords and Reserved Words 

BEGIN -- 9.4 User-Defined Variables ok

-- You can store a value in a user-defined variable in one statement and refer to it later in another statement. This enables you to pass values from one statement to another.
-- 
-- User variables are written as @var_name

SET @v1=X'41';
SET @v2=X'41'+0;
SET @v3=CAST(X'41' AS UNSIGNED);

SELECT @v1,@v2,@v3;

SET @v1=b'1000001';
SET @v2=b'1000001'+0;
SET @v3=CAST(b'1000001' AS UNSIGNED);
SELECT @v1,@v2,@v3;

SET @t1=1,@t2=2,@t3:=4;
SELECT @t1,@t2,@t3,@t4:=@t1+@t2+@t3; -- 在set以外的语句赋值需要使用:=

SET @v1=X'41';
SET @v2=X'41'+0;
SET @v3=CAST(X'41' AS UNSIGNED);
SELECT @v1,@v2,@v3;

-- Hexadecimal or bit values assigned to user variables are treated as binary strings.

SET @v1=b'1000001';
SET @v2=b'1000001'+0;
SET @v3=CAST(b'1000001' AS UNSIGNED);
SELECT @v1,@v2,@v3;

SET @a=@a+1;
SELECT @a;

SELECT @a,@a:=@a+1;

SET @a='test';
SELECT @a,(@a:=20);

SELECT * FROM t;
CREATE TABLE t (i INT);INSERT INTO t VALUES(1);

-- If the value of a user variable is selected in a result set, it is returned to the client as a string.
-- 
-- If you refer to a variable that has not been initialized, it has a value of NULL and a type of string.

SELECT b FROM t;
SET @col='b';
SELECT @col FROM t;

SELECT `@col` FROM t;

SET @col='`b`';
SELECT @col FROM t;

SET @c='b';
SET @s=CONCAT('select ',@c,' from t');
PREPARE stmt FROM @s;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

END -- 9.4 User-Defined Variables 

BEGIN -- 9.5 Expression Syntax ok

-- expr:
--     expr OR expr
--   | expr || expr
--   | expr XOR expr
--   | expr AND expr
--   | expr && expr
--   | NOT expr
--   | ! expr
--   | boolean_primary IS [NOT] {TRUE | FALSE | UNKNOWN}
--   | boolean_primary
-- 
-- boolean_primary:
--     boolean_primary IS [NOT] NULL
--   | boolean_primary <=> predicate
--   | boolean_primary comparison_operator predicate
--   | boolean_primary comparison_operator {ALL | ANY} (subquery)
--   | predicate
-- 
-- comparison_operator: = | >= | > | <= | < | <> | !=
-- 
-- predicate:
--     bit_expr [NOT] IN (subquery)
--   | bit_expr [NOT] IN (expr [, expr] ...)
--   | bit_expr [NOT] BETWEEN bit_expr AND predicate
--   | bit_expr SOUNDS LIKE bit_expr
--   | bit_expr [NOT] LIKE simple_expr [ESCAPE simple_expr]
--   | bit_expr [NOT] REGEXP bit_expr
--   | bit_expr
-- 
-- bit_expr:
--     bit_expr | bit_expr
--   | bit_expr & bit_expr
--   | bit_expr << bit_expr
--   | bit_expr >> bit_expr
--   | bit_expr + bit_expr
--   | bit_expr - bit_expr
--   | bit_expr * bit_expr
--   | bit_expr / bit_expr
--   | bit_expr DIV bit_expr
--   | bit_expr MOD bit_expr
--   | bit_expr % bit_expr
--   | bit_expr ^ bit_expr
--   | bit_expr + interval_expr
--   | bit_expr - interval_expr
--   | simple_expr
-- 
-- simple_expr:
--     literal
--   | identifier
--   | function_call
--   | simple_expr COLLATE collation_name
--   | param_marker
--   | variable
--   | simple_expr || simple_expr
--   | + simple_expr
--   | - simple_expr
--   | ~ simple_expr
--   | ! simple_expr
--   | BINARY simple_expr
--   | (expr [, expr] ...)
--   | ROW (expr, expr [, expr] ...)
--   | (subquery)
--   | EXISTS (subquery)
--   | {identifier expr}
--   | match_expr
--   | case_expr
--   | interval_expr

CREATE TABLE tbool(a BOOL);
DESCRIBE tbool;
INSERT INTO tbool(a) VALUES(TRUE),(FALSE);

SELECT * FROM tbool WHERE a IS UNKNOWN;

END -- 9.5 Expression Syntax 

BEGIN -- 9.6 Comment Syntax 



END -- 9.6 Comment Syntax 

END -- 9 Language Structure 
