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

END -- examples

END -- 12.7 Date and Time Functions