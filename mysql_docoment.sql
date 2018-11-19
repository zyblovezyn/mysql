--           mysql document        --

-- 12 Function and Operator Reference
-- Name    Description
-- ABS()	Return the absolute value
-- ACOS()	Return the arc cosine
-- ADDDATE()	Add time values (intervals) to a date value
-- ADDTIME()	Add time
-- AES_DECRYPT()	Decrypt using AES
-- AES_ENCRYPT()	Encrypt using AES
-- AND, &&	Logical AND
-- Area()	Return Polygon or MultiPolygon area
-- AsBinary(), AsWKB()	Convert from internal geometry format to WKB
-- ASCII()	Return numeric value of left-most character
-- ASIN()	Return the arc sine
-- =	Assign a value (as part of a SET statement, or as part of the SET clause in an UPDATE statement)
-- :=	Assign a value
-- AsText(), AsWKT()	Convert from internal geometry format to WKT
-- ATAN()	Return the arc tangent
-- ATAN2(), ATAN()	Return the arc tangent of the two arguments
-- AVG()	Return the average value of the argument
-- BENCHMARK()	Repeatedly execute an expression
-- BETWEEN ... AND ...	Check whether a value is within a range of values
-- BIN()	Return a string containing binary representation of a number
-- BINARY	Cast a string to a binary string
-- BIT_AND()	Return bitwise AND
-- BIT_COUNT()	Return the number of bits that are set
-- BIT_LENGTH()	Return length of argument in bits
-- BIT_OR()	Return bitwise OR
-- BIT_XOR()	Return bitwise XOR
-- &	Bitwise AND
-- ~	Bitwise inversion
-- |	Bitwise OR
-- ^	Bitwise XOR
-- CASE	Case operator
-- CAST()	Cast a value as a certain type
-- CEIL()	Return the smallest integer value not less than the argument
-- CEILING()	Return the smallest integer value not less than the argument
-- Centroid()	Return centroid as a point
-- CHAR()	Return the character for each integer passed
-- CHAR_LENGTH()	Return number of characters in argument
-- CHARACTER_LENGTH()	Synonym for CHAR_LENGTH()
-- CHARSET()	Return the character set of the argument
-- COALESCE()	Return the first non-NULL argument
-- COERCIBILITY()	Return the collation coercibility value of the string argument
-- COLLATION()	Return the collation of the string argument
-- COMPRESS()	Return result as a binary string
-- CONCAT()	Return concatenated string
-- CONCAT_WS()	Return concatenate with separator
-- CONNECTION_ID()	Return the connection ID (thread ID) for the connection
-- Contains()	Whether MBR of one geometry contains MBR of another
-- CONV()	Convert numbers between different number bases
-- CONVERT()	Cast a value as a certain type
-- CONVERT_TZ()	Convert from one time zone to another
-- COS()	Return the cosine
-- COT()	Return the cotangent
-- COUNT()	Return a count of the number of rows returned
-- COUNT(DISTINCT)	Return the count of a number of different values
-- CRC32()	Compute a cyclic redundancy check value
-- Crosses()	Whether one geometry crosses another
-- CURDATE()	Return the current date
-- CURRENT_DATE(), CURRENT_DATE	Synonyms for CURDATE()
-- CURRENT_TIME(), CURRENT_TIME	Synonyms for CURTIME()
-- CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP	Synonyms for NOW()
-- CURRENT_USER(), CURRENT_USER	The authenticated user name and host name
-- CURTIME()	Return the current time
-- DATABASE()	Return the default (current) database name
-- DATE()	Extract the date part of a date or datetime expression
-- DATE_ADD()	Add time values (intervals) to a date value
-- DATE_FORMAT()	Format date as specified
-- DATE_SUB()	Subtract a time value (interval) from a date
-- DATEDIFF()	Subtract two dates
-- DAY()	Synonym for DAYOFMONTH()
-- DAYNAME()	Return the name of the weekday
-- DAYOFMONTH()	Return the day of the month (0-31)
-- DAYOFWEEK()	Return the weekday index of the argument
-- DAYOFYEAR()	Return the day of the year (1-366)
-- DECODE()	Decodes a string encrypted using ENCODE()
-- DEFAULT()	Return the default value for a table column
-- DEGREES()	Convert radians to degrees
-- DES_DECRYPT()	Decrypt a string
-- DES_ENCRYPT()	Encrypt a string
-- Dimension()	Dimension of geometry
-- Disjoint()	Whether MBRs of two geometries are disjoint
-- DIV	Integer division
-- /	Division operator
-- ELT()	Return string at index number
-- ENCODE()	Encode a string
-- ENCRYPT()	Encrypt a string
-- EndPoint()	End Point of LineString
-- Envelope()	Return MBR of geometry
-- =	Equal operator
-- <=>	NULL-safe equal to operator
-- Equals()	Whether MBRs of two geometries are equal
-- EXP()	Raise to the power of
-- EXPORT_SET()	Return a string such that for every bit set in the value bits, you get an on string and for every unset bit, you get an off string
-- ExteriorRing()	Return exterior ring of Polygon
-- EXTRACT()	Extract part of a date
-- ExtractValue()	Extracts a value from an XML string using XPath notation
-- FIELD()	Return the index (position) of the first argument in the subsequent arguments
-- FIND_IN_SET()	Return the index position of the first argument within the second argument
-- FLOOR()	Return the largest integer value not greater than the argument
-- FORMAT()	Return a number formatted to specified number of decimal places
-- FOUND_ROWS()	For a SELECT with a LIMIT clause, the number of rows that would be returned were there no LIMIT clause
-- FROM_DAYS()	Convert a day number to a date
-- FROM_UNIXTIME()	Format Unix timestamp as a date
-- GeomCollFromText(), GeometryCollectionFromText()	Return geometry collection from WKT
-- GeomCollFromWKB(), GeometryCollectionFromWKB()	Return geometry collection from WKB
-- GeometryCollection()	Construct geometry collection from geometries
-- GeometryN()	Return N-th geometry from geometry collection
-- GeometryType()	Return name of geometry type
-- GeomFromText(), GeometryFromText()	Return geometry from WKT
-- GeomFromWKB(), GeometryFromWKB()	Return geometry from WKB
-- GET_FORMAT()	Return a date format string
-- GET_LOCK()	Get a named lock
-- GLength()	Return length of LineString
-- >	Greater than operator
-- >=	Greater than or equal operator
-- GREATEST()	Return the largest argument
-- GROUP_CONCAT()	Return a concatenated string
-- HEX()	Return a hexadecimal representation of a decimal or string value
-- HOUR()	Extract the hour
-- IF()	If/else construct
-- IFNULL()	Null if/else construct
-- IN()	Check whether a value is within a set of values
-- INET_ATON()	Return the numeric value of an IP address
-- INET_NTOA()	Return the IP address from a numeric value
-- INSERT()	Insert a substring at the specified position up to the specified number of characters
-- INSTR()	Return the index of the first occurrence of substring
-- InteriorRingN()	Return N-th interior ring of Polygon
-- Intersects()	Whether MBRs of two geometries intersect
-- INTERVAL()	Return the index of the argument that is less than the first argument
-- IS	Test a value against a boolean
-- IS_FREE_LOCK()	Whether the named lock is free
-- IS NOT	Test a value against a boolean
-- IS NOT NULL	NOT NULL value test
-- IS NULL	NULL value test
-- IS_USED_LOCK()	Whether the named lock is in use; return connection identifier if true
-- IsClosed()	Whether a geometry is closed and simple
-- IsEmpty()	Placeholder function
-- ISNULL()	Test whether the argument is NULL
-- IsSimple()	Whether a geometry is simple
-- LAST_DAY	Return the last day of the month for the argument
-- LAST_INSERT_ID()	Value of the AUTOINCREMENT column for the last INSERT
-- LCASE()	Synonym for LOWER()
-- LEAST()	Return the smallest argument
-- LEFT()	Return the leftmost number of characters as specified
-- <<	Left shift
-- LENGTH()	Return the length of a string in bytes
-- <	Less than operator
-- <=	Less than or equal operator
-- LIKE	Simple pattern matching
-- LineFromText(), LineStringFromText()	Construct LineString from WKT
-- LineFromWKB(), LineStringFromWKB()	Construct LineString from WKB
-- LineString()	Construct LineString from Point values
-- LN()	Return the natural logarithm of the argument
-- LOAD_FILE()	Load the named file
-- LOCALTIME(), LOCALTIME	Synonym for NOW()
-- LOCALTIMESTAMP, LOCALTIMESTAMP()	Synonym for NOW()
-- LOCATE()	Return the position of the first occurrence of substring
-- LOG()	Return the natural logarithm of the first argument
-- LOG10()	Return the base-10 logarithm of the argument
-- LOG2()	Return the base-2 logarithm of the argument
-- LOWER()	Return the argument in lowercase
-- LPAD()	Return the string argument, left-padded with the specified string
-- LTRIM()	Remove leading spaces
-- MAKE_SET()	Return a set of comma-separated strings that have the corresponding bit in bits set
-- MAKEDATE()	Create a date from the year and day of year
-- MAKETIME()	Create time from hour, minute, second
-- MASTER_POS_WAIT()	Block until the slave has read and applied all updates up to the specified position
-- MATCH	Perform full-text search
-- MAX()	Return the maximum value
-- MBRContains()	Whether MBR of one geometry contains MBR of another
-- MBRDisjoint()	Whether MBRs of two geometries are disjoint
-- MBREqual()	Whether MBRs of two geometries are equal
-- MBRIntersects()	Whether MBRs of two geometries intersect
-- MBROverlaps()	Whether MBRs of two geometries overlap
-- MBRTouches()	Whether MBRs of two geometries touch
-- MBRWithin()	Whether MBR of one geometry is within MBR of another
-- MD5()	Calculate MD5 checksum
-- MICROSECOND()	Return the microseconds from argument
-- MID()	Return a substring starting from the specified position
-- MIN()	Return the minimum value
-- -	Minus operator
-- MINUTE()	Return the minute from the argument
-- MLineFromText(), MultiLineStringFromText()	Construct MultiLineString from WKT
-- MLineFromWKB(), MultiLineStringFromWKB()	Construct MultiLineString from WKB
-- MOD()	Return the remainder
-- %, MOD	Modulo operator
-- MONTH()	Return the month from the date passed
-- MONTHNAME()	Return the name of the month
-- MPointFromText(), MultiPointFromText()	Construct MultiPoint from WKT
-- MPointFromWKB(), MultiPointFromWKB()	Construct MultiPoint from WKB
-- MPolyFromText(), MultiPolygonFromText()	Construct MultiPolygon from WKT
-- MPolyFromWKB(), MultiPolygonFromWKB()	Construct MultiPolygon from WKB
-- MultiLineString()	Contruct MultiLineString from LineString values
-- MultiPoint()	Construct MultiPoint from Point values
-- MultiPolygon()	Construct MultiPolygon from Polygon values
-- NAME_CONST()	Causes the column to have the given name
-- NOT, !	Negates value
-- NOT BETWEEN ... AND ...	Check whether a value is not within a range of values
-- !=, <>	Not equal operator
-- NOT IN()	Check whether a value is not within a set of values
-- NOT LIKE	Negation of simple pattern matching
-- NOT REGEXP	Negation of REGEXP
-- NOW()	Return the current date and time
-- NULLIF()	Return NULL if expr1 = expr2
-- NumGeometries()	Return number of geometries in geometry collection
-- NumInteriorRings()	Return number of interior rings in Polygon
-- NumPoints()	Return number of points in LineString
-- OCT()	Return a string containing octal representation of a number
-- OCTET_LENGTH()	Synonym for LENGTH()
-- OLD_PASSWORD()	Return the value of the pre-4.1 implementation of PASSWORD
-- ||, OR	Logical OR
-- ORD()	Return character code for leftmost character of the argument
-- Overlaps()	Whether MBRs of two geometries overlap
-- PASSWORD()	Calculate and return a password string
-- PERIOD_ADD()	Add a period to a year-month
-- PERIOD_DIFF()	Return the number of months between periods
-- PI()	Return the value of pi
-- +	Addition operator
-- Point()	Construct Point from coordinates
-- PointFromText()	Construct Point from WKT
-- PointFromWKB()	Construct Point from WKB
-- PointN()	Return N-th point from LineString
-- PolyFromText(), PolygonFromText()	Construct Polygon from WKT
-- PolyFromWKB(), PolygonFromWKB()	Construct Polygon from WKB
-- Polygon()	Construct Polygon from LineString arguments
-- POSITION()	Synonym for LOCATE()
-- POW()	Return the argument raised to the specified power
-- POWER()	Return the argument raised to the specified power
-- PROCEDURE ANALYSE()	Analyze the results of a query
-- QUARTER()	Return the quarter from a date argument
-- QUOTE()	Escape the argument for use in an SQL statement
-- RADIANS()	Return argument converted to radians
-- RAND()	Return a random floating-point value
-- REGEXP	Whether string matches regular expression
-- RELEASE_LOCK()	Releases the named lock
-- REPEAT()	Repeat a string the specified number of times
-- REPLACE()	Replace occurrences of a specified string
-- REVERSE()	Reverse the characters in a string
-- RIGHT()	Return the specified rightmost number of characters
-- >>	Right shift
-- RLIKE	Whether string matches regular expression
-- ROUND()	Round the argument
-- ROW_COUNT()	The number of rows updated
-- RPAD()	Append string the specified number of times
-- RTRIM()	Remove trailing spaces
-- SCHEMA()	Synonym for DATABASE()
-- SEC_TO_TIME()	Converts seconds to 'HH:MM:SS' format
-- SECOND()	Return the second (0-59)
-- SESSION_USER()	Synonym for USER()
-- SHA1(), SHA()	Calculate an SHA-1 160-bit checksum
-- SHA2()	Calculate an SHA-2 checksum
-- SIGN()	Return the sign of the argument
-- SIN()	Return the sine of the argument
-- SLEEP()	Sleep for a number of seconds
-- SOUNDEX()	Return a soundex string
-- SOUNDS LIKE	Compare sounds
-- SPACE()	Return a string of the specified number of spaces
-- SQRT()	Return the square root of the argument
-- SRID()	Return spatial reference system ID for geometry
-- StartPoint()	Start Point of LineString
-- STD()	Return the population standard deviation
-- STDDEV()	Return the population standard deviation
-- STDDEV_POP()	Return the population standard deviation
-- STDDEV_SAMP()	Return the sample standard deviation
-- STR_TO_DATE()	Convert a string to a date
-- STRCMP()	Compare two strings
-- SUBDATE()	Synonym for DATE_SUB() when invoked with three arguments
-- SUBSTR()	Return the substring as specified
-- SUBSTRING()	Return the substring as specified
-- SUBSTRING_INDEX()	Return a substring from a string before the specified number of occurrences of the delimiter
-- SUBTIME()	Subtract times
-- SUM()	Return the sum
-- SYSDATE()	Return the time at which the function executes
-- SYSTEM_USER()	Synonym for USER()
-- TAN()	Return the tangent of the argument
-- TIME()	Extract the time portion of the expression passed
-- TIME_FORMAT()	Format as time
-- TIME_TO_SEC()	Return the argument converted to seconds
-- TIMEDIFF()	Subtract time
-- *	Multiplication operator
-- TIMESTAMP()	With a single argument, this function returns the date or datetime expression; with two arguments, the sum of the arguments
-- TIMESTAMPADD()	Add an interval to a datetime expression
-- TIMESTAMPDIFF()	Subtract an interval from a datetime expression
-- TO_DAYS()	Return the date argument converted to days
-- TO_SECONDS()	Return the date or datetime argument converted to seconds since Year 0
-- Touches()	Whether one geometry touches another
-- TRIM()	Remove leading and trailing spaces
-- TRUNCATE()	Truncate to specified number of decimal places
-- UCASE()	Synonym for UPPER()
-- -	Change the sign of the argument
-- UNCOMPRESS()	Uncompress a string compressed
-- UNCOMPRESSED_LENGTH()	Return the length of a string before compression
-- UNHEX()	Return a string containing hex representation of a number
-- UNIX_TIMESTAMP()	Return a Unix timestamp
-- UpdateXML()	Return replaced XML fragment
-- UPPER()	Convert to uppercase
-- USER()	The user name and host name provided by the client
-- UTC_DATE()	Return the current UTC date
-- UTC_TIME()	Return the current UTC time
-- UTC_TIMESTAMP()	Return the current UTC date and time
-- UUID()	Return a Universal Unique Identifier (UUID)
-- UUID_SHORT()	Return an integer-valued universal identifier
-- VALUES()	Defines the values to be used during an INSERT
-- VAR_POP()	Return the population standard variance
-- VAR_SAMP()	Return the sample variance
-- VARIANCE()	Return the population standard variance
-- VERSION()	Return a string that indicates the MySQL server version
-- WEEK()	Return the week number
-- WEEKDAY()	Return the weekday index
-- WEEKOFYEAR()	Return the calendar week of the date (1-53)
-- Within()	Whether MBR of one geometry is within MBR of another
-- X()	Return X coordinate of Point
-- XOR	Logical XOR
-- Y()	Return Y coordinate of Point
-- YEAR()	Return the year
-- YEARWEEK()	Return the year and week

SELECT 1 + '1';
SELECT CONCAT(2,' test');
SELECT 38.5, CAST(38.5 AS CHAR);
SELECT NULL<=>NULL;   -- 1 <=> null-safe equality comparison operator.

SELECT 1>'6x';
SELECT 7>'6x';
SELECT 0>'x6'
SELECT 0='x6';

SELECT * FROM tbl_name WHERE str_col=1; -- if str_col has index,now index can not work.
SELECT '18015376320243458' = 18015376320243458;
SELECT '18015376320243459' = 18015376320243459;
SELECT '18015376320243459'+0.0;

-- 12.5 String Functions
-- Name	Description
-- ASCII()	Return numeric value of left-most character
-- BIN()	Return a string containing binary representation of a number
-- BIT_LENGTH()	Return length of argument in bits
-- CHAR()	Return the character for each integer passed
-- CHAR_LENGTH()	Return number of characters in argument
-- CHARACTER_LENGTH()	Synonym for CHAR_LENGTH()
-- CONCAT()	Return concatenated string
-- CONCAT_WS()	Return concatenate with separator
-- ELT()	Return string at index number
-- EXPORT_SET()	Return a string such that for every bit set in the value bits, you get an on string and for every unset bit, you get an off string
-- FIELD()	Return the index (position) of the first argument in the subsequent arguments
-- FIND_IN_SET()	Return the index position of the first argument within the second argument
-- FORMAT()	Return a number formatted to specified number of decimal places
-- HEX()	Return a hexadecimal representation of a decimal or string value
-- INSERT()	Insert a substring at the specified position up to the specified number of characters
-- INSTR()	Return the index of the first occurrence of substring
-- LCASE()	Synonym for LOWER()
-- LEFT()	Return the leftmost number of characters as specified
-- LENGTH()	Return the length of a string in bytes
-- LIKE	Simple pattern matching
-- LOAD_FILE()	Load the named file
-- LOCATE()	Return the position of the first occurrence of substring
-- LOWER()	Return the argument in lowercase
-- LPAD()	Return the string argument, left-padded with the specified string
-- LTRIM()	Remove leading spaces
-- MAKE_SET()	Return a set of comma-separated strings that have the corresponding bit in bits set
-- MATCH	Perform full-text search
-- MID()	Return a substring starting from the specified position
-- NOT LIKE	Negation of simple pattern matching
-- NOT REGEXP	Negation of REGEXP
-- OCT()	Return a string containing octal representation of a number
-- OCTET_LENGTH()	Synonym for LENGTH()
-- ORD()	Return character code for leftmost character of the argument
-- POSITION()	Synonym for LOCATE()
-- QUOTE()	Escape the argument for use in an SQL statement
-- REGEXP	Whether string matches regular expression
-- REPEAT()	Repeat a string the specified number of times
-- REPLACE()	Replace occurrences of a specified string
-- REVERSE()	Reverse the characters in a string
-- RIGHT()	Return the specified rightmost number of characters
-- RLIKE	Whether string matches regular expression
-- RPAD()	Append string the specified number of times
-- RTRIM()	Remove trailing spaces
-- SOUNDEX()	Return a soundex string
-- SOUNDS LIKE	Compare sounds
-- SPACE()	Return a string of the specified number of spaces
-- STRCMP()	Compare two strings
-- SUBSTR()	Return the substring as specified
-- SUBSTRING()	Return the substring as specified
-- SUBSTRING_INDEX()	Return a substring from a string before the specified number of occurrences of the delimiter
-- TRIM()	Remove leading and trailing spaces
-- UCASE()	Synonym for UPPER()
-- UNHEX()	Return a string containing hex representation of a number
-- UPPER()	Convert to uppercase

-- For functions that operate on string positions,the first position is numbered.
SELECT ASCII('2');
SELECT ASCII(2);
SELECT ASCII('dx');

SELECT BIT_LENGTH('test');
SELECT BIT_LENGTH('张');

SELECT CHAR(77,121,83,81,'76');
SELECT CHAR(77,77,77.3);

SELECT HEX(CHAR(1,0)),HEX(CHAR(256));
SELECT HEX(CHAR(1,0,0)),HEX(CHAR(256*256));

SELECT CHARSET(CHAR(X'65')),CHARSET(CHAR(X'65' USING utf8));

SELECT CHAR_LENGTH('张渊博'),LENGTH('张渊博') -- result 3 ,9 
SELECT CHAR_LENGTH('zyb'),LENGTH('zyb');	-- result：3 3 	
-- LENGTH return the length string in bytes
-- CHAR_LENGTH Return number of characters in argument
-- CHARACTER_LENGTH is a synonym for CHAR_LENGTH(同义词)

-- CONCAT() returns null if any argument is null
SELECT CONCAT('My','s','QL'),CONCAT('My',NULL,'QL'),CONCAT(14.3);  -- result MysQL null 14.3

SELECT CONCAT_WS(',','First name','Second name','Last Name');
SELECT CONCAT_WS(',','First name',NULL,'Last Name');	-- CONCAT_WS does not ship empty
-- strings.However,it does ship any NULL values after the separator argument.

SELECT ELT(1,'Aa','Bb','Cc','Dd');
SELECT ELT(4,'Aa','Bb','Cc','Dd');

SELECT FIELD('Bb', 'Aa', 'Bb', 'Cc', 'Dd', 'Ff');
SELECT FIELD('Gg', 'Aa', 'Bb', 'Cc', 'Dd', 'Ff');

SELECT FIND_IN_SET('b','a,b,c,d');


-- 13.1.13 CREATE INDEX Syntax
-- 创建索引index 语句
CREATE [ONLINE|OFFLINE] [UNIQUE|FULLTEXT|SPATIAL] INDEX index_name
    [index_type]
    ON tbl_name (index_col_name,...)
    [index_option] ...

index_col_name:
    col_name [(LENGTH)] [ASC | DESC]

index_option:
    KEY_BLOCK_SIZE [=] VALUE
  | index_type
  | WITH PARSER parser_name
  | COMMENT 'string'

index_type:
    USING {BTREE | HASH}
    
 -- create index 不能创建primary index，要使用alter table 代替
    
CREATE TABLE customer (id INT UNSIGNED NOT NULL PRIMARY KEY,NAME CHAR(20))

CREATE INDEX part_of_name ON customer (NAME(10))  -- 前缀索引
-- 前缀索引不适合NDB
-- offline online关键字只适合NDB cluster
-- unique index permits multiple null values for column that can contain null
-- fullindex indexes are supported only for myisam tables and can include only 
-- char varchar test columns

CREATE TABLE lookup(id INT) ENGINE=MEMORY

CREATE INDEX id_index ON lookup (id) USING BTREE

-- btree indexes are implemented by the NDB storage engine as T-tree indexes


-- 13.1.14 CREATE LOGFILE GROUP Syntax
-- create logfile group is useful only Disk Data storage for NDB Cluster
CREATE LOGFILE GROUP logfile_group
    ADD UNDOFILE 'undo_file'
    [INITIAL_SIZE [=] INITIAL_SIZE]
    [UNDO_BUFFER_SIZE [=] UNDO_BUFFER_SIZE]
    [REDO_BUFFER_SIZE [=] REDO_BUFFER_SIZE]
    [NODEGROUP [=] nodegroup_id]
    [WAIT]
    [COMMENT [=] 'string']
    ENGINE [=] engine_name

CREATE LOGFILE GROUP lg1 ADD UNDOFILE 'undo.dat' INITIAL_SIZE=10M

SHOW WARNINGS;

CREATE LOGFILE GROUP lg1 ADD UNDOFILE 'undo.dat' INITIAL_SIZE=10M ENGINE=NDB;

SELECT logfile_group_name,logfile_group_number,extra
FROM information_schema.`FILES`
WHERE file_name='undo_10.dat';

SELECT * FROM information_schema.files;

-- 13.1.15 CREATE PROCEDURE and CREATE FUNCTION Syntax
CREATE
    [DEFINER = { USER | CURRENT_USER }]
    PROCEDURE sp_name ([proc_parameter[,...]])
    [characteristic ...] routine_body

CREATE
    [DEFINER = { USER | CURRENT_USER }]
    FUNCTION sp_name ([func_parameter[,...]])
    RETURNS TYPE
    [characteristic ...] routine_body

proc_parameter:
    [ IN | OUT | INOUT ] param_name TYPE

func_parameter:
    param_name TYPE

TYPE:
    ANY valid MySQL DATA TYPE

characteristic:
    COMMENT 'string'
  | LANGUAGE SQL
  | [NOT] DETERMINISTIC
  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }
  | SQL SECURITY { DEFINER | INVOKER }

routine_body:
    Valid SQL ROUTINE statement

-- the parameters list enclosed whithin parentheses must always be present.if there are no parameters,
-- an empty parameters list of () should be used.parameters names are not case sensitive.
-- each parameter is an IN parameter by default. To specify otherwise for a parameter,use the keyword
-- OUT or INOUT before the parameter name. For a FUNCTION,parameters are always regaeded as IN parameters.
 
-- The following example shows a simple stored procedure that uses an OUT parameter:
SHOW TABLES; SELECT * FROM lookup;INSERT INTO lookup VALUE(1),(2),(3);

DELIMITER //
CREATE PROCEDURE simpleproc(OUT param1 INT)
BEGIN
SELECT COUNT(*) INTO param1 FROM lookup;
END//

CALL test.`simpleproc`(@a);
SELECT @a; 

BEGIN 对mysql变量的理解
-- @a 对mysql 变量的解释
-- set语句的学习：
-- 
-- 使用select定义用户变量的实践
-- 将如下语句改成select的形式：
--  SET @VAR=(SELECT SUM(amount) FROM penalties);
-- 我的修改：
--  SELECT @VAR:=(SELECT SUM(amount) FROM penalties);
-- 
-- 我这样改，虽然是可以的。但是，对比的书中的答案，发现这样的方式太蹩脚了。说明没有很好地理解select定义变量的本质。
-- 在select中，发现有一个用户变量，如果没有定义，那么就会初始化。
-- select子句原来的方式根本不受到影响。只是增加了用户变量。所以，还是按照原来的方式使用select子句。那么像：select SUM(amount) FROM penalties。增加变量就成
-- 
-- 了:SELECT  @VAR:=SUM(amount) FROM penalties。
-- 
-- 将sum(amount)的结果赋给变量@VAR:。变量前面有select，那用户么就是显示该变量了。
-- 
-- 
-- 笔记部分：mysql变量的术语分类：
-- 1.用户变量：以"@"开始，形式为"@变量名"
-- 用户变量跟mysql客户端是绑定的，设置的变量，只对当前用户使用的客户端生效
-- 2.全局变量：定义时，以如下两种形式出现，set GLOBAL 变量名  或者  SET @@global.变量名 
-- 对所有客户端生效。只有具有super权限才可以设置全局变量
-- 
-- 3.会话变量：只对连接的客户端有效。
-- 
-- 4.局部变量：作用范围在begin到end语句块之间。在该语句块里设置的变量
-- declare语句专门用于定义局部变量。set语句是设置不同类型的变量，包括会话变量和全局变量
-- 
-- 
-- 通俗理解术语之间的区别：
-- 
-- 用户定义的变量就叫用户变量。这样理解的话，会话变量和全局变量都可以是用户定义的变量。只是他们是对当前客户端生效还是对所有客户端生效的区别了。所以，用户变量包括了会话变量和全局变量
-- 
-- 局部变量与用户变量的区分在于两点:1.用户变量是以"@"开头的。局部变量没有这个符号。2.定义变量不同。用户变量使用set语句，局部变量使用declare语句定义 3.作用范围。局部变量只在begin-end语句块之间有效。在begin-end语句块运行完之后，局部变量就消失了。
-- 
-- 所以，最后它们之间的层次关系是：变量包括局部变量和用户变量。用户变量包括会话变量和全局变量。
-- 
-- 
-- 使用备忘，set @var 若没有指定GLOBAL 或SESSION ，那么默认将会定义用户变量
-- 两种方式定义用户变量：
-- 1."=",如 SET @a =3,@a:=5
-- 2.":="。select常常这样使用
-- 总结：使用select 和set设置变量的区别，set可以使用以上两种形式设置变量。而select只能使用":="的形式设置变量
-- 实践积累：用户变量在mysql客户端退出后，会自动消失。之后我打开客户端，使用"select @a;" 显示变了的值为null。说明，未定义的变量初始化是null
-- 
-- 实际中的问题
-- 
-- 设置常量对group_concat()的配置影响：
-- SET @@GROUP_CONCAT_MAX_LEN=4
-- 手册中提到设置的语法是这样的：
-- SET [SESSION | GLOBAL] group_concat_max_len = val;
-- 
-- 以下两种形式都能达到达到同样的效果，但是有什么区别？
-- 
-- SET @@global.GROUP_CONCAT_MAX_LEN=4;
-- global可以省略，那么就变成了：SET @@GROUP_CONCAT_MAX_LEN=4;
-- 
-- 2011.2.25
-- 
-- 之前的理解不怎么准确。现在对加深理解后的地方进行总结。
-- 
-- mysql中变量的层次关系是:大体包括用户变量和系统变量。系统变量包括系统会话变量和系统全局变量。
-- 
-- 我是这样理解相互之间的区别：
-- 
-- 因为用户变量就是用户定义的变量，系统变量就是mysql定义和维护的变量。所以，用户变量与系统变量的区别在于，是谁在管理这些变量。mysql一启动的时候就会读取系统变量(这样做目的是可以确定mysql的以何种机制或模式运行)。 系统会话变量与用户变量都是在当前客户端退出后消失。他们之间的区别可以这样理解，虽然常常看到"set @@varible"的形式去改变系统变量的值，但是并不涉及到定义系统变量。用户变量是可以自己定义(初始化)。系统变量按照只是在改变值。
-- 
-- 局部变量只在begin-end语句块中定义并有效。执行到该语句块之后就消失了。定义的方式有明显的特点，使用declare语句。
-- 
-- 为什么看到使用系统变量以"@@变量名"和"变量名"的形式出现，怎么理解两者形式的区别？
-- 
-- 使用系统变量理论上是可以使用两种形式：1.前面带有符号"@@" 2.符号省略。比如我会看的如下形式：CURRENT_USER。但是，约定系统变量要使用"@@变量名"的形式，就是在前面加上符号"@@"。
-- 
-- 为什么会出现CURRENT_USER这样没有符号的情况？看书籍《SQL FOR MySQL Developers A Comprehensive Tutorial AND Reference》大致说明的原因，这样做是为了与其他的SQL产品保持一致。
 END

-- The example uses the mysql client delimiter command to change the statement delimiter from ; to // while
-- the procedure is being defined.This enables the ; delimiter used in the procedure body to be passed
-- through to the server rather than interpreted by mysql itself.

-- The RETURNS clause may be sepcified only for a FUNCTION,for which it is mandatory.
-- The following example function takes a parameter, performs an operation using an SQL function, 
-- and returns the result. In this case, it is unnecessary to use delimiter because the function 
-- definition contains no internal ; statement delimiters:

CREATE FUNCTION hello(s CHAR(20))
RETURNS CHAR(50) DETERMINISTIC   -- deterministic adj 确定性 决定性 决定论
RETURN CONCAT('hello,',s,'!');

SELECT hello('zhang'); -- 调用函数

-- Statements that return a result set can be used within stored procedure but not whitin a stored function.
SELECT CURRENT_USER;
SELECT CURRENT_USER();

SELECT COUNT(*) FROM mysql.user;
SELECT * FROM mysql.user;

-- Consider the following procedure, which displays a count of the number of MySQL accounts listed 
-- in the mysql.user table:
DELIMITER //
CREATE DEFINER='admin'@'localhost' PROCEDURE account_count()
BEGIN
	SELECT 'Number of acounts:',COUNT(*) FROM mysql.user;
END//

CALL test.`account_count` ();
DROP PROCEDURE test.account_count;

DELIMITER //

CREATE DEFINER='admin'@'localhost' PROCEDURE account_count()
SQL SECURITY INVOKER
BEGIN
	SELECT 'Numbers of accounts:',COUNT(*) FROM mysql.user;
END//
CALL test.`account_count`();


DELIMITER //
CREATE DEFINER='root'@'localhost' PROCEDURE account_count_root()
BEGIN
	SELECT 'Number of acounts:',COUNT(*) FROM mysql.user;
END//

CALL test.account_count_root();

-- 13.1.16 CREATE SERVER Syntax
CREATE SERVER server_name
    FOREIGN DATA WRAPPER wrapper_name
    OPTIONS (OPTION [, OPTION] ...)

OPTION:
  { HOST CHARACTER-literal
  | DATABASE CHARACTER-literal
  | USER CHARACTER-literal
  | PASSWORD CHARACTER-literal
  | SOCKET CHARACTER-literal
  | OWNER CHARACTER-literal
  | PORT NUMERIC-literal }
  
  -- For example:
  CREATE SERVER s
  FOREIGN DATA WRAPPER mysql
  OPTIONS (USER 'Remote',HOST '198.51.100.106',DATABASE 'test');
  
  -- Be sure to specify all options nesssary to establish a connection to the server.The user name,host name,and
  -- database name are mandatory.Other options might be required as well,such as password.
  
  -- The data stored in the table can be used when creating a connection to a FEDERATED table:
  CREATE TABLE t (s1 INT) ENGINE=FEDERATED CONNECTION='s';
  -- 执行以上语句报错，待处理
  
  -- 13.1.17 CREATE TABLE Syntax
CREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name
    (create_definition,...)
    [table_options]
    [partition_options]

CREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name
    [(create_definition,...)]
    [table_options]
    [partition_options]
    [IGNORE | REPLACE]
    [AS] query_expression

CREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name
    { LIKE old_tbl_name | (LIKE old_tbl_name) }

create_definition:
    col_name column_definition
  | [CONSTRAINT [symbol]] PRIMARY KEY [index_type] (index_col_name,...)
      [index_option] ...
  | {INDEX|KEY} [index_name] [index_type] (index_col_name,...)
      [index_option] ...
  | [CONSTRAINT [symbol]] UNIQUE [INDEX|KEY]
      [index_name] [index_type] (index_col_name,...)
      [index_option] ...
  | {FULLTEXT|SPATIAL} [INDEX|KEY] [index_name] (index_col_name,...)
      [index_option] ...
  | [CONSTRAINT [symbol]] FOREIGN KEY
      [index_name] (index_col_name,...) reference_definition
  | CHECK (expr)

column_definition:
    data_type [NOT NULL | NULL] [DEFAULT default_value]
      [AUTO_INCREMENT] [UNIQUE [KEY]] [[PRIMARY] KEY]
      [COMMENT 'string']
      [COLUMN_FORMAT {FIXED|DYNAMIC|DEFAULT}]
      [STORAGE {DISK|MEMORY|DEFAULT}]
      [reference_definition]

data_type:
    BIT[(LENGTH)]
  | TINYINT[(LENGTH)] [UNSIGNED] [ZEROFILL]
  | SMALLINT[(LENGTH)] [UNSIGNED] [ZEROFILL]
  | MEDIUMINT[(LENGTH)] [UNSIGNED] [ZEROFILL]
  | INT[(LENGTH)] [UNSIGNED] [ZEROFILL]
  | INTEGER[(LENGTH)] [UNSIGNED] [ZEROFILL]
  | BIGINT[(LENGTH)] [UNSIGNED] [ZEROFILL]
  | REAL[(LENGTH,decimals)] [UNSIGNED] [ZEROFILL]
  | DOUBLE[(LENGTH,decimals)] [UNSIGNED] [ZEROFILL]
  | FLOAT[(LENGTH,decimals)] [UNSIGNED] [ZEROFILL]
  | DECIMAL[(LENGTH[,decimals])] [UNSIGNED] [ZEROFILL]
  | NUMERIC[(LENGTH[,decimals])] [UNSIGNED] [ZEROFILL]
  | DATE
  | TIME
  | TIMESTAMP
  | DATETIME
  | YEAR
  | CHAR[(LENGTH)]
      [CHARACTER SET charset_name] [COLLATE collation_name]
  | VARCHAR(LENGTH)
      [CHARACTER SET charset_name] [COLLATE collation_name]
  | BINARY[(LENGTH)]
  | VARBINARY(LENGTH)
  | TINYBLOB
  | BLOB[(LENGTH)]
  | MEDIUMBLOB
  | LONGBLOB
  | TINYTEXT
      [CHARACTER SET charset_name] [COLLATE collation_name]
  | TEXT[(LENGTH)]
      [CHARACTER SET charset_name] [COLLATE collation_name]
  | MEDIUMTEXT
      [CHARACTER SET charset_name] [COLLATE collation_name]
  | LONGTEXT
      [CHARACTER SET charset_name] [COLLATE collation_name]
  | ENUM(value1,value2,value3,...)
      [CHARACTER SET charset_name] [COLLATE collation_name]
  | SET(value1,value2,value3,...)
      [CHARACTER SET charset_name] [COLLATE collation_name]
  | spatial_type

index_col_name:
    col_name [(LENGTH)] [ASC | DESC]

index_type:
    USING {BTREE | HASH}

index_option:
    KEY_BLOCK_SIZE [=] VALUE
  | index_type
  | WITH PARSER parser_name
  | COMMENT 'string'

reference_definition:
    REFERENCES tbl_name (index_col_name,...)
      [MATCH FULL | MATCH PARTIAL | MATCH SIMPLE]
      [ON DELETE reference_option]
      [ON UPDATE reference_option]

reference_option:
    RESTRICT | CASCADE | SET NULL | NO ACTION | SET DEFAULT

table_options:
    table_option [[,] table_option] ...

table_option:
    AUTO_INCREMENT [=] VALUE
  | AVG_ROW_LENGTH [=] VALUE
  | [DEFAULT] CHARACTER SET [=] charset_name
  | CHECKSUM [=] {0 | 1}
  | [DEFAULT] COLLATE [=] collation_name
  | COMMENT [=] 'string'
  | CONNECTION [=] 'connect_string'
  | {DATA|INDEX} DIRECTORY [=] 'absolute path to directory'
  | DELAY_KEY_WRITE [=] {0 | 1}
  | ENGINE [=] engine_name
  | INSERT_METHOD [=] { NO | FIRST | LAST }
  | KEY_BLOCK_SIZE [=] VALUE
  | MAX_ROWS [=] VALUE
  | MIN_ROWS [=] VALUE
  | PACK_KEYS [=] {0 | 1 | DEFAULT}
  | PASSWORD [=] 'string'
  | ROW_FORMAT [=] {DEFAULT|DYNAMIC|FIXED|COMPRESSED|REDUNDANT|COMPACT}
  | TABLESPACE tablespace_name [STORAGE {DISK|MEMORY|DEFAULT}]
  | UNION [=] (tbl_name[,tbl_name]...)

partition_options:
    PARTITION BY
        { [LINEAR] HASH(expr)
        | [LINEAR] KEY [ALGORITHM={1|2}] (column_list)
        | RANGE{(expr) | COLUMNS(column_list)}
        | LIST{(expr) | COLUMNS(column_list)} }
    [PARTITIONS num]
    [SUBPARTITION BY
        { [LINEAR] HASH(expr)
        | [LINEAR] KEY [ALGORITHM={1|2}] (column_list) }
      [SUBPARTITIONS num]
    ]
    [(partition_definition [, partition_definition] ...)]

partition_definition:
    PARTITION partition_name
        [VALUES
            {LESS THAN {(expr | value_list) | MAXVALUE}
            |
            IN (value_list)}]
        [[STORAGE] ENGINE [=] engine_name]
        [COMMENT [=] 'string' ]
        [DATA DIRECTORY [=] 'data_dir']
        [INDEX DIRECTORY [=] 'index_dir']
        [MAX_ROWS [=] max_number_of_rows]
        [MIN_ROWS [=] min_number_of_rows]
        [TABLESPACE [=] tablespace_name]
        [NODEGROUP [=] node_group_id]
        [(subpartition_definition [, subpartition_definition] ...)]

subpartition_definition:
    SUBPARTITION logical_name
        [[STORAGE] ENGINE [=] engine_name]
        [COMMENT [=] 'string' ]
        [DATA DIRECTORY [=] 'data_dir']
        [INDEX DIRECTORY [=] 'index_dir']
        [MAX_ROWS [=] max_number_of_rows]
        [MIN_ROWS [=] min_number_of_rows]
        [TABLESPACE [=] tablespace_name]
        [NODEGROUP [=] node_group_id]

query_expression:
    SELECT ...   (SOME valid SELECT OR UNION statement)
    
 -- by default,tables are created in the default database.suing the InnoDB storage engine.An error occurs
 -- if the table exists,if there is no default database,or if the database does not exists.
 
 TEMPORARY TABLES
 -- you can use the TEMPORARY keyword when creating a table.A TEMPORARY table is visible obly whitin 
 -- the currently session,and is droped automatically when session is closed.
 
 Cloning OR Copying a TABLE
 1.like
 -- Use CREATE TABLE ... LIKE to craete an empty table based on the definotion of another table,including
 -- any column and indexes defined in the original table.
 CREATE TABLE new_tbl LIKE orig_tbl;
 2.[AS] query_expression
 -- To create table from another,add a SELECT statement at the end of the CREATE TABLE statement.
 CREATE TABLE new_tbl AS SELECT * FROM orig_tbl;
 
 3.IGNORE|REPLACE
 -- The IGNORE and REPLACE options indicate how to handle rows that duplicate unique key values
 -- when copying a table using a SELECT statement.
 
 COLUMN DATA TYPES AND Attributes
 
 -- There is a hard limit of 4096 columns per table,but the effictive maximum may be less for a given table
 -- and depends on the factors.
 
 data_type
 
 -- Some attributes do not apply to all data types. AUTO_INCREMENT applies only to integer and floating-point type
 -- DEFAULT does not apply to the BLOB or TEXT types.
 
 -- Character data types (CHAR, VARCHAR, TEXT) can include CHARACTER SET and COLLATE attributes to specify 
 -- the character set and collation for the column.
 CREATE TABLE t (c CHAR(20)) CHARACTER SET utf8 COLLATION utf8_bin;
 
 -- For CHAR, VARCHAR, BINARY, and VARBINARY columns, indexes can be created that use only the 
 -- leading part of column values, using col_name(length) syntax to specify an index prefix length.
 -- BLOB and TEXT columns also can be indexed, but a prefix length must be given. 
 -- Prefix lengths are given in characters for nonbinary string types and in bytes for binary string types. 
 -- That is, index entries consist of the first length characters of each column value for 
 -- CHAR, VARCHAR, and TEXT columns, and the first length bytes of each column value for 
 -- BINARY, VARBINARY, and BLOB columns. 
 -- Indexing only a prefix of column values like this can make the index file much smaller. 
 
 -- Only the InnoDB and MyISAM storage engines support indexing on BLOB and TEXT columns.For example:
 CREATE TABLE test (blob_col BLOB,INDEX(blob_col(10)));
 
 -- In MySQL 5.5, only the InnoDB, MyISAM, and MEMORY storage engines support indexes 
 -- on columns that can have NULL values. In other cases, you must declare 
 -- indexed columns as NOT NULL or an error results.
 
 -- AUTO_INCREMENT sequences begin with 1.
 
 SELECT LAST_INSERT_ID();
 SELECT mysql_insert_id() -- 报错，待处理
 -- If the NO_AUTO_VALUE_ON_ZERO SQL mode is enabled, you can store 0 
 -- in AUTO_INCREMENT columns as 0 without generating a new sequence value。
 
 -- To make MySQL compatible with some ODBC applications, you can find the 
 -- AUTO_INCREMENT value for the last inserted row with the following query:
 SELECT * FROM tbl_name WHERE auto_col IS NULL;
 
 SHOW CREATE TABLE test;
 SHOW FULL COLUMNS FROM test; 
 
 STORAGE
 -- For NDB tables, it is possible to specify whether the column is stored on disk 
 -- or in memory by using a STORAGE clause. STORAGE DISK causes the column to be 
 -- stored on disk, and STORAGE MEMORY causes in-memory storage to be used. 
 -- The CREATE TABLE statement used must still include a TABLESPACE clause:
 CREATE TABLE t1 (
	c1 INT STORAGE DISK,
	c2 INT STORAGE MEMORY
	) ENGINE NDB;
-- 错误代码： 1286 	Unknown storage engine 'ndb'	
CREATE TABLE t1(
	c1 INT STORAGE DISK,
	c2 INT STORAGE MEMORY
	) TABLESPACE ts_1 ENGINE NDB;
 
INDEXES AND FOREIGN KEYS

-- PRIMARY KEY
-- A table can have obly one PRIMARY KEY.The primary key column must NOT NULL.

SHOW INDEXES FROM test;

-- Integer Type 
-- Type	Storage(Bytes)	Minimun Value Signed Minimun Value Unsigned Maximum Value Signed Maximum Value Unsigned
--  tinyint       1              -128                  0		      127                 255
--  smallint	  2              -32768                0                      32767 		  65535
--  mediumint     3              -8388608              0                      8388607             16777215
--  int           4              -2147473648           0                      2147483647          4294967295
--  bigint        8              -2**63                0                      2**63-1             2**64-1

-- Index values are always stored in asccending order.

ALTER TABLE tbl_name AUTO_INCREMENT=N,N>maximum number IN the table.
-- The TABLESPACE and STORAGE table options are employed only with NDBCLUSTER tables. 


