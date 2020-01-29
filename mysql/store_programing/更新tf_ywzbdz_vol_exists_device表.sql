    
        
CREATE TABLE base.tf_ywzbdz_vol_exists_device AS     
SELECT DISTINCT
     dev.depart AS org_no, ywz.whbz AS ywzid, ywz.whbzmc AS ywzname, dev.substation_id AS stationid, dev.substation_name AS stationname, dev.voltagelevel_id AS volcode, dev.voltagelevel AS volname
FROM
     cisp_dev.v_all_dev dev
     LEFT JOIN cisp_dev.yc_substation station
          ON dev.substation_id = station.id
     LEFT JOIN base.tf_ywzbdz ywz
          ON ywz.zyid = station.id
WHERE ywz.whbz IS NOT NULL;


TRUNCATE base.tf_ywzbdz_vol_exists_device ;
INSERT INTO base.tf_ywzbdz_vol_exists_device
SELECT DISTINCT
     dev.depart AS org_no, ywz.whbz AS ywzid, ywz.whbzmc AS ywzname, dev.substation_id AS stationid, dev.substation_name AS stationname, dev.voltagelevel_id AS volcode, dev.voltagelevel AS volname
FROM
     cisp_dev.v_all_dev dev
     LEFT JOIN cisp_dev.yc_substation station
          ON dev.substation_id = station.id
     LEFT JOIN base.tf_ywzbdz ywz
          ON ywz.whbz = station.maintenance_team;

ALTER TABLE base.tf_ywzbdz_vol_exists_device ADD KEY (stationid)

-- 更新tf_ywzbdz_vol_exists_device表
DROP PROCEDURE IF EXISTS base.sp_update_tf_ywzbdz_vol_exists_device;
DELIMITER //
CREATE PROCEDURE base.sp_update_tf_ywzbdz_vol_exists_device ()
BEGIN
     -- TRUNCATE base.tf_ywzbdz_vol_exists_device;     
     INSERT INTO base.tf_ywzbdz_vol_exists_device 
     SELECT DISTINCT
		dev.depart AS org_no, ywz.whbz AS ywzid, ywz.whbzmc AS ywzname, station.id AS stationid, station.name AS stationname, dev.voltagelevel_id AS volcode, dev.voltagelevel AS volname
		FROM
		cisp_dev.v_all_dev dev
		LEFT JOIN cisp_dev.yc_substation station
			ON dev.substation_id = station.id
		LEFT JOIN base.tf_ywzbdz ywz
			ON ywz.whbz = station.maintenance_team
     WHERE ywz.whbz IS NOT NULL AND dev.substation_id NOT IN (SELECT stationid FROM tf_ywzbdz_vol_exists_device);
     
END 
//
DELIMITER ;


SELECT * FROM cisp_dev.yc_substation

-- 创建定时更新事件 3 分钟更新一次
DROP EVENT base.update_tf_ywzbdz_vol_exists_device;

CREATE EVENT base.update_tf_ywzbdz_vol_exists_device
ON SCHEDULE EVERY 3 MINUTE DO CALL base.sp_update_tf_ywzbdz_vol_exists_device ();



SELECT * FROM cisp_dev.v_all_dev      
 SELECT * FROM cisp_dev.yc_substation
 
 SELECT * FROM base.tf_ywzbdz
 
 SELECT * FROM base.tf_ywzbdz_vol_exists_device 
 
 
 
 
 -- 查询单位下的运维站有设备的
DROP PROCEDURE IF EXISTS base.sp_getyYwzByOrgNo;

DELIMITER //

CREATE PROCEDURE base.sp_getyYwzByOrgNo (IN org_no CHAR(50))
BEGIN
     SET @sqlstr = CONCAT(
          'select distinct ywzId,ywzName from base.tf_ywzbdz_vol_exists_device where org_no', base.getInClause (org_no)
     );
     PREPARE stmt FROM @sqlstr;
     EXECUTE stmt;
END;
 
 
CALL base.sp_getyYwzByOrgNo('8a812897493378a001495677ad086663');
CALL base.sp_getyYwzByOrgNo('1096FA0035D17535E05379FB31000001');
CALL base.sp_getyYwzByOrgNo('1096FA0035D17535E05379FB31210000');



DROP PROCEDURE IF EXISTS base.sp_getYwzOrStationOrVolCode;

DELIMITER //
CREATE PROCEDURE base.sp_getYwzOrStationOrVolCode (
     IN org_no CHAR(64), IN ywzid MEDIUMTEXT,IN volcode MEDIUMTEXT
)
BEGIN
	SET @sqlstr=CONCAT('SELECT
					org_no, ywzid, ywzname, stationid, stationname, volcode, volname
				   FROM
					base.tf_ywzbdz_vol_exists_device where org_no',base.getInClause(org_no));
					
	IF ISNULL(ywzid)=FALSE AND LENGTH(ywzid)>0 THEN
		-- SET @ywzids=base.delimiterStr(ywzid);
		SET @sqlstr=CONCAT(@sqlstr,' and ywzid in ',base.delimiterStr(ywzid,','));
	END IF;
	
	IF ISNULL(volcode)=FALSE AND LENGTH(volcode)>0 THEN
		-- SET @volcodes=base.delimiterStr(volcode);
		SET @sqlstr=CONCAT(@sqlstr,' and volcode in ',base.delimiterStr(volcode,','));
	END IF;	
	-- select @sqlstr;
	SET @sqlstr=CONCAT(@sqlstr,'order by volcode desc');				 
	PREPARE stmt FROM @sqlstr;
	EXECUTE stmt;
END  

 
CALL base.sp_getYwzOrStationOrVolCode('8a812897493378a001495677ad086663','','');
CALL base.sp_getYwzOrStationOrVolCode('8a812897493378a001495677ad086663','1096FA0035D17535E05379FB31000496,1096FA0035D17535E05379FB00301202','33,32');
CALL base.sp_getYwzOrStationOrVolCode('1096FA0035D17535E05379FB31210000',NULL,NULL);

