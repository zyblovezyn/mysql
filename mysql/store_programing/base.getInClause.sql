DROP FUNCTION IF EXISTS base.getInClause;
DELIMITER //
CREATE FUNCTION base.getInClause(org_no CHAR(50)) RETURNS TEXT CHARSET utf8
BEGIN
 DECLARE temp VARCHAR(50);
 DECLARE hasnum INT DEFAULT 0;
 DECLARE allorgs TEXT(50000);
 DECLARE group_org VARCHAR(1000);
 SET @inclause=' in (';
-- 局信息
IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
	SET allorgs=base.getAllChildOrg(org_no);
	-- IF LENGTH(allorgs)>0 THEN
-- 		SET allorgs=RIGHT(allorgs,LENGTH(allorgs)-4);
-- 	END IF;
		-- select allorgs;
	-- sET @sqlstr=CONCAT(@sqlstr,' AND station.depart IN (');
	loopin:LOOP
		SET hasnum=LOCATE(',',allorgs);
		IF hasnum<=0 THEN
			IF LENGTH(allorgs)>0 THEN
				SET @inclause=CONCAT(@inclause,'\'',allorgs,'\'');
				 						 						 
			END IF;
			LEAVE loopin;
		END IF;						 
		SET temp='';
		SET temp=SUBSTRING_INDEX(allorgs,',',1);
		SET allorgs=SUBSTRING(allorgs,hasnum+1);
		SET @inclause=CONCAT(@inclause,'\'',temp,'\',');
	END LOOP;
	SET @inclause=CONCAT(@inclause,')');
END IF;
RETURN @inclause;
END;
