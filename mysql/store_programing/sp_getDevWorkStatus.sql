

-- version 1.0	date:2019-01-03	reason：设备状态查询
DROP PROCEDURE IF EXISTS base.sp_getDevWorkStatusDetail;
DELIMITER //
CREATE PROCEDURE base.sp_getDevWorkStatusDetail(org_no CHAR(40),ywzids MEDIUMTEXT,volids MEDIUMTEXT,
stationids MEDIUMTEXT,devType CHAR(32),factoryid CHAR(50),devModel CHAR(50),devstatus CHAR(10),
startdate VARCHAR(20),enddate VARCHAR(20),startline VARCHAR(20),limitline VARCHAR(20))
BEGIN

	SET @sqlstr=CONCAT('SELECT 	dev.id devid,
						dev.district,
						dev.depart,
						dev.run_date,
						dev.name devname,
						dev.install_location,
						type.type_id AS devtypeid,
						type.type_name AS devtypename,
						IFNULL(devstatus.dev_status, "2005") AS dev_status,
						IFNULL(dic.value, \'投运\') AS dev_status_value,
						factory.value AS product_factory,
						factory.name AS factoryname,
						model.value model,
						model.name modelname,
						station.id,
						station.name AS substationname,
						station.voltagelevel_id,
						station.voltagelevel,
						ywz.whbz ywzid,
						ywz.whbzmc ywzname,
						org.org_name departname,
						org.org_no depart
						FROM
							cisp_dev.v_all_dev dev
						left join base.tf_dev_currentstatus devstatus
							on dev.id = devstatus.dev_id
						left join base.tf_device_type type
							on dev.class_name = type.type_id
						left join cisp_dev.yc_substation station
							on dev.substation_id = station.id
						left join cisp_platform.bp_org org
							on dev.depart = org.org_no
						left join base.tf_ywzbdz ywz
							on station.id = ywz.zyid
						left join base.td_dictionary dic
							on devstatus.dev_status = dic.code
						left join
							(select
								value,
								name
							from
								cisp_platform.bp_code
							where code_type = \'device_factory\') factory
							on dev.product_factory = factory.value
						left join
							(select
								value,
								name
							from
								cisp_platform.bp_code
							where code_type = \'device_model\'
								and index_key != \'\') model
							on dev.model = model.value
						where type.group_id = 2 ');
	
	IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN
		SET @org_no=IF(STRCMP(org_no,'8a812897493378a001495677ad086663'),'',CONCAT(' and org.org_no ',base.getInClause(org_no))); END IF;
	
	IF ISNULL(ywzids)=FALSE AND LENGTH(ywzids)>0 THEN
		SET @ywzids=CONCAT(' and ywz.whbz in ',base.delimiterStr(ywzids,','));END IF;
		
	IF ISNULL(volids)=FALSE AND LENGTH(volids)>0 THEN
		SET @volids=CONCAT(' and station.voltagelevel_id in ',base.delimiterStr(volids,','));END IF;
		
	IF ISNULL(stationids)=FALSE AND LENGTH(stationids)>0 THEN
		SET @stationids=CONCAT(' and station.id in ',base.delimiterStr(stationids,','));END IF;
		
	IF ISNULL(devType)=FALSE AND LENGTH(devType)>0 THEN
		SET @devType=CONCAT(' and type.type_id = \'',devType,'\'');END IF;
		
	IF ISNULL(factoryid)=FALSE AND LENGTH(factoryid)>0 THEN
		SET @factoryid=CONCAT(' and factory.value = \'',factoryid,'\'');END IF;
		
	IF ISNULL(devModel)=FALSE AND LENGTH(devModel)>0 THEN
		SET @devModel=CONCAT(' and model.value = \'',devModel,'\'');END IF;
		
	IF ISNULL(devstatus)=FALSE AND LENGTH(devstatus)>0 THEN
		SET @devstatus=CONCAT(' and devstatus.dev_status = \'',devstatus,'\'');END IF;
		
	IF ISNULL(startdate)=FALSE AND LENGTH(startdate)>0 THEN
		SET @startdate=CONCAT(' and dev.run_date >= \'',startdate,'\'');END IF;
		
	IF ISNULL(enddate)=FALSE AND LENGTH(enddate)>0 THEN
		SET @enddate=CONCAT(' and dev.run_date <= \'',enddate,'\'');END IF;
	
	IF ISNULL(startline)=FALSE AND LENGTH(startline)>0 THEN
		SET @startline=CONCAT(' limit ',startline);END IF;
		
	IF ISNULL(limitline)=FALSE AND LENGTH(limitline)>0 THEN
		SET @limitline=CONCAT(',',limitline);END IF;
	SET @sqlorder=CONCAT(' order by org.order_no ,ywzname,voltagelevel');
	SET @sqlstr=CONCAT(@sqlstr,
	IFNULL(@org_no,''),
	IFNULL(@ywzids,''),
	IFNULL(@volids,''),
	IFNULL(@stationids,''),
	IFNULL(@devType,''),
	IFNULL(@factoryid,''),
	IFNULL(@devModel,''),
	IFNULL(@devstatus,''),
	IFNULL(@startdate,''),
	IFNULL(@enddate,''),
	IFNULL(@sqlorder,''),
	IFNULL(@startline,''),
	IFNULL(@limitline,'')	
	);	
	-- select @sqlstr;
	PREPARE stmt FROM @sqlstr;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
END



CALL base.sp_getDevWorkStatusDetail('1096FA0035D17535E05379FB31000001','','','','','','','2001','','','0','100');

CALL base.sp_getDevWorkStatusDetail('8a812897493378a001495677ad086663','','','','','','','','','','0','20510');


SELECT LENGTH('2018-12-12');
SELECT * FROM 	base.tf_dev_currentstatus devstatus
SELECT base.delimiterStr('1,2,3',',')
SELECT MAX(LENGTH(type_id)) FROM base.tf_device_type TYPE

SELECT COUNT(*) FROM cisp_dev.v_all_dev WHERE district='8a812897493378a001495677ad086663';