BEGIN	#test

CALL base.p_queryAlarm_v2_count('1096FA0035D17535E05379FB31000001','','33,25,32','','','','','2018-11-01','2018-12-20','','','0','10000');
CALL base.p_queryAlarm_v2_count('8a812897493378a001495677ad086663','','33,25,32','','','','','2018-12-26','2018-12-28','','');

CALL base.p_queryAlarm_v2_count('1096FA0035D17535E05379FB31000001','','','30000000-102415259','','','','','','','','0','15');
CALL base.p_queryAlarm_v2_count('1096FA0035D17535E05379FB31000001','1096FA0035D17535E05379FB31000502','','','','','','','','','0','15');
CALL base.p_queryAlarm_v2_count('1096FA0035D17535E05379FB31000001','','','30000000-102415569','','','3','','','','','0','15');
CALL base.p_queryAlarm_v2_count('1096FA0035D17535E05379FB31000001','','','','','','3','','','','','0','1000');
CALL base.p_queryAlarm_v2_count('1096FA0035D17535E05379FB31000001','','','','','','3','','','','0','0','1000');

CALL base.p_queryAlarm_v2_count('1096FA0035D17535E05379FB31000001','','','','POWERENVIOR','','','2018-12-24','2018-12-26','','0');
CALL base.p_queryAlarm_v2_count('1096FA0035D17535E05379FB31000001','','','','','','','2019-1-7','2019-1-9','','');
CALL base.p_queryAlarm_v2_count('8a812897493378a001495677ad086663','','','','','','5','2019-1-7',NOW(),'0','0');


SELECT COUNT(*) FROM cisp_platform.me_soe

END

SELECT * FROM base.tf_ywz_bdz_vol_device dev;


# version:2.0	date:2019-1-8	reason: 优化 
DROP PROCEDURE IF EXISTS base.p_queryAlarm_v2_count;

DELIMITER $$

CREATE PROCEDURE base.p_queryAlarm_v2_count (IN org_no VARCHAR(40),IN ywzId MEDIUMTEXT,IN volCode MEDIUMTEXT,IN stationId MEDIUMTEXT,
						IN subSystem VARCHAR(30),IN devTypeId TEXT,IN eventLevel VARCHAR(4),
						IN startDate VARCHAR(20),IN endDate VARCHAR(20),IN isProcessed VARCHAR(2),
						IN isReturn VARCHAR(1))
BEGIN
	DECLARE is_p_org_no BOOL;
     SET @sqlstr = CONCAT('SELECT
					COUNT(*) AS total
					FROM
					base.tf_ywz_bdz_vol_device dev					 
					JOIN cisp_platform.me_soe soe
						ON dev.pointid = soe.measurepoint_id					 
					WHERE soe.isalarm = 1 ');	
	
	IF ISNULL(volCode)=FALSE AND LENGTH(volCode)>0 THEN 
		SET @volid=base.delimiterStr(volCode,',');
		SET @sqlstr=CONCAT(@sqlstr,' and dev.volcode in ',@volid);END IF;
	
	IF ISNULL(stationId)=FALSE AND LENGTH(stationId)>0 THEN 
		SET @stationids=base.delimiterStr(stationId,',');
		SET @sqlstr=CONCAT(@sqlstr,' and dev.stationid in ',@stationids);END IF;
	
	IF ISNULL(devTypeId)=FALSE AND LENGTH(devTypeId)>0 THEN 
		SET @devtypeids=base.delimiterStr(devTypeId,',');
		SET @sqlstr=CONCAT(@sqlstr,' and dev.devtype in ',@devtypeids);END IF;
	
	IF ISNULL(ywzId)=FALSE AND LENGTH(ywzId)>0 THEN 
		SET @ywzids=base.delimiterStr(ywzId,',');
		SET @sqlstr=CONCAT(@sqlstr,' and dev.ywzid in ',@ywzids);END IF;
	
	IF ISNULL(eventLevel)=FALSE AND LENGTH(eventLevel)>0 THEN 
		SET @sqlstr=CONCAT(@sqlstr,' and soe.eventlevel=\'',eventLevel,'\'');END IF;
	IF ISNULL(subSystem)=FALSE AND LENGTH(subSystem)>0 THEN 
		SET @sqlstr=CONCAT(@sqlstr,' and dev.subsystem=\'',subSystem,'\'');END IF;
	
	IF ISNULL(startDate)=FALSE AND LENGTH(startDate)>0 THEN
		SET @sqlStartDate=STR_TO_DATE(CONCAT(startDate,' 0:0:1'),'%Y-%m-%d %H:%i:%s');
		SET @sqlstr=CONCAT(@sqlstr,' and soe.t>=\'',@sqlStartDate,'\'');
		END IF;
	
	IF ISNULL(endDate)=FALSE AND LENGTH(endDate)>0 THEN 
		SET @sqlEndDate=STR_TO_DATE(IF(TO_DAYS(endDate)=TO_DAYS(NOW()),NOW(),CONCAT(endDate,' 23:59:59')),'%Y-%m-%d %H:%i:%s');
		SET @sqlstr=CONCAT(@sqlstr,' and soe.t<=\'',@sqlEndDate,'\'');
		END IF;
			
	IF ISNULL(isProcessed)=FALSE AND LENGTH(isProcessed)>0 THEN SET @sqlstr=CONCAT(@sqlstr,' and soe.isProcessed=\'',isProcessed,'\'');END IF;
	
	IF ISNULL(isReturn)=FALSE AND LENGTH(isReturn)>0 THEN SET @sqlstr=CONCAT(@sqlstr,' and soe.isReturn=\'',isReturn,'\'');END IF;
	
	IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
		IF STRCMP('8a812897493378a001495677ad086663',org_no)=0 THEN
			SET @sqlstr=CONCAT(@sqlstr,'');
		ELSE
			SELECT COUNT(1)>0 INTO is_p_org_no FROM base.bp_org_shortname org WHERE org.p_org_no=org_no; #is_p_org_no=1 市局 0 县局
			IF is_p_org_no THEN
				SET @sqlstr=CONCAT(@sqlstr,' and dev.p_org_no=\'',org_no,'\'');
			ELSE
				SET @sqlstr=CONCAT(@sqlstr,' and dev.org_no=\'',org_no,'\'');
			END IF;
			#SET @sqlstr=CONCAT(@sqlstr,' and dev.org_no',base.getInClause(org_no));
		END IF;
	END IF;
	
	-- SELECT @sqlstr;
	# needed out select for order by clause
	PREPARE stmt FROM @sqlstr;
	EXECUTE stmt;	
END




# version:2.0	date:2019-1-8	reason: 优化 
DROP PROCEDURE IF EXISTS base.p_queryAlarm_v2_count;

DELIMITER $$

CREATE PROCEDURE base.p_queryAlarm_v2_count (IN org_no VARCHAR(40),IN ywzId MEDIUMTEXT,IN volCode MEDIUMTEXT,IN stationId MEDIUMTEXT,
						IN subSystem VARCHAR(30),IN devTypeId TEXT,IN eventLevel VARCHAR(4),
						IN startDate VARCHAR(20),IN endDate VARCHAR(20),IN isProcessed VARCHAR(2),
						IN isReturn VARCHAR(1))
BEGIN
	DECLARE is_p_org_no BOOL;
     SET @sqlstr = CONCAT('SELECT
					COUNT(*) AS total
					FROM
					base.tf_ywz_bdz_vol_device dev					 
					JOIN cisp_platform.me_soe soe
						ON dev.pointid = soe.measurepoint_id					 
					WHERE soe.isalarm = 1 ');	
	
	IF ISNULL(volCode)=FALSE AND LENGTH(volCode)>0 THEN 
		SET @volid=base.delimiterStr(volCode,',');
		SET @sqlstr=CONCAT(@sqlstr,' and dev.volcode in ',@volid);END IF;
	
	IF ISNULL(stationId)=FALSE AND LENGTH(stationId)>0 THEN 
		SET @stationids=base.delimiterStr(stationId,',');
		SET @sqlstr=CONCAT(@sqlstr,' and dev.stationid in ',@stationids);END IF;
	
	IF ISNULL(devTypeId)=FALSE AND LENGTH(devTypeId)>0 THEN 
		SET @devtypeids=base.delimiterStr(devTypeId,',');
		SET @sqlstr=CONCAT(@sqlstr,' and dev.devtype in ',@devtypeids);END IF;
	
	IF ISNULL(ywzId)=FALSE AND LENGTH(ywzId)>0 THEN 
		SET @ywzids=base.delimiterStr(ywzId,',');
		SET @sqlstr=CONCAT(@sqlstr,' and dev.ywzid in ',@ywzids);END IF;
	
	IF ISNULL(eventLevel)=FALSE AND LENGTH(eventLevel)>0 THEN 
		SET @sqlstr=CONCAT(@sqlstr,' and soe.eventlevel=\'',eventLevel,'\'');END IF;
	IF ISNULL(subSystem)=FALSE AND LENGTH(subSystem)>0 THEN 
		SET @sqlstr=CONCAT(@sqlstr,' and dev.subsystem=\'',subSystem,'\'');END IF;
	
	IF ISNULL(startDate)=FALSE AND LENGTH(startDate)>0 THEN
		SET @sqlStartDate=STR_TO_DATE(CONCAT(startDate,' 0:0:1'),'%Y-%m-%d %H:%i:%s');
		SET @sqlstr=CONCAT(@sqlstr,' and soe.t>=\'',@sqlStartDate,'\'');
		END IF;
	
	IF ISNULL(endDate)=FALSE AND LENGTH(endDate)>0 THEN 
		SET @sqlEndDate=STR_TO_DATE(IF(TO_DAYS(endDate)=TO_DAYS(NOW()),NOW(),CONCAT(endDate,' 23:59:59')),'%Y-%m-%d %H:%i:%s');
		SET @sqlstr=CONCAT(@sqlstr,' and soe.t<=\'',@sqlEndDate,'\'');
		END IF;
			
	IF ISNULL(isProcessed)=FALSE AND LENGTH(isProcessed)>0 THEN SET @sqlstr=CONCAT(@sqlstr,' and soe.isProcessed=\'',isProcessed,'\'');END IF;
	
	IF ISNULL(isReturn)=FALSE AND LENGTH(isReturn)>0 THEN SET @sqlstr=CONCAT(@sqlstr,' and soe.isReturn=\'',isReturn,'\'');END IF;
	
	IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
		IF STRCMP('8a812897493378a001495677ad086663',org_no)=0 THEN
			SET @sqlstr=CONCAT(@sqlstr,'');
		ELSE
			SELECT COUNT(1)>0 INTO is_p_org_no FROM base.bp_org_shortname org WHERE org.p_org_no=org_no; #is_p_org_no=1 市局 0 县局
			IF is_p_org_no THEN
				SET @sqlstr=CONCAT(@sqlstr,' and dev.p_org_no=\'',org_no,'\'');
			ELSE
				SET @sqlstr=CONCAT(@sqlstr,' and dev.org_no=\'',org_no,'\'');
			END IF;
			#SET @sqlstr=CONCAT(@sqlstr,' and dev.org_no',base.getInClause(org_no));
		END IF;
	END IF;
	
	-- SELECT @sqlstr;
	# needed out select for order by clause
	PREPARE stmt FROM @sqlstr;
	EXECUTE stmt;	
END



# version:1.0	date:2018-12-27	reason: create sp to get count 
DROP PROCEDURE IF EXISTS base.p_queryAlarm_v2_count;

DELIMITER $$

CREATE PROCEDURE base.p_queryAlarm_v2_count (IN org_no VARCHAR(40),IN ywzId MEDIUMTEXT,IN volCode MEDIUMTEXT,IN stationId MEDIUMTEXT,
						IN subSystem VARCHAR(30),IN devTypeId TEXT,IN eventLevel VARCHAR(4),
						IN startDate VARCHAR(20),IN endDate VARCHAR(20),IN isProcessed VARCHAR(2),
						IN isReturn VARCHAR(1))
BEGIN
     SET @sqlstr = CONCAT('SELECT count(soe.soeid) as total
					FROM
					base.tf_ywz_bdz_vol_device dev
					 INNER JOIN cisp_platform.bp_org org
						ON dev.org_no = org.org_no					 
					left join cisp_platform.me_conf_measurepoint point
						on point.end_dev_id=dev.devid					 
					left JOIN cisp_platform.me_soe soe
						ON point.id = soe.measurepoint_id 
					WHERE soe.isalarm=1 ');	
	IF ISNULL(volCode)=FALSE AND LENGTH(volCode)>0 THEN 
		SET @volid=base.delimiterStr(volCode,',');
		SET @sqlstr=CONCAT(@sqlstr,' and dev.volcode in ',@volid);END IF;
	
	IF ISNULL(stationId)=FALSE AND LENGTH(stationId)>0 THEN 
		SET @stationids=base.delimiterStr(stationId,',');
		SET @sqlstr=CONCAT(@sqlstr,' and dev.stationid in ',@stationids);END IF;
	
	IF ISNULL(devTypeId)=FALSE AND LENGTH(devTypeId)>0 THEN 
		SET @devtypeids=base.delimiterStr(devTypeId,',');
		SET @sqlstr=CONCAT(@sqlstr,' and dev.devtype in ',@devtypeids);END IF;
	
	IF ISNULL(ywzId)=FALSE AND LENGTH(ywzId)>0 THEN 
		SET @ywzids=base.delimiterStr(ywzId,',');
		SET @sqlstr=CONCAT(@sqlstr,' and dev.ywzid in ',@ywzids);END IF;
	
	IF ISNULL(eventLevel)=FALSE AND LENGTH(eventLevel)>0 THEN 
		SET @sqlstr=CONCAT(@sqlstr,' and soe.eventlevel=\'',eventLevel,'\'');END IF;
	IF ISNULL(subSystem)=FALSE AND LENGTH(subSystem)>0 THEN 
		SET @sqlstr=CONCAT(@sqlstr,' and dev.subsystem=\'',subSystem,'\'');END IF;
	
	IF ISNULL(startDate)=FALSE AND LENGTH(startDate)>0 THEN SET @sqlstr=CONCAT(@sqlstr,' and soe.t>=str_to_date(\'',startDate,' 0:0:1\'',',\'%Y-%m-%d %H:%i:%s\')');END IF;
	
	IF ISNULL(endDate)=FALSE AND LENGTH(endDate)>0 THEN SET @sqlstr=CONCAT(@sqlstr,' and soe.t<=str_to_date(IF(TO_DAYS(\'',endDate,'\')=TO_DAYS(NOW()),NOW(),\'' ,endDate,' 23:59:59\'),\'%Y-%m-%d %H:%i:%s\')');END IF;
	
	IF ISNULL(isProcessed)=FALSE AND LENGTH(isProcessed)>0 THEN SET @sqlstr=CONCAT(@sqlstr,' and soe.isProcessed=\'',isProcessed,'\'');END IF;
	
	IF ISNULL(isReturn)=FALSE AND LENGTH(isReturn)>0 THEN SET @sqlstr=CONCAT(@sqlstr,' and soe.isReturn=\'',isReturn,'\'');END IF;
	
	IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
		IF STRCMP('8a812897493378a001495677ad086663',org_no)=0 THEN
			SET @sqlstr=CONCAT(@sqlstr);
		ELSE
			SET @sqlstr=CONCAT(@sqlstr,' and dev.org_no',base.getInClause(org_no));
		END IF;
	END IF;
	
	-- SELECT @sqlstr;
	# needed out select for order by clause
	PREPARE stmt FROM @sqlstr;
	EXECUTE stmt;	
END

