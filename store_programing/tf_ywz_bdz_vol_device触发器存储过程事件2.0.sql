# 1	create table   
 DROP TABLE IF EXISTS base.tf_ywz_bdz_vol_device;

CREATE TABLE base.tf_ywz_bdz_vol_device AS
SELECT DISTINCT
     org.org_no AS org_no,
     org.org_name AS org_name,
     org.org_full_name AS org_full_name,
     org.order_no AS order_no,
     org.p_org_no,
     ywz.whbz AS ywzid,
     ywz.whbzmc AS ywzname,
     station.id AS stationid,
     station.name AS stationname,
     station.voltagelevel_id AS volcode,
     station.voltagelevel AS volname,
     devtype.subsystem AS subsystem,
     devtype.subsystemname AS subsystemname,
     devtype.type_id AS devtype,
     devtype.type_name AS devtypename,
     dev.id AS devid,
     dev.name AS devname,
     point.id AS pointid
     -- measure.actionparam
FROM
     cisp_dev.v_all_dev dev
     LEFT JOIN cisp_dev.yc_substation station
          ON dev.substation_id = station.id
     LEFT JOIN base.tf_ywzbdz ywz
          ON ywz.zyid = station.id
     LEFT JOIN base.tf_device_type devtype
          ON dev.class_name = devtype.type_id
     LEFT JOIN base.bp_org_shortname org
          ON dev.depart = org.org_no
     LEFT JOIN cisp_platform.me_conf_measurepoint POINT
          ON point.end_dev_id = dev.id
     -- inner JOIN cisp_platform.me_conf_measure measure
-- 	    ON measure.measurepoint_id=point.id
WHERE ywz.whbz IS NOT NULL;

SELECT * FROM base.tf_ywz_bdz_vol_device

SELECT  
     COUNT(dev.id)
FROM
     cisp_dev.v_all_dev dev
      LEFT JOIN cisp_dev.yc_substation station
          ON dev.substation_id = station.id
      LEFT JOIN base.tf_ywzbdz ywz
          ON ywz.zyid = station.id
     LEFT  JOIN base.tf_device_type devtype
          ON dev.class_name = devtype.type_id
      LEFT JOIN base.bp_org_shortname org
          ON dev.depart = org.org_no
     LEFT  JOIN cisp_platform.me_conf_measurepoint POINT
          ON point.end_dev_id = dev.id
    --  inner JOIN cisp_platform.me_conf_measure measure
-- 	    ON measure.measurepoint_id=point.id
WHERE ywz.whbz IS NOT NULL;



# 2	create table   
TRUNCATE  base.tf_ywz_bdz_vol_device;     
INSERT INTO base.tf_ywz_bdz_vol_device 
SELECT DISTINCT
     org.org_no AS org_no,
     org.org_name AS org_name,
     org.org_full_name AS org_full_name,
     org.order_no AS order_no,
     org.p_org_no,
     ywz.whbz AS ywzid,
     ywz.whbzmc AS ywzname,
     station.id AS stationid,
     station.name AS stationname,
     station.voltagelevel_id AS volcode,
     station.voltagelevel AS volname,
     devtype.subsystem AS subsystem,
     devtype.subsystemname AS subsystemname,
     devtype.type_id AS devtype,
     devtype.type_name AS devtypename,
     dev.id AS devid,
     dev.name AS devname,
     point.id AS pointid,
     measure.actionparam
FROM
     cisp_dev.v_all_dev dev
     LEFT JOIN cisp_dev.yc_substation station
          ON dev.substation_id = station.id
     LEFT JOIN base.tf_ywzbdz ywz
          ON ywz.zyid = station.id
     LEFT JOIN base.tf_device_type devtype
          ON dev.class_name = devtype.type_id
     LEFT JOIN base.bp_org_shortname org
          ON dev.depart = org.org_no
     LEFT JOIN cisp_platform.me_conf_measurepoint POINT
          ON point.end_dev_id = dev.id
     INNER JOIN cisp_platform.me_conf_measure measure
	    ON measure.measurepoint_id=point.id
WHERE ywz.whbz IS NOT NULL;



# 3 change column type
SELECT GROUP_CONCAT(DISTINCT type_id),GROUP_CONCAT(TYPE_NAME) FROM base.tf_device_type;
SELECT GROUP_CONCAT(DISTINCT typeId) FROM (SELECT CODE AS typeId,VALUE AS typeName FROM base.td_dictionary WHERE TYPE='SUBSYSTEM'
) t;
SELECT GROUP_CONCAT(DISTINCT typeName) FROM (SELECT CODE AS typeId,VALUE AS typeName FROM base.td_dictionary WHERE TYPE='SUBSYSTEM'
) t;

SELECT GROUP_CONCAT(DISTINCT org_no) FROM (SELECT DISTINCT org_no,org_name,org_full_name,order_no FROM base.bp_org_shortname) t;

SELECT GROUP_CONCAT(org_no) FROM (SELECT DISTINCT org_no,org_name,org_full_name,order_no FROM base.bp_org_shortname) t;

SELECT GROUP_CONCAT(DISTINCT org_name) FROM (SELECT DISTINCT org_no,org_name,org_full_name,order_no FROM base.bp_org_shortname) t;
SELECT GROUP_CONCAT(DISTINCT org_full_name) FROM (SELECT DISTINCT org_no,org_name,org_full_name,order_no FROM base.bp_org_shortname) t;

SELECT GROUP_CONCAT(DISTINCT order_no) FROM (SELECT DISTINCT org_no,org_name,org_full_name,order_no FROM base.bp_org_shortname) t;

SELECT GROUP_CONCAT(DISTINCT p_org_no) FROM (SELECT DISTINCT org_no,org_name,org_full_name,order_no,p_org_no FROM base.bp_org_shortname) t;


SELECT * FROM base.tf_voltagelevel WHERE useflag=1

SELECT GROUP_CONCAT(DISTINCT vol_code),GROUP_CONCAT(DISTINCT vol_value)  FROM base.tf_voltagelevel WHERE useflag=1 ;

SELECT * FROM tf_ywz_bdz_vol_device WHERE volcode NOT IN ('37','36','35','34','33','32','31','30','25','24','23','22','21','20','14','15','13','10','12','09','11','8','7','6','5','4','3','2','1'
);

SELECT * FROM base.tf_device_type

SELECT * FROM  cisp_dev.v_all_dev dev;
SELECT * FROM  base.tf_ywz_bdz_vol_device;
SELECT COUNT(*) FROM  base.tf_ywz_bdz_vol_device;

SELECT * FROM  base.tf_ywz_bdz_vol_device;
SELECT * FROM cisp_dev.yc_substation

# 4 change column datatype
ALTER TABLE base.tf_ywz_bdz_vol_device MODIFY COLUMN subsystem ENUM('FIRECONTROL','LOCKCONTROL','POWERENVIOR','PRESSBOARD','SECURITYCONTROL','VIDEOCONTROL'
);

ALTER TABLE base.tf_ywz_bdz_vol_device MODIFY COLUMN subsystemname ENUM('消防子系统','锁控子系统','动环子系统','压板子系统','安防子系统','视频子系统'
);

ALTER TABLE base.tf_ywz_bdz_vol_device MODIFY COLUMN devtype ENUM('AirConditionerAsset','AudibleVisualAlarmAsset','AudioAsset','BatteryAsset','BrakeThermodetectorAsset','CableMonitAsset','CameraAsset','CondensationScanAsset','CVTAsset','DischargeAsset','DoorCtrlAsset','DryPowderExtinguisherAsset','ElectricFenceAsset','EnvironmentCtrlAsset','FanCTLAsset','FeElectricAsset','FireDetectorAsset','FireInfraredDSAsset','FireWaterpoolAsset','FireWaterPumpAsset','HumidityAsset','HydrantAsset','InfraredDSAsset','InfraredSJAsset','LigterCtrlAsset','MagnetMonitAsset','O3ContentAsset','OilAnalysisAsset','OilFrontCTAsset','RobotAsset','SF6ContentAsset','SF6DensityAsset','SirenCtrl','SmokeDetectorAsset','SPSprayAsset','SwitchThermodetectorAsset','TemperatureSensorAsset','ThermodetectorAsset','TransformerBreathAsset','TransformerBushAsset','TransformerDischargeAsset','TransformerElectricAsset','VerticalMonitAsset','WaterPumpAsset','WaterSoakAsset','WaterSprayAsset','WindDirectionAsset','WindSpeedAsset','ZnO2ArresterAsset'
);

ALTER TABLE base.tf_ywz_bdz_vol_device MODIFY COLUMN devtypename ENUM('空调','声光报警','可视对讲设备','蓄电池（组）装置','开关柜闸刀触头测温装置','电缆沟监测装置','摄像头设备','端子箱凝露监测装置','电容式电压互感器装置','组合电器局部放电装置','门禁','干粉灭火器','电子围栏','环境控制设备','风机','变压器铁芯接地电流装置','火焰探测器','消防红外对射','消防水池','消防水泵','湿度检测设备','消火栓','安防红外对射','红外双鉴','灯光','中性点直流偏磁监测装置','臭氧含量检测设备','变压器、电抗器油色谱装置','油浸正立电容型电流互感器装置','机器人','SF6气体含量检测设备','SF6气体微水含量、密度装置','警笛','烟感','SP泡沫喷淋','隔离开关触头测温装置','温感','温度检测设备','变压器呼吸器监测装置','变压器套管装置','变压器局部放电装置','变压器绕组电流监测装置','隔直监测装置','动环水泵','水浸','消防水喷淋','风向检测设备','风速检测设备','氧化锌避雷器'
);

ALTER TABLE base.tf_ywz_bdz_vol_device MODIFY COLUMN volcode ENUM('37','35','33','32','25');

ALTER TABLE base.tf_ywz_bdz_vol_device MODIFY COLUMN volname ENUM('交流1000kV','交流500kV','交流220kV','交流110kV','交流35kV');

ALTER TABLE base.tf_ywz_bdz_vol_device MODIFY COLUMN org_no ENUM('000000000','1096FA0035D17535E05379FB00200000','1096FA0035D17535E05379FB00240000','1096FA0035D17535E05379FB00255000','1096FA0035D17535E05379FB00260000','1096FA0035D17535E05379FB00265000','1096FA0035D17535E05379FB00270000','1096FA0035D17535E05379FB00300000','1096FA0035D17535E05379FB00368888','1096FA0035D17535E05379FB00370000','1096FA0035D17535E05379FB00380000','1096FA0035D17535E05379FB00390000','1096FA0035D17535E05379FB20000001','1096FA0035D17535E05379FB21001001','1096FA0035D17535E05379FB21001002','1096FA0035D17535E05379FB21001100','1096FA0035D17535E05379FB21001110','1096FA0035D17535E05379FB21001121','1096FA0035D17535E05379FB21001130','1096FA0035D17535E05379FB21001140','1096FA0035D17535E05379FB21001160','1096FA0035D17535E05379FB21001161','1096FA0035D17535E05379FB25000001','1096FA0035D17535E05379FB26000001','1096FA0035D17535E05379FB27000001','1096FA0035D17535E05379FB31000001','1096FA0035D17535E05379FB31210000','1096FA0035D17535E05379FB31510001','1096FA0035D17535E05379FB31520001','1096FA0035D17535E05379FB31531000','1096FA0035D17535E05379FB31540001','1096FA0035D17535E05379FB31550001','1096FA0035D17535E05379FB31560001','1096FA0035D17535E05379FB31570001','1096FA0035D17535E05379FB32000001','1096FA0035D17535E05379FB32700000','1096FA0035D17535E05379FB32800000','1096FA0035D17535E05379FB32900000','1096FA0035D17535E05379FB33000001','1096FA0035D17535E05379FB33910000','1096FA0035D17535E05379FB33920001','1096FA0035D17535E05379FB33930001','1096FA0035D17535E05379FB33940001','1096FA0035D17535E05379FB33950001','1096FA0035D17535E05379FB33960001','1096FA0035D17535E05379FB34000001','1096FA0035D17535E05379FB34810001','1096FA0035D17535E05379FB34829999','1096FA0035D17535E05379FB34830001','1096FA0035D17535E05379FB34840000','1096FA0035D17535E05379FB34859999','1096FA0035D17535E05379FB34860100','1096FA0035D17535E05379FB34870000','1096FA0035D17535E05379FB34880001','1096FA0035D17535E05379FB34890000','1096FA0035D17535E05379FB35000001','1096FA0035D17535E05379FB35030000','1096FA0035D17535E05379FB35040000','1096FA0035D17535E05379FB35050000','1096FA0035D17535E05379FB35060000','1096FA0035D17535E05379FB35070000','1096FA0035D17535E05379FB35080000','1096FA0035D17535E05379FB35090000','1096FA0035D17535E05379FB36000001','1096FA0035D17535E05379FB36661001','1096FA0035D17535E05379FB36661007','1096FA0035D17535E05379FB36661008','1096FA0035D17535E05379FB36662001','1096FA0035D17535E05379FB36663001','1096FA0035D17535E05379FB36664001','1096FA0035D17535E05379FB37000000','1096FA0035D17535E05379FB37007001','1096FA0035D17535E05379FB37010001','1096FA0035D17535E05379FB37012501','1096FA0035D17535E05379FB37015001','1096FA0035D17535E05379FB37017501','1096FA0035D17535E05379FB37020001','1096FA0035D17535E05379FB37022501','1096FA0035D17535E05379FB37025001','1096FA0035D17535E05379FB37030001','1096FA0035D17535E05379FB37999999','1096FA0035D17535E05379FB38010000','1096FA0035D17535E05379FB38900000','1096FA0035D17535E05379FB38920000','1096FA0035D17535E05379FB38930164','1096FA0035D17535E05379FB38941000','1096FA0035D17535E05379FB38960000','1096FA0035D17535E05379FB38980000','1096FA0035D17535E05379FB39100000','1096FA0035D17535E05379FB39200000','1096FA0035D17535E05379FB42000000','1096FA0035D17535E05379FB47000000','1096FA0035D17535E05379FB48000000','1096FA0035D17535E05379FB48210001','1096FA0035D17535E05379FB48220002','1096FA0035D17535E05379FB50005475','1096FA0035D17535E05379FB50006001','1096FA0035D17535E05379FB50151460','1096FA0035D17535E05379FB50151626','1096FA0035D17535E05379FB50152125','1096FA0035D17535E05379FB50152150','1096FA0035D17535E05379FB50152618','1096FA0035D17535E05379FB50152672','1096FA0035D17535E05379FB50152684','1096FA0035D17535E05379FB50152705','1096FA0035D17535E05379FB50152940','1096FA0035D17535E05379FB50153253','1096FA0035D17535E05379FB50154611','1096FA0035D17535E05379FB50168981','8a097e074b7770ae014c1cbff63f6a32','8a127803551645a401552f5d88c32111','8a127803551645a40156bb8b01b24f59','8a1278036043716701608bbb873c2e52','8a12788950f6bb1a015138891f18050b','8a812897493378a001495677ad086663','B269C7754CAEDF7AA55C26E0BBA809F','ff808081551645d1015590d17bbd437f','国网浙江省置业公司'
);

ALTER TABLE base.tf_ywz_bdz_vol_device MODIFY COLUMN org_name ENUM('三门','上虞','东阳','临安','临海','丽水','丽水本部','义乌','乐清','云和','仙居','余姚','余杭','信息通信分公司','兰溪','华云公司','华电器材检测研究所','台州','台州本部','嘉兴','嘉兴本部','嘉善','国网公司','国网浙经济技术研究院本部','培训中心','大江东','天台','奉化','宁波','宁波本部','宁海','安吉','富阳','岱山','嵊州','嵊泗','常山','平湖','平阳','庆元','建德','开化','德清','慈溪','文成','新昌','景宁','杭州','杭州本部','松阳','桐乡','桐庐','椒江','武义','永嘉','永康','江山','泰顺','洞头','测试单位1','浙江浙电置业有限公司','浙江火电建设有限公司','浙江电力建设监理有限公司','浙江电力调度控制中心','浦江','海宁','海盐','淳安','温岭','温州','温州图盛科技有限公司','温州本部','湖州','湖州本部','物业公司','物资分公司','玉环','瑞安','电力','电力实业总公司','电动汽车公司','电试院','省公司本部','省检','省置业公司','磐安','紧水滩水力发电厂','绍兴','绍兴本部','经济技术研究院','经济技术研究院2','综合服务中心本部','缙云','职业防治院','舟山','舟山本部','节能服务公司','苍南','莲都','萧山','衢州','衢州本部','诸暨','象山','路桥','送变电公司','送变电工程公司','送变电工程公司（母公司）','遂昌','鄞州','金华','金华本部','长兴','青田','黄岩','龙泉','龙游'
);

ALTER TABLE base.tf_ywz_bdz_vol_device MODIFY COLUMN org_full_name ENUM('国家电网公司职业防治院','国网公司','国网浙江三门县供电公司','国网浙江东阳市供电公司','国网浙江临安市供电公司','国网浙江临海市供电公司','国网浙江丽水市莲都区供电公司','国网浙江义乌市供电公司','国网浙江乐清市供电公司','国网浙江云和县供电公司','国网浙江仙居县供电公司','国网浙江余姚市供电公司','国网浙江兰溪市供电公司','国网浙江华电器材检测研究所','国网浙江台州市椒江区供电公司','国网浙江台州市路桥区供电公司','国网浙江台州市黄岩区供电公司','国网浙江嘉善县供电公司','国网浙江天台县供电公司','国网浙江奉化市供电公司','国网浙江宁波市鄞州区供电公司','国网浙江宁海县供电公司','国网浙江安吉县供电公司','国网浙江嵊州市供电公司','国网浙江常山县供电公司','国网浙江平湖市供电公司','国网浙江平阳县供电有限责任公司','国网浙江建德市供电公司','国网浙江开化县供电公司','国网浙江德清县供电公司','国网浙江慈溪市供电公司','国网浙江新昌县供电公司','国网浙江杭州市余杭区供电公司','国网浙江杭州市大江东供电公司','国网浙江杭州市富阳区供电公司','国网浙江杭州市萧山区供电公司','国网浙江松阳县供电公司','国网浙江桐乡市供电公司','国网浙江桐庐县供电公司','国网浙江武义县供电公司','国网浙江永嘉县供电公司','国网浙江永康市供电公司','国网浙江江山市供电公司','国网浙江浙电节能服务有限公司','国网浙江浦江县供电公司','国网浙江海宁市供电公司','国网浙江海盐县供电公司','国网浙江淳安县供电公司','国网浙江温岭市供电公司','国网浙江玉环县供电公司','国网浙江瑞安市供电有限责任公司','国网浙江电力','国网浙江电动汽车公司','国网浙江省电力公司丽水供电公司','国网浙江省电力公司丽水供电公司本部','国网浙江省电力公司信息通信分公司','国网浙江省电力公司台州供电公司','国网浙江省电力公司台州供电公司本部','国网浙江省电力公司嘉兴供电公司','国网浙江省电力公司嘉兴供电公司本部','国网浙江省电力公司培训中心','国网浙江省电力公司宁波供电公司','国网浙江省电力公司宁波供电公司本部','国网浙江省电力公司岱山县供电公司','国网浙江省电力公司嵊泗县供电公司','国网浙江省电力公司庆元县供电公司','国网浙江省电力公司文成县供电公司','国网浙江省电力公司景宁县供电公司','国网浙江省电力公司本部','国网浙江省电力公司杭州供电公司','国网浙江省电力公司杭州供电公司本部','国网浙江省电力公司检修分公司','国网浙江省电力公司泰顺县供电公司','国网浙江省电力公司洞头县供电公司','国网浙江省电力公司温州供电公司','国网浙江省电力公司温州供电公司本部','国网浙江省电力公司湖州供电公司','国网浙江省电力公司湖州供电公司本部','国网浙江省电力公司电力科学研究院','国网浙江省电力公司磐安县供电公司','国网浙江省电力公司紧水滩水力发电厂','国网浙江省电力公司绍兴供电公司','国网浙江省电力公司绍兴供电公司本部','国网浙江省电力公司经济技术研究院','国网浙江省电力公司经济技术研究院2','国网浙江省电力公司综合服务中心本部','国网浙江省电力公司舟山供电公司','国网浙江省电力公司舟山供电公司本部','国网浙江省电力公司衢州供电公司','国网浙江省电力公司衢州供电公司本部','国网浙江省电力公司金华供电公司','国网浙江省电力公司金华供电公司本部','国网浙江省电力公司龙泉市供电公司','国网浙江省电力有限公司物资分公司','国网浙江省置业公司','国网浙江绍兴市上虞区供电公司','国网浙江缙云县供电公司','国网浙江苍南县供电有限责任公司','国网浙江诸暨市供电公司','国网浙江象山县供电公司','国网浙江遂昌县供电公司','国网浙江长兴县供电公司','国网浙江青田县供电公司','国网浙江龙游县供电公司','国网浙省电力公司经济技术研究院本部','测试单位1','浙江华云电力实业集团有限公司','浙江浙电置业有限公司','浙江火电建设有限公司','浙江电力建设监理有限公司','浙江电力调度控制中心','浙江省电力实业总公司','浙江省送变电工程公司','浙江省送变电工程公司（母公司）','温州市图盛科技有限公司','物业公司'
);

ALTER TABLE base.tf_ywz_bdz_vol_device MODIFY COLUMN order_no ENUM('1','2','3','4','5','6','7','8','9','10','11','12','13','14','16','17','103','104','105','106','107','108','109','110','111','112','113','114','115','116','117','118','119','120','121','122','123','124','125','126','127','128','129','130','131','132','133','134','135','136','137','138','139','140','141','142','143','144','145','146','147','148','149','150','151','152','153','154','155','156','157','158','159','160','161','162','163','164','165','166','167','168','169','170','171','172','173','174','175','176','177','179','182'
);
ALTER TABLE base.tf_ywz_bdz_vol_device MODIFY COLUMN p_org_no ENUM('000000000','1096FA0035D17535E05379FB00200000','1096FA0035D17535E05379FB00300000','1096FA0035D17535E05379FB21001100','1096FA0035D17535E05379FB21001161','1096FA0035D17535E05379FB31000001','1096FA0035D17535E05379FB31240000','1096FA0035D17535E05379FB32000001','1096FA0035D17535E05379FB33000001','1096FA0035D17535E05379FB34000001','1096FA0035D17535E05379FB35000001','1096FA0035D17535E05379FB36000001','1096FA0035D17535E05379FB37000000','1096FA0035D17535E05379FB38010000','1096FA0035D17535E05379FB38011300','1096FA0035D17535E05379FB38011800','1096FA0035D17535E05379FB42000000','1096FA0035D17535E05379FB48000000','1096FA0035D17535E05379FB50096195','1096FA0035D17535E05379FB50171041','8a812897493378a001495677ad086663'
);

# 5  add key
ALTER TABLE base.tf_ywz_bdz_vol_device ADD KEY (org_no);

ALTER TABLE base.tf_ywz_bdz_vol_device ADD KEY (order_no);

ALTER TABLE base.tf_ywz_bdz_vol_device ADD KEY (p_org_no);

ALTER TABLE base.tf_ywz_bdz_vol_device ADD KEY (ywzid);

ALTER TABLE base.tf_ywz_bdz_vol_device ADD KEY (stationid);

ALTER TABLE base.tf_ywz_bdz_vol_device ADD KEY (subsystem);

ALTER TABLE base.tf_ywz_bdz_vol_device ADD KEY (devtype);

ALTER TABLE base.tf_ywz_bdz_vol_device ADD KEY (devid);

ALTER TABLE base.tf_ywz_bdz_vol_device ADD KEY (pointid);

ALTER TABLE base.tf_ywz_bdz_vol_device ADD KEY (pointid);







# 6	更新tf_ywzbdz_vol_exists_device表
DROP PROCEDURE IF EXISTS base.sp_update_tf_ywz_bdz_vol_device;
DELIMITER //
CREATE PROCEDURE base.sp_update_tf_ywz_bdz_vol_device ()
BEGIN
     -- TRUNCATE base.tf_ywzbdz_vol_exists_device;
     
		INSERT INTO base.tf_ywz_bdz_vol_device
			SELECT DISTINCT
			org.org_no AS org_no,
			org.org_name AS org_name,
			org.org_full_name AS org_full_name,
			org.order_no AS order_no,
			org.p_org_no,
			ywz.whbz AS ywzid,
			ywz.whbzmc AS ywzname,
			station.id AS stationid,
			station.name AS stationname,
			station.voltagelevel_id AS volcode,
			station.voltagelevel AS volname,
			devtype.subsystem AS subsystem,
			devtype.subsystemname AS subsystemname,
			devtype.type_id AS devtype,
			devtype.type_name AS devtypename,
			dev.id AS devid,
			dev.name AS devname,
			point.id AS pointid
			-- measure.actionparam
			FROM
			cisp_dev.v_all_dev dev
			LEFT JOIN cisp_dev.yc_substation station
				ON dev.substation_id = station.id
			LEFT JOIN base.tf_ywzbdz ywz
				ON ywz.zyid = station.id
			LEFT JOIN base.tf_device_type devtype
				ON dev.class_name = devtype.type_id
			LEFT JOIN base.bp_org_shortname org
				ON dev.depart = org.org_no
			LEFT JOIN cisp_platform.me_conf_measurepoint POINT
				ON point.end_dev_id = dev.id
			-- LEFT JOIN cisp_platform.me_conf_measure measure
-- 				ON measure.measurepoint_id=point.id
			WHERE ywz.whbz IS NOT NULL
		AND dev.id NOT IN
		(SELECT
			devid
		FROM
			base.tf_ywz_bdz_vol_device);

     
END 
//
DELIMITER ;

CALL base.sp_update_tf_ywz_bdz_vol_device;

SELECT * FROM base.tf_ywz_bdz_vol_device;
SELECT * FROM cisp_dev.v_all_dev dev

# 7	建定时更新事件 20 分钟更新一次
DROP EVENT IF EXISTS base.update_tf_ywz_bdz_vol_device;

CREATE EVENT base.update_tf_ywz_bdz_vol_device
ON SCHEDULE EVERY 20 MINUTE DO CALL base.sp_update_tf_ywz_bdz_vol_device ();



