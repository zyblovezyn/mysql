DROP PROCEDURE IF EXISTS base.p_queryAlarm;

DELIMITER $$

CREATE PROCEDURE base.p_queryAlarm (IN org_no VARCHAR(40),IN ywzId MEDIUMTEXT,IN volCode MEDIUMTEXT,IN stationId MEDIUMTEXT,
						IN devTypeId TEXT,IN eventLevel VARCHAR(4),
						IN startDate VARCHAR(20),IN endDate VARCHAR(20),IN isProcessed VARCHAR(2),
						IN isReturn VARCHAR(1),IN startline VARCHAR(100),IN limitline VARCHAR(100))
BEGIN
      SET @sqlstr = CONCAT('SELECT
					cast((@rowno := @rowno + 1) as unsigned) AS xuhao, org.org_name AS orgName, dev.voltagelevel AS volName, dev.substation_name AS stationName, devtype.type_name AS devTypeName, dev.name AS devName,
					CASE
						soe.eventlevel
						WHEN 1
						THEN \'一级告警\'
						WHEN 2
						THEN \'二级告警\'
						WHEN 3
						THEN \'三级告警\'
					END AS alarmLevelName, 
					JSON_EXTRACT(soe.value,\'$.VALUE\')  AS measureValue, soe.eventDesc, DATE_FORMAT(soe.T, \'%Y-%m-%d %H:%i:%s\') AS T,
					CASE
						soe.isProcessed
						WHEN 0
						THEN \'未确认\'
						WHEN 1
						THEN \'已确认\'
					END AS isProcessed, ifnull(soe.operator,\'\') as operator,
					CASE
						soe.isreturn
						WHEN 0
						THEN \'未复归\'
						WHEN 1
						THEN \'已复归\'
					END AS isReturn, DATE_FORMAT(
						soe.returnTime, \'%Y-%m-%d %H:%i:%s\'
					) AS returnTime
					FROM
					cisp_dev.v_all_dev dev
					INNER JOIN cisp_platform.bp_org org
						ON dev.depart = org.org_no
					INNER JOIN base.tf_device_type devtype
						ON devtype.type_id = dev.class_name
					INNER JOIN cisp_platform.me_soe soe
						ON dev.id = soe.dev_id ');
	SET @sqlstr=CONCAT(@sqlstr,'WHERE (@rowno:=',startline,')=(@rowno:=',startline,') and soe.isalarm=1 ');
	SET @limitsql=CONCAT(' limit ',startline,',',limitline);
	IF ISNULL(volCode)=FALSE AND LENGTH(volCode)>0 THEN 
		SET @volid=base.delimiterStr(volCode,',');
		SET @sqlstr=CONCAT(@sqlstr,' and dev.voltagelevel_id in ',@volid);END IF;
	
	IF ISNULL(stationId)=FALSE AND LENGTH(stationId)>0 THEN 
		SET @stationids=base.delimiterStr(stationId,',');
		SET @sqlstr=CONCAT(@sqlstr,' and dev.substation_id in ',@stationids);END IF;
	
	IF ISNULL(devTypeId)=FALSE AND LENGTH(devTypeId)>0 THEN 
		SET @devtypeids=base.delimiterStr(devTypeId,',');
		SET @sqlstr=CONCAT(@sqlstr,' and devtype.type_id in ',@devtypeids);END IF;
	
	IF ISNULL(ywzId)=FALSE AND LENGTH(ywzId)>0 THEN 
		SET @ywzids=base.delimiterStr(ywzId,',');
		SET @sqlstr=CONCAT(@sqlstr,' and dev.maintenance_team in ',@ywzids);END IF;
	
	IF ISNULL(eventLevel)=FALSE AND LENGTH(eventLevel)>0 THEN 
		SET @sqlstr=CONCAT(@sqlstr,' soe.eventlevel=\'',eventLevel,'\'');END IF;
	
	IF ISNULL(startDate)=FALSE AND LENGTH(startDate)>0 THEN SET @sqlstr=CONCAT(@sqlstr,' and soe.t>str_to_date(\'',startDate,'\'',',\'%Y-%m-%d\')');END IF;
	
	IF ISNULL(endDate)=FALSE AND LENGTH(endDate)>0 THEN SET @sqlstr=CONCAT(@sqlstr,' and  soe.t<str_to_date(\'',endDate,'\'',',\'%Y-%m-%d\')');END IF;
	
	IF ISNULL(isProcessed)=FALSE AND LENGTH(isProcessed)>0 AND STRCMP(isProcessed,'全部') != 0 THEN SET @sqlstr=CONCAT(@sqlstr,' and soe.isProcessed=\'',isProcessed,'\'');END IF;
	
	IF ISNULL(isReturn)=FALSE AND LENGTH(isReturn)>0 AND STRCMP(isReturn,'全部') != 0 THEN SET @sqlstr=CONCAT(@sqlstr,' and soe.isReturn=\'',isReturn,'\'');END IF;
	
	IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
		SET @sqlstr=CONCAT(@sqlstr,' and org.org_no',base.getInClause(org_no),@limitsql);END IF;
	
	 SELECT @sqlstr;
	PREPARE stmt FROM @sqlstr;
	EXECUTE stmt;
END


CALL base.p_queryAlarm('1096FA0035D17535E05379FB31000001','','33,25,32','','','','2018-11-01','2018-12-20','','','0','15');
CALL base.p_queryAlarm('1096FA0035D17535E05379FB31000001','','','30000000-102415259','','','','','','','0','15');
CALL base.p_queryAlarmCount_fk('1096FA0035D17535E05379FB31000001','','','30000000-102415259','','','','','','');

30000000-102415259
CALL base.p_queryAlarmCount_fk('1096FA0035D17535E05379FB31000001','','33,25,32','','','','2018-11-01','2018-12-20','','');

SELECT FOUND_ROWS()
SELECT STRCMP('123','123') != 0;

SELECT  * FROM cisp_dev.v_all_dev d LIMIT 15
SELECT * FROM cisp_platform.me_soe soe WHERE isreturn=0 AND isalarm=1 LIMIT 100
SHOW PROCESSLIST
SELECT
	(@rowno:=@rowno+1) AS xuhao,
      dev.subburoname AS orgName,
      dev.volName,
      dev.stationname,
      dev.devTypeName,
      dev.devName,
      CASE soe.eventlevel WHEN 1 THEN '一级告警' WHEN 2 THEN '二级告警' WHEN 3 THEN '三级告警' END AS alarmLevelName,
      soe.value AS measureValue,
      soe.eventdesc,
      soe.t,
      CASE soe.isProcessed WHEN 0 THEN '未确认' WHEN 1 THEN '已确认' END AS isprocessed,
      soe.operator,
      CASE soe.isreturn WHEN 0 THEN '未复归' WHEN 1 THEN '已复归' END AS isreturn,
      FROM_UNIXTIME(soe.returnTime,'%Y-%m-%d')
FROM base.vf_dev_search dev INNER JOIN cisp_platform.me_soe soe
ON dev.devId = soe.dev_id
WHERE (@rowno:=0)=(@rowno:=0)  AND soe.t>STR_TO_DATE('2018-1-12','%Y-%m-%d') AND soe.t<STR_TO_DATE('2018-12-12','%Y-%m-%d')


SELECT STR_TO_DATE('2018-12-12','%Y-%m-%d');
 
     