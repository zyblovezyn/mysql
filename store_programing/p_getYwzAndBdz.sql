DROP PROCEDURE IF EXISTS p_getYwzAndBdz;
DELIMITER$$
-- 
CREATE PROCEDURE p_getYwzAndBdz(IN org VARCHAR(200))
BEGIN
	DECLARE sqlstr VARCHAR(1000);
	DECLARE allorgs VARCHAR(1000);
	DECLARE hasnum INT;
	DECLARE temp VARCHAR(50);
	
	SET @sqlstr='SELECT DISTINCT'; 
	SET @sqlstr=CONCAT(@sqlstr,' ywz.ywz_id', ' \"','id','\",');
	SET @sqlstr=CONCAT(@sqlstr,' ywz.ywz_name', ' \"','name','\",');
	SET @sqlstr=CONCAT(@sqlstr,' ywz.lng', ' \"','ywzx','\",');
	SET @sqlstr=CONCAT(@sqlstr,' ywz.lat', ' \"','ywzy','\",');
	SET @sqlstr=CONCAT(@sqlstr,' station.id', ' \"','s_id','\",');
	SET @sqlstr=CONCAT(@sqlstr,' station.name', ' \"','s_name','\",');
	SET @sqlstr=CONCAT(@sqlstr,' station.lng', ' \"','s_x','\",');
	SET @sqlstr=CONCAT(@sqlstr,' station.lat', ' \"','s_y','\",');
	SET @sqlstr=CONCAT(@sqlstr,' station.voltagelevel_id', ' \"','s_volcode','\",');
	SET @sqlstr=CONCAT(@sqlstr,' station.voltagelevel', ' \"','s_volname','\"');
	SET @sqlstr=CONCAT(@sqlstr,' FROM base.tf_ywz ywz 
		INNER JOIN cisp_dev.yc_substation AS station 
			ON ywz.ywz_id = station.maintenance_team 
		WHERE 1 = 1
		AND ywz.lat IS NOT NULL
		AND ywz.lng IS NOT NULL
		AND ywz.useflag = 1
		AND station.lat IS NOT NULL
		AND station.lng IS NOT NULL ');
		-- 局信息
		IF ISNULL(org)=FALSE AND LENGTH(org)>0 THEN 
			SET allorgs=base.getAllChildOrg(org);
			SET allorgs=RIGHT(allorgs,LENGTH(allorgs)-2);	-- 去掉开头的'$,'		 
			SET @sqlstr=CONCAT(@sqlstr,' and station.depart in (');
			 loop3:LOOP
				SET hasnum=LOCATE(',',allorgs);
				IF hasnum<=0 THEN
					IF LENGTH(allorgs)>0 THEN
						SET @sqlstr=CONCAT(@sqlstr,'\'',allorgs,'\'');
					ELSE
						SET @sqlstr=LEFT(@sqlstr,LENGTH(@sqlstr)-1);
					END IF;
					LEAVE loop3;
				END IF;
				SET temp='';
				SET temp=SUBSTRING_INDEX(allorgs,',',1);
				SET allorgs=SUBSTRING(allorgs,hasnum+1);
				SET @sqlstr=CONCAT(@sqlstr,'\'',temp,'\',');	
			
		        END LOOP;
			SET @sqlstr=CONCAT(@sqlstr,')');
			-- SET @sqlstr=CONCAT(@sqlstr,' FIND_IN_SET(s.subburo,base.getAllChildOrg(\'',org,'\'))>0');
		END IF;
	 -- SELECT @sqlstr;	
	
	 PREPARE stmt FROM @sqlstr;
	 EXECUTE stmt;
END

-- 2018-11-20 优化
SELECT base.getAllChildOrg('1096FA0035D17535E05379FB31000001');
SELECT RIGHT(base.getAllChildOrg('1096FA0035D17535E05379FB31000001'),LENGTH(base.getAllChildOrg('1096FA0035D17535E05379FB31000001'))-2);
SELECT RIGHT('123',-1);
SELECT base.getAllChildOrg('1096FA0035D17535E05379FB31000000001');

SELECT SUBSTRING_INDEX('$,1096FA0035D17535E05379FB31000001,1096FA0035D17535E05379FB31510001',',',1);
SELECT SUBSTRING('$,1096FA0035D17535E05379FB31000001,1096FA0035D17535E05379FB31510001',LOCATE(',','$,1096FA0035D17535E05379FB31000001,1096FA0035D17535E05379FB31510001')+1);

SELECT SUBSTRING_INDEX('1096FA0035D17535E05379FB31000001,1096FA0035D17535E05379FB31510001',',',1);
SELECT SUBSTRING('1096FA0035D17535E05379FB31000001,1096FA0035D17535E05379FB31510001',LOCATE(',','1096FA0035D17535E05379FB31000001,1096FA0035D17535E05379FB31510001')+1);

SELECT SUBSTRING_INDEX('1096FA0035D17535E05379FB31510001',',',1);
`getAllChildOrg`
SELECT LOCATE(',','1,2,3,4');

/*
	

*/     		
     
DROP PROCEDURE p_getYwzAndBdz   
    
CALL base.p_getYwzAndBdz('1096FA0035D17535E05379FB31000001')  





SELECT * FROM base.tf_ywz    WHERE ywz_name LIKE '%霞湾%'   

UPDATE base.tf_ywz SET lng='120.147216',lat='30.301584' WHERE ywz_id='1096FA0035D17535E05379FB31000503'

SELECT * FROM cisp_platform.bp_org WHERE org_no='1096FA0035D17535E05379FB50152672'    
            
SELECT * FROM cisp_dev.`yc_substation`


SHOW CREATE TABLE cisp_dev.yc_substation

 