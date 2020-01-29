BEGIN	#test

CALL base.p_queryAlarm_v2('1096FA0035D17535E05379FB31000001','','33,25,32','','','','','2018-11-01','2018-12-20','','','0','10000');
CALL base.p_queryAlarm_v2('8a812897493378a001495677ad086663','','33,25,32','','','','','2018-12-26','2018-12-29','','','0','10000');

CALL base.p_queryAlarm_v2('1096FA0035D17535E05379FB31000001','','','30000000-102415259','','','','','','','','0','15');
CALL base.p_queryAlarm_v2('1096FA0035D17535E05379FB31000001','1096FA0035D17535E05379FB31000502','','','','','','','','','0','15');
CALL base.p_queryAlarm_v2('1096FA0035D17535E05379FB31000001','','','30000000-102415569','','','3','','','','','0','15');
CALL base.p_queryAlarm_v2('1096FA0035D17535E05379FB31000001','','','','','','3','','','','','0','1000');
CALL base.p_queryAlarm_v2('1096FA0035D17535E05379FB31000001','','','','','','3','','','','0','0','1000');

CALL base.p_queryAlarm_v2('1096FA0035D17535E05379FB31000001','','','','POWERENVIOR','','','2018-12-24','2018-12-26','','0','0','1000');
CALL base.p_queryAlarm_v2('1096FA0035D17535E05379FB31000001','','','','','','','2018-12-25','2019-1-2','','0','0','15');

CALL base.p_queryAlarm_v2('1096FA0035D17535E05379FB31000001','','','','','','','2019-1-8','2019-1-8','','','0','15');

SELECT COUNT(*) FROM cisp_platform.me_soe
END

SELECT * FROM base.tf_ywz_bdz_vol_device dev;
SELECT * FROM base.tf_ywz_bdz_vol_device dev WHERE subsystem='VIDEOCONTROL';
SELECT * FROM cisp_platform.bp_org neworg INNER JOIN base.bp_org_shortname oldorg ON neworg.ORG_NO=oldorg.org_no
UPDATE  cisp_platform.bp_org oldorg INNER JOIN base.bp_org_shortname neworg ON neworg.org_no=oldorg.org_no SET oldorg.order_no=neworg.order_no
SELECT * FROM base.bp_org_shortname




# version:10.0	date:2019-1-7	reason:排序 只按时间进行排序
DROP PROCEDURE IF EXISTS base.p_queryAlarm_v2;
DELIMITER $$
CREATE PROCEDURE base.p_queryAlarm_v2 (IN org_no VARCHAR(40),IN ywzId MEDIUMTEXT,IN volCode MEDIUMTEXT,IN stationId MEDIUMTEXT,
						IN subSystem VARCHAR(30),IN devTypeId TEXT,IN eventLevel VARCHAR(4),
						IN startDate VARCHAR(20),IN endDate VARCHAR(20),IN isProcessed VARCHAR(2),
						IN isReturn VARCHAR(1),IN startline VARCHAR(100),IN limitline VARCHAR(100))
BEGIN
	DECLARE is_p_org_no BOOL;
      SET @sqlstr = CONCAT('SELECT
					CAST((@rowno := @rowno + 1) AS UNSIGNED) AS xuhao,
					temp.orgName,
					temp.ywzName,
					temp.devId,
					temp.soeId,
					temp.volName,
					temp.stationName,
					temp.devTypeName,
					temp.devName,
					temp.alarmLevelName,
					temp.measureValue,
					temp.eventDesc,
					temp.T,
					temp.isProcessed,
					temp.operator,
					temp.isReturn,
					temp.returnTime,
					temp.actionParam
					FROM
					(SELECT
						dev.org_full_name AS orgName,
						dev.ywzname as ywzName,
						dev.devid AS devId,
						soe.soeid AS soeId,
						dev.volname AS volName,
						dev.stationname AS stationName,
						dev.devtypename AS devTypeName,
						dev.devname AS devName,
						soe.measurepoint_id AS measurePointId,
						soe.measuretag AS measureTag,
						IFNULL(measure.actionparam, \'\') AS actionParam,
						CASE
							soe.eventlevel
							WHEN 5
							THEN \'一级告警\'
							WHEN 6
							THEN \'二级告警\'
							WHEN 7
							THEN \'三级告警\'
						END AS alarmLevelName,
						CASE
							JSON_EXTRACT(soe.value, \'$.VALUE\')
							WHEN 1
							THEN \'告警\'
							ELSE ROUND(
								JSON_EXTRACT(soe.value, \'$.VALUE\'),
								2
							)
						END AS measureValue,
						soe.eventDesc,
						IFNULL(
							DATE_FORMAT(soe.T, \'%Y-%m-%d %H:%i:%s\'),
							\'\'
						) AS T,
						CASE
							soe.isProcessed
							WHEN 0
							THEN \'未确认\'
							WHEN 1
							THEN \'已确认\'
						END AS isProcessed,
						IFNULL(soe.operator, \'\') AS operator,
						CASE
							soe.isreturn
							WHEN 0
							THEN \'未复归\'
							WHEN 1
							THEN \'已复归\'
						END AS isReturn,
						IFNULL(
							DATE_FORMAT(
								soe.returnTime,
								\'%Y-%m-%d %H:%i:%s\'
							),
							\'\'
						) AS returnTime
					FROM
						base.tf_ywz_bdz_vol_device dev
						JOIN cisp_platform.me_soe soe
							ON dev.pointid = soe.measurepoint_id
						JOIN cisp_platform.me_conf_measure measure
							ON measure.measurepoint_id = soe.measurepoint_id 
							AND soe.measuretag=measure.measuretag 
					WHERE soe.isalarm = 1 ');	
 	SET @sqlrowno=CONCAT('(@rowno:=',startline,')=(@rowno:=',startline,')');
	#SET @sqlorder=CONCAT(' order by org.order_no,dev.volcode,dev.stationid,T');
	SET @sqlorder=CONCAT(' order by soe.t desc'); # 只按时间进行排序

	SET @sqllimit=CONCAT(' limit ',startline,',',limitline);
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
	SET @sqlstr=CONCAT(@sqlstr,@sqlorder,' limit ',startline,',',limitline,') AS temp WHERE',@sqlrowno); 
	-- SELECT @sqlstr;
	PREPARE stmt FROM @sqlstr;
	EXECUTE stmt;	
	DEALLOCATE PREPARE stmt;
END




# version:9.0	date:2019-1-2	reason:告警联动执行参数传递
DROP PROCEDURE IF EXISTS base.p_queryAlarm_v2;

DELIMITER $$

CREATE PROCEDURE base.p_queryAlarm_v2 (IN org_no VARCHAR(40),IN ywzId MEDIUMTEXT,IN volCode MEDIUMTEXT,IN stationId MEDIUMTEXT,
						IN subSystem VARCHAR(30),IN devTypeId TEXT,IN eventLevel VARCHAR(4),
						IN startDate VARCHAR(20),IN endDate VARCHAR(20),IN isProcessed VARCHAR(2),
						IN isReturn VARCHAR(1),IN startline VARCHAR(100),IN limitline VARCHAR(100))
BEGIN
      SET @sqlstr = CONCAT('SELECT  org.org_name AS orgName,dev.devid as devId,soe.soeid as soeId, 
						dev.volname AS volName, dev.stationname AS stationName, 
						dev.devtypename AS devTypeName, dev.devname AS devName,
						soe.measurepoint_id AS measurePointId,soe.measuretag as measureTag,				
						CASE
						soe.eventlevel
						WHEN 5
						THEN \'一级告警\'
						WHEN 6
						THEN \'二级告警\'
						WHEN 7
						THEN \'三级告警\'
					END AS alarmLevelName,
					case JSON_EXTRACT(soe.value,\'$.VALUE\')
					when 1 then \'告警\'
					else round(JSON_EXTRACT(soe.value,\'$.VALUE\'),2) end
					AS measureValue, soe.eventDesc, DATE_FORMAT(soe.T, \'%Y-%m-%d %H:%i:%s\') AS T,
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
					base.tf_ywz_bdz_vol_device dev
					 INNER JOIN cisp_platform.bp_org org
						ON dev.org_no = org.org_no
					left join cisp_platform.me_conf_measurepoint point
						on point.end_dev_id=dev.devid					 
					left JOIN cisp_platform.me_soe soe
						ON point.id = soe.measurepoint_id 
					WHERE soe.isalarm=1 ');	
 	SET @sqlrowno=CONCAT('(@rowno:=',startline,')=(@rowno:=',startline,')');
	SET @sqlorder=CONCAT(' order by org.order_no,dev.volcode,dev.stationid,T');
	SET @sqllimit=CONCAT(' limit ',startline,',',limitline);
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
			SET @sqlstr=CONCAT(@sqlstr,@sqlorder);
		ELSE
			SET @sqlstr=CONCAT(@sqlstr,' and dev.org_no',base.getInClause(org_no),@sqlorder);
		END IF;
	END IF;
	
	-- SELECT @sqlstr;
	# needed out select for order by clause
	SET @sqlstr=CONCAT('SELECT 	temp.xuhao, temp.orgName, temp.devId, temp.soeId, temp.volName, temp.stationName, 
						temp.devTypeName, temp.devName, temp.alarmLevelName, temp.measureValue, temp.eventDesc,
						temp.T, temp.isProcessed, temp.operator, temp.isReturn, ifnull(temp.returnTime,\'\') as returnTime, 
						ifnull(measure.actionparam,\'\') as actionParam
						FROM
						(select CAST((@rowno := @rowno + 1) AS UNSIGNED) AS xuhao, temp.orgName, 
							temp.devId, temp.soeId, temp.volName, temp.stationName, temp.devTypeName, 
							temp.devName, temp.alarmLevelName, temp.measureValue, temp.eventDesc, temp.T, 
							temp.isProcessed, temp.operator, temp.isReturn, temp.returnTime, temp.measurePointId,temp.measureTag from ( ',
						@sqlstr,') as temp where ',@sqlrowno,' limit ',startline,',',limitline,
						') AS temp
							left JOIN cisp_platform.me_conf_measure measure
								ON measure.measurepoint_id = temp.measurePointId and temp.measureTag=measure.measuretag'); 
	-- SELECT @sqlstr;
	PREPARE stmt FROM @sqlstr;
	EXECUTE stmt;	
	DEALLOCATE PREPARE stmt;
END




# version:8.0	date:2018-12-29	reason:chang alarm level to  5=一级告警 6=二级告警 7=三级告警  
DROP PROCEDURE IF EXISTS base.p_queryAlarm_v2;

DELIMITER $$

CREATE PROCEDURE base.p_queryAlarm_v2 (IN org_no VARCHAR(40),IN ywzId MEDIUMTEXT,IN volCode MEDIUMTEXT,IN stationId MEDIUMTEXT,
						IN subSystem VARCHAR(30),IN devTypeId TEXT,IN eventLevel VARCHAR(4),
						IN startDate VARCHAR(20),IN endDate VARCHAR(20),IN isProcessed VARCHAR(2),
						IN isReturn VARCHAR(1),IN startline VARCHAR(100),IN limitline VARCHAR(100))
BEGIN
      SET @sqlstr = CONCAT('SELECT  org.org_name AS orgName,dev.devid as devId,soe.soeid as soeId, 
						dev.volname AS volName, dev.stationname AS stationName, 
						dev.devtypename AS devTypeName, dev.devname AS devName,
 						CASE
						soe.eventlevel
						WHEN 5
						THEN \'一级告警\'
						WHEN 6
						THEN \'二级告警\'
						WHEN 7
						THEN \'三级告警\'
					END AS alarmLevelName,
					case JSON_EXTRACT(soe.value,\'$.VALUE\')
					when 1 then \'告警\'
					else round(JSON_EXTRACT(soe.value,\'$.VALUE\'),2) end
					AS measureValue, soe.eventDesc, DATE_FORMAT(soe.T, \'%Y-%m-%d %H:%i:%s\') AS T,
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
					base.tf_ywz_bdz_vol_device dev
					 INNER JOIN cisp_platform.bp_org org
						ON dev.org_no = org.org_no					 
					INNER JOIN cisp_platform.me_soe soe
						ON dev.devid = soe.dev_id
					WHERE soe.isalarm=1 ');	
 	SET @sqlrowno=CONCAT('(@rowno:=',startline,')=(@rowno:=',startline,')');
	SET @sqlorder=CONCAT(' order by org.order_no,dev.volcode,dev.stationid');
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
			SET @sqlstr=CONCAT(@sqlstr,@sqlorder);
		ELSE
			SET @sqlstr=CONCAT(@sqlstr,' and dev.org_no',base.getInClause(org_no),@sqlorder);
		END IF;
	END IF;
	
	-- SELECT @sqlstr;
	# needed out select for order by clause
	SET @sqlstr=CONCAT('select CAST((@rowno := @rowno + 1) AS UNSIGNED) AS xuhao, 
					temp.orgName,temp.devId,temp.soeId,temp.volName,
					temp.stationName,temp.devTypeName,temp.devName,temp.alarmLevelName,temp.measureValue,temp.eventDesc,
					temp.T,temp.isProcessed,temp.operator,temp.isReturn,temp.returnTime,temp.measurePointId from ( ',
					@sqlstr,') as temp where ',@sqlrowno,' limit ',startline,',',limitline); 
	PREPARE stmt FROM @sqlstr;
	EXECUTE stmt;	
END



# version:7.0	date:2018-12-28	reason: 1 when operator is null ,display the operator empty string.
#							  2 and order by order_no volcode stationid
#							  3 replace cisp_platform.bp_org to base.bp_org_shortname
#							  4  because used order by clause so need out select
DROP PROCEDURE IF EXISTS base.p_queryAlarm_v2;

DELIMITER $$

CREATE PROCEDURE base.p_queryAlarm_v2 (IN org_no VARCHAR(40),IN ywzId MEDIUMTEXT,IN volCode MEDIUMTEXT,IN stationId MEDIUMTEXT,
						IN subSystem VARCHAR(30),IN devTypeId TEXT,IN eventLevel VARCHAR(4),
						IN startDate VARCHAR(20),IN endDate VARCHAR(20),IN isProcessed VARCHAR(2),
						IN isReturn VARCHAR(1),IN startline VARCHAR(100),IN limitline VARCHAR(100))
BEGIN
      SET @sqlstr = CONCAT('SELECT  org.org_name AS orgName, 
						dev.volname AS volName, dev.stationname AS stationName, 
						dev.devtypename AS devTypeName, dev.devname AS devName,					
						CASE
						soe.eventlevel
						WHEN 1
						THEN \'一级告警\'
						WHEN 2
						THEN \'二级告警\'
						WHEN 3
						THEN \'三级告警\'
					END AS alarmLevelName,
					case JSON_EXTRACT(soe.value,\'$.VALUE\')
					when 1 then \'告警\'
					else round(JSON_EXTRACT(soe.value,\'$.VALUE\'),2) end
					AS measureValue, soe.eventDesc, DATE_FORMAT(soe.T, \'%Y-%m-%d %H:%i:%s\') AS T,
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
					base.tf_ywz_bdz_vol_device dev
					 INNER JOIN cisp_platform.bp_org org
						ON dev.org_no = org.org_no					 
					INNER JOIN cisp_platform.me_soe soe
						ON dev.devid = soe.dev_id
					WHERE soe.isalarm=1 ');	
 	SET @sqlrowno=CONCAT('(@rowno:=',startline,')=(@rowno:=',startline,')');
	SET @sqlorder=CONCAT(' order by org.order_no,dev.volcode,dev.stationid');
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
			SET @sqlstr=CONCAT(@sqlstr,@limitsql);
		ELSE
			SET @sqlstr=CONCAT(@sqlstr,' and dev.org_no',base.getInClause(org_no),@sqlorder);
		END IF;
	END IF;
	
	 -- SELECT @sqlstr;
	# needed out select for order by clause
	SET @sqlstr=CONCAT('select CAST((@rowno := @rowno + 1) AS UNSIGNED) AS xuhao, temp.* from ( ',@sqlstr,') as temp where ',@sqlrowno,' limit ',startline,',',limitline); 
	PREPARE stmt FROM @sqlstr;
	EXECUTE stmt;	
END



SELECT STR_TO_DATE(IF(TO_DAYS('2018-12-27 13:14:15')=TO_DAYS(NOW()),NOW(),'2018-12-27 13:14:15'),'%Y-%m-%d %H:%i:%s')  


# version:6.0	date:2018-12-27	reason: 优化对me_soe表进行了分区

DROP PROCEDURE IF EXISTS base.p_queryAlarm_v2;

DELIMITER $$

CREATE PROCEDURE base.p_queryAlarm_v2 (IN org_no VARCHAR(40),IN ywzId MEDIUMTEXT,IN volCode MEDIUMTEXT,IN stationId MEDIUMTEXT,
						IN subSystem VARCHAR(30),IN devTypeId TEXT,IN eventLevel VARCHAR(4),
						IN startDate VARCHAR(20),IN endDate VARCHAR(20),IN isProcessed VARCHAR(2),
						IN isReturn VARCHAR(1),IN startline VARCHAR(100),IN limitline VARCHAR(100))
BEGIN
      SET @sqlstr = CONCAT('SELECT 
						CAST((@rowno := @rowno + 1) AS UNSIGNED) AS xuhao, org.org_name AS orgName, 
						dev.volname AS volName, dev.stationname AS stationName, 
						dev.devtypename AS devTypeName, dev.devname AS devName,					
						CASE
						soe.eventlevel
						WHEN 1
						THEN \'一级告警\'
						WHEN 2
						THEN \'二级告警\'
						WHEN 3
						THEN \'三级告警\'
					END AS alarmLevelName,
					case JSON_EXTRACT(soe.value,\'$.VALUE\')
					when 1 then \'告警\'
					else round(JSON_EXTRACT(soe.value,\'$.VALUE\'),2) end
					AS measureValue, soe.eventDesc, DATE_FORMAT(soe.T, \'%Y-%m-%d %H:%i:%s\') AS T,
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
					base.tf_ywz_bdz_vol_device dev
					 INNER JOIN cisp_platform.bp_org org
						ON dev.org_no = org.org_no					 
					INNER JOIN cisp_platform.me_soe soe
						ON dev.devid = soe.dev_id ');
	SET @sqlstr=CONCAT(@sqlstr,'WHERE (@rowno:=',startline,')=(@rowno:=',startline,') and soe.isalarm=1 ');
	SET @limitsql=CONCAT(' order by org.order_no,dev.volcode,dev.stationid limit ',startline,',',limitline);
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
	
	IF ISNULL(startDate)=FALSE AND LENGTH(startDate)>0 THEN SET @sqlstr=CONCAT(@sqlstr,' and soe.t>str_to_date(\'',startDate,'\'',',\'%Y-%m-%d\')');END IF;
	
	IF ISNULL(endDate)=FALSE AND LENGTH(endDate)>0 THEN SET @sqlstr=CONCAT(@sqlstr,' and  soe.t<str_to_date(\'',endDate,'\'',',\'%Y-%m-%d\')');END IF;
	
	IF ISNULL(isProcessed)=FALSE AND LENGTH(isProcessed)>0 THEN SET @sqlstr=CONCAT(@sqlstr,' and soe.isProcessed=\'',isProcessed,'\'');END IF;
	
	IF ISNULL(isReturn)=FALSE AND LENGTH(isReturn)>0 THEN SET @sqlstr=CONCAT(@sqlstr,' and soe.isReturn=\'',isReturn,'\'');END IF;
	
	IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
		IF STRCMP('8a812897493378a001495677ad086663',org_no)=0 THEN
			SET @sqlstr=CONCAT(@sqlstr,@limitsql);
		ELSE
			SET @sqlstr=CONCAT(@sqlstr,' and dev.org_no',base.getInClause(org_no),@limitsql);
		END IF;
	END IF;
	
	-- SELECT @sqlstr;
	PREPARE stmt FROM @sqlstr;
	EXECUTE stmt;	
END


SELECT @rowno
# version:5.0	date:2018-12-27	reason: 优化 
DROP PROCEDURE IF EXISTS base.p_queryAlarm_v2;

DELIMITER $$

CREATE PROCEDURE base.p_queryAlarm_v2 (IN org_no VARCHAR(40),IN ywzId MEDIUMTEXT,IN volCode MEDIUMTEXT,IN stationId MEDIUMTEXT,
						IN subSystem VARCHAR(30),IN devTypeId TEXT,IN eventLevel VARCHAR(4),
						IN startDate VARCHAR(20),IN endDate VARCHAR(20),IN isProcessed VARCHAR(2),
						IN isReturn VARCHAR(1),IN startline VARCHAR(100),IN limitline VARCHAR(100))
BEGIN
      SET @sqlstr = CONCAT('SELECT 
						CAST((@rowno := @rowno + 1) AS UNSIGNED) AS xuhao, org.org_name AS orgName, 
						dev.volname AS volName, dev.stationname AS stationName, 
						dev.devtypename AS devTypeName, dev.devname AS devName,					
						CASE
						soe.eventlevel
						WHEN 1
						THEN \'一级告警\'
						WHEN 2
						THEN \'二级告警\'
						WHEN 3
						THEN \'三级告警\'
					END AS alarmLevelName,
					case JSON_EXTRACT(soe.value,\'$.VALUE\')
					when 1 then \'告警\'
					else round(JSON_EXTRACT(soe.value,\'$.VALUE\'),2) end
					AS measureValue, soe.eventDesc, DATE_FORMAT(soe.T, \'%Y-%m-%d %H:%i:%s\') AS T,
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
					cisp_platform.me_soe soe 
					JOIN (select * from base.tf_ywz_bdz_vol_device dev where 1=1 ');
	SET @sqlstrw=CONCAT(' ) dev
						ON dev.devid = soe.dev_id 
					JOIN cisp_platform.bp_org org
						ON dev.org_no = org.org_no');
	SET @sqlstrw=CONCAT(@sqlstrw,' WHERE (@rowno:=',startline,')=(@rowno:=',startline,') and soe.isalarm=1 ');
	SET @limitsql=CONCAT(' limit ',startline,',',limitline);
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
		SET @sqlstrw=CONCAT(@sqlstrw,' and soe.eventlevel=\'',eventLevel,'\'');END IF;
	IF ISNULL(subSystem)=FALSE AND LENGTH(subSystem)>0 THEN 
		SET @sqlstr=CONCAT(@sqlstr,' and dev.subsystem=\'',subSystem,'\'');END IF;
	
	IF ISNULL(startDate)=FALSE AND LENGTH(startDate)>0 THEN SET @sqlstrw=CONCAT(@sqlstrw,' and soe.t>str_to_date(\'',startDate,'\'',',\'%Y-%m-%d\')');END IF;
	
	IF ISNULL(endDate)=FALSE AND LENGTH(endDate)>0 THEN SET @sqlstrw=CONCAT(@sqlstrw,' and  soe.t<str_to_date(\'',endDate,'\'',',\'%Y-%m-%d\')');END IF;
	
	IF ISNULL(isProcessed)=FALSE AND LENGTH(isProcessed)>0 THEN SET @sqlstrw=CONCAT(@sqlstrw,' and soe.isProcessed=\'',isProcessed,'\'');END IF;
	
	IF ISNULL(isReturn)=FALSE AND LENGTH(isReturn)>0 THEN SET @sqlstrw=CONCAT(@sqlstrw,' and soe.isReturn=\'',isReturn,'\'');END IF;
	
	IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
		IF STRCMP('8a812897493378a001495677ad086663',org_no)=0 THEN
			SET @sqlstr=CONCAT(@sqlstr,@limitsql);
		ELSE
			SET @sqlstr=CONCAT(@sqlstr,' and dev.org_no',base.getInClause(org_no));
		END IF;
	END IF;
	SET @sqlstr=CONCAT(@sqlstr,@sqlstrw,@limitsql);
	-- SELECT @sqlstr;
	PREPARE stmt FROM @sqlstr;
	EXECUTE stmt;
END


# version:4.0	date:2018-12-26	reason: 优化 取消关联设备类型
DROP PROCEDURE IF EXISTS base.p_queryAlarm_v2;

DELIMITER $$

CREATE PROCEDURE base.p_queryAlarm_v2 (IN org_no VARCHAR(40),IN ywzId MEDIUMTEXT,IN volCode MEDIUMTEXT,IN stationId MEDIUMTEXT,
						IN subSystem VARCHAR(30),IN devTypeId TEXT,IN eventLevel VARCHAR(4),
						IN startDate VARCHAR(20),IN endDate VARCHAR(20),IN isProcessed VARCHAR(2),
						IN isReturn VARCHAR(1),IN startline VARCHAR(100),IN limitline VARCHAR(100))
BEGIN
      SET @sqlstr = CONCAT('SELECT 
						CAST((@rowno := @rowno + 1) AS UNSIGNED) AS xuhao, org.org_name AS orgName, 
						dev.volname AS volName, dev.stationname AS stationName, 
						dev.devtypename AS devTypeName, dev.devname AS devName,					
						CASE
						soe.eventlevel
						WHEN 1
						THEN \'一级告警\'
						WHEN 2
						THEN \'二级告警\'
						WHEN 3
						THEN \'三级告警\'
					END AS alarmLevelName,
					case JSON_EXTRACT(soe.value,\'$.VALUE\')
					when 1 then \'告警\'
					else round(JSON_EXTRACT(soe.value,\'$.VALUE\'),2) end
					AS measureValue, soe.eventDesc, DATE_FORMAT(soe.T, \'%Y-%m-%d %H:%i:%s\') AS T,
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
					base.tf_ywz_bdz_vol_device dev
					 INNER JOIN cisp_platform.bp_org org
						ON dev.org_no = org.org_no					 
					INNER JOIN cisp_platform.me_soe soe
						ON dev.devid = soe.dev_id ');
	SET @sqlstr=CONCAT(@sqlstr,'WHERE (@rowno:=',startline,')=(@rowno:=',startline,') and soe.isalarm=1 ');
	SET @limitsql=CONCAT(' limit ',startline,',',limitline);
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
	
	IF ISNULL(startDate)=FALSE AND LENGTH(startDate)>0 THEN SET @sqlstr=CONCAT(@sqlstr,' and soe.t>str_to_date(\'',startDate,'\'',',\'%Y-%m-%d\')');END IF;
	
	IF ISNULL(endDate)=FALSE AND LENGTH(endDate)>0 THEN SET @sqlstr=CONCAT(@sqlstr,' and  soe.t<str_to_date(\'',endDate,'\'',',\'%Y-%m-%d\')');END IF;
	
	IF ISNULL(isProcessed)=FALSE AND LENGTH(isProcessed)>0 THEN SET @sqlstr=CONCAT(@sqlstr,' and soe.isProcessed=\'',isProcessed,'\'');END IF;
	
	IF ISNULL(isReturn)=FALSE AND LENGTH(isReturn)>0 THEN SET @sqlstr=CONCAT(@sqlstr,' and soe.isReturn=\'',isReturn,'\'');END IF;
	
	IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
		IF STRCMP('8a812897493378a001495677ad086663',org_no)=0 THEN
			SET @sqlstr=CONCAT(@sqlstr,@limitsql);
		ELSE
			SET @sqlstr=CONCAT(@sqlstr,' and dev.org_no',base.getInClause(org_no),@limitsql);
		END IF;
	END IF;
	
	-- SELECT @sqlstr;
	PREPARE stmt FROM @sqlstr;
	EXECUTE stmt;
END



# version:3.0	date:2018-12-25	reason:add subsystem filter condition
DROP PROCEDURE IF EXISTS base.p_queryAlarm_v2;

DELIMITER $$

CREATE PROCEDURE base.p_queryAlarm_v2 (IN org_no VARCHAR(40),IN ywzId MEDIUMTEXT,IN volCode MEDIUMTEXT,IN stationId MEDIUMTEXT,
						IN subSystem VARCHAR(30),IN devTypeId TEXT,IN eventLevel VARCHAR(4),
						IN startDate VARCHAR(20),IN endDate VARCHAR(20),IN isProcessed VARCHAR(2),
						IN isReturn VARCHAR(1),IN startline VARCHAR(100),IN limitline VARCHAR(100))
BEGIN
      SET @sqlstr = CONCAT('SELECT 
						CAST((@rowno := @rowno + 1) AS UNSIGNED) AS xuhao, org.org_name AS orgName, 
						dev.volname AS volName, dev.stationname AS stationName, 
						devtype.type_name AS devTypeName, dev.devname AS devName,					
						CASE
						soe.eventlevel
						WHEN 1
						THEN \'一级告警\'
						WHEN 2
						THEN \'二级告警\'
						WHEN 3
						THEN \'三级告警\'
					END AS alarmLevelName,
					case JSON_EXTRACT(soe.value,\'$.VALUE\')
					when 1 then \'告警\'
					else round(JSON_EXTRACT(soe.value,\'$.VALUE\'),2) end
					AS measureValue, soe.eventDesc, DATE_FORMAT(soe.T, \'%Y-%m-%d %H:%i:%s\') AS T,
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
					base.tf_ywz_bdz_vol_device dev
					 INNER JOIN cisp_platform.bp_org org
						ON dev.org_no = org.org_no
					INNER JOIN base.tf_device_type devtype
						ON devtype.type_id = dev.devtype
					INNER JOIN cisp_platform.me_soe soe
						ON dev.devid = soe.dev_id ');
	SET @sqlstr=CONCAT(@sqlstr,'WHERE (@rowno:=',startline,')=(@rowno:=',startline,') and soe.isalarm=1 ');
	SET @limitsql=CONCAT(' limit ',startline,',',limitline);
	IF ISNULL(volCode)=FALSE AND LENGTH(volCode)>0 THEN 
		SET @volid=base.delimiterStr(volCode,',');
		SET @sqlstr=CONCAT(@sqlstr,' and dev.volcode in ',@volid);END IF;
	
	IF ISNULL(stationId)=FALSE AND LENGTH(stationId)>0 THEN 
		SET @stationids=base.delimiterStr(stationId,',');
		SET @sqlstr=CONCAT(@sqlstr,' and dev.stationid in ',@stationids);END IF;
	
	IF ISNULL(devTypeId)=FALSE AND LENGTH(devTypeId)>0 THEN 
		SET @devtypeids=base.delimiterStr(devTypeId,',');
		SET @sqlstr=CONCAT(@sqlstr,' and devtype.type_id in ',@devtypeids);END IF;
	
	IF ISNULL(ywzId)=FALSE AND LENGTH(ywzId)>0 THEN 
		SET @ywzids=base.delimiterStr(ywzId,',');
		SET @sqlstr=CONCAT(@sqlstr,' and dev.ywzid in ',@ywzids);END IF;
	
	IF ISNULL(eventLevel)=FALSE AND LENGTH(eventLevel)>0 THEN 
		SET @sqlstr=CONCAT(@sqlstr,' and soe.eventlevel=\'',eventLevel,'\'');END IF;
	IF ISNULL(subSystem)=FALSE AND LENGTH(subSystem)>0 THEN 
		SET @sqlstr=CONCAT(@sqlstr,' and devtype.subsystem=\'',subSystem,'\'');END IF;
	
	IF ISNULL(startDate)=FALSE AND LENGTH(startDate)>0 THEN SET @sqlstr=CONCAT(@sqlstr,' and soe.t>str_to_date(\'',startDate,'\'',',\'%Y-%m-%d\')');END IF;
	
	IF ISNULL(endDate)=FALSE AND LENGTH(endDate)>0 THEN SET @sqlstr=CONCAT(@sqlstr,' and  soe.t<str_to_date(\'',endDate,'\'',',\'%Y-%m-%d\')');END IF;
	
	IF ISNULL(isProcessed)=FALSE AND LENGTH(isProcessed)>0 THEN SET @sqlstr=CONCAT(@sqlstr,' and soe.isProcessed=\'',isProcessed,'\'');END IF;
	
	IF ISNULL(isReturn)=FALSE AND LENGTH(isReturn)>0 THEN SET @sqlstr=CONCAT(@sqlstr,' and soe.isReturn=\'',isReturn,'\'');END IF;
	
	IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
		IF STRCMP('8a812897493378a001495677ad086663',org_no)=0 THEN
			SET @sqlstr=CONCAT(@sqlstr,@limitsql);
		ELSE
			SET @sqlstr=CONCAT(@sqlstr,' and dev.org_no',base.getInClause(org_no),@limitsql);
		END IF;
	END IF;
	
	SELECT @sqlstr;
	PREPARE stmt FROM @sqlstr;
	EXECUTE stmt;
END


# version:2.0	date:2018-12-24	reason:fix selected slowly problem
DROP PROCEDURE IF EXISTS base.p_queryAlarm_v2;

DELIMITER $$

CREATE PROCEDURE base.p_queryAlarm_v2 (IN org_no VARCHAR(40),IN ywzId MEDIUMTEXT,IN volCode MEDIUMTEXT,IN stationId MEDIUMTEXT,
						IN devTypeId TEXT,IN eventLevel VARCHAR(4),
						IN startDate VARCHAR(20),IN endDate VARCHAR(20),IN isProcessed VARCHAR(2),
						IN isReturn VARCHAR(1),IN startline VARCHAR(100),IN limitline VARCHAR(100))
BEGIN
      SET @sqlstr = CONCAT('SELECT 
						CAST((@rowno := @rowno + 1) AS UNSIGNED) AS xuhao, org.org_name AS orgName, 
						dev.volname AS volName, dev.stationname AS stationName, 
						devtype.type_name AS devTypeName, dev.devname AS devName,					
						CASE
						soe.eventlevel
						WHEN 1
						THEN \'一级告警\'
						WHEN 2
						THEN \'二级告警\'
						WHEN 3
						THEN \'三级告警\'
					END AS alarmLevelName,
					case JSON_EXTRACT(soe.value,\'$.VALUE\')
					when 1 then \'告警\'
					else round(JSON_EXTRACT(soe.value,\'$.VALUE\'),2) end
					AS measureValue, soe.eventDesc, DATE_FORMAT(soe.T, \'%Y-%m-%d %H:%i:%s\') AS T,
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
					base.tf_ywz_bdz_vol_device dev
					 INNER JOIN cisp_platform.bp_org org
						ON dev.org_no = org.org_no
					INNER JOIN base.tf_device_type devtype
						ON devtype.type_id = dev.classname
					INNER JOIN cisp_platform.me_soe soe
						ON dev.devid = soe.dev_id ');
	SET @sqlstr=CONCAT(@sqlstr,'WHERE (@rowno:=',startline,')=(@rowno:=',startline,') and soe.isalarm=1 ');
	SET @limitsql=CONCAT(' limit ',startline,',',limitline);
	IF ISNULL(volCode)=FALSE AND LENGTH(volCode)>0 THEN 
		SET @volid=base.delimiterStr(volCode,',');
		SET @sqlstr=CONCAT(@sqlstr,' and dev.volcode in ',@volid);END IF;
	
	IF ISNULL(stationId)=FALSE AND LENGTH(stationId)>0 THEN 
		SET @stationids=base.delimiterStr(stationId,',');
		SET @sqlstr=CONCAT(@sqlstr,' and dev.stationid in ',@stationids);END IF;
	
	IF ISNULL(devTypeId)=FALSE AND LENGTH(devTypeId)>0 THEN 
		SET @devtypeids=base.delimiterStr(devTypeId,',');
		SET @sqlstr=CONCAT(@sqlstr,' and devtype.type_id in ',@devtypeids);END IF;
	
	IF ISNULL(ywzId)=FALSE AND LENGTH(ywzId)>0 THEN 
		SET @ywzids=base.delimiterStr(ywzId,',');
		SET @sqlstr=CONCAT(@sqlstr,' and dev.ywzid in ',@ywzids);END IF;
	
	IF ISNULL(eventLevel)=FALSE AND LENGTH(eventLevel)>0 THEN 
		SET @sqlstr=CONCAT(@sqlstr,' soe.eventlevel=\'',eventLevel,'\'');END IF;
	
	IF ISNULL(startDate)=FALSE AND LENGTH(startDate)>0 THEN SET @sqlstr=CONCAT(@sqlstr,' and soe.t>str_to_date(\'',startDate,'\'',',\'%Y-%m-%d\')');END IF;
	
	IF ISNULL(endDate)=FALSE AND LENGTH(endDate)>0 THEN SET @sqlstr=CONCAT(@sqlstr,' and  soe.t<str_to_date(\'',endDate,'\'',',\'%Y-%m-%d\')');END IF;
	
	IF ISNULL(isProcessed)=FALSE AND LENGTH(isProcessed)>0 THEN SET @sqlstr=CONCAT(@sqlstr,' and soe.isProcessed=\'',isProcessed,'\'');END IF;
	
	IF ISNULL(isReturn)=FALSE AND LENGTH(isReturn)>0 THEN SET @sqlstr=CONCAT(@sqlstr,' and soe.isReturn=\'',isReturn,'\'');END IF;
	
	IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
		IF STRCMP('8a812897493378a001495677ad086663',org_no)=0 THEN
			SET @sqlstr=CONCAT(@sqlstr,@limitsql);
		ELSE
			SET @sqlstr=CONCAT(@sqlstr,' and dev.org_no',base.getInClause(org_no),@limitsql);
		END IF;
	END IF;
	
	-- SELECT @sqlstr;
	PREPARE stmt FROM @sqlstr;
	EXECUTE stmt;
END



DROP PROCEDURE IF EXISTS base.p_queryAlarm_v2;

DELIMITER $$

CREATE PROCEDURE base.p_queryAlarm_v2 (IN org_no VARCHAR(40),IN ywzId MEDIUMTEXT,IN volCode MEDIUMTEXT,IN stationId MEDIUMTEXT,
						IN devTypeId TEXT,IN eventLevel VARCHAR(4),
						IN startDate VARCHAR(20),IN endDate VARCHAR(20),IN isProcessed VARCHAR(2),
						IN isReturn VARCHAR(1),IN startline VARCHAR(100),IN limitline VARCHAR(100))
BEGIN
      SET @sqlstr = CONCAT('SELECT 
						CAST((@rowno := @rowno + 1) AS UNSIGNED) AS xuhao, org.org_name AS orgName, 
						dev.volname AS volName, dev.stationname AS stationName, 
						devtype.type_name AS devTypeName, dev.devname AS devName,					
						CASE
						soe.eventlevel
						WHEN 1
						THEN \'一级告警\'
						WHEN 2
						THEN \'二级告警\'
						WHEN 3
						THEN \'三级告警\'
					END AS alarmLevelName, 
					ROUND(JSON_EXTRACT(soe.value,\'$.VALUE\'),2)  AS measureValue, soe.eventDesc, DATE_FORMAT(soe.T, \'%Y-%m-%d %H:%i:%s\') AS T,
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
					base.tf_ywz_bdz_vol_device dev
					 INNER JOIN cisp_platform.bp_org org
						ON dev.org_no = org.org_no
					INNER JOIN base.tf_device_type devtype
						ON devtype.type_id = dev.classname
					INNER JOIN cisp_platform.me_soe soe
						ON dev.devid = soe.dev_id ');
	SET @sqlstr=CONCAT(@sqlstr,'WHERE (@rowno:=',startline,')=(@rowno:=',startline,') and soe.isalarm=1 ');
	SET @limitsql=CONCAT(' limit ',startline,',',limitline);
	IF ISNULL(volCode)=FALSE AND LENGTH(volCode)>0 THEN 
		SET @volid=base.delimiterStr(volCode,',');
		SET @sqlstr=CONCAT(@sqlstr,' and dev.volcode in ',@volid);END IF;
	
	IF ISNULL(stationId)=FALSE AND LENGTH(stationId)>0 THEN 
		SET @stationids=base.delimiterStr(stationId,',');
		SET @sqlstr=CONCAT(@sqlstr,' and dev.stationid in ',@stationids);END IF;
	
	IF ISNULL(devTypeId)=FALSE AND LENGTH(devTypeId)>0 THEN 
		SET @devtypeids=base.delimiterStr(devTypeId,',');
		SET @sqlstr=CONCAT(@sqlstr,' and devtype.type_id in ',@devtypeids);END IF;
	
	IF ISNULL(ywzId)=FALSE AND LENGTH(ywzId)>0 THEN 
		SET @ywzids=base.delimiterStr(ywzId,',');
		SET @sqlstr=CONCAT(@sqlstr,' and dev.ywzid in ',@ywzids);END IF;
	
	IF ISNULL(eventLevel)=FALSE AND LENGTH(eventLevel)>0 THEN 
		SET @sqlstr=CONCAT(@sqlstr,' soe.eventlevel=\'',eventLevel,'\'');END IF;
	
	IF ISNULL(startDate)=FALSE AND LENGTH(startDate)>0 THEN SET @sqlstr=CONCAT(@sqlstr,' and soe.t>str_to_date(\'',startDate,'\'',',\'%Y-%m-%d\')');END IF;
	
	IF ISNULL(endDate)=FALSE AND LENGTH(endDate)>0 THEN SET @sqlstr=CONCAT(@sqlstr,' and  soe.t<str_to_date(\'',endDate,'\'',',\'%Y-%m-%d\')');END IF;
	
	IF ISNULL(isProcessed)=FALSE AND LENGTH(isProcessed)>0 THEN SET @sqlstr=CONCAT(@sqlstr,' and soe.isProcessed=\'',isProcessed,'\'');END IF;
	
	IF ISNULL(isReturn)=FALSE AND LENGTH(isReturn)>0 THEN SET @sqlstr=CONCAT(@sqlstr,' and soe.isReturn=\'',isReturn,'\'');END IF;
	
	IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
		SET @sqlstr=CONCAT(@sqlstr,' and dev.org_no',base.getInClause(org_no),@limitsql);END IF;
	
	-- SELECT @sqlstr;
	PREPARE stmt FROM @sqlstr;
	EXECUTE stmt;
END



CALL base.p_queryAlarm_v2('1096FA0035D17535E05379FB31000001','','33,25,32','','','','2018-11-01','2018-12-20','','','0','100000');

CALL base.p_queryAlarm_v2('1096FA0035D17535E05379FB31000001','','','30000000-102415259','','','','','','','0','15');
CALL base.p_queryAlarm_v2('1096FA0035D17535E05379FB31000001','1096FA0035D17535E05379FB31000502','','','','','','','','','0','15');

CALL base.p_queryAlarmCount_fk('1096FA0035D17535E05379FB31000001','','','','','','2018-11-01','2018-12-20','','');

SELECT ROUND('75.123233',2);
SELECT GROUP_CONCAT() FROM 

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
WHERE (@rowno:=0)=(@rowno:=0)    AND soe.t>STR_TO_DATE('2018-1-12','%Y-%m-%d') AND soe.t<STR_TO_DATE('2018-12-12','%Y-%m-%d')


SELECT STR_TO_DATE('2018-12-12','%Y-%m-%d');


SELECT REPLACE(NAME,'...kV','') FROM cisp_dev.dev_cameraasset



 
     