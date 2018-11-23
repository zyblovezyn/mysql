-------------------- mysql document -------------------- 
BEGIN -- 1

END -- 1 

BEGIN -- 2

END -- 2 

BEGIN -- 3

END -- 3 

BEGIN -- 4

END -- 4 

BEGIN -- 5

END -- 5 

BEGIN -- 6

END -- 6 

BEGIN -- 7

END -- 7 

BEGIN -- 8

END -- 8 

BEGIN -- 9

END -- 9

BEGIN -- 10

END -- 10 

BEGIN -- 11

END -- 11 

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

BEGIN -- 12.5 String Functions

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

BEGIN -- 12.6 Numeric Functions and Operators

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

BEGIN -- 12.7 Date and Time Functions

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

BEGIN -- 12.8 What Calendar Is Used By MySQL?

-- MySQL uses what is known as a proleptic Gregorian calendar.

END -- 12.8 What Calendar Is Used By MySQL?

BEGIN -- 12.9 Full-Text Search Functions

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

BEGIN -- 12.9.6 Fine-Tuning MySQL Full-Text Search

END

BEGIN -- 12.9.7 Adding a Collation for Full-Text Indexing
END

END -- 12.9 Full-Text Search Functions

BEGIN -- 12.10 Cast Functions and Operators 
END -- 12.10 Cast Functions and Operators

BEGIN -- 12.11 XML Functions 
END -- 12.11 XML Functions

BEGIN -- 12.12 Bit Functions and Operators 
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

BEGIN -- 12.16 Aggregate (GROUP BY) Functions 

BEGIN -- 12.16.1 Aggregate (GROUP BY) Function Descriptions 
END -- 12.16.1 Aggregate (GROUP BY) Function Descriptions
BEGIN -- 12.16.2 GROUP BY Modifiers 
END -- 12.16.2 GROUP BY Modifiers
BEGIN -- 12.16.3 MySQL Handling of GROUP BY 

END -- 12.16.3 MySQL Handling of GROUP BY

END -- 12.16 Aggregate (GROUP BY) Functions

BEGIN -- 12.17 Miscellaneous Functions 

END -- 12.17 Miscellaneous Functions

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

BEGIN 

END -- 12chp

BEGIN -- 13 SQL Statement Syntax

BEGIN -- 13.1.13 CREATE INDEX Syntax
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
END

BEGIN -- 13.1.14 CREATE LOGFILE GROUP Syntax
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
END

BEGIN -- 13.1.15 CREATE PROCEDURE and CREATE FUNCTION Syntax
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
  
END  
  
BEGIN  -- 13.1.17 CREATE TABLE Syntax
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
-- Hashes one or more columns to create a key for placing and locating rows.

END

END -- 13 SQL Statement Syntax end


BEGIN -- 13 SQL Statement Syntax 
END -- 13 SQL Statement Syntax
BEGIN -- 13.1 Data Definition Statements 
END -- 13.1 Data Definition Statements
BEGIN -- 13.1.1 ALTER DATABASE Syntax 
END -- 13.1.1 ALTER DATABASE Syntax
BEGIN -- 13.1.2 ALTER EVENT Syntax end -- 13.1.2 ALTER EVENT Syntax
BEGIN -- 13.1.3 ALTER FUNCTION Syntax end -- 13.1.3 ALTER FUNCTION Syntax
BEGIN -- 13.1.4 ALTER LOGFILE GROUP Syntax end -- 13.1.4 ALTER LOGFILE GROUP Syntax
BEGIN -- 13.1.5 ALTER PROCEDURE Syntax end -- 13.1.5 ALTER PROCEDURE Syntax
BEGIN -- 13.1.6 ALTER SERVER Syntax end -- 13.1.6 ALTER SERVER Syntax
BEGIN -- 13.1.7 ALTER TABLE Syntax end -- 13.1.7 ALTER TABLE Syntax
BEGIN -- 13.1.8 ALTER TABLESPACE Syntax end -- 13.1.8 ALTER TABLESPACE Syntax
BEGIN -- 13.1.9 ALTER VIEW Syntax end -- 13.1.9 ALTER VIEW Syntax
BEGIN -- 13.1.10 CREATE DATABASE Syntax end -- 13.1.10 CREATE DATABASE Syntax
BEGIN -- 13.1.11 CREATE EVENT Syntax end -- 13.1.11 CREATE EVENT Syntax
BEGIN -- 13.1.12 CREATE FUNCTION Syntax end -- 13.1.12 CREATE FUNCTION Syntax
BEGIN -- 13.1.13 CREATE INDEX Syntax end -- 13.1.13 CREATE INDEX Syntax
BEGIN -- 13.1.14 CREATE LOGFILE GROUP Syntax end -- 13.1.14 CREATE LOGFILE GROUP Syntax
BEGIN -- 13.1.15 CREATE PROCEDURE and CREATE FUNCTION Syntax end -- 13.1.15 CREATE PROCEDURE and CREATE FUNCTION Syntax
BEGIN -- 13.1.16 CREATE SERVER Syntax end -- 13.1.16 CREATE SERVER Syntax
BEGIN -- 13.1.17 CREATE TABLE Syntax end -- 13.1.17 CREATE TABLE Syntax
BEGIN -- 13.1.18 CREATE TABLESPACE Syntax end -- 13.1.18 CREATE TABLESPACE Syntax
BEGIN -- 13.1.19 CREATE TRIGGER Syntax end -- 13.1.19 CREATE TRIGGER Syntax
BEGIN -- 13.1.20 CREATE VIEW Syntax end -- 13.1.20 CREATE VIEW Syntax
BEGIN -- 13.1.21 DROP DATABASE Syntax end -- 13.1.21 DROP DATABASE Syntax
BEGIN -- 13.1.22 DROP EVENT Syntax end -- 13.1.22 DROP EVENT Syntax
BEGIN -- 13.1.23 DROP FUNCTION Syntax end -- 13.1.23 DROP FUNCTION Syntax
BEGIN -- 13.1.24 DROP INDEX Syntax end -- 13.1.24 DROP INDEX Syntax
BEGIN -- 13.1.25 DROP LOGFILE GROUP Syntax end -- 13.1.25 DROP LOGFILE GROUP Syntax
BEGIN -- 13.1.26 DROP PROCEDURE and DROP FUNCTION Syntax end -- 13.1.26 DROP PROCEDURE and DROP FUNCTION Syntax
BEGIN -- 13.1.27 DROP SERVER Syntax end -- 13.1.27 DROP SERVER Syntax
BEGIN -- 13.1.28 DROP TABLE Syntax end -- 13.1.28 DROP TABLE Syntax
BEGIN -- 13.1.29 DROP TABLESPACE Syntax end -- 13.1.29 DROP TABLESPACE Syntax
BEGIN -- 13.1.30 DROP TRIGGER Syntax end -- 13.1.30 DROP TRIGGER Syntax
BEGIN -- 13.1.31 DROP VIEW Syntax end -- 13.1.31 DROP VIEW Syntax
BEGIN -- 13.1.32 RENAME TABLE Syntax end -- 13.1.32 RENAME TABLE Syntax
BEGIN -- 13.1.33 TRUNCATE TABLE Syntax end -- 13.1.33 TRUNCATE TABLE Syntax
BEGIN -- 13.2 Data Manipulation Statements end -- 13.2 Data Manipulation Statements
BEGIN -- 13.2.1 CALL Syntax end -- 13.2.1 CALL Syntax
BEGIN -- 13.2.2 DELETE Syntax end -- 13.2.2 DELETE Syntax
BEGIN -- 13.2.3 DO Syntax end -- 13.2.3 DO Syntax
BEGIN -- 13.2.4 HANDLER Syntax end -- 13.2.4 HANDLER Syntax
BEGIN -- 13.2.5 INSERT Syntax end -- 13.2.5 INSERT Syntax
BEGIN -- 13.2.6 LOAD DATA INFILE Syntax end -- 13.2.6 LOAD DATA INFILE Syntax
BEGIN -- 13.2.7 LOAD XML Syntax end -- 13.2.7 LOAD XML Syntax
BEGIN -- 13.2.8 REPLACE Syntax end -- 13.2.8 REPLACE Syntax
BEGIN -- 13.2.9 SELECT Syntax end -- 13.2.9 SELECT Syntax
BEGIN -- 13.2.10 Subquery Syntax end -- 13.2.10 Subquery Syntax
BEGIN -- 13.2.11 UPDATE Syntax end -- 13.2.11 UPDATE Syntax
BEGIN -- 13.3 Transactional and Locking Statements end -- 13.3 Transactional and Locking Statements
BEGIN -- 13.3.1 START TRANSACTION, COMMIT, and ROLLBACK Syntax end -- 13.3.1 START TRANSACTION, COMMIT, and ROLLBACK Syntax
BEGIN -- 13.3.2 Statements That Cannot Be Rolled Back end -- 13.3.2 Statements That Cannot Be Rolled Back
BEGIN -- 13.3.3 Statements That Cause an Implicit Commit end -- 13.3.3 Statements That Cause an Implicit Commit
BEGIN -- 13.3.4 SAVEPOINT, ROLLBACK TO SAVEPOINT, and RELEASE SAVEPOINT Syntax end -- 13.3.4 SAVEPOINT, ROLLBACK TO SAVEPOINT, and RELEASE SAVEPOINT Syntax
BEGIN -- 13.3.5 LOCK TABLES and UNLOCK TABLES Syntax end -- 13.3.5 LOCK TABLES and UNLOCK TABLES Syntax
BEGIN -- 13.3.6 SET TRANSACTION Syntax end -- 13.3.6 SET TRANSACTION Syntax
BEGIN -- 13.3.7 XA Transactions end -- 13.3.7 XA Transactions
BEGIN -- 13.4 Replication Statements end -- 13.4 Replication Statements
BEGIN -- 13.4.1 SQL Statements for Controlling Master Servers end -- 13.4.1 SQL Statements for Controlling Master Servers
BEGIN -- 13.4.2 SQL Statements for Controlling Slave Servers end -- 13.4.2 SQL Statements for Controlling Slave Servers
BEGIN -- 13.5 Prepared SQL Statement Syntax end -- 13.5 Prepared SQL Statement Syntax
BEGIN -- 13.5.1 PREPARE Syntax end -- 13.5.1 PREPARE Syntax
BEGIN -- 13.5.2 EXECUTE Syntax end -- 13.5.2 EXECUTE Syntax
BEGIN -- 13.5.3 DEALLOCATE PREPARE Syntax end -- 13.5.3 DEALLOCATE PREPARE Syntax
BEGIN -- 13.5.4 Automatic Prepared Statement Repreparation end -- 13.5.4 Automatic Prepared Statement Repreparation
BEGIN -- 13.6 Compound-Statement Syntax end -- 13.6 Compound-Statement Syntax
BEGIN -- 13.6.1 BEGIN ... END Compound-Statement Syntax end -- 13.6.1 BEGIN ... END Compound-Statement Syntax
BEGIN -- 13.6.2 Statement Label Syntax end -- 13.6.2 Statement Label Syntax
BEGIN -- 13.6.3 DECLARE Syntax end -- 13.6.3 DECLARE Syntax
BEGIN -- 13.6.4 Variables in Stored Programs end -- 13.6.4 Variables in Stored Programs
BEGIN -- 13.6.5 Flow Control Statements end -- 13.6.5 Flow Control Statements
BEGIN -- 13.6.6 Cursors end -- 13.6.6 Cursors
BEGIN -- 13.6.7 Condition Handling end -- 13.6.7 Condition Handling
BEGIN -- 13.7 Database Administration Statements end -- 13.7 Database Administration Statements
BEGIN -- 13.7.1 Account Management Statements end -- 13.7.1 Account Management Statements
BEGIN -- 13.7.2 Table Maintenance Statements end -- 13.7.2 Table Maintenance Statements
BEGIN -- 13.7.3 Plugin and User-Defined Function Statements end -- 13.7.3 Plugin and User-Defined Function Statements
BEGIN -- 13.7.4 SET Syntax end -- 13.7.4 SET Syntax
BEGIN -- 13.7.5 SHOW Syntax end -- 13.7.5 SHOW Syntax
BEGIN -- 13.7.6 Other Administrative Statements end -- 13.7.6 Other Administrative Statements
BEGIN -- 13.8 Utility Statements end -- 13.8 Utility Statements
BEGIN -- 13.8.1 DESCRIBE Syntax end -- 13.8.1 DESCRIBE Syntax
BEGIN -- 13.8.2 EXPLAIN Syntax end -- 13.8.2 EXPLAIN Syntax
BEGIN -- 13.8.3 HELP Syntax end -- 13.8.3 HELP Syntax
BEGIN -- 13.8.4 USE Syntax end -- 13.8.4 USE Syntax
BEGIN -- 14 The InnoDB Storage Engine end -- 14 The InnoDB Storage Engine
BEGIN -- 14.1 Introduction to InnoDB end -- 14.1 Introduction to InnoDB
BEGIN -- 14.1.1 Benefits of Using InnoDB Tables end -- 14.1.1 Benefits of Using InnoDB Tables
BEGIN -- 14.1.2 Best Practices for InnoDB Tables end -- 14.1.2 Best Practices for InnoDB Tables
BEGIN -- 14.1.3 Checking InnoDB Availability end -- 14.1.3 Checking InnoDB Availability
BEGIN -- 14.1.4 Upward and Downward Compatibility end -- 14.1.4 Upward and Downward Compatibility
BEGIN -- 14.1.5 Testing and Benchmarking with InnoDB end -- 14.1.5 Testing and Benchmarking with InnoDB
BEGIN -- 14.1.6 Turning Off InnoDB end -- 14.1.6 Turning Off InnoDB
BEGIN -- 14.1.7 Third-Party Software Contributions end -- 14.1.7 Third-Party Software Contributions
BEGIN -- 14.2 Installing the InnoDB Storage Engine end -- 14.2 Installing the InnoDB Storage Engine
BEGIN -- 14.3 Upgrading the InnoDB Storage Engine end -- 14.3 Upgrading the InnoDB Storage Engine
BEGIN -- 14.4 Downgrading the InnoDB Storage Engine end -- 14.4 Downgrading the InnoDB Storage Engine
BEGIN -- 14.5 InnoDB and the ACID Model end -- 14.5 InnoDB and the ACID Model
BEGIN -- 14.6 InnoDB Multi-Versioning end -- 14.6 InnoDB Multi-Versioning
BEGIN -- 14.7 InnoDB Architecture end -- 14.7 InnoDB Architecture
BEGIN -- 14.7.1 Buffer Pool end -- 14.7.1 Buffer Pool
BEGIN -- 14.7.2 Change Buffer end -- 14.7.2 Change Buffer
BEGIN -- 14.7.3 Adaptive Hash Index end -- 14.7.3 Adaptive Hash Index
BEGIN -- 14.7.4 Redo Log Buffer end -- 14.7.4 Redo Log Buffer
BEGIN -- 14.7.5 System Tablespace end -- 14.7.5 System Tablespace
BEGIN -- 14.7.6 InnoDB Data Dictionary end -- 14.7.6 InnoDB Data Dictionary
BEGIN -- 14.7.7 Doublewrite Buffer end -- 14.7.7 Doublewrite Buffer
BEGIN -- 14.7.8 Undo Logs end -- 14.7.8 Undo Logs
BEGIN -- 14.7.9 File-Per-Table Tablespaces end -- 14.7.9 File-Per-Table Tablespaces
BEGIN -- 14.7.10 Redo Log end -- 14.7.10 Redo Log
BEGIN -- 14.8 InnoDB Locking and Transaction Model end -- 14.8 InnoDB Locking and Transaction Model
BEGIN -- 14.8.1 InnoDB Locking end -- 14.8.1 InnoDB Locking
BEGIN -- 14.8.2 InnoDB Transaction Model end -- 14.8.2 InnoDB Transaction Model
BEGIN -- 14.8.3 Locks Set by Different SQL Statements in InnoDB end -- 14.8.3 Locks Set by Different SQL Statements in InnoDB
BEGIN -- 14.8.4 Phantom Rows end -- 14.8.4 Phantom Rows
BEGIN -- 14.8.5 Deadlocks in InnoDB end -- 14.8.5 Deadlocks in InnoDB
BEGIN -- 14.9 InnoDB Configuration end -- 14.9 InnoDB Configuration
BEGIN -- 14.9.1 InnoDB Startup Configuration end -- 14.9.1 InnoDB Startup Configuration
BEGIN -- 14.9.2 InnoDB Buffer Pool Configuration end -- 14.9.2 InnoDB Buffer Pool Configuration
BEGIN -- 14.9.3 Configuring the Memory Allocator for InnoDB end -- 14.9.3 Configuring the Memory Allocator for InnoDB
BEGIN -- 14.9.4 Configuring InnoDB Change Buffering end -- 14.9.4 Configuring InnoDB Change Buffering
BEGIN -- 14.9.5 Configuring Thread Concurrency for InnoDB end -- 14.9.5 Configuring Thread Concurrency for InnoDB
BEGIN -- 14.9.6 Configuring the Number of Background InnoDB I/O Threads end -- 14.9.6 Configuring the Number of Background InnoDB I/O Threads
BEGIN -- 14.9.7 Using Asynchronous I/O on Linux end -- 14.9.7 Using Asynchronous I/O on Linux
BEGIN -- 14.9.8 Configuring the InnoDB Master Thread I/O Rate end -- 14.9.8 Configuring the InnoDB Master Thread I/O Rate
BEGIN -- 14.9.9 Configuring Spin Lock Polling end -- 14.9.9 Configuring Spin Lock Polling
BEGIN -- 14.9.10 Configuring InnoDB Purge Scheduling end -- 14.9.10 Configuring InnoDB Purge Scheduling
BEGIN -- 14.9.11 Configuring Optimizer Statistics for InnoDB end -- 14.9.11 Configuring Optimizer Statistics for InnoDB
BEGIN -- 14.10 InnoDB Tablespaces end -- 14.10 InnoDB Tablespaces
BEGIN -- 14.10.1 Resizing the InnoDB System Tablespace end -- 14.10.1 Resizing the InnoDB System Tablespace
BEGIN -- 14.10.2 Changing the Number or Size of InnoDB Redo Log Files end -- 14.10.2 Changing the Number or Size of InnoDB Redo Log Files
BEGIN -- 14.10.3 Using Raw Disk Partitions for the System Tablespace end -- 14.10.3 Using Raw Disk Partitions for the System Tablespace
BEGIN -- 14.10.4 InnoDB File-Per-Table Tablespaces end -- 14.10.4 InnoDB File-Per-Table Tablespaces
BEGIN -- 14.11 InnoDB Tables and Indexes end -- 14.11 InnoDB Tables and Indexes
BEGIN -- 14.11.1 InnoDB Tables end -- 14.11.1 InnoDB Tables
BEGIN -- 14.11.2 InnoDB Indexes end -- 14.11.2 InnoDB Indexes
BEGIN -- 14.12 InnoDB Table Compression end -- 14.12 InnoDB Table Compression
BEGIN -- 14.12.1 Overview of Table Compression end -- 14.12.1 Overview of Table Compression
BEGIN -- 14.12.2 Enabling Compression for a Table end -- 14.12.2 Enabling Compression for a Table
BEGIN -- 14.12.3 Tuning Compression for InnoDB Tables end -- 14.12.3 Tuning Compression for InnoDB Tables
BEGIN -- 14.12.4 Monitoring InnoDB Table Compression at Runtime end -- 14.12.4 Monitoring InnoDB Table Compression at Runtime
BEGIN -- 14.12.5 How Compression Works for InnoDB Tables end -- 14.12.5 How Compression Works for InnoDB Tables
BEGIN -- 14.12.6 SQL Compression Syntax Warnings and Errors end -- 14.12.6 SQL Compression Syntax Warnings and Errors
BEGIN -- 14.13 InnoDB File-Format Management end -- 14.13 InnoDB File-Format Management
BEGIN -- 14.13.1 Enabling File Formats end -- 14.13.1 Enabling File Formats
BEGIN -- 14.13.2 Verifying File Format Compatibility end -- 14.13.2 Verifying File Format Compatibility
BEGIN -- 14.13.3 Identifying the File Format in Use end -- 14.13.3 Identifying the File Format in Use
BEGIN -- 14.13.4 Downgrading the File Format end -- 14.13.4 Downgrading the File Format
BEGIN -- 14.14 InnoDB Row Storage and Row Formats end -- 14.14 InnoDB Row Storage and Row Formats
BEGIN -- 14.14.1 Overview of InnoDB Row Storage end -- 14.14.1 Overview of InnoDB Row Storage
BEGIN -- 14.14.2 Specifying the Row Format for a Table end -- 14.14.2 Specifying the Row Format for a Table
BEGIN -- 14.14.3 DYNAMIC and COMPRESSED Row Formats end -- 14.14.3 DYNAMIC and COMPRESSED Row Formats
BEGIN -- 14.14.4 COMPACT and REDUNDANT Row Formats end -- 14.14.4 COMPACT and REDUNDANT Row Formats
BEGIN -- 14.15 InnoDB Disk I/O and File Space Management end -- 14.15 InnoDB Disk I/O and File Space Management
BEGIN -- 14.15.1 InnoDB Disk I/O end -- 14.15.1 InnoDB Disk I/O
BEGIN -- 14.15.2 File Space Management end -- 14.15.2 File Space Management
BEGIN -- 14.15.3 InnoDB Checkpoints end -- 14.15.3 InnoDB Checkpoints
BEGIN -- 14.15.4 Defragmenting a Table end -- 14.15.4 Defragmenting a Table
BEGIN -- 14.15.5 Reclaiming Disk Space with TRUNCATE TABLE end -- 14.15.5 Reclaiming Disk Space with TRUNCATE TABLE
BEGIN -- 14.16 InnoDB Fast Index Creation end -- 14.16 InnoDB Fast Index Creation
BEGIN -- 14.16.1 Overview of Fast Index Creation end -- 14.16.1 Overview of Fast Index Creation
BEGIN -- 14.16.2 Examples of Fast Index Creation end -- 14.16.2 Examples of Fast Index Creation
BEGIN -- 14.16.3 Implementation Details of Fast Index Creation end -- 14.16.3 Implementation Details of Fast Index Creation
BEGIN -- 14.16.4 Concurrency Considerations for Fast Index Creation end -- 14.16.4 Concurrency Considerations for Fast Index Creation
BEGIN -- 14.16.5 How Crash Recovery Works with Fast Index Creation end -- 14.16.5 How Crash Recovery Works with Fast Index Creation
BEGIN -- 14.16.6 Limitations of Fast Index Creation end -- 14.16.6 Limitations of Fast Index Creation
BEGIN -- 14.17 InnoDB Startup Options and System Variables end -- 14.17 InnoDB Startup Options and System Variables
BEGIN -- 14.18 InnoDB INFORMATION_SCHEMA Tables end -- 14.18 InnoDB INFORMATION_SCHEMA Tables
BEGIN -- 14.18.1 InnoDB INFORMATION_SCHEMA Tables about Compression end -- 14.18.1 InnoDB INFORMATION_SCHEMA Tables about Compression
BEGIN -- 14.18.2 InnoDB INFORMATION_SCHEMA Transaction and Locking Information end -- 14.18.2 InnoDB INFORMATION_SCHEMA Transaction and Locking Information
BEGIN -- 14.18.3 InnoDB INFORMATION_SCHEMA Buffer Pool Tables end -- 14.18.3 InnoDB INFORMATION_SCHEMA Buffer Pool Tables
BEGIN -- 14.19 InnoDB Integration with MySQL Performance Schema end -- 14.19 InnoDB Integration with MySQL Performance Schema
BEGIN -- 14.19.1 Monitoring InnoDB Mutex Waits Using Performance Schema end -- 14.19.1 Monitoring InnoDB Mutex Waits Using Performance Schema
BEGIN -- 14.20 InnoDB Monitors end -- 14.20 InnoDB Monitors
BEGIN -- 14.20.1 InnoDB Monitor Types end -- 14.20.1 InnoDB Monitor Types
BEGIN -- 14.20.2 Enabling InnoDB Monitors end -- 14.20.2 Enabling InnoDB Monitors
BEGIN -- 14.20.3 InnoDB Standard Monitor and Lock Monitor Output end -- 14.20.3 InnoDB Standard Monitor and Lock Monitor Output
BEGIN -- 14.20.4 InnoDB Tablespace Monitor Output end -- 14.20.4 InnoDB Tablespace Monitor Output
BEGIN -- 14.20.5 InnoDB Table Monitor Output end -- 14.20.5 InnoDB Table Monitor Output
BEGIN -- 14.21 InnoDB Backup and Recovery end -- 14.21 InnoDB Backup and Recovery
BEGIN -- 14.21.1 InnoDB Backup end -- 14.21.1 InnoDB Backup
BEGIN -- 14.21.2 InnoDB Recovery end -- 14.21.2 InnoDB Recovery
BEGIN -- 14.22 InnoDB and MySQL Replication end -- 14.22 InnoDB and MySQL Replication
BEGIN -- 14.23 InnoDB Troubleshooting end -- 14.23 InnoDB Troubleshooting
BEGIN -- 14.23.1 Troubleshooting InnoDB I/O Problems end -- 14.23.1 Troubleshooting InnoDB I/O Problems
BEGIN -- 14.23.2 Forcing InnoDB Recovery end -- 14.23.2 Forcing InnoDB Recovery
BEGIN -- 14.23.3 Troubleshooting InnoDB Data Dictionary Operations end -- 14.23.3 Troubleshooting InnoDB Data Dictionary Operations
BEGIN -- 14.23.4 InnoDB Error Handling end -- 14.23.4 InnoDB Error Handling
BEGIN -- 15 Alternative Storage Engines end -- 15 Alternative Storage Engines
BEGIN -- 15.1 Setting the Storage Engine end -- 15.1 Setting the Storage Engine
BEGIN -- 15.2 Overview of MySQL Storage Engine Architecture end -- 15.2 Overview of MySQL Storage Engine Architecture
BEGIN -- 15.2.1 Pluggable Storage Engine Architecture end -- 15.2.1 Pluggable Storage Engine Architecture
BEGIN -- 15.2.2 The Common Database Server Layer end -- 15.2.2 The Common Database Server Layer
BEGIN -- 15.3 The MyISAM Storage Engine end -- 15.3 The MyISAM Storage Engine
BEGIN -- 15.3.1 MyISAM Startup Options end -- 15.3.1 MyISAM Startup Options
BEGIN -- 15.3.2 Space Needed for Keys end -- 15.3.2 Space Needed for Keys
BEGIN -- 15.3.3 MyISAM Table Storage Formats end -- 15.3.3 MyISAM Table Storage Formats
BEGIN -- 15.3.4 MyISAM Table Problems end -- 15.3.4 MyISAM Table Problems
BEGIN -- 15.4 The MEMORY Storage Engine end -- 15.4 The MEMORY Storage Engine
BEGIN -- 15.5 The CSV Storage Engine end -- 15.5 The CSV Storage Engine
BEGIN -- 15.5.1 Repairing and Checking CSV Tables end -- 15.5.1 Repairing and Checking CSV Tables
BEGIN -- 15.5.2 CSV Limitations end -- 15.5.2 CSV Limitations
BEGIN -- 15.6 The ARCHIVE Storage Engine end -- 15.6 The ARCHIVE Storage Engine
BEGIN -- 15.7 The BLACKHOLE Storage Engine end -- 15.7 The BLACKHOLE Storage Engine
BEGIN -- 15.8 The MERGE Storage Engine end -- 15.8 The MERGE Storage Engine
BEGIN -- 15.8.1 MERGE Table Advantages and Disadvantages end -- 15.8.1 MERGE Table Advantages and Disadvantages
BEGIN -- 15.8.2 MERGE Table Problems end -- 15.8.2 MERGE Table Problems
BEGIN -- 15.9 The FEDERATED Storage Engine end -- 15.9 The FEDERATED Storage Engine
BEGIN -- 15.9.1 FEDERATED Storage Engine Overview end -- 15.9.1 FEDERATED Storage Engine Overview
BEGIN -- 15.9.2 How to Create FEDERATED Tables end -- 15.9.2 How to Create FEDERATED Tables
BEGIN -- 15.9.3 FEDERATED Storage Engine Notes and Tips end -- 15.9.3 FEDERATED Storage Engine Notes and Tips
BEGIN -- 15.9.4 FEDERATED Storage Engine Resources end -- 15.9.4 FEDERATED Storage Engine Resources
BEGIN -- 15.10 The EXAMPLE Storage Engine end -- 15.10 The EXAMPLE Storage Engine
BEGIN -- 15.11 Other Storage Engines end -- 15.11 Other Storage Engines
BEGIN -- 16 High Availability and Scalability end -- 16 High Availability and Scalability
BEGIN -- 16.1 Using ZFS Replication end -- 16.1 Using ZFS Replication
BEGIN -- 16.1.1 Using ZFS for File System Replication end -- 16.1.1 Using ZFS for File System Replication
BEGIN -- 16.1.2 Configuring MySQL for ZFS Replication end -- 16.1.2 Configuring MySQL for ZFS Replication
BEGIN -- 16.1.3 Handling MySQL Recovery with ZFS end -- 16.1.3 Handling MySQL Recovery with ZFS
BEGIN -- 16.2 Using MySQL with memcached end -- 16.2 Using MySQL with memcached
BEGIN -- 16.2.1 Installing memcached end -- 16.2.1 Installing memcached
BEGIN -- 16.2.2 Using memcached end -- 16.2.2 Using memcached
BEGIN -- 16.2.3 Developing a memcached Application end -- 16.2.3 Developing a memcached Application
BEGIN -- 16.2.4 Getting memcached Statistics end -- 16.2.4 Getting memcached Statistics
BEGIN -- 16.2.5 memcached FAQ end -- 16.2.5 memcached FAQ
BEGIN -- 17 Replication end -- 17 Replication
BEGIN -- 17.1 Replication Configuration end -- 17.1 Replication Configuration
BEGIN -- 17.1.1 How to Set Up Replication end -- 17.1.1 How to Set Up Replication
BEGIN -- 17.1.2 Replication Formats end -- 17.1.2 Replication Formats
BEGIN -- 17.1.3 Replication and Binary Logging Options and Variables end -- 17.1.3 Replication and Binary Logging Options and Variables
BEGIN -- 17.1.4 Common Replication Administration Tasks end -- 17.1.4 Common Replication Administration Tasks
BEGIN -- 17.2 Replication Implementation end -- 17.2 Replication Implementation
BEGIN -- 17.2.1 Replication Implementation Details end -- 17.2.1 Replication Implementation Details
BEGIN -- 17.2.2 Replication Relay and Status Logs end -- 17.2.2 Replication Relay and Status Logs
BEGIN -- 17.2.3 How Servers Evaluate Replication Filtering Rules end -- 17.2.3 How Servers Evaluate Replication Filtering Rules
BEGIN -- 17.3 Replication Solutions end -- 17.3 Replication Solutions
BEGIN -- 17.3.1 Using Replication for Backups end -- 17.3.1 Using Replication for Backups
BEGIN -- 17.3.2 Using Replication with Different Master and Slave Storage Engines end -- 17.3.2 Using Replication with Different Master and Slave Storage Engines
BEGIN -- 17.3.3 Using Replication for Scale-Out end -- 17.3.3 Using Replication for Scale-Out
BEGIN -- 17.3.4 Replicating Different Databases to Different Slaves end -- 17.3.4 Replicating Different Databases to Different Slaves
BEGIN -- 17.3.5 Improving Replication Performance end -- 17.3.5 Improving Replication Performance
BEGIN -- 17.3.6 Switching Masters During Failover end -- 17.3.6 Switching Masters During Failover
BEGIN -- 17.3.7 Setting Up Replication to Use Encrypted Connections end -- 17.3.7 Setting Up Replication to Use Encrypted Connections
BEGIN -- 17.3.8 Semisynchronous Replication end -- 17.3.8 Semisynchronous Replication
BEGIN -- 17.4 Replication Notes and Tips end -- 17.4 Replication Notes and Tips
BEGIN -- 17.4.1 Replication Features and Issues end -- 17.4.1 Replication Features and Issues
BEGIN -- 17.4.2 Replication Compatibility Between MySQL Versions end -- 17.4.2 Replication Compatibility Between MySQL Versions
BEGIN -- 17.4.3 Upgrading a Replication Setup end -- 17.4.3 Upgrading a Replication Setup
BEGIN -- 17.4.4 Troubleshooting Replication end -- 17.4.4 Troubleshooting Replication
BEGIN -- 17.4.5 How to Report Replication Bugs or Problems end -- 17.4.5 How to Report Replication Bugs or Problems
BEGIN -- 18 MySQL NDB Cluster 7.2 end -- 18 MySQL NDB Cluster 7.2
BEGIN -- 18.1 NDB Cluster Overview end -- 18.1 NDB Cluster Overview
BEGIN -- 18.1.1 NDB Cluster Core Concepts end -- 18.1.1 NDB Cluster Core Concepts
BEGIN -- 18.1.2 NDB Cluster Nodes, Node Groups, Replicas, and Partitions end -- 18.1.2 NDB Cluster Nodes, Node Groups, Replicas, and Partitions
BEGIN -- 18.1.3 NDB Cluster Hardware, Software, and Networking Requirements end -- 18.1.3 NDB Cluster Hardware, Software, and Networking Requirements
BEGIN -- 18.1.4 What is New in MySQL NDB Cluster 7.2 end -- 18.1.4 What is New in MySQL NDB Cluster 7.2
BEGIN -- 18.1.5 MySQL Server Using InnoDB Compared with NDB Cluster end -- 18.1.5 MySQL Server Using InnoDB Compared with NDB Cluster
BEGIN -- 18.1.6 Known Limitations of NDB Cluster end -- 18.1.6 Known Limitations of NDB Cluster
BEGIN -- 18.2 NDB Cluster Installation end -- 18.2 NDB Cluster Installation
BEGIN -- 18.2.1 Installing NDB Cluster on Linux end -- 18.2.1 Installing NDB Cluster on Linux
BEGIN -- 18.2.2 Installing NDB Cluster on Windows end -- 18.2.2 Installing NDB Cluster on Windows
BEGIN -- 18.2.3 Initial Configuration of NDB Cluster end -- 18.2.3 Initial Configuration of NDB Cluster
BEGIN -- 18.2.4 Initial Startup of NDB Cluster end -- 18.2.4 Initial Startup of NDB Cluster
BEGIN -- 18.2.5 NDB Cluster Example with Tables and Data end -- 18.2.5 NDB Cluster Example with Tables and Data
BEGIN -- 18.2.6 Safe Shutdown and Restart of NDB Cluster end -- 18.2.6 Safe Shutdown and Restart of NDB Cluster
BEGIN -- 18.2.7 Upgrading and Downgrading NDB Cluster end -- 18.2.7 Upgrading and Downgrading NDB Cluster
BEGIN -- 18.3 Configuration of NDB Cluster end -- 18.3 Configuration of NDB Cluster
BEGIN -- 18.3.1 Quick Test Setup of NDB Cluster end -- 18.3.1 Quick Test Setup of NDB Cluster
BEGIN -- 18.3.2 Overview of NDB Cluster Configuration Parameters, Options, and Variables end -- 18.3.2 Overview of NDB Cluster Configuration Parameters, Options, and Variables
BEGIN -- 18.3.3 NDB Cluster Configuration Files end -- 18.3.3 NDB Cluster Configuration Files
BEGIN -- 18.3.4 Using High-Speed Interconnects with NDB Cluster end -- 18.3.4 Using High-Speed Interconnects with NDB Cluster
BEGIN -- 18.4 NDB Cluster Programs end -- 18.4 NDB Cluster Programs
BEGIN -- 18.4.1 ndbd — The NDB Cluster Data Node Daemon end -- 18.4.1 ndbd — The NDB Cluster Data Node Daemon
BEGIN -- 18.4.2 ndbinfo_select_all — Select From ndbinfo Tables end -- 18.4.2 ndbinfo_select_all — Select From ndbinfo Tables
BEGIN -- 18.4.3 ndbmtd — The NDB Cluster Data Node Daemon (Multi-Threaded) end -- 18.4.3 ndbmtd — The NDB Cluster Data Node Daemon (Multi-Threaded)
BEGIN -- 18.4.4 ndb_mgmd — The NDB Cluster Management Server Daemon end -- 18.4.4 ndb_mgmd — The NDB Cluster Management Server Daemon
BEGIN -- 18.4.5 ndb_mgm — The NDB Cluster Management Client end -- 18.4.5 ndb_mgm — The NDB Cluster Management Client
BEGIN -- 18.4.6 ndb_blob_tool — Check and Repair BLOB and TEXT columns of NDB Cluster Tables end -- 18.4.6 ndb_blob_tool — Check and Repair BLOB and TEXT columns of NDB Cluster Tables
BEGIN -- 18.4.7 ndb_config — Extract NDB Cluster Configuration Information end -- 18.4.7 ndb_config — Extract NDB Cluster Configuration Information
BEGIN -- 18.4.8 ndb_cpcd — Automate Testing for NDB Development end -- 18.4.8 ndb_cpcd — Automate Testing for NDB Development
BEGIN -- 18.4.9 ndb_delete_all — Delete All Rows from an NDB Table end -- 18.4.9 ndb_delete_all — Delete All Rows from an NDB Table
BEGIN -- 18.4.10 ndb_desc — Describe NDB Tables end -- 18.4.10 ndb_desc — Describe NDB Tables
BEGIN -- 18.4.11 ndb_drop_index — Drop Index from an NDB Table end -- 18.4.11 ndb_drop_index — Drop Index from an NDB Table
BEGIN -- 18.4.12 ndb_drop_table — Drop an NDB Table end -- 18.4.12 ndb_drop_table — Drop an NDB Table
BEGIN -- 18.4.13 ndb_error_reporter — NDB Error-Reporting Utility end -- 18.4.13 ndb_error_reporter — NDB Error-Reporting Utility
BEGIN -- 18.4.14 ndb_index_stat — NDB Index Statistics Utility end -- 18.4.14 ndb_index_stat — NDB Index Statistics Utility
BEGIN -- 18.4.15 ndb_move_data — NDB Data Copy Utility end -- 18.4.15 ndb_move_data — NDB Data Copy Utility
BEGIN -- 18.4.16 ndb_print_backup_file — Print NDB Backup File Contents end -- 18.4.16 ndb_print_backup_file — Print NDB Backup File Contents
BEGIN -- 18.4.17 ndb_print_file — Print NDB Disk Data File Contents end -- 18.4.17 ndb_print_file — Print NDB Disk Data File Contents
BEGIN -- 18.4.18 ndb_print_schema_file — Print NDB Schema File Contents end -- 18.4.18 ndb_print_schema_file — Print NDB Schema File Contents
BEGIN -- 18.4.19 ndb_print_sys_file — Print NDB System File Contents end -- 18.4.19 ndb_print_sys_file — Print NDB System File Contents
BEGIN -- 18.4.20 ndb_redo_log_reader — Check and Print Content of Cluster Redo Log end -- 18.4.20 ndb_redo_log_reader — Check and Print Content of Cluster Redo Log
BEGIN -- 18.4.21 ndb_restore — Restore an NDB Cluster Backup end -- 18.4.21 ndb_restore — Restore an NDB Cluster Backup
BEGIN -- 18.4.22 ndb_select_all — Print Rows from an NDB Table end -- 18.4.22 ndb_select_all — Print Rows from an NDB Table
BEGIN -- 18.4.23 ndb_select_count — Print Row Counts for NDB Tables end -- 18.4.23 ndb_select_count — Print Row Counts for NDB Tables
BEGIN -- 18.4.24 ndb_show_tables — Display List of NDB Tables end -- 18.4.24 ndb_show_tables — Display List of NDB Tables
BEGIN -- 18.4.25 ndb_size.pl — NDBCLUSTER Size Requirement Estimator end -- 18.4.25 ndb_size.pl — NDBCLUSTER Size Requirement Estimator
BEGIN -- 18.4.26 ndb_waiter — Wait for NDB Cluster to Reach a Given Status end -- 18.4.26 ndb_waiter — Wait for NDB Cluster to Reach a Given Status
BEGIN -- 18.4.27 Options Common to NDB Cluster Programs — Options Common to NDB Cluster Programs end -- 18.4.27 Options Common to NDB Cluster Programs — Options Common to NDB Cluster Programs
BEGIN -- 18.5 Management of NDB Cluster end -- 18.5 Management of NDB Cluster
BEGIN -- 18.5.1 Summary of NDB Cluster Start Phases end -- 18.5.1 Summary of NDB Cluster Start Phases
BEGIN -- 18.5.2 Commands in the NDB Cluster Management Client end -- 18.5.2 Commands in the NDB Cluster Management Client
BEGIN -- 18.5.3 Online Backup of NDB Cluster end -- 18.5.3 Online Backup of NDB Cluster
BEGIN -- 18.5.4 MySQL Server Usage for NDB Cluster end -- 18.5.4 MySQL Server Usage for NDB Cluster
BEGIN -- 18.5.5 Performing a Rolling Restart of an NDB Cluster end -- 18.5.5 Performing a Rolling Restart of an NDB Cluster
BEGIN -- 18.5.6 Event Reports Generated in NDB Cluster end -- 18.5.6 Event Reports Generated in NDB Cluster
BEGIN -- 18.5.7 NDB Cluster Log Messages end -- 18.5.7 NDB Cluster Log Messages
BEGIN -- 18.5.8 NDB Cluster Single User Mode end -- 18.5.8 NDB Cluster Single User Mode
BEGIN -- 18.5.9 Quick Reference: NDB Cluster SQL Statements end -- 18.5.9 Quick Reference: NDB Cluster SQL Statements
BEGIN -- 18.5.10 ndbinfo: The NDB Cluster Information Database end -- 18.5.10 ndbinfo: The NDB Cluster Information Database
BEGIN -- 18.5.11 NDB Cluster Security Issues end -- 18.5.11 NDB Cluster Security Issues
BEGIN -- 18.5.12 NDB Cluster Disk Data Tables end -- 18.5.12 NDB Cluster Disk Data Tables
BEGIN -- 18.5.13 Adding NDB Cluster Data Nodes Online end -- 18.5.13 Adding NDB Cluster Data Nodes Online
BEGIN -- 18.5.14 Distributed MySQL Privileges for NDB Cluster end -- 18.5.14 Distributed MySQL Privileges for NDB Cluster
BEGIN -- 18.5.15 NDB API Statistics Counters and Variables end -- 18.5.15 NDB API Statistics Counters and Variables
BEGIN -- 18.6 NDB Cluster Replication end -- 18.6 NDB Cluster Replication
BEGIN -- 18.6.1 NDB Cluster Replication: Abbreviations and Symbols end -- 18.6.1 NDB Cluster Replication: Abbreviations and Symbols
BEGIN -- 18.6.2 General Requirements for NDB Cluster Replication end -- 18.6.2 General Requirements for NDB Cluster Replication
BEGIN -- 18.6.3 Known Issues in NDB Cluster Replication end -- 18.6.3 Known Issues in NDB Cluster Replication
BEGIN -- 18.6.4 NDB Cluster Replication Schema and Tables end -- 18.6.4 NDB Cluster Replication Schema and Tables
BEGIN -- 18.6.5 Preparing the NDB Cluster for Replication end -- 18.6.5 Preparing the NDB Cluster for Replication
BEGIN -- 18.6.6 Starting NDB Cluster Replication (Single Replication Channel) end -- 18.6.6 Starting NDB Cluster Replication (Single Replication Channel)
BEGIN -- 18.6.7 Using Two Replication Channels for NDB Cluster Replication end -- 18.6.7 Using Two Replication Channels for NDB Cluster Replication
BEGIN -- 18.6.8 Implementing Failover with NDB Cluster Replication end -- 18.6.8 Implementing Failover with NDB Cluster Replication
BEGIN -- 18.6.9 NDB Cluster Backups With NDB Cluster Replication end -- 18.6.9 NDB Cluster Backups With NDB Cluster Replication
BEGIN -- 18.6.10 NDB Cluster Replication: Multi-Master and Circular Replication end -- 18.6.10 NDB Cluster Replication: Multi-Master and Circular Replication
BEGIN -- 18.6.11 NDB Cluster Replication Conflict Resolution end -- 18.6.11 NDB Cluster Replication Conflict Resolution
BEGIN -- 18.7 NDB Cluster Release Notes end -- 18.7 NDB Cluster Release Notes
BEGIN -- 19 Partitioning end -- 19 Partitioning
BEGIN -- 19.1 Overview of Partitioning in MySQL end -- 19.1 Overview of Partitioning in MySQL
BEGIN -- 19.2 Partitioning Types end -- 19.2 Partitioning Types
BEGIN -- 19.2.1 RANGE Partitioning end -- 19.2.1 RANGE Partitioning
BEGIN -- 19.2.2 LIST Partitioning end -- 19.2.2 LIST Partitioning
BEGIN -- 19.2.3 COLUMNS Partitioning end -- 19.2.3 COLUMNS Partitioning
BEGIN -- 19.2.4 HASH Partitioning end -- 19.2.4 HASH Partitioning
BEGIN -- 19.2.5 KEY Partitioning end -- 19.2.5 KEY Partitioning
BEGIN -- 19.2.6 Subpartitioning end -- 19.2.6 Subpartitioning
BEGIN -- 19.2.7 How MySQL Partitioning Handles NULL end -- 19.2.7 How MySQL Partitioning Handles NULL
BEGIN -- 19.3 Partition Management end -- 19.3 Partition Management
BEGIN -- 19.3.1 Management of RANGE and LIST Partitions end -- 19.3.1 Management of RANGE and LIST Partitions
BEGIN -- 19.3.2 Management of HASH and KEY Partitions end -- 19.3.2 Management of HASH and KEY Partitions
BEGIN -- 19.3.3 Maintenance of Partitions end -- 19.3.3 Maintenance of Partitions
BEGIN -- 19.3.4 Obtaining Information About Partitions end -- 19.3.4 Obtaining Information About Partitions
BEGIN -- 19.4 Partition Pruning end -- 19.4 Partition Pruning
BEGIN -- 19.5 Restrictions and Limitations on Partitioning end -- 19.5 Restrictions and Limitations on Partitioning
BEGIN -- 19.5.1 Partitioning Keys, Primary Keys, and Unique Keys end -- 19.5.1 Partitioning Keys, Primary Keys, and Unique Keys
BEGIN -- 19.5.2 Partitioning Limitations Relating to Storage Engines end -- 19.5.2 Partitioning Limitations Relating to Storage Engines
BEGIN -- 19.5.3 Partitioning Limitations Relating to Functions end -- 19.5.3 Partitioning Limitations Relating to Functions
BEGIN -- 19.5.4 Partitioning and Table-Level Locking end -- 19.5.4 Partitioning and Table-Level Locking
BEGIN -- 20 Stored Programs and Views end -- 20 Stored Programs and Views
BEGIN -- 20.1 Defining Stored Programs end -- 20.1 Defining Stored Programs
BEGIN -- 20.2 Using Stored Routines (Procedures and Functions) end -- 20.2 Using Stored Routines (Procedures and Functions)
BEGIN -- 20.2.1 Stored Routine Syntax end -- 20.2.1 Stored Routine Syntax
BEGIN -- 20.2.2 Stored Routines and MySQL Privileges end -- 20.2.2 Stored Routines and MySQL Privileges
BEGIN -- 20.2.3 Stored Routine Metadata end -- 20.2.3 Stored Routine Metadata
BEGIN -- 20.2.4 Stored Procedures, Functions, Triggers, and LAST_INSERT_ID() end -- 20.2.4 Stored Procedures, Functions, Triggers, and LAST_INSERT_ID()
BEGIN -- 20.3 Using Triggers end -- 20.3 Using Triggers
BEGIN -- 20.3.1 Trigger Syntax and Examples end -- 20.3.1 Trigger Syntax and Examples
BEGIN -- 20.3.2 Trigger Metadata end -- 20.3.2 Trigger Metadata
BEGIN -- 20.4 Using the Event Scheduler end -- 20.4 Using the Event Scheduler
BEGIN -- 20.4.1 Event Scheduler Overview end -- 20.4.1 Event Scheduler Overview
BEGIN -- 20.4.2 Event Scheduler Configuration end -- 20.4.2 Event Scheduler Configuration
BEGIN -- 20.4.3 Event Syntax end -- 20.4.3 Event Syntax
BEGIN -- 20.4.4 Event Metadata end -- 20.4.4 Event Metadata
BEGIN -- 20.4.5 Event Scheduler Status end -- 20.4.5 Event Scheduler Status
BEGIN -- 20.4.6 The Event Scheduler and MySQL Privileges end -- 20.4.6 The Event Scheduler and MySQL Privileges
BEGIN -- 20.5 Using Views end -- 20.5 Using Views
BEGIN -- 20.5.1 View Syntax end -- 20.5.1 View Syntax
BEGIN -- 20.5.2 View Processing Algorithms end -- 20.5.2 View Processing Algorithms
BEGIN -- 20.5.3 Updatable and Insertable Views end -- 20.5.3 Updatable and Insertable Views
BEGIN -- 20.5.4 The View WITH CHECK OPTION Clause end -- 20.5.4 The View WITH CHECK OPTION Clause
BEGIN -- 20.5.5 View Metadata end -- 20.5.5 View Metadata
BEGIN -- 20.6 Access Control for Stored Programs and Views end -- 20.6 Access Control for Stored Programs and Views
BEGIN -- 20.7 Binary Logging of Stored Programs end -- 20.7 Binary Logging of Stored Programs
BEGIN -- 21 INFORMATION_SCHEMA Tables end -- 21 INFORMATION_SCHEMA Tables
BEGIN -- 21.1 The INFORMATION_SCHEMA CHARACTER_SETS Table end -- 21.1 The INFORMATION_SCHEMA CHARACTER_SETS Table
BEGIN -- 21.2 The INFORMATION_SCHEMA COLLATIONS Table end -- 21.2 The INFORMATION_SCHEMA COLLATIONS Table
BEGIN -- 21.3 The INFORMATION_SCHEMA COLLATION_CHARACTER_SET_APPLICABILITY Table end -- 21.3 The INFORMATION_SCHEMA COLLATION_CHARACTER_SET_APPLICABILITY Table
BEGIN -- 21.4 The INFORMATION_SCHEMA COLUMNS Table end -- 21.4 The INFORMATION_SCHEMA COLUMNS Table
BEGIN -- 21.5 The INFORMATION_SCHEMA COLUMN_PRIVILEGES Table end -- 21.5 The INFORMATION_SCHEMA COLUMN_PRIVILEGES Table
BEGIN -- 21.6 The INFORMATION_SCHEMA ENGINES Table end -- 21.6 The INFORMATION_SCHEMA ENGINES Table
BEGIN -- 21.7 The INFORMATION_SCHEMA EVENTS Table end -- 21.7 The INFORMATION_SCHEMA EVENTS Table
BEGIN -- 21.8 The INFORMATION_SCHEMA GLOBAL_STATUS and SESSION_STATUS Tables end -- 21.8 The INFORMATION_SCHEMA GLOBAL_STATUS and SESSION_STATUS Tables
BEGIN -- 21.9 The INFORMATION_SCHEMA GLOBAL_VARIABLES and SESSION_VARIABLES Tables end -- 21.9 The INFORMATION_SCHEMA GLOBAL_VARIABLES and SESSION_VARIABLES Tables
BEGIN -- 21.10 The INFORMATION_SCHEMA KEY_COLUMN_USAGE Table end -- 21.10 The INFORMATION_SCHEMA KEY_COLUMN_USAGE Table
BEGIN -- 21.11 The INFORMATION_SCHEMA PARAMETERS Table end -- 21.11 The INFORMATION_SCHEMA PARAMETERS Table
BEGIN -- 21.12 The INFORMATION_SCHEMA PARTITIONS Table end -- 21.12 The INFORMATION_SCHEMA PARTITIONS Table
BEGIN -- 21.13 The INFORMATION_SCHEMA PLUGINS Table end -- 21.13 The INFORMATION_SCHEMA PLUGINS Table
BEGIN -- 21.14 The INFORMATION_SCHEMA PROCESSLIST Table end -- 21.14 The INFORMATION_SCHEMA PROCESSLIST Table
BEGIN -- 21.15 The INFORMATION_SCHEMA PROFILING Table end -- 21.15 The INFORMATION_SCHEMA PROFILING Table
BEGIN -- 21.16 The INFORMATION_SCHEMA REFERENTIAL_CONSTRAINTS Table end -- 21.16 The INFORMATION_SCHEMA REFERENTIAL_CONSTRAINTS Table
BEGIN -- 21.17 The INFORMATION_SCHEMA ROUTINES Table end -- 21.17 The INFORMATION_SCHEMA ROUTINES Table
BEGIN -- 21.18 The INFORMATION_SCHEMA SCHEMATA Table end -- 21.18 The INFORMATION_SCHEMA SCHEMATA Table
BEGIN -- 21.19 The INFORMATION_SCHEMA SCHEMA_PRIVILEGES Table end -- 21.19 The INFORMATION_SCHEMA SCHEMA_PRIVILEGES Table
BEGIN -- 21.20 The INFORMATION_SCHEMA STATISTICS Table end -- 21.20 The INFORMATION_SCHEMA STATISTICS Table
BEGIN -- 21.21 The INFORMATION_SCHEMA TABLES Table end -- 21.21 The INFORMATION_SCHEMA TABLES Table
BEGIN -- 21.22 The INFORMATION_SCHEMA TABLESPACES Table end -- 21.22 The INFORMATION_SCHEMA TABLESPACES Table
BEGIN -- 21.23 The INFORMATION_SCHEMA TABLE_CONSTRAINTS Table end -- 21.23 The INFORMATION_SCHEMA TABLE_CONSTRAINTS Table
BEGIN -- 21.24 The INFORMATION_SCHEMA TABLE_PRIVILEGES Table end -- 21.24 The INFORMATION_SCHEMA TABLE_PRIVILEGES Table
BEGIN -- 21.25 The INFORMATION_SCHEMA TRIGGERS Table end -- 21.25 The INFORMATION_SCHEMA TRIGGERS Table
BEGIN -- 21.26 The INFORMATION_SCHEMA USER_PRIVILEGES Table end -- 21.26 The INFORMATION_SCHEMA USER_PRIVILEGES Table
BEGIN -- 21.27 The INFORMATION_SCHEMA VIEWS Table end -- 21.27 The INFORMATION_SCHEMA VIEWS Table
BEGIN -- 21.28 InnoDB INFORMATION_SCHEMA Tables end -- 21.28 InnoDB INFORMATION_SCHEMA Tables
BEGIN -- 21.28.1 The INFORMATION_SCHEMA INNODB_BUFFER_PAGE Table end -- 21.28.1 The INFORMATION_SCHEMA INNODB_BUFFER_PAGE Table
BEGIN -- 21.28.2 The INFORMATION_SCHEMA INNODB_BUFFER_PAGE_LRU Table end -- 21.28.2 The INFORMATION_SCHEMA INNODB_BUFFER_PAGE_LRU Table
BEGIN -- 21.28.3 The INFORMATION_SCHEMA INNODB_BUFFER_POOL_STATS Table end -- 21.28.3 The INFORMATION_SCHEMA INNODB_BUFFER_POOL_STATS Table
BEGIN -- 21.28.4 The INFORMATION_SCHEMA INNODB_CMP and INNODB_CMP_RESET Tables end -- 21.28.4 The INFORMATION_SCHEMA INNODB_CMP and INNODB_CMP_RESET Tables
BEGIN -- 21.28.5 The INFORMATION_SCHEMA INNODB_CMPMEM and INNODB_CMPMEM_RESET Tables end -- 21.28.5 The INFORMATION_SCHEMA INNODB_CMPMEM and INNODB_CMPMEM_RESET Tables
BEGIN -- 21.28.6 The INFORMATION_SCHEMA INNODB_LOCKS Table end -- 21.28.6 The INFORMATION_SCHEMA INNODB_LOCKS Table
BEGIN -- 21.28.7 The INFORMATION_SCHEMA INNODB_LOCK_WAITS Table end -- 21.28.7 The INFORMATION_SCHEMA INNODB_LOCK_WAITS Table
BEGIN -- 21.28.8 The INFORMATION_SCHEMA INNODB_TRX Table end -- 21.28.8 The INFORMATION_SCHEMA INNODB_TRX Table
BEGIN -- 21.29 NDB Cluster INFORMATION_SCHEMA Tables end -- 21.29 NDB Cluster INFORMATION_SCHEMA Tables
BEGIN -- 21.29.1 The INFORMATION_SCHEMA FILES Table end -- 21.29.1 The INFORMATION_SCHEMA FILES Table
BEGIN -- 21.29.2 The INFORMATION_SCHEMA ndb_transid_mysql_connection_map Table end -- 21.29.2 The INFORMATION_SCHEMA ndb_transid_mysql_connection_map Table
BEGIN -- 21.30 Thread Pool INFORMATION_SCHEMA Tables end -- 21.30 Thread Pool INFORMATION_SCHEMA Tables
BEGIN -- 21.30.1 The INFORMATION_SCHEMA TP_THREAD_GROUP_STATE Table end -- 21.30.1 The INFORMATION_SCHEMA TP_THREAD_GROUP_STATE Table
BEGIN -- 21.30.2 The INFORMATION_SCHEMA TP_THREAD_GROUP_STATS Table end -- 21.30.2 The INFORMATION_SCHEMA TP_THREAD_GROUP_STATS Table
BEGIN -- 21.30.3 The INFORMATION_SCHEMA TP_THREAD_STATE Table end -- 21.30.3 The INFORMATION_SCHEMA TP_THREAD_STATE Table
BEGIN -- 21.31 Extensions to SHOW Statements end -- 21.31 Extensions to SHOW Statements
BEGIN -- 22 MySQL Performance Schema end -- 22 MySQL Performance Schema
BEGIN -- 22.1 Performance Schema Quick Start end -- 22.1 Performance Schema Quick Start
BEGIN -- 22.2 Performance Schema Build Configuration end -- 22.2 Performance Schema Build Configuration
BEGIN -- 22.3 Performance Schema Startup Configuration end -- 22.3 Performance Schema Startup Configuration
BEGIN -- 22.4 Performance Schema Runtime Configuration end -- 22.4 Performance Schema Runtime Configuration
BEGIN -- 22.4.1 Performance Schema Event Timing end -- 22.4.1 Performance Schema Event Timing
BEGIN -- 22.4.2 Performance Schema Event Filtering end -- 22.4.2 Performance Schema Event Filtering
BEGIN -- 22.4.3 Event Pre-Filtering end -- 22.4.3 Event Pre-Filtering
BEGIN -- 22.4.4 Naming Instruments or Consumers for Filtering Operations end -- 22.4.4 Naming Instruments or Consumers for Filtering Operations
BEGIN -- 22.4.5 Determining What Is Instrumented end -- 22.4.5 Determining What Is Instrumented
BEGIN -- 22.5 Performance Schema Queries end -- 22.5 Performance Schema Queries
BEGIN -- 22.6 Performance Schema Instrument Naming Conventions end -- 22.6 Performance Schema Instrument Naming Conventions
BEGIN -- 22.7 Performance Schema Status Monitoring end -- 22.7 Performance Schema Status Monitoring
BEGIN -- 22.8 Performance Schema General Table Characteristics end -- 22.8 Performance Schema General Table Characteristics
BEGIN -- 22.9 Performance Schema Table Descriptions end -- 22.9 Performance Schema Table Descriptions
BEGIN -- 22.9.1 Performance Schema Table Index end -- 22.9.1 Performance Schema Table Index
BEGIN -- 22.9.2 Performance Schema Setup Tables end -- 22.9.2 Performance Schema Setup Tables
BEGIN -- 22.9.3 Performance Schema Instance Tables end -- 22.9.3 Performance Schema Instance Tables
BEGIN -- 22.9.4 Performance Schema Wait Event Tables end -- 22.9.4 Performance Schema Wait Event Tables
BEGIN -- 22.9.5 Performance Schema Summary Tables end -- 22.9.5 Performance Schema Summary Tables
BEGIN -- 22.9.6 Performance Schema Miscellaneous Tables end -- 22.9.6 Performance Schema Miscellaneous Tables
BEGIN -- 22.10 Performance Schema Option and Variable Reference end -- 22.10 Performance Schema Option and Variable Reference
BEGIN -- 22.11 Performance Schema System Variables end -- 22.11 Performance Schema System Variables
BEGIN -- 22.12 Performance Schema Status Variables end -- 22.12 Performance Schema Status Variables
BEGIN -- 22.13 Performance Schema and Plugins end -- 22.13 Performance Schema and Plugins
BEGIN -- 22.14 Using the Performance Schema to Diagnose Problems end -- 22.14 Using the Performance Schema to Diagnose Problems
BEGIN -- 23 Connectors and APIs end -- 23 Connectors and APIs
BEGIN -- 23.1 MySQL Connector/C end -- 23.1 MySQL Connector/C
BEGIN -- 23.2 MySQL Connector/C++ end -- 23.2 MySQL Connector/C++
BEGIN -- 23.3 MySQL Connector/J end -- 23.3 MySQL Connector/J
BEGIN -- 23.4 MySQL Connector/NET end -- 23.4 MySQL Connector/NET
BEGIN -- 23.5 MySQL Connector/ODBC end -- 23.5 MySQL Connector/ODBC
BEGIN -- 23.6 MySQL Connector/Python end -- 23.6 MySQL Connector/Python
BEGIN -- 23.7 libmysqld, the Embedded MySQL Server Library end -- 23.7 libmysqld, the Embedded MySQL Server Library
BEGIN -- 23.7.1 Compiling Programs with libmysqld end -- 23.7.1 Compiling Programs with libmysqld
BEGIN -- 23.7.2 Restrictions When Using the Embedded MySQL Server end -- 23.7.2 Restrictions When Using the Embedded MySQL Server
BEGIN -- 23.7.3 Options with the Embedded Server end -- 23.7.3 Options with the Embedded Server
BEGIN -- 23.7.4 Embedded Server Examples end -- 23.7.4 Embedded Server Examples
BEGIN -- 23.8 MySQL C API end -- 23.8 MySQL C API
BEGIN -- 23.8.1 MySQL C API Implementations end -- 23.8.1 MySQL C API Implementations
BEGIN -- 23.8.2 Simultaneous MySQL Server and Connector/C Installations end -- 23.8.2 Simultaneous MySQL Server and Connector/C Installations
BEGIN -- 23.8.3 Example C API Client Programs end -- 23.8.3 Example C API Client Programs
BEGIN -- 23.8.4 Building and Running C API Client Programs end -- 23.8.4 Building and Running C API Client Programs
BEGIN -- 23.8.5 C API Data Structures end -- 23.8.5 C API Data Structures
BEGIN -- 23.8.6 C API Function Overview end -- 23.8.6 C API Function Overview
BEGIN -- 23.8.7 C API Function Descriptions end -- 23.8.7 C API Function Descriptions
BEGIN -- 23.8.8 C API Prepared Statements end -- 23.8.8 C API Prepared Statements
BEGIN -- 23.8.9 C API Prepared Statement Data Structures end -- 23.8.9 C API Prepared Statement Data Structures
BEGIN -- 23.8.10 C API Prepared Statement Function Overview end -- 23.8.10 C API Prepared Statement Function Overview
BEGIN -- 23.8.11 C API Prepared Statement Function Descriptions end -- 23.8.11 C API Prepared Statement Function Descriptions
BEGIN -- 23.8.12 C API Threaded Function Descriptions end -- 23.8.12 C API Threaded Function Descriptions
BEGIN -- 23.8.13 C API Embedded Server Function Descriptions end -- 23.8.13 C API Embedded Server Function Descriptions
BEGIN -- 23.8.14 C API Client Plugin Functions end -- 23.8.14 C API Client Plugin Functions
BEGIN -- 23.8.15 C API Encrypted Connection Support end -- 23.8.15 C API Encrypted Connection Support
BEGIN -- 23.8.16 C API Multiple Statement Execution Support end -- 23.8.16 C API Multiple Statement Execution Support
BEGIN -- 23.8.17 C API Prepared Statement Handling of Date and Time Values end -- 23.8.17 C API Prepared Statement Handling of Date and Time Values
BEGIN -- 23.8.18 C API Prepared CALL Statement Support end -- 23.8.18 C API Prepared CALL Statement Support
BEGIN -- 23.8.19 C API Prepared Statement Problems end -- 23.8.19 C API Prepared Statement Problems
BEGIN -- 23.8.20 C API Automatic Reconnection Control end -- 23.8.20 C API Automatic Reconnection Control
BEGIN -- 23.8.21 C API Common Issues end -- 23.8.21 C API Common Issues
BEGIN -- 23.9 MySQL PHP API end -- 23.9 MySQL PHP API
BEGIN -- 23.10 MySQL Perl API end -- 23.10 MySQL Perl API
BEGIN -- 23.11 MySQL Python API end -- 23.11 MySQL Python API
BEGIN -- 23.12 MySQL Ruby APIs end -- 23.12 MySQL Ruby APIs
BEGIN -- 23.12.1 The MySQL/Ruby API end -- 23.12.1 The MySQL/Ruby API
BEGIN -- 23.12.2 The Ruby/MySQL API end -- 23.12.2 The Ruby/MySQL API
BEGIN -- 23.13 MySQL Tcl API end -- 23.13 MySQL Tcl API
BEGIN -- 23.14 MySQL Eiffel Wrapper end -- 23.14 MySQL Eiffel Wrapper
BEGIN -- 24 Extending MySQL end -- 24 Extending MySQL
BEGIN -- 24.1 MySQL Internals end -- 24.1 MySQL Internals
BEGIN -- 24.1.1 MySQL Threads end -- 24.1.1 MySQL Threads
BEGIN -- 24.1.2 The MySQL Test Suite end -- 24.1.2 The MySQL Test Suite
BEGIN -- 24.2 The MySQL Plugin API end -- 24.2 The MySQL Plugin API
BEGIN -- 24.2.1 Types of Plugins end -- 24.2.1 Types of Plugins
BEGIN -- 24.2.2 Plugin API Characteristics end -- 24.2.2 Plugin API Characteristics
BEGIN -- 24.2.3 Plugin API Components end -- 24.2.3 Plugin API Components
BEGIN -- 24.2.4 Writing Plugins end -- 24.2.4 Writing Plugins
BEGIN -- 24.3 MySQL Services for Plugins end -- 24.3 MySQL Services for Plugins
BEGIN -- 24.4 Adding New Functions to MySQL end -- 24.4 Adding New Functions to MySQL
BEGIN -- 24.4.1 Features of the User-Defined Function Interface end -- 24.4.1 Features of the User-Defined Function Interface
BEGIN -- 24.4.2 Adding a New User-Defined Function end -- 24.4.2 Adding a New User-Defined Function
BEGIN -- 24.4.3 Adding a New Native Function end -- 24.4.3 Adding a New Native Function
BEGIN -- 24.5 Debugging and Porting MySQL end -- 24.5 Debugging and Porting MySQL
BEGIN -- 24.5.1 Debugging a MySQL Server end -- 24.5.1 Debugging a MySQL Server
BEGIN -- 24.5.2 Debugging a MySQL Client end -- 24.5.2 Debugging a MySQL Client
BEGIN -- 24.5.3 The DBUG Package end -- 24.5.3 The DBUG Package
BEGIN -- 25 MySQL Enterprise Edition end -- 25 MySQL Enterprise Edition
BEGIN -- 25.1 MySQL Enterprise Monitor Overview end -- 25.1 MySQL Enterprise Monitor Overview
BEGIN -- 25.2 MySQL Enterprise Backup Overview end -- 25.2 MySQL Enterprise Backup Overview
BEGIN -- 25.3 MySQL Enterprise Security Overview end -- 25.3 MySQL Enterprise Security Overview
BEGIN -- 25.4 MySQL Enterprise Encryption Overview end -- 25.4 MySQL Enterprise Encryption Overview
BEGIN -- 25.5 MySQL Enterprise Audit Overview end -- 25.5 MySQL Enterprise Audit Overview
BEGIN -- 25.6 MySQL Enterprise Firewall Overview end -- 25.6 MySQL Enterprise Firewall Overview
BEGIN -- 25.7 MySQL Enterprise Thread Pool Overview end -- 25.7 MySQL Enterprise Thread Pool Overview
BEGIN -- 26 MySQL Workbench end -- 26 MySQL Workbench
BEGIN -- A MySQL 5.5 Frequently Asked Questions end -- A MySQL 5.5 Frequently Asked Questions
BEGIN -- A.1 MySQL 5.5 FAQ: General end -- A.1 MySQL 5.5 FAQ: General
BEGIN -- A.2 MySQL 5.5 FAQ: Storage Engines end -- A.2 MySQL 5.5 FAQ: Storage Engines
BEGIN -- A.3 MySQL 5.5 FAQ: Server SQL Mode end -- A.3 MySQL 5.5 FAQ: Server SQL Mode
BEGIN -- A.4 MySQL 5.5 FAQ: Stored Procedures and Functions end -- A.4 MySQL 5.5 FAQ: Stored Procedures and Functions
BEGIN -- A.5 MySQL 5.5 FAQ: Triggers end -- A.5 MySQL 5.5 FAQ: Triggers
BEGIN -- A.6 MySQL 5.5 FAQ: Views end -- A.6 MySQL 5.5 FAQ: Views
BEGIN -- A.7 MySQL 5.5 FAQ: INFORMATION_SCHEMA end -- A.7 MySQL 5.5 FAQ: INFORMATION_SCHEMA
BEGIN -- A.8 MySQL 5.5 FAQ: Migration end -- A.8 MySQL 5.5 FAQ: Migration
BEGIN -- A.9 MySQL 5.5 FAQ: Security end -- A.9 MySQL 5.5 FAQ: Security
BEGIN -- A.10 MySQL FAQ: MySQL 5.5 and NDB Cluster end -- A.10 MySQL FAQ: MySQL 5.5 and NDB Cluster
BEGIN -- A.11 MySQL 5.5 FAQ: MySQL Chinese, Japanese, and Korean Character Sets end -- A.11 MySQL 5.5 FAQ: MySQL Chinese, Japanese, and Korean Character Sets
BEGIN -- A.12 MySQL 5.5 FAQ: Connectors & APIs end -- A.12 MySQL 5.5 FAQ: Connectors & APIs
BEGIN -- A.13 MySQL 5.5 FAQ: Replication end -- A.13 MySQL 5.5 FAQ: Replication
BEGIN -- A.14 MySQL 5.5 FAQ: MySQL Enterprise Thread Pool end -- A.14 MySQL 5.5 FAQ: MySQL Enterprise Thread Pool
BEGIN -- A.15 MySQL 5.5 FAQ: InnoDB Change Buffer end -- A.15 MySQL 5.5 FAQ: InnoDB Change Buffer
BEGIN -- A.16 MySQL 5.5 FAQ: Virtualization Support end -- A.16 MySQL 5.5 FAQ: Virtualization Support

-- all end
