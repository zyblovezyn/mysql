BEGIN -- Chapter 11 Data Type

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

BEGIN -- 11.2 Numeric Types

BEGIN -- 11.2.1 Integer Types (Exact Value) - INTEGER, INT, SMALLINT, TINYINT, MEDIUMINT, BIGINT ok

END -- 11.2.1 Integer Types (Exact Value) - INTEGER, INT, SMALLINT, TINYINT, MEDIUMINT, BIGINT

BEGIN -- 11.2.2 Fixed-Point Types (Exact Value) - DECIMAL, NUMERIC ok

END -- 11.2.2 Fixed-Point Types (Exact Value) - DECIMAL, NUMERIC

BEGIN -- 11.2.3 Floating-Point Types (Approximate Value) - FLOAT, DOUBLE 

END -- 11.2.3 Floating-Point Types (Approximate Value) - FLOAT, DOUBLE

BEGIN -- 11.2.4 Bit-Value Type - BIT 

END -- 11.2.4 Bit-Value Type - BIT

BEGIN -- 11.2.5 Numeric Type Attributes 

END -- 11.2.5 Numeric Type Attributes

BEGIN -- 11.2.6 Out-of-Range and Overflow Handling 

END -- 11.2.6 Out-of-Range and Overflow Handling

END -- 11.2 Numeric Types

BEGIN -- 11.3 Date and Time Types 

BEGIN -- 11.3.1 The DATE, DATETIME, and TIMESTAMP Types 

END -- 11.3.1 The DATE, DATETIME, and TIMESTAMP Types

BEGIN -- 11.3.2 The TIME Type 

END -- 11.3.2 The TIME Type

BEGIN -- 11.3.3 The YEAR Type 

END -- 11.3.3 The YEAR Type

BEGIN -- 11.3.4 YEAR(2) Limitations and Migrating to YEAR(4) 

END -- 11.3.4 YEAR(2) Limitations and Migrating to YEAR(4)

BEGIN -- 11.3.5 Automatic Initialization and Updating for TIMESTAMP 

END -- 11.3.5 Automatic Initialization and Updating for TIMESTAMP

BEGIN -- 11.3.6 Fractional Seconds in Time Values 

END -- 11.3.6 Fractional Seconds in Time Values

BEGIN -- 11.3.7 Conversion Between Date and Time Types 

END -- 11.3.7 Conversion Between Date and Time Types

BEGIN -- 11.3.8 Two-Digit Years in Dates 

END -- 11.3.8 Two-Digit Years in Dates

END -- 11.3 Date and Time Types

BEGIN -- 11.4 String Types 

BEGIN -- 11.4.1 The CHAR and VARCHAR Types 

END -- 11.4.1 The CHAR and VARCHAR Types

BEGIN -- 11.4.2 The BINARY and VARBINARY Types 

END -- 11.4.2 The BINARY and VARBINARY Types

BEGIN -- 11.4.3 The BLOB and TEXT Types 

END -- 11.4.3 The BLOB and TEXT Types

BEGIN -- 11.4.4 The ENUM Type 

END -- 11.4.4 The ENUM Type

BEGIN -- 11.4.5 The SET Type 

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

END -- 11.6 Data Type Default Values

BEGIN -- 11.7 Data Type Storage Requirements 

END -- 11.7 Data Type Storage Requirements

BEGIN -- 11.8 Choosing the Right Type for a Column 

END -- 11.8 Choosing the Right Type for a Column

BEGIN -- 11.9 Using Data Types from Other Database Engines 

END -- 11.9 Using Data Types from Other Database Engines

END -- Chapter 11 Data Type