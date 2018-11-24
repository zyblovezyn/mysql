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

BEGIN -- 11.1.2 Date and Time Type Overview 

END -- 11.1.2 Date and Time Type Overview

BEGIN -- 11.1.3 String Type Overview 

END -- 11.1.3 String Type Overview

END -- 11.1 Data Type Overview

BEGIN -- 11.2 Numeric Types 

BEGIN -- 11.2.1 Integer Types (Exact Value) - INTEGER, INT, SMALLINT, TINYINT, MEDIUMINT, BIGINT 

END -- 11.2.1 Integer Types (Exact Value) - INTEGER, INT, SMALLINT, TINYINT, MEDIUMINT, BIGINT

BEGIN -- 11.2.2 Fixed-Point Types (Exact Value) - DECIMAL, NUMERIC

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