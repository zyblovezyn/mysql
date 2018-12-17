BEGIN -- 12 Function and Operator Reference

BEGIN -- all function
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
END

BEGIN -- examples

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

END -- example

BEGIN -- 12.5 String Functions ok

BEGIN -- String Functions
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
END 

BEGIN -- For functions that operate on string positions,the first position is numbered.
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

-- HEX(str), HEX(N)
SELECT X'616263',HEX('abc'),UNHEX(HEX('abc'));

SELECT HEX(255),CONV(HEX(255),16,10);

-- INSERT(str,pos,len,newstr)
SELECT INSERT('Quadratic',3,4,'What');
SELECT INSERT('Quadratic',-1,4,'What');
SELECT INSERT('Quadratic',3,100,'What');

-- INSTR(str,substr)
SELECT INSTR('footbarbar','bar');
SELECT INSTR('$12,1233,123,123',',');
SELECT INSTR('xbar','foobar');
-- LEFT(str,len)
SELECT LEFT('foobarbar',5);

-- LENGTH(str) return the length of the str,measured in bytes.
SELECT LENGTH('test');

-- LOAD_FILE(file_name)
UPDATE t SET blob_col=LOAD_FILE('/tmp/picture')
WHERE id=1

-- LOCATE(substr,str), LOCATE(substr,str,pos)
SELECT LOCATE('bar','foobarbar');
SELECT LOCATE('xbar','foobarbar');
SELECT LOCATE('bar','foobarbar',5);

-- LOWER()
SET @str=BINARY 'New York';
SELECT LOWER(@str),LOWER(CONVERT(@str USING latin1));

-- LTRIM(str)
SELECT LTRIM('   barbar');

-- OCT(N)=CONV(N,from_base,to_base)
SELECT OCT(12);

-- POSITION(substr IN str) is a synonym for LOCATE(substr,str).

-- QUOTE(str)
SELECT QUOTE('Don\'t!'),QUOTE(NULL);

-- REPEAT(str,count)
SELECT REPEAT('MySql',3);

-- REPLACE(str,from_str,to_str)
SELECT REPLACE('www.mysql.com','w','Ww');

-- REVERSE(str)
SELECT REVERSE('abc');

-- RIGHT(str,len)
SELECT RIGHT('foobarbar',4);

-- RPAD(str,len,padstr)
SELECT RPAD('hi',5,'?');
SELECT RPAD('hi',1,'?');

-- RTRIM(str)
SELECT RTRIM('barbar   ');

-- SPACE(N)
SELECT SPACE(6);

-- SUBSTRING(str,pos), SUBSTRING(str FROM pos), SUBSTRING(str,pos,len), SUBSTRING(str FROM pos FOR len)
SELECT SUBSTRING('Quadratically',5);
SELECT SUBSTRING('foobarbar' FROM 4);
SELECT SUBSTRING('Quadratically',5,6);
SELECT SUBSTRING('Sakila', -3);
SELECT SUBSTRING('Sakila',-5,3);
SELECT SUBSTRING('Sakila' FROM -4 FOR 2);

-- SUBSTRING_INDEX(str,delim,count)
SELECT SUBSTRING_INDEX('www.mysql.com','.',2);

-- UNHEX(str) str is hexadecimal digital characters
SELECT UNHEX('4D7953514C');
SELECT X'4D7953514C';
SELECT UNHEX(HEX('string'));
SELECT HEX(UNHEX('1267'));
SELECT UNHEX('GG');

END 

BEGIN -- 12.5.1 String Comparison Functions

-- Name	Description
-- LIKE	Simple pattern matching
-- NOT LIKE	Negation of simple pattern matching
-- STRCMP()	Compare two strings
SELECT 'ä' LIKE 'ae' COLLATE latin1_german2_ci;
SELECT 'ä' = 'ae' COLLATE latin1_german2_ci;
SELECT 'a'='a','a' LIKE 'a ';

-- % matches any number of characters, even zero characters.
-- _matches exactly one character.
SELECT 'David!' LIKE 'David_';
SELECT 'David!' LIKE '%D%v%'

-- \% matches one % character
-- \_ matches one _ character
SELECT 'David!' LIKE 'David\_';
SELECT 'David_' LIKE 'David\_';

SELECT 'David_' LIKE 'David|_' ESCAPE '|';

SELECT 'abc' LIKE BINARY 'ABC';

SELECT 10 LIKE '1%';

CREATE TABLE foo (bar VARCHAR(10));

INSERT INTO foo VALUES (NULL),(NULL);

SELECT COUNT(*) FROM foo WHERE bar LIKE '%baz%';

SELECT COUNT(*) FROM foo WHERE bar NOT LIKE '%baz%' OR
bar IS NULL;

STRCMP(exp1,exp2)
-- exp1 > exp2       1
-- exp1 = exp2       0	
-- exp1 < exp2       -1

SELECT STRCMP('text','text2');
SELECT STRCMP('test2','test');
SELECT STRCMP('test','test');

END -- 12.5.1 String Comparison Functions

BEGIN -- 12.5.2 Regular Expressions

-- char和varchar的字符比较中，是忽略大小写与最后的空格的，如下:
SELECT 'a'='a ' , 'a'='A' , 'a'='A ';
-- 而binary及varbinary的字节比较中，所有的信息都不会被忽略



END -- 12.5.2 Regular Expressions

END -- 12.5 String Functions

BEGIN -- 12.6 Numeric Functions and Operators ok

BEGIN -- Function
-- Name	Description
-- ABS()	Return the absolute value
-- ACOS()	Return the arc cosine
-- ASIN()	Return the arc sine
-- ATAN()	Return the arc tangent
-- ATAN2(), ATAN()	Return the arc tangent of the two arguments
-- CEIL()	Return the smallest integer value not less than the argument
-- CEILING()	Return the smallest integer value not less than the argument
-- CONV()	Convert numbers between different number bases
-- COS()	Return the cosine
-- COT()	Return the cotangent
-- CRC32()	Compute a cyclic redundancy check value
-- DEGREES()	Convert radians to degrees
-- DIV	Integer division
-- /	Division operator
-- EXP()	Raise to the power of
-- FLOOR()	Return the largest integer value not greater than the argument
-- LN()	Return the natural logarithm of the argument
-- LOG()	Return the natural logarithm of the first argument
-- LOG10()	Return the base-10 logarithm of the argument
-- LOG2()	Return the base-2 logarithm of the argument
-- -	Minus operator
-- MOD()	Return the remainder
-- %, MOD	Modulo operator
-- PI()	Return the value of pi
-- +	Addition operator
-- POW()	Return the argument raised to the specified power
-- POWER()	Return the argument raised to the specified power
-- RADIANS()	Return argument converted to radians
-- RAND()	Return a random floating-point value
-- ROUND()	Round the argument
-- SIGN()	Return the sign of the argument
-- SIN()	Return the sine of the argument
-- SQRT()	Return the square root of the argument
-- TAN()	Return the tangent of the argument
-- *	Multiplication operator
-- TRUNCATE()	Truncate to specified number of decimal places
-- -	Change the sign of the argument

END -- Function

BEGIN -- 12.6.1 Arithmetic Operators

SELECT 3+5;
SELECT 3-5;
SELECT -2;

SELECT 3/5;
-- Division by zero produces a null result. division 除法
SELECT 102/(1-1);
SELECT 5 DIV 2,-5 DIV 2,5 DIV -2,-5 DIV -2;
-- % modulo 取余
END 12.6.1 Arithmetic Operators

BEGIN -- 12.6.2 Mathematical Functions

SELECT ABS(2),ABS(-32); -- return the absolute value of x

SELECT ACOS(1),ACOS(1.0001),ACOS(0);-- return null if value is not in the range -1 to 1.

SELECT ASIN(0.2),ASIN('foo');
SHOW WARNINGS;
SELECT ATAN(-2,2);

-- Returns the smallest integer value not less than X.
SELECT CEILING(1.23),CEILING(-1.23);

-- CONV(N,from_base.to_base).Converts numbers between different number bases
SELECT CONV('a',16,2),CONV('6E',18,8),CONV(-17,10,-18);
SELECT CONV(10+'10'+'10'+X'0a',10,10);

-- Computes a cyclic redundancy check value and returns a 32-bit unsigned value.
SELECT CRC32('MySql'),CRC32('mysql');

-- Returns the argument X, converted from radians to degrees.
SELECT DEGREES(PI()),DEGREES(PI()/2);

-- Returns the largest integer value not greater than X.
SELECT FLOOR(1.23),FLOOR(-1.23);

SELECT LOG(2,65536);
SELECT LOG(10,100);

-- LOG2() is useful for finding out how many bits a number requires for storage.
--  This function is equivalent to the expression LOG(X) / LOG(2).
SELECT LOG2(65536);

SELECT LOG10(2);
SELECT LOG10(100);
SELECT LOG10(-100);

SELECT MOD(3,2),3%2;

SELECT PI();
SELECT PI()+0.0000000000000

SELECT POW(2,2),POWER(2,-2);

SELECT FLOOR(7+(RAND()*5));-- 7<=x<12
SELECT CEILING(7+(RAND()*5)); -- 7<x<=12

CREATE TABLE t(i INT);

INSERT INTO t VALUES(1),(2),(3);
SELECT i,RAND() FROM t;
SELECT i,RAND(3) FROM t;
SELECT i,RAND() FROM t;
SELECT i,RAND(3) FROM t;

SELECT * FROM tbl_name ORDER BY RAND();
SELECT * FROM t ORDER BY RAND();

SELECT * FROM table1,table2 WHERE a=b AND c<d ORDER BY RAND() LIMIT 1000;

SELECT ROUND(-1.23);
SELECT ROUND(-1.58);
SELECT ROUND(1.58);
SELECT ROUND(1.298,1);
SELECT ROUND(1.298,0);
SELECT ROUND(23.298,-1);

SELECT SQRT(4);
SELECT SQRT(20);

SELECT TRUNCATE(1.223,1);
SELECT TRUNCATE(1.999,1);
SELECT TRUNCATE(1.999,0);
SELECT TRUNCATE(-1.999,1);
SELECT TRUNCATE(122,-2);
SELECT TRUNCATE(10.28*100,0);

END -- 12.6.2 Mathematical Functions

END -- 12.6 Numeric Functions and Operators

BEGIN -- 12.7 Date and Time Functions ok

BEGIN -- Date and Time Functions

-- Name	Description
-- ADDDATE()	Add time values (intervals) to a date value
-- ADDTIME()	Add time
-- CONVERT_TZ()	Convert from one time zone to another
-- CURDATE()	Return the current date
-- CURRENT_DATE(), CURRENT_DATE	Synonyms for CURDATE()
-- CURRENT_TIME(), CURRENT_TIME	Synonyms for CURTIME()
-- CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP	Synonyms for NOW()
-- CURTIME()	Return the current time
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
-- EXTRACT()	Extract part of a date
-- FROM_DAYS()	Convert a day number to a date
-- FROM_UNIXTIME()	Format Unix timestamp as a date
-- GET_FORMAT()	Return a date format string
-- HOUR()	Extract the hour
-- LAST_DAY	Return the last day of the month for the argument
-- LOCALTIME(), LOCALTIME	Synonym for NOW()
-- LOCALTIMESTAMP, LOCALTIMESTAMP()	Synonym for NOW()
-- MAKEDATE()	Create a date from the year and day of year
-- MAKETIME()	Create time from hour, minute, second
-- MICROSECOND()	Return the microseconds from argument
-- MINUTE()	Return the minute from the argument
-- MONTH()	Return the month from the date passed
-- MONTHNAME()	Return the name of the month
-- NOW()	Return the current date and time
-- PERIOD_ADD()	Add a period to a year-month
-- PERIOD_DIFF()	Return the number of months between periods
-- QUARTER()	Return the quarter from a date argument
-- SEC_TO_TIME()	Converts seconds to 'HH:MM:SS' format
-- SECOND()	Return the second (0-59)
-- STR_TO_DATE()	Convert a string to a date
-- SUBDATE()	Synonym for DATE_SUB() when invoked with three arguments
-- SUBTIME()	Subtract times
-- SYSDATE()	Return the time at which the function executes
-- TIME()	Extract the time portion of the expression passed
-- TIME_FORMAT()	Format as time
-- TIME_TO_SEC()	Return the argument converted to seconds
-- TIMEDIFF()	Subtract time
-- TIMESTAMP()	With a single argument, this function returns the date or datetime expression; with two arguments, the sum of the arguments
-- TIMESTAMPADD()	Add an interval to a datetime expression
-- TIMESTAMPDIFF()	Subtract an interval from a datetime expression
-- TO_DAYS()	Return the date argument converted to days
-- TO_SECONDS()	Return the date or datetime argument converted to seconds since Year 0
-- UNIX_TIMESTAMP()	Return a Unix timestamp
-- UTC_DATE()	Return the current UTC date
-- UTC_TIME()	Return the current UTC time
-- UTC_TIMESTAMP()	Return the current UTC date and time
-- WEEK()	Return the week number
-- WEEKDAY()	Return the weekday index
-- WEEKOFYEAR()	Return the calendar week of the date (1-53)
-- YEAR()	Return the year
-- YEARWEEK()	Return the year and week

END -- Date and Time Functions

BEGIN -- examples

-- The following query selects all rows with a date_col value from within 
-- the last 30 days:
SELECT * FROM tbl_name WHERE DATE_SUB(CURDATE(),INTERVAL 30 DAY)<=data_col;

SELECT DAYOFMONTH('2011-11-00'),MONTH('2005-00-00');

SELECT DATE_ADD('2006-05-00',INTERVAL 1 DAY);
SELECT DAYNAME('2006-05-00');

-- ADDDATE(date,interval expr uint),ADDDATE(date,days);
SELECT DATE_ADD('2008-01-02',INTERVAL 31 DAY);
SELECT ADDDATE('2008-01-02',INTERVAL 31 DAY);
SELECT ADDDATE('2008-01-02',31);

SELECT ADDTIME('2017-12-31 23:59:59.999999','1 1:1:1.000002');

SELECT ADDTIME('01:00:00.999999','02:00:00.999998');

-- convert_tz(dt,from_tz,to_tz);
SELECT CONVERT_TZ('2004-01-01 12:00:00','GMT','MET');
SELECT CONVERT_TZ('2004-01-01 12:00:00','+00:00','+10:00');

SELECT CURDATE();
SELECT CURDATE()+0;

-- CURRENT_DATE, CURRENT_DATE()

-- CURRENT_DATE and CURRENT_DATE() are synonyms for CURDATE().

-- CURRENT_TIME, CURRENT_TIME()

-- CURRENT_TIME and CURRENT_TIME() are synonyms for CURTIME().

-- CURRENT_TIMESTAMP, CURRENT_TIMESTAMP()

-- CURRENT_TIMESTAMP and CURRENT_TIMESTAMP() are synonyms for NOW().
SELECT NOW()

SELECT CURTIME(),CURTIME()+0;

SELECT DATE('2003-12-31 01:02:03');

-- datediff(expr1,expr2)
-- return expr1-expr2 expressed as a value in days from one date to the other.
-- only the date parts of the values are used in the calculation.
SELECT DATEDIFF('2007-12-31 23:59:59','2007-12-30');
SELECT DATEDIFF('2010-11-30 23:59:59','2010-12-31');

-- date_add(date,interval expr unit),date_sub(date,interval expr unit);
-- The following table shows the expected form of the expr argument for each unit value.
-- unit Value	Expected expr Format
-- MICROSECOND	MICROSECONDS
-- SECOND	SECONDS
-- MINUTE	MINUTES
-- HOUR	HOURS
-- DAY	DAYS
-- WEEK	WEEKS
-- MONTH	MONTHS
-- QUARTER	QUARTERS
-- YEAR	YEARS
-- SECOND_MICROSECOND	'SECONDS.MICROSECONDS'
-- MINUTE_MICROSECOND	'MINUTES:SECONDS.MICROSECONDS'
-- MINUTE_SECOND	'MINUTES:SECONDS'
-- HOUR_MICROSECOND	'HOURS:MINUTES:SECONDS.MICROSECONDS'
-- HOUR_SECOND	'HOURS:MINUTES:SECONDS'
-- HOUR_MINUTE	'HOURS:MINUTES'
-- DAY_MICROSECOND	'DAYS HOURS:MINUTES:SECONDS.MICROSECONDS'
-- DAY_SECOND	'DAYS HOURS:MINUTES:SECONDS'
-- DAY_MINUTE	'DAYS HOURS:MINUTES'
-- DAY_HOUR	'DAYS HOURS'
-- YEAR_MONTH	'YEARS-MONTHS'

-- date + INTERVAL expr unit
-- date - INTERVAL expr unit

SELECT '2008-12-31 23:59:59'+INTERVAL 1 SECOND;
SELECT INTERVAL 1 DAY +'2008-12-31'
SELECT '2005-01-01'-INTERVAL 1 SECOND;
SELECT DATE_ADD('2005-01-01',INTERVAL 1 SECOND);
SELECT DATE_ADD('2010-12-31 23:59:59',INTERVAL 1 DAY);
SELECT DATE_ADD('2100-12-31 23:59:59',INTERVAL '1:1' MINUTE_SECOND);
SELECT DATE_SUB('2005-01-01 00:00:00',INTERVAL '1:1' DAY_SECOND);
SELECT DATE_ADD('1900-01-01 00:00:00',INTERVAL '-1 10' DAY_HOUR);
SELECT DATE_SUB('1998-01-02',INTERVAL 31 DAY);
SELECT DATE_ADD('1992-12-31 23:59:59',INTERVAL '1.999999' SECOND_MICROSECOND);

-- Because expr is treated as a string, be careful if you specify a nonstring value with INTERVAL. 
-- For example, with an interval specifier of HOUR_MINUTE, 6/4 evaluates to 1.5000 
-- and is treated as 1 hour, 5000 minutes:
SELECT 6/4;
SELECT DATE_ADD('2009-01-01',INTERVAL 6/4 HOUR_MINUTE);
SELECT CAST(6/4 AS DECIMAL(3,1));
SELECT DATE_ADD('2009-01-01',INTERVAL CAST(6/4 AS DECIMAL(3,1)) HOUR_MINUTE);

SELECT DATE_ADD('2013-01-01',INTERVAL 1 DAY);
SELECT DATE_ADD('2013-01-01',INTERVAL 1 HOUR);

SELECT DATE_ADD('2009-01-30',INTERVAL 1 MONTH);

SELECT DATE_ADD('2006-07-00',INTERVAL 1 DAY);
SELECT '2005-03-32'+INTERVAL 1 MONTH;

SELECT DAYNAME('2018-11-22');

SELECT DAYOFMONTH('2018-11-22');

SELECT DAYOFWEEK(NOW());

SELECT DAYOFYEAR(NOW());

-- extract(uint from date);
SELECT EXTRACT(YEAR FROM NOW());
SELECT EXTRACT(YEAR_MONTH FROM NOW());
SELECT EXTRACT(DAY_MINUTE FROM NOW());

SELECT FROM_DAYS(2000000);

-- from_unixtime(unix_timestamp),from_unixtime(unix_timestamp,format);
SELECT FROM_UNIXTIME(1447430881);
SELECT FROM_UNIXTIME(1447430881)+0;
SELECT FROM_UNIXTIME(UNIX_TIMESTAMP(),'%Y %D %M %h:%i:%s %x');

SELECT HOUR('10:05:03');
SELECT HOUR('272:59:59');

SELECT LAST_DAY('2003-02-05');
SELECT LAST_DAY('2004-02-05');
SELECT LAST_DAY('2004-01-01 01:01:01');
SELECT LAST_DAY('2003-03-32');

SELECT MAKEDATE(2011,31),MAKEDATE(2011,32);
SELECT MAKEDATE(2011,365),MAKEDATE(2014,365);
SELECT MAKEDATE(2011,0);

SELECT MAKETIME(12,15,30);

SELECT MICROSECOND('12:00:00.123456');
SELECT MICROSECOND('2009-12-31 23:59:59.000010');

SELECT MINUTE('2008-02-03 10:05:03');

SELECT MONTH('2008-02-03');

SELECT MONTHNAME('2008-02-03');

SELECT NOW();
SELECT NOW()+0;

SELECT NOW(),SLEEP(2),NOW();

SELECT SYSDATE(),SLEEP(2),SYSDATE();

SELECT PERIOD_ADD(200801,2);

SELECT PERIOD_DIFF(200802,200703);

SELECT QUARTER(NOW());

SELECT SECOND(2378);

SELECT SEC_TO_TIME(2378);
SELECT SEC_TO_TIME(2378)+0;

-- STR_TO_DATE(STR,FORMAT)
-- This is the inverse of the DATE_FORMAT() function.
SELECT STR_TO_DATE('01,05,2013','%d,%m,%Y');
SELECT STR_TO_DATE('May 1,2013','%M %d,%Y');

SELECT STR_TO_DATE('a09:30:17','a%h:%i:%s');
SELECT STR_TO_DATE('a09:30:17','%h:%i:%s');
SELECT STR_TO_DATE('09:30:17a','%h:%i:%s');

SELECT STR_TO_DATE('abc','abc');
SELECT STR_TO_DATE('9','%m');
SELECT STR_TO_DATE('9','%s');

SET sql_mode='';
SELECT STR_TO_DATE('15:35:00','%H:%i:%s');

SET sql_mode='no_zero_in_date';
SELECT STR_TO_DATE('15:35:00','%h:%i:%s');
SHOW WARNINGS;

-- SUBDATE is synonym of DATE_SUB() function.
SELECT DATE_SUB('2008-01-02',INTERVAL 31 DAY);
SELECT SUBDATE('2008-01-02',INTERVAL 31 DAY);

SELECT TIME(NOW());
SELECT TIME('2008-01-01 01:02:03.123456');

SELECT TIMEDIFF('2000:01:01 00:00:00','2000:01:01 00:00:00.000001');
SELECT TIMEDIFF('2008-12-31 23:59:59.000001','2008-12-30 01:01:01.000001');

-- TIMESTAMPADD(unit,interval,datetime_expr)
SELECT TIMESTAMPADD(MINUTE,1,'2003-01-02');
SELECT TIMESTAMPADD(WEEK,1,'2003-01-02');

-- TIMESTAMPDIFF(unit,datetime_expr1,datetime_expr2)
-- Returns datetime_expr2 − datetime_expr1, where datetime_expr1 and datetime_expr2 are date or datetime expressions
SELECT TIMESTAMPDIFF(MONTH,'2003-02-01','2003-05-01');
SELECT TIMESTAMPDIFF(YEAR,'2002-05-01','2001-01-01');
SELECT TIMESTAMPDIFF(MINUTE,'2003-02-01','2003-05-01 12:05:55');

SELECT TIME_TO_SEC('22:23:00');
SELECT TIME_TO_SEC('00:39:38');

SELECT TO_DAYS(950501);
SELECT TO_DAYS('2007-10-07');

SELECT UNIX_TIMESTAMP();

END -- examples

END -- 12.7 Date and Time Functions

BEGIN -- 12.8 What Calendar Is Used By MySQL? ok

-- MySQL uses what is known as a proleptic Gregorian calendar.

END -- 12.8 What Calendar Is Used By MySQL?

BEGIN -- 12.9 Full-Text Search Functions ok

-- MySQL has support for full-text indexing and searching:

-- A full-text index in MySQL is an index of type FULLTEXT.

-- Full-text indexes can be used only with MyISAM tables. 
-- (In MySQL 5.6 and up, they can also be used with InnoDB 
-- tables.) Full-text indexes can be created only for 
-- CHAR, VARCHAR, or TEXT columns.

-- A FULLTEXT index definition can be given in the 
-- CREATE TABLE statement when a table is created, 
-- or added later using ALTER TABLE or CREATE INDEX.

-- For large data sets, it is much faster to load your 
-- data into a table that has no FULLTEXT index and 
-- then create the index after that, than to load data 
-- into a table that has an existing FULLTEXT index.


BEGIN -- 12.9.1 Natural Language Full-Text Searches ok

CREATE TABLE articles(
	id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
	title VARCHAR(200),
	body TEXT,
	FULLTEXT(title,body)
)ENGINE=INNODB;

INSERT INTO articles (title,body) VALUES
        ('MySQL Tutorial','DBMS stands for DataBase ...'),
        ('How To Use MySQL Well','After you went through a ...'),
        ('Optimizing MySQL','In this tutorial we will show ...'),
        ('1001 MySQL Tricks','1. Never run mysqld as root. 2. ...'),
        ('MySQL vs. YourSQL','In the following database comparison ...'),
        ('MySQL Security','When configured properly, MySQL ...');
        
SELECT * FROM articles WHERE MATCH(title,body) 
AGAINST('database' IN NATURAL LANGUAGE MODE);

SELECT COUNT(*) FROM articles WHERE 
MATCH(title,body)
AGAINST('database' IN NATURAL LANGUAGE MODE);

SELECT COUNT(
IF(
MATCH(title,body) AGAINST ('database' IN NATURAL LANGUAGE MODE)
,1
,NULL)
)
FROM articles;

-- The first query sorts the results by relevance whereas the second does not. However, 
-- the second query performs a full table scan and the first does not. 
-- The first may be faster if the search matches few rows; otherwise, 
-- the second may be faster because it would read many rows anyway.

SELECT id,MATCH(title,body)
AGAINST('Tutorial' IN NATURAL LANGUAGE MODE) AS score
FROM articles;


SELECT id, body, MATCH (title,body) AGAINST
('Security implications of running MySQL as root'
IN NATURAL LANGUAGE MODE) AS score
FROM articles WHERE MATCH (title,body) AGAINST
('Security implications of running MySQL as root'
IN NATURAL LANGUAGE MODE);

END -- 12.9.1 Natural Language Full-Text Searches

BEGIN -- 12.9.2 Boolean Full-Text Searches ok
SELECT * FROM articles WHERE MATCH(title,body)
AGAINST ('+MySql -YourSQL' IN BOOLEAN MODE);

-- In implementing this feature, MySQL uses what is sometimes referred 
-- to as implied Boolean logic, in which
--  + stands for AND
--  - stands for NOT
--  [no operator] implies OR

-- The following examples demonstrate some search strings that use boolean full-text operators:
-- 'apple banana'
-- Find rows that contain at least one of the two words.
-- '+apple +juice'
-- Find rows that contain both words.
-- '+apple macintosh'
-- Find rows that contain the word “apple”, but rank rows higher if they also contain “macintosh”.
-- '+apple -macintosh'
-- Find rows that contain the word “apple” but not “macintosh”.
-- '+apple ~macintosh'
-- Find rows that contain the word “apple”, but if the row also contains the word “macintosh”, rate it lower than if row does not. This is “softer” than a search for '+apple -macintosh', for which the presence of “macintosh” causes the row not to be returned at all.
-- '+apple +(>turnover <strudel)'
-- Find rows that contain the words “apple” and “turnover”, or “apple” and “strudel” (in any order), but rank “apple turnover” higher than “apple strudel”.
-- 'apple*'
-- Find rows that contain words such as “apple”, “apples”, “applesauce”, or “applet”.
-- '"some words"'
-- Find rows that contain the exact phrase “some words” (for example, rows that contain “some words of wisdom” but not “some noise words”). Note that the " characters that enclose the phrase are operator characters that delimit the phrase. They are not the quotation marks that enclose the search string itself.


-- select substr(@@session.sql_mode,locate(',',@@session.sql_mode)+1)

-- IF(expr,if_true_expr,if_false_expr)

END  -- 12.9.2 Boolean Full-Text Searches
 
BEGIN -- 12.9.3 Full-Text Searches with Query Expansion ok

SELECT * FROM articles 
WHERE MATCH(title,body)
AGAINST ('database' IN NATURAL LANGUAGE MODE);

SELECT * FROM articles
WHERE MATCH(title,body)
AGAINST('database' WITH QUERY EXPANSION);

END -- 12.9.3 Full-Text Searches with Query Expansion

BEGIN -- 12.9.4 Full-Text Stopwords ok
END

BEGIN -- 12.9.5 Full-Text Restrictions ok

-- Full-text searches are supported for MyISAM tables only. 
-- (In MySQL 5.6 and up, they can also be used with InnoDB tables.)

-- Full-text searches are not supported for partitioned tables.  

-- Full-text searches can be used with most multibyte character sets. 
-- The exception is that for Unicode, the utf8 character set can be used, 
-- but not the ucs2 character set. However, although FULLTEXT indexes 
-- on ucs2 columns cannot be used, you can perform IN BOOLEAN MODE searches
--  on a ucs2 column that has no such index.

-- The remarks for utf8 also apply to utf8mb4, and the remarks for ucs2 
-- also apply to utf16 and utf32.

-- Ideographic languages such as Chinese and Japanese do not have word delimiters. 
-- Therefore, the FULLTEXT parser cannot determine where words begin and end in 
-- these and other such languages.

-- Although the use of multiple character sets within a single table is supported, 
-- all columns in a FULLTEXT index must use the same character set and collation.

-- The MATCH() column list must match exactly the column list in some FULLTEXT index 
-- definition for the table, unless this MATCH() is IN BOOLEAN MODE. 
-- Boolean-mode searches can be done on nonindexed columns, although they are likely to be slow.

-- The argument to AGAINST() must be a string value that is constant during query evaluation. T
-- his rules out, for example, a table column because that can differ for each row.

-- Index hints are more limited for FULLTEXT searches than for non-FULLTEXT searches.

-- The '%' character is not a supported wildcard character for full-text searches.


END

BEGIN -- 12.9.6 Fine-Tuning MySQL Full-Text Search ok

-- If you modify full-text variables that affect indexing 
-- (ft_min_word_len, ft_max_word_len, or ft_stopword_file), 
-- or if you change the stopword file itself, you must rebuild your FULLTEXT indexes 
-- after making the changes and restarting the server. To rebuild the indexes in this case, 
-- it is sufficient to do a QUICK repair operation:
REPAIR TABLE tbl_name QUICK;

myisamchk --recover --ft_min_word_len=3 tbl_name.MYI

END

BEGIN -- 12.9.7 Adding a Collation for Full-Text Indexing ok
END

END -- 12.9 Full-Text Search Functions

BEGIN -- 12.10 Cast Functions and Operators ok

-- Name	        	Description
-- BINARY	Cast a string to a binary string
-- CAST()	Cast a value as a certain type
-- CONVERT()	Cast a value as a certain type

-- CONVERT(expr using transcoding_name)

SELECT CONVERT(_latin1'Müller' USING utf8);
INSERT INTO utf8_table(utf8_column) 
	SELECT CONVERT(latin1_column USING utf8) FROM latin1_table;

-- CONVERT(string, CHAR[(N)] CHARACTER SET charset_name)
-- CAST(string AS CHAR[(N)] CHARACTER SET charset_name)	 

SELECT CONVERT('test',CHAR CHARACTER SET utf8);
SELECT CAST('test' AS CHAR CHARACTER SET utf8);

-- this is legal
SELECT CAST('test' AS CHAR CHARACTER SET utf8) COLLATE utf8_bin;

-- this is illegal
SELECT CAST('test' AS CHAR CHARACTER SET utf8 COLLATE utf8_bin);

SELECT 'A' LIKE CONVERT(blob_col USING latin1) FROM tbl_name;

SELECT 'A' LIKE CONVERT(blob_col USING latin1) COLLATE latin1_germanl_ci FROM tbl_name;

SET @s1=_latin1'abc',@s2=_latin2'abc';
SELECT @s1=@s2;

SELECT @s1=CONVERT(@s2 USING latin1);

-- Character set conversion is also useful preceding lettercase conversion of binary strings. 
-- LOWER() and UPPER() are ineffective when applied directly to binary strings 
-- because the concept of lettercase does not apply. To perform lettercase conversion of
-- a binary string, first convert it to a nonbinary string:
SET @str=BINARY 'Now York';
SELECT LOWER(@str),LOWER(CONVERT(@str USING latin1));

CREATE TABLE new_table SELECT CAST('2011-01-01' AS DATE) AS c1;
SHOW CREATE TABLE new_table;

SELECT enum_col FROM tbl_name ORDER BY CAST(enum_col AS CHAR);

SELECT 1+'1';
SELECT X'41',X'41'+0;
SELECT b'1100001',b'1100001'+0;

SELECT CONCAT('hello you ',2);

SELECT CAST(TIMESTAMP '2014-09-08 18:07:54' AS SIGNED);

SHOW WARNINGS;

USE test;

CREATE TABLE c_test(col TIMESTAMP);

INSERT INTO c_test VALUES('2014-09-08 18:07:54');

SELECT col,CAST(col AS SIGNED) AS c_col FROM c_test;

SELECT 1-2;
SELECT CAST(1-2 AS UNSIGNED);
SELECT CAST(CAST(1-2 AS UNSIGNED) AS SIGNED);

SELECT CAST(1 AS UNSIGNED)-2.0

SELECT 'a'='A';
SELECT BINARY 'a'='A';
SELECT 'a'='a ';
SELECT BINARY 'a'='a  ';

SELECT 'a'='A';
SELECT _binary 'a'='A';

SELECT CONVERT('abc' USING utf8);

END -- 12.10 Cast Functions and Operators

BEGIN -- 12.11 XML Functions 



END -- 12.11 XML Functions

BEGIN -- 12.12 Bit Functions and Operators ok

-- Name	Description
-- BIT_COUNT()	Return the number of bits that are set
-- &	Bitwise AND
-- ~	Bitwise inversion
-- |	Bitwise OR
-- ^	Bitwise XOR
-- <<	Left shift
-- >>	Right shift

SELECT 29|15;
SELECT 29&15;
SELECT 1^1;
SELECT 1^0;
SELECT 11^3;

SELECT 1<<2;
SELECT 4>>2;

SELECT 5 & ~1;

SELECT BIT_COUNT(29),BIT_COUNT(b'101010');

END -- 12.12 Bit Functions and Operators

BEGIN -- 12.13 Encryption and Compression Functions 



END -- 12.13 Encryption and Compression Functions

BEGIN -- 12.14 Information Functions 
END -- 12.14 Information Functions

BEGIN -- 12.15 Spatial Analysis Functions 

BEGIN -- 12.15.1 Spatial Function Reference 

END -- 12.15.1 Spatial Function Reference

BEGIN -- 12.15.2 Argument Handling by Spatial Functions 

END -- 12.15.2 Argument Handling by Spatial Functions

BEGIN -- 12.15.3 Functions That Create Geometry Values from WKT Values 

END -- 12.15.3 Functions That Create Geometry Values from WKT Values

BEGIN -- 12.15.4 Functions That Create Geometry Values from WKB Values 

END -- 12.15.4 Functions That Create Geometry Values from WKB Values

BEGIN -- 12.15.5 MySQL-Specific Functions That Create Geometry Values 

END -- 12.15.5 MySQL-Specific Functions That Create Geometry Values

BEGIN -- 12.15.6 Geometry Format Conversion Functions 

END -- 12.15.6 Geometry Format Conversion Functions

BEGIN -- 12.15.7 Geometry Property Functions 

END -- 12.15.7 Geometry Property Functions

BEGIN -- 12.15.8 Spatial Operator Functions 

END -- 12.15.8 Spatial Operator Functions

BEGIN -- 12.15.9 Functions That Test Spatial Relations Between Geometry Objects 
END -- 12.15.9 Functions That Test Spatial Relations Between Geometry Objects

END -- 12.15 Spatial Analysis Functions

BEGIN -- 12.16 Aggregate (GROUP BY) Functions ok

BEGIN -- 12.16.1 Aggregate (GROUP BY) Function Descriptions ok

-- Name		       Description
-- AVG()	Return the average value of the argument
-- BIT_AND()	Return bitwise AND
-- BIT_OR()	Return bitwise OR
-- BIT_XOR()	Return bitwise XOR
-- COUNT()	Return a count of the number of rows returned
-- COUNT(DISTINCT)	Return the count of a number of different values
-- GROUP_CONCAT()	Return a concatenated string
-- MAX()	Return the maximum value
-- MIN()	Return the minimum value
-- STD()	Return the population standard deviation
-- STDDEV()	Return the population standard deviation
-- STDDEV_POP()	Return the population standard deviation
-- STDDEV_SAMP()	Return the sample standard deviation
-- SUM()	Return the sum
-- VAR_POP()	Return the population standard variance
-- VAR_SAMP()	Return the sample variance
-- VARIANCE()	Return the population standard variance

SELECT SEC_TO_TIME(SUM(TIME_TO_SEC(time_col))) FROM tbl_name;
SELECT FROM_DAYS(SUM(TO_DAYS(date_col))) FROM tbl_name;

SELECT student_name,AVG(test_score) FROM student GROUP BY student_name;

SELECT COUNT(DISTINCT results) FROM student;

-- GROUP_CONCAT([DISTINCT] expr [,expr ...]
--              [ORDER BY {unsigned_integer | col_name | expr}
--                  [ASC | DESC] [,col_name ...]]
--              [SEPARATOR str_val])

SELECT student_name,GROUP_CONCAT(test_score) FROM student GROUP BY student_name;

SELECT student_name,
GROUP_CONCAT(DISTINCT test_score ORDER BY test_score DESC SEPARATOR 'v ')
FROM student GROUP BY student_name;

-- group_concat_max_len default is 1024
SET [GLOBAL | SESSION] group_concat_max_len=val;

SELECT student_name,MIN(test_score),MAX(test_score) FROM tudent GROUP BY student_name;



END -- 12.16.1 Aggregate (GROUP BY) Function Descriptions

BEGIN -- 12.16.2 GROUP BY Modifiers ok

CREATE TABLE sales
(
	YEAR INT,
	country VARCHAR(20),
	product VARCHAR(20),
	profit INT
);
SELECT YEAR,SUM(profit) AS profit FROM sales GROUP BY YEAR;

SELECT YEAR,SUM(profit) AS profit FROM sales GROUP BY YEAR WITH ROLLUP;

SELECT YEAR,country,product,SUM(profit) AS profit
FROM sales
GROUP BY YEAR,country,product;

SELECT YEAR,country,product,SUM(profit) AS profit
FROM sales
GROUP BY YEAR,country,product WITH ROLLUP;

SELECT * FROM 
(SELECT YEAR,SUM(profit) AS profit FROM sales GROUP BY YEAR WITH ROLLUP) AS dt
ORDER BY YEAR DESC;

SELECT YEAR,country,product,SUM(profit) AS profit
FROM sales
GROUP BY YEAR,country,product WITH ROLLUP
LIMIT 5;

SELECT YEAR,country,SUM(profit) AS profit
FROM sales
GROUP BY YEAR WITH ROLLUP; -- only_full_group_by sql_mode is not enabled.

END -- 12.16.2 GROUP BY Modifiers

BEGIN -- 12.16.3 MySQL Handling of GROUP BY ok

SELECT NAME,COUNT(NAME) 
FROM orders 
GROUP BY NAME HAVING COUNT(NAME)=1; -- only_full_group_by is enable.

SELECT NAME,COUNT(NAME) AS c FROM orders
GROUP BY NAME
HAVING c=1; -- only_full_group_by is disabled.

SELECT id,FLOOR(VALUE/100) AS val
FROM tab_name
GROUP BY id,val;

SELECT id,FLOOR(VALUE/100) AS val
FROM tbl_name
GROUP BY id,FLOOR(VALUE/100);

END -- 12.16.3 MySQL Handling of GROUP BY

END -- 12.16 Aggregate (GROUP BY) Functions

BEGIN -- 12.17 Miscellaneous Functions 

END -- 12.17 Miscellaneous Functions

BEGIN #JSON 

SELECT JSON_ARRAY(1,'abc',NULL,TRUE,CURTIME());

SELECT JSON_OBJECT('id',87,'name','carrot');

SELECT JSON_QUOTE('null'),JSON_QUOTE('"null"');

SELECT JSON_QUOTE('[1,2,3]');

SET @j='{"a":1,"b":2,"c":{"d":4}}';
SET @j2='1';
SELECT JSON_CONTAINS(@j,@j2,'$.a');
SELECT JSON_CONTAINS(@j,@j2,'$.b');

SET @j2='{"d":4}';

SELECT JSON_CONTAINS(@j,@j2,'$.a');

SELECT JSON_CONTAINS(@j,@j2,'$.c');

SET @j = '{"a": 1, "b": 2, "c": {"d": 4}}';
SELECT JSON_CONTAINS_PATH(@j,'one','$.a','$e');

SELECT JSON_CONTAINS_PATH(@j,'all','$.a','$.e');

SELECT JSON_CONTAINS_PATH(@j,'one','$.c.d');

SELECT JSON_CONTAINS_PATH(@j,'one','$.a.d');

SELECT JSON_EXTRACT('[10, 20, [30, 40]]','$[1]');

SELECT JSON_EXTRACT('[10, 20, [30, 40]]','$[1]','$[0]');

SELECT JSON_EXTRACT('[10, 20, [30, 40]]','$[2][0]');

CREATE TABLE tj10(a JSON,b INT);

 INSERT INTO tj10
    VALUES ("[3,10,5,17,44]", 33), ("[3,10,5,17,[22,44,66]]", 0);
    
 SELECT a->"$[4]" FROM tj10;
 
 SELECT * FROM tj10 WHERE a->"$[0]"=3;
 
 SELECT * FROM tj10 WHERE a->'$[4][1]' IS NOT NULL;
 
 SELECT a->'$[4][1]' FROM tj10;
 
 SELECT JSON_EXTRACT(a,'$[4][1]') FROM tj10;
 
 

END 

BEGIN -- 12.18 Precision Math 

BEGIN -- 12.18.1 Types of Numeric Values 
END -- 12.18.1 Types of Numeric Values
BEGIN -- 12.18.2 DECIMAL Data Type Characteristics 
END -- 12.18.2 DECIMAL Data Type Characteristics
BEGIN -- 12.18.3 Expression Handling 
END -- 12.18.3 Expression Handling
BEGIN -- 12.18.4 Rounding Behavior 
END -- 12.18.4 Rounding Behavior
BEGIN -- 12.18.5 Precision Math Examples 
END -- 12.18.5 Precision Math Examples

END -- 12.18 Precision Math



END -- 12chp
