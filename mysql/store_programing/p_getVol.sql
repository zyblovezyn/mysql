 DROP PROCEDURE IF EXISTS p_getVol;
DELIMITER$$
-- 由于数据表改变所以一下代码废弃，仅作为参考
CREATE PROCEDURE p_getVol(IN org VARCHAR(200))
BEGIN
	DECLARE sqlstr VARCHAR(1000);
	DECLARE allorgs VARCHAR(1000);
	DECLARE hasnum INT;
	DECLARE temp VARCHAR(50);
	
	SET @sqlstr='SELECT DISTINCT 
			station.voltagelevel_id  AS stationVolCode,
			station.voltagelevel stationVolName
		     FROM base.tf_ywz ywz 
		INNER JOIN cisp_dev.yc_substation AS station 
			ON ywz.ywz_id = station.maintenance_team 
		WHERE 1 = 1
		AND ywz.lat IS NOT NULL
		AND ywz.lng IS NOT NULL
		AND ywz.useflag = 1
		AND station.lat IS NOT NULL
		AND station.lng IS NOT NULL'; 
	 
		-- 局信息
		IF ISNULL(org)=FALSE AND LENGTH(org)>0 THEN 
			SET allorgs=base.getAllChildOrg(org);
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
		SET @sqlstr=CONCAT(@sqlstr,' ORDER BY station.voltagelevel_id');
	  -- SELECT @sqlstr;	
	
	 PREPARE stmt FROM @sqlstr;
	 EXECUTE stmt;
END 
/* BEGIN
	DECLARE sqlstr VARCHAR(1000);
	DECLARE allorgs VARCHAR(1000);
	DECLARE hasnum INT;
	DECLARE temp VARCHAR(50);
	
	SET @sqlstr='SELECT DISTINCT vol.vol_code  AS stationVolCode,
                vol.vol_value stationVolName
  FROM tf_ywz ywz
 INNER JOIN(tf_substation AS station, tf_voltagelevel AS vol)
    ON (station.vol_id = vol.vol_code AND
       (ywz.ywz_id = station.ywzid OR
       LOCATE(\',\', station.ywzid) > 0 AND
       SUBSTRING_INDEX(station.ywzid, \',\', 1) = ywz.ywz_id))
 WHERE 1 = 1
   AND ywz.lat IS NOT NULL
   AND station.lat IS NOT NULL'; 
	 
		-- 局信息
		IF ISNULL(org)=FALSE AND LENGTH(org)>0 THEN 
			SET allorgs=base.getAllChildOrg(org);
			SET @sqlstr=CONCAT(@sqlstr,' and station.subburo in (');
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
		SET @sqlstr=CONCAT(@sqlstr,' ORDER BY vol.vol_code');
	  SELECT @sqlstr;	
	
	 PREPARE stmt FROM @sqlstr;
	 EXECUTE stmt;
END */
     
     
     
CALL base.p_getVol('1096FA0035D17535E05379FB31000001')            


SELECT * FROM cisp_dev.yc_substation  WHERE voltagelevel_id='33' 
UPDATE cisp_dev.yc_substation SET voltagelevel_id='33' ,voltagelevel='交流220kV'    WHERE id= '30000000-102415259'   
 

 