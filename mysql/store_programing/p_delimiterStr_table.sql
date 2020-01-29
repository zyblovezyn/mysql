DROP PROCEDURE IF EXISTS base.p_delimiterStr_table;

DELIMITER//
CREATE PROCEDURE base.p_delimiterStr_table(IN str TEXT,IN delimiter_char CHAR(1))
BEGIN
-- 
-- 	分隔字符串 str:要分隔的字符
-- 		     delimiter_char:分隔符,只允许一个字符的分隔符，多字符会产生替换冲突。
-- 
-- 
 	DECLARE position_num INT;
	DECLARE temp VARCHAR(50);
	DROP TEMPORARY TABLE base.temptables;
	CREATE TEMPORARY TABLE base.temptables(id VARCHAR(20));
	SET @result='(';

	IF ISNULL(str)=FALSE AND LENGTH(str)>0 THEN 
		loopin:LOOP
			SET position_num=LOCATE(delimiter_char,str);
			IF position_num<=0 THEN
				IF LENGTH(str)>0 THEN
					#SET @result=CONCAT(@result,'\'',str,'\'');	
					INSERT INTO temptables VALUES(str);				 
				END IF;
				LEAVE loopin;
			END IF;
			SET temp=SUBSTRING_INDEX(str,delimiter_char,1);
			SET str=SUBSTRING(str,position_num+1);
			#SET @result=CONCAT(@result,'\'',temp,'\',');
			INSERT INTO temptables VALUES(temp);			
	        END LOOP;
	END IF;
	
	#SET @result=CONCAT(@result,')');
	#SELECT @result;
	SELECT * FROM temptables;
END

CALL base.p_delimiterStr_table('1,2,3',',');

