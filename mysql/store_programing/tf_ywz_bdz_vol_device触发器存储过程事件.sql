# 1	create table   
DROP TABLE base.tf_ywz_bdz_vol_device;   
CREATE TABLE base.tf_ywz_bdz_vol_device AS     
SELECT DISTINCT
    dev.id AS devid,dev.name AS devname,devtype.subsystem AS subsystem,
    devtype.type_id AS devtype,devtype.type_name AS devtypename,
    dev.depart AS org_no, ywz.whbz AS ywzid, ywz.whbzmc AS ywzname,
    station.id AS stationid, station.name AS stationname,
    station.voltagelevel_id AS volcode,station.voltagelevel AS volname
FROM
     cisp_dev.v_all_dev dev
    LEFT JOIN cisp_dev.yc_substation station
	ON dev.substation_id = station.id
    LEFT JOIN base.tf_ywzbdz ywz
	ON ywz.zyid = station.id
     LEFT JOIN base.tf_device_type devtype
	ON dev.class_name=devtype.type_id
WHERE ywz.whbz IS NOT NULL

# 1	create table   
TRUNCATE  base.tf_ywz_bdz_vol_device;     
INSERT INTO base.tf_ywz_bdz_vol_device 
SELECT DISTINCT
    dev.id AS devid,dev.name AS devname,devtype.subsystem AS subsystem,
    devtype.type_id AS devtype,devtype.type_name AS devtypename,
    dev.depart AS org_no, ywz.whbz AS ywzid, ywz.whbzmc AS ywzname,
    station.id AS stationid, station.name AS stationname,
    station.voltagelevel_id AS volcode,station.voltagelevel AS volname
FROM
     cisp_dev.v_all_dev dev
    LEFT JOIN cisp_dev.yc_substation station
	ON dev.substation_id = station.id
    LEFT JOIN base.tf_ywzbdz ywz
	ON ywz.whbz = station.maintenance_team
     LEFT JOIN base.tf_device_type devtype
	ON dev.class_name=devtype.type_id 
WHERE ywz.whbz IS NOT NULL

SELECT GROUP_CONCAT(type_id),GROUP_CONCAT(TYPE_NAME) FROM base.tf_device_type;
SELECT GROUP_CONCAT(typeId) FROM (SELECT CODE AS typeId,VALUE AS typeName FROM base.td_dictionary WHERE TYPE='SUBSYSTEM'
) t
SELECT * FROM base.tf_device_type

SELECT * FROM  cisp_dev.v_all_dev dev;
SELECT * FROM  base.tf_ywz_bdz_vol_device;
SELECT COUNT(*) FROM  base.tf_ywz_bdz_vol_device;

SELECT * FROM  base.tf_ywz_bdz_vol_device;
SELECT * FROM cisp_dev.yc_substation

# change column datatype
ALTER TABLE base.tf_ywz_bdz_vol_device MODIFY COLUMN subsystem ENUM('FIRECONTROL','LOCKCONTROL','POWERENVIOR','PRESSBOARD','SECURITYCONTROL','VIDEOCONTROL'
);

ALTER TABLE base.tf_ywz_bdz_vol_device MODIFY COLUMN devtype ENUM('AirConditionerAsset','AudibleVisualAlarmAsset','AudioAsset','BatteryAsset','BrakeThermodetectorAsset','CableMonitAsset','CameraAsset','CondensationScanAsset','CVTAsset','DischargeAsset','DoorCtrlAsset','DryPowderExtinguisherAsset','ElectricFenceAsset','EnvironmentCtrlAsset','FanCTLAsset','FeElectricAsset','FireDetectorAsset','FireInfraredDSAsset','FireWaterpoolAsset','FireWaterPumpAsset','HumidityAsset','HydrantAsset','InfraredDSAsset','InfraredSJAsset','LigterCtrlAsset','MagnetMonitAsset','O3ContentAsset','OilAnalysisAsset','OilFrontCTAsset','RobotAsset','SF6ContentAsset','SF6DensityAsset','SirenCtrl','SmokeDetectorAsset','SPSprayAsset','SwitchThermodetectorAsset','TemperatureSensorAsset','ThermodetectorAsset','TransformerBreathAsset','TransformerBushAsset','TransformerDischargeAsset','TransformerElectricAsset','VerticalMonitAsset','WaterPumpAsset','WaterSoakAsset','WaterSprayAsset','WindDirectionAsset','WindSpeedAsset','ZnO2ArresterAsset'
);

ALTER TABLE base.tf_ywz_bdz_vol_device MODIFY COLUMN devtypename ENUM('空调','声光报警','可视对讲设备','蓄电池（组）装置','开关柜闸刀触头测温装置','电缆沟监测装置','摄像头设备','端子箱凝露监测装置','电容式电压互感器装置','组合电器局部放电装置','门禁','干粉灭火器','电子围栏','环境控制设备','风机','变压器铁芯接地电流装置','火焰探测器','消防红外对射','消防水池','消防水泵','湿度检测设备','消火栓','安防红外对射','红外双鉴','灯光','中性点直流偏磁监测装置','臭氧含量检测设备','变压器、电抗器油色谱装置','油浸正立电容型电流互感器装置','机器人','SF6气体含量检测设备','SF6气体微水含量、密度装置','警笛','烟感','SP泡沫喷淋','隔离开关触头测温装置','温感','温度检测设备','变压器呼吸器监测装置','变压器套管装置','变压器局部放电装置','变压器绕组电流监测装置','隔直监测装置','动环水泵','水浸','消防水喷淋','风向检测设备','风速检测设备','氧化锌避雷器'
);

ALTER TABLE base.tf_ywz_bdz_vol_device MODIFY COLUMN volcode ENUM('37','36','35','34','33','32','31','30','25','24','23','22','21','20','14','15','13','10','12','09','11','8','7','6','5','4','3','2','1'
);
ALTER TABLE base.tf_ywz_bdz_vol_device MODIFY COLUMN volname ENUM('交流1000kV','交流750kV','交流500kV','交流330kV','交流220kV','交流110kV','交流72.5kV','交流66kV','交流35kV','交流20kV','交流15.75kV','交流10kV','交流6kV','交流3kV','交流3000V','交流2500V','交流1500V','交流1000V（含1140V）','交流750V','交流660V','交流600V','交流380V（含400V）','交流220V','交流110V','交流48V','交流36V','交流24V','交流12V','交流6V'
);


SELECT * FROM base.tf_voltagelevel WHERE useflag=1

SELECT GROUP_CONCAT(vol_code),GROUP_CONCAT(vol_value) FROM base.tf_voltagelevel WHERE useflag=1

SELECT * FROM tf_ywz_bdz_vol_device WHERE volcode NOT IN ('37','36','35','34','33','32','31','30','25','24','23','22','21','20','14','15','13','10','12','09','11','8','7','6','5','4','3','2','1'
);



SELECT COUNT(*) FROM base.tf_ywz_bdz_vol_device
SELECT COUNT(*) FROM cisp_dev.v_all_dev dev
# 2	add key
ALTER TABLE base.tf_ywz_bdz_vol_device ADD KEY (devid,stationid,org_no,subsystem,devtype,devtypename,ywzid)
ALTER TABLE base.tf_ywz_bdz_vol_device ADD KEY (devid);
ALTER TABLE base.tf_ywz_bdz_vol_device ADD KEY (stationid);
ALTER TABLE base.tf_ywz_bdz_vol_device ADD KEY (org_no);
ALTER TABLE base.tf_ywz_bdz_vol_device ADD KEY (subsystem);
ALTER TABLE base.tf_ywz_bdz_vol_device ADD KEY (devtype);
ALTER TABLE base.tf_ywz_bdz_vol_device ADD KEY (devtypename);
ALTER TABLE base.tf_ywz_bdz_vol_device ADD KEY (ywzid);





# 3	更新tf_ywzbdz_vol_exists_device表
DROP PROCEDURE IF EXISTS base.sp_update_tf_ywz_bdz_vol_device;
DELIMITER //
CREATE PROCEDURE base.sp_update_tf_ywz_bdz_vol_device ()
BEGIN
     -- TRUNCATE base.tf_ywzbdz_vol_exists_device;
     
     INSERT INTO base.tf_ywz_bdz_vol_device 
		SELECT DISTINCT
		dev.id AS devid,dev.name AS devname,devtype.subsystem AS subsystem,
		devtype.type_id AS devtype,devtype.type_name AS devtypename,
		dev.depart AS org_no, ywz.whbz AS ywzid, ywz.whbzmc AS ywzname,
		station.id AS stationid, station.name AS stationname,
		station.voltagelevel_id AS volcode,station.voltagelevel AS volname
		FROM
		cisp_dev.v_all_dev dev
		LEFT JOIN cisp_dev.yc_substation station
			ON dev.substation_id = station.id
		LEFT JOIN base.tf_ywzbdz ywz
			ON ywz.zyid = station.id
		LEFT JOIN base.tf_device_type devtype
			ON dev.class_name=devtype.type_id
		WHERE ywz.whbz IS NOT NULL AND dev.id NOT IN (SELECT devid FROM tf_ywz_bdz_vol_device);
     
END 
//
DELIMITER ;

CALL base.sp_update_tf_ywz_bdz_vol_device;

SELECT * FROM base.tf_ywz_bdz_vol_device;
SELECT * FROM cisp_dev.v_all_dev dev

# 4	建定时更新事件 20 分钟更新一次
DROP EVENT IF EXISTS base.update_tf_ywz_bdz_vol_device;

CREATE EVENT base.update_tf_ywz_bdz_vol_device
ON SCHEDULE EVERY 20 MINUTE DO CALL base.sp_update_tf_ywz_bdz_vol_device ();



SELECT * FROM cisp_dev.v_all_dev      
SELECT * FROM cisp_dev.yc_substation
 
SELECT * FROM base.tf_ywzbdz
 
  
 
 
 
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

