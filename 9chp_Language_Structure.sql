BEGIN -- 9 Language Structure 

BEGIN -- 9.1 Literal Values 

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

BEGIN -- 9.2 Schema Object Names 

BEGIN -- 9.2.1 Identifier Qualifiers ok



END -- 9.2.1 Identifier Qualifiers 

BEGIN -- 9.2.2 Identifier Case Sensitivity ok

SELECT * FROM my_table WHERE my_table.col=1;

RENAME TABLE t1 TO t2;


END -- 9.2.2 Identifier Case Sensitivity 

BEGIN -- 9.2.3 Mapping of Identifiers to File Names 

END -- 9.2.3 Mapping of Identifiers to File Names 

BEGIN -- 9.2.4 Function Name Parsing and Resolution 

END -- 9.2.4 Function Name Parsing and Resolution 

END -- 9.2 Schema Object Names 


BEGIN -- 9.3 Keywords and Reserved Words 
END -- 9.3 Keywords and Reserved Words 
BEGIN -- 9.4 User-Defined Variables 
END -- 9.4 User-Defined Variables 
BEGIN -- 9.5 Expression Syntax 
END -- 9.5 Expression Syntax 
BEGIN -- 9.6 Comment Syntax 
END -- 9.6 Comment Syntax 
END -- 9 Language Structure 
