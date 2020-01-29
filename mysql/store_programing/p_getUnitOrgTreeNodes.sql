
CALL base.p_getUnitOrgTreeNodes('1096FA0035D17535E05379FB31520001');
CALL base.p_getUnitOrgTreeNodes('1096FA0035D17535E05379FB31000001');
CALL base.p_getUnitOrgTreeNodes('8a812897493378a001495677ad086663');


-- version 3.0	date:2019-1-2	reason:change union to union all will be more fast
DROP PROCEDURE IF EXISTS base.p_getUnitOrgTreeNodes;
DELIMITER //
CREATE PROCEDURE base.p_getUnitOrgTreeNodes(IN org_no CHAR(40))
BEGIN

 DECLARE temp VARCHAR(50);
 DECLARE hasnum INT DEFAULT 0;
 DECLARE allorgs TEXT;
 DECLARE group_org VARCHAR(1000); 

 -- 显示有变电站的单位信息
 
DECLARE done INT DEFAULT 0;
DECLARE cur1 CURSOR FOR SELECT DISTINCT depart FROM cisp_dev.yc_substation;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;

OPEN cur1;
SET @orgNos='';
read_loop:LOOP

	FETCH FROM cur1 INTO temp;

	IF done THEN LEAVE read_loop;END IF;

	IF LENGTH(@orgNos)<=0 THEN 
		SET @orgNos=base.getAllParentsOrg(temp);
		ITERATE read_loop;
	END IF;
	SET @orgNos=CONCAT(@orgNos,',',base.getAllParentsOrg(temp));
	END LOOP;
CLOSE cur1;


SET @sqlstr1='select org.org_no as id,org.p_org_no as pId,org.p_org_no as parentId,org.org_name as name,1 as open,org_type from cisp_platform.bp_org org WHERE org.org_no=';
SET @sqlstr1=CONCAT(@sqlstr1,'\'',org_no,'\''); -- '8a812897493378a001495677ad086663'

SET allorgs=base.getAllChildOrg(org_no);
IF LENGTH(allorgs)>0 THEN
	
	IF STRCMP(org_no,'8a812897493378a001495677ad086663')=0 THEN		
		SET @inclause=base.delimiterStr(@orgNos,','); 
		SET @sqlstr=CONCAT('select * from (' ,@sqlstr1,'union SELECT distinct
					o.org_no AS id, o.p_org_no AS pId,o.p_org_no as parentId, o.org_name AS name, 0 AS open, o.org_type
				 
				    from cisp_platform.bp_org o 
					 
				WHERE o.org_no in ', @inclause,' and org_no !=\'',org_no,'\'',' ) as t left join base.bp_org_shortname org on t.id=org.org_no order by org.order_no');
	ELSE
		SET @inclause=base.getInClause(org_no);
		SET @sqlstr='select org_no AS id,p_org_no AS pId,p_org_no as parentId,org_name AS name,0 as open,org_type
		from cisp_platform.bp_org WHERE org_no is not null and p_org_no is not null and org_no';
		
		SET @sqlstr=CONCAT('select a.id,a.pId,a.name,a.org_type,a.open,a.parentId from (',@sqlstr,@inclause,' and org_no !=\'',org_no,'\' union all ',@sqlstr1,') as a left join base.bp_org_shortname org on a.id=org.org_no order by org.order_no');
	END IF; 
	-- SELECT @sqlstr;
	PREPARE stmt FROM @sqlstr;
	EXECUTE stmt;
	END IF;
END


-- version 2.0	date:2018-12-29	reason:order
DROP PROCEDURE IF EXISTS base.p_getUnitOrgTreeNodes;
DELIMITER //
CREATE PROCEDURE base.p_getUnitOrgTreeNodes(IN org_no CHAR(40))
BEGIN

 DECLARE temp VARCHAR(50);
 DECLARE hasnum INT DEFAULT 0;
 DECLARE allorgs TEXT;
 DECLARE group_org VARCHAR(1000); 

 -- 显示有变电站的单位信息
 
DECLARE done INT DEFAULT 0;
DECLARE cur1 CURSOR FOR SELECT DISTINCT depart FROM cisp_dev.yc_substation;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;

OPEN cur1;
SET @orgNos='';
read_loop:LOOP

	FETCH FROM cur1 INTO temp;

	IF done THEN LEAVE read_loop;END IF;

	IF LENGTH(@orgNos)<=0 THEN 
		SET @orgNos=base.getAllParentsOrg(temp);
		ITERATE read_loop;
	END IF;
	SET @orgNos=CONCAT(@orgNos,',',base.getAllParentsOrg(temp));
	END LOOP;
CLOSE cur1;


SET @sqlstr1='select org.org_no as id,org.p_org_no as pId,org.p_org_no as parentId,org.org_name as name,1 as open,org_type from cisp_platform.bp_org org WHERE org.org_no=';
SET @sqlstr1=CONCAT(@sqlstr1,'\'',org_no,'\''); -- '8a812897493378a001495677ad086663'

SET allorgs=base.getAllChildOrg(org_no);
IF LENGTH(allorgs)>0 THEN
	
	IF STRCMP(org_no,'8a812897493378a001495677ad086663')=0 THEN		
		SET @inclause=base.delimiterStr(@orgNos,','); 
		SET @sqlstr=CONCAT('select * from (' ,@sqlstr1,'union SELECT distinct
					o.org_no AS id, o.p_org_no AS pId,o.p_org_no as parentId, o.org_name AS name, 0 AS open, o.org_type
				 
				    from cisp_platform.bp_org o 
					 
				WHERE o.org_no in ', @inclause,' and org_no !=\'',org_no,'\'',' ) as t left join base.bp_org_shortname org on t.id=org.org_no order by org.order_no');
	ELSE
		SET @inclause=base.getInClause(org_no);
		SET @sqlstr='select org_no AS id,p_org_no AS pId,p_org_no as parentId,org_name AS name,0 as open,org_type
		from cisp_platform.bp_org WHERE org_no is not null and p_org_no is not null and org_no';
		
		SET @sqlstr=CONCAT('select a.id,a.pId,a.name,a.org_type,a.open,a.parentId from (',@sqlstr,@inclause,' and org_no !=\'',org_no,'\' union ',@sqlstr1,') as a left join base.bp_org_shortname org on a.id=org.org_no order by org.order_no');
	END IF; 
	-- SELECT @sqlstr;
	PREPARE stmt FROM @sqlstr;
	EXECUTE stmt;
	END IF;
END


-- version 1.0	date:2019-1-2	
DROP PROCEDURE IF EXISTS base.p_getUnitOrgTreeNodes;
DELIMITER //
CREATE PROCEDURE base.p_getUnitOrgTreeNodes(IN org_no CHAR(40))
BEGIN

 DECLARE temp VARCHAR(50);
 DECLARE hasnum INT DEFAULT 0;
 DECLARE allorgs TEXT;
 DECLARE group_org VARCHAR(1000);
 
 /* 显示所有单位信息
 
SET @sqlstr1='select org.org_no as id,ifnull(org.p_org_no,0) as pId,org.org_name as name,1 as open from cisp_platform.bp_org org WHERE org.org_no=';
SET @sqlstr1=CONCAT(@sqlstr1,'\'',org_no,'\''); -- '8a812897493378a001495677ad086663'

SET allorgs=base.getAllChildOrg(org_no);
IF LENGTH(allorgs)>0 THEN

	SET @sqlstr='select org_no AS id,p_org_no AS pId,org_name AS name,0 as open 
	from cisp_platform.bp_org WHERE org_no is not null and p_org_no is not null and org_no ';
	SET @sqlstr=CONCAT(@sqlstr,base.getInClause(org_no),'union ',@sqlstr1);

	PREPARE stmt FROM @sqlstr;
	EXECUTE stmt;
END IF;

*/

 -- 显示有变电站的单位信息
 
DECLARE done INT DEFAULT 0;
DECLARE cur1 CURSOR FOR SELECT DISTINCT depart FROM cisp_dev.yc_substation;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;

OPEN cur1;
SET @orgNos='';
read_loop:LOOP

	FETCH FROM cur1 INTO temp;

	IF done THEN LEAVE read_loop;END IF;

	IF LENGTH(@orgNos)<=0 THEN 
		SET @orgNos=base.getAllParentsOrg(temp);
		ITERATE read_loop;
	END IF;
	SET @orgNos=CONCAT(@orgNos,',',base.getAllParentsOrg(temp));
	END LOOP;
CLOSE cur1;
-- select @orgNos;
/*
SET @inclause='';
loopin:LOOP
		
		SET hasnum=LOCATE(',',@orgNos);
		IF hasnum<=0 THEN
			IF LENGTH(@orgNos)>0 THEN
				SET @inclause=CONCAT(@inclause,'\'',@orgNos,'\'');
				 						 						 
			END IF;
			LEAVE loopin;
		END IF;						 
		SET temp='';
		SET temp=SUBSTRING_INDEX(@orgNos,',',1);
		SET @orgNos=SUBSTRING(@orgNos,hasnum+1);
		SET @inclause=CONCAT(@inclause,'\'',temp,'\',');
	END LOOP;
-- select @inclause;
 */

SET @sqlstr1='select org.org_no as id,org.p_org_no as pId,org.p_org_no as parentId,org.org_name as name,1 as open,org_type from cisp_platform.bp_org org WHERE org.org_no=';
SET @sqlstr1=CONCAT(@sqlstr1,'\'',org_no,'\''); -- '8a812897493378a001495677ad086663'

SET allorgs=base.getAllChildOrg(org_no);
IF LENGTH(allorgs)>0 THEN
	
	IF STRCMP(org_no,'8a812897493378a001495677ad086663')=0 THEN		
		SET @inclause=base.delimiterStr(@orgNos,','); 
		SET @sqlstr=CONCAT('SELECT distinct
					o.org_no AS id, o.p_org_no AS pId,o.p_org_no as parentId, o.org_name AS name, 0 AS open, o.org_type
				 
				    from cisp_platform.bp_org o
					 
				WHERE o.org_no in ', @inclause,' and org_no !=\'',org_no,'\' union ',@sqlstr1);
	ELSE
		SET @inclause=base.getInClause(org_no);
		SET @sqlstr='select org_no AS id,p_org_no AS pId,p_org_no as parentId,org_name AS name,0 as open,org_type  
		from cisp_platform.bp_org WHERE org_no is not null and p_org_no is not null and org_no';
		
		SET @sqlstr=CONCAT('select a.id,a.pId,a.name,a.org_type,a.open,a.parentId from (',@sqlstr,@inclause,' and org_no !=\'',org_no,'\' union ',@sqlstr1,') as a');
	END IF; 
	-- SELECT @sqlstr;
	PREPARE stmt FROM @sqlstr;
	EXECUTE stmt;
	END IF;
END




SELECT LEFT('1,2,3,422',LENGTH('1,2,3,422')-(LENGTH(SUBSTRING_INDEX('1,2,3,422',',',-1))+1));
SELECT org.org_no AS id,IFNULL(org.p_org_no,0) AS pId,org.org_name AS NAME,0 AS OPEN 
FROM cisp_platform.bp_org org WHERE org.p_org_no='8a812897493378a001495677ad086663';

SELECT * FROM cisp_platform.bp_org

SELECT DISTINCT s.depart FROM cisp_dev.yc_substation s

SELECT base.getAllParentsOrg('1096FA0035D17535E05379FB31520001');
CALL base.p_getUnitOrgTreeNodes('1096FA0035D17535E05379FB31000001');
CALL base.p_getUnitOrgTreeNodes('8a812897493378a001495677ad086663');

SELECT * FROM cisp_platform.bp_org WHERE org_no IN ('1096FA0035D17535E05379FB31510001','1096FA0035D17535E05379FB31000001','8a812897493378a001495677ad086663');

SELECT org.org_no AS id,org.p_org_no AS pId,org.org_name AS NAME,0 AS OPEN 
	FROM cisp_platform.bp_org org INNER JOIN tf_ywzbdz t ON t.ssds=org.org_no 
WHERE org.org_no IS NOT NULL AND org.p_org_no IS NOT NULL 

SELECT * FROM tf_ywzbdz t INNER JOIN cisp_platform.bp_org org ON t.ssds=org.org_no

CALL base.p_getUnitOrgTreeNodes('8a812897493378a001495677ad086663');
CALL base.p_getUnitOrgTreeNodes('1096FA0035D17535E05379FB31000001');


SELECT * FROM cisp_platform.bp_org WHERE p_org_no='8a812897493378a001495677ad086663'

SELECT base.getChildOrg('8a812897493378a001495677ad086663');




SELECT * FROM cisp_platform.bp_org WHERE p_org_no='1096FA0035D17535E05379FB31000001'

SELECT base.getChildOrg('1096FA0035D17535E05379FB31000001');