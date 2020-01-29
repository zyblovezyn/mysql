 

DROP VIEW IF EXISTS vf_dev_search 

CREATE VIEW vf_dev_search AS
SELECT DISTINCT device.ID AS devId,
                device.NAME AS devName,
                device.STATUS AS useflag,
                CASE device.STATUS
                  WHEN 10 THEN
                   '未投运'
                  WHEN 20 THEN
                   '在运'
                  WHEN 30 THEN
                   '退运'
                  WHEN 31 THEN
                   '现场留用'
                  WHEN 32 THEN
                   '库存备用'
                  WHEN 33 THEN
                   '待报废'
                  WHEN 40 THEN
                   '报废'
                  ELSE
                   NULL
                END AS useflagName,
                device.CLASS_ID AS devTypeId,
                type.TYPE_NAME AS devTypeName,
                device.DEV_EREA_ID AS areaId,
                device.DEV_EREA_NAME AS areaName,
                device.SUBSTATION_ID AS stationId,
                device.SUBSTATION_NAME AS stationName,
                ywz.ywz_id AS ywzId,
                ywz.ywz_name AS ywzName,
                station.voltagelevel_id AS volCode,
                station.voltagelevel AS volName,
                factory.id AS factoryId,
                factory.name AS factoryName,
                org.ORG_NO AS subBuro,
                org.ORG_NAME AS subBuroName,
                device.GRID_CODE AS gridCode,
                type.GROUP_ID AS groupId,
                CASE type.GROUP_ID
                  WHEN '1' THEN
                   '在线监测装置'
                  WHEN '2' THEN
                   '辅助设备'
                  WHEN '3' THEN
                   '机器人'
                END AS groupName,
                 DATE_FORMAT(device.run_date,'%Y-%m-%d %h:%i:%s')      AS userTime
  FROM cisp_dev.v_all_dev device
  LEFT JOIN base.tf_device_type TYPE
    ON type.TYPE_ID = device.CLASS_NAME
  LEFT JOIN base.tf_factory factory
    ON factory.id = device.PRODUCT_FACTORY
  LEFT JOIN cisp_platform.bp_org org
    ON org.ORG_NO = device.DEPART
  LEFT JOIN cisp_dev.yc_substation station
    ON station.ID = device.SUBSTATION_ID
  LEFT JOIN base.tf_ywz ywz
    ON ywz.ywz_id = station.MAINTENANCE_TEAM
  LEFT JOIN cisp_platform.bp_code devstatus
    ON devstatus.VALUE = device.STATUS
 WHERE station.RUN_STATUS = '20'
   AND ywz.useflag = 1
   AND devstatus.CODE_TYPE = 'bdsb_yxzt'

SELECT * FROM cisp_dev.v_all_dev


SELECT * FROM base.vf_dev_search
 
/* SELECT DISTINCT
  device.device_id     AS devId,
  device.device_name   AS devName,
  device.useflag       AS useflag,
  (CASE device.useflag WHEN 0 THEN '禁用' WHEN 1 THEN '启用' ELSE NULL END) AS useflagName,
  (CASE device.devDynamicStatus WHEN 0 THEN '在线' WHEN 1 THEN '离线' WHEN 2 THEN '异常' ELSE NULL END) AS devDynamicStatusName,
  type.TYPE_ID         AS devTypeId,
  type.TYPE_NAME       AS devTypeName,
  area.area_id         AS areaId,
  area.area_name       AS areaName,
  station.station_id   AS stationId,
  station.station_name AS stationName,
  ywz.ywz_id           AS ywzId,
  ywz.ywz_name	       AS ywzName,
  vol.vol_code         AS volCode,
  vol.vol_value        AS volName,
  org.ORG_NO           AS subBuro,
  org.ORG_NAME         AS subBuroName,
  factory.id           AS factoryId,
  factory.name         AS factoryName,
  DATE_FORMAT(device.user_time,'%Y-%m-%d %h:%i:%s')     AS userTime,
  device.manager_id    AS managerId,
  device.manager       AS manager,
  device.grid_code     AS gridCode,
  type.GROUP_ID        AS groupId
FROM base.tf_device device
  JOIN base.tf_device_type TYPE
    ON type.TYPE_ID = device.dev_type_id
  JOIN base.tf_substation station
    ON station.station_id = device.substation_Id
  JOIN base.tf_voltagelevel vol
    ON vol.vol_code = station.vol_id
  JOIN base.tf_factory factory
    ON factory.id = device.factory_id
  JOIN base.tf_device_area AREA
    ON area.area_id = device.area_id
  JOIN cisp_platform.bp_org org
    ON org.ORG_NO = station.subburo
  JOIN tf_ywz ywz
    ON (ywz.ywz_id=station.ywzid OR (LOCATE(',',station.ywzid) AND SUBSTRING_INDEX(station.ywzid,',',1)=ywz.ywz_id))
*/

SELECT t.*
FROM tf_dev_currentstatus t
WHERE t.dev_id IN（ SELECT
                        v.devId
                      FROM base.vf_dev_search v
                      WHERE FIND_IN_SET(v.subBuro,base.getAllChildOrg('1096FA0035D17535E05379FB31000001')))
                      
SELECT
  v.devId
FROM base.vf_dev_search v
WHERE FIND_IN_SET(v.subBuro,base.getAllChildOrg('1096FA0035D17535E05379FB31000001'))




SELECT t.*,v.devId,v.subBuroName
FROM tf_dev_currentstatus t
  LEFT JOIN base.vf_dev_search v
    ON t.dev_id = v.devId
WHERE FIND_IN_SET(v.subBuro,base.getAllChildOrg('1096FA0035D17535E05379FB31000001'))

SELECT * FROM td_dictionary WHERE TYPE='Device_Status'



SELECT * FROM tf_device_copy

SELECT COUNT(*) FROM tf_device_copy
DELETE FROM tf_device_copy 

UPDATE tf_device_copy SET device_id=SUBSTRING(device_id,LENGTH(device_id)-1);


SELECT SUBSTRING("'zhang",2);



SELECT * FROM cisp_dev.yc_substation

SELECT * FROM 








