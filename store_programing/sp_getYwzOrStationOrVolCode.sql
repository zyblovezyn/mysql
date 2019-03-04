
CALL base.sp_getYwzOrStationOrVolCode('8a812897493378a001495677ad086663','1096FA0035D17535E05379FB31000496','');
CALL base.sp_getYwzOrStationOrVolCode('8a812897493378a001495677ad086663','1096FA0035D17535E05379FB31000496,1096FA0035D17535E05379FB00301202','33,32');
CALL base.sp_getYwzOrStationOrVolCode('1096FA0035D17535E05379FB31210000',NULL,'35');
CALL base.sp_getYwzOrStationOrVolCode('8a812897493378a001495677ad086663',NULL,'');
CALL base.sp_getYwzOrStationOrVolCode('8a812897493378a001495677ad086663',NULL,'');


# version 2.0     function: 获取运维站 变电站 电压等级信息 都是有设备的，没有设备的信息过滤掉
# reason:fix bug volcode filter 
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



# version 1.0     function:获取运维站 变电站 电压等级信息 都是有设备的，没有设备的信息过滤掉
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


SELECT * FROM tf_ywzbdz_vol_exists_device WHERE ywzid='1096FA0035D17535E05379FB31000496'

SELECT * FROM cisp_dev.yc_substation s
INNER JOIN cisp_dev.v_all_dev d ON d.SUBSTATION_ID=s.id
WHERE s.id='30000000-102415271'


SELECT * FROM cisp_dev.v_all_dev

SELECT * FROM cisp_dev.yc_substation s
WHERE NAME LIKE '%天湖%'

SELECT DISTINCT
     dev.depart AS org_no, ywz.whbz AS ywzid, ywz.whbzmc AS ywzname,dev.substation_id AS stationid, dev.substation_name AS stationname,dev.voltagelevel_id AS volcode,dev.voltagelevel AS volname
FROM
     cisp_dev.v_all_dev dev
     LEFT JOIN base.tf_ywzbdz ywz
          ON dev.MAINTENANCE_TEAM = ywz.whbz
WHERE ywz.whbz IS NOT NULL AND dev.substation_name LIKE '%天湖%'

SELECT * FROM cisp_dev.v_all_dev WHERE substation_name LIKE '%天湖%'
SELECT * FROM base.tf_ywzbdz ywz WHERE bdzmc LIKE '%天湖%'
SELECT * FROM base.tf_ywzbdz ywz WHERE whbz='1096FA0035D17535E05379FB31000010'

