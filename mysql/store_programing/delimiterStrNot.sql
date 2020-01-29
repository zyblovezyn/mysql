DROP FUNCTION IF EXISTS base.delimiterStrNot;

DELIMITER//
CREATE FUNCTION base.delimiterStrNot(str TEXT,delimiter_char CHAR(1)) RETURNS TEXT CHARSET utf8
BEGIN
-- 
-- 	分隔字符串 str:要分隔的字符
-- 		     delimiter_char:分隔符,只允许一个字符的分隔符，多字符会产生替换冲突。
-- 
-- 
 	DECLARE position_num INT;
	DECLARE temp VARCHAR(50);

	SET @result='';

	IF ISNULL(str)=FALSE AND LENGTH(str)>0 THEN 
		loopin:LOOP
			SET position_num=LOCATE(delimiter_char,str);
			IF position_num<=0 THEN
				IF LENGTH(str)>0 THEN
					SET @result=CONCAT(@result,'\'',str,'\'');					 
				END IF;
				LEAVE loopin;
			END IF;
			SET temp=SUBSTRING_INDEX(str,delimiter_char,1);
			SET str=SUBSTRING(str,position_num+1);
			SET @result=CONCAT(@result,'\'',temp,'\',');	
	        END LOOP;
	END IF;
	
	SET @result=CONCAT(@result,'');
	RETURN (SELECT @result);
END
