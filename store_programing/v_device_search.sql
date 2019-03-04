DELIMITER $$

ALTER ALGORITHM=UNDEFINED DEFINER=zhxm@ SQL SECURITY DEFINER VIEW vf_dev_search AS 
SELECT DISTINCT
  device.ID               AS devId,
  device.NAME             AS devName,
  device.STATUS           AS useflag,
  (CASE device.STATUS WHEN 10 THEN '未投运' WHEN 20 THEN '在运' WHEN 30 THEN '备用' WHEN 40 THEN '退运' WHEN 41 THEN '现场留用' WHEN 42 THEN '库存备用' WHEN 43 THEN '待报废' WHEN 50 THEN '报废' ELSE NULL END) AS useflagName,
  device.CLASS_ID         AS devTypeId,
  type.TYPE_NAME          AS devTypeName,
  device.DEV_EREA_ID      AS areaId,
  device.DEV_EREA_NAME    AS areaName,
  device.SUBSTATION_ID    AS stationId,
  device.SUBSTATION_NAME  AS stationName,
  ywz.whbz                AS ywzId,
  ywz.whbzmc              AS ywzName,
  station.VOLTAGELEVEL_ID AS volCode,
  station.VOLTAGELEVEL    AS volName,
  factory.id              AS factoryId,
  factory.name            AS factoryName,
  org.ORG_NO              AS subBuro,
  org.ORG_NAME            AS subBuroName,
  device.GRID_CODE        AS gridCode,
  type.GROUP_ID           AS groupId,
  (CASE type.GROUP_ID WHEN '1' THEN '在线监测装置' WHEN '2' THEN '辅助设备' WHEN '3' THEN '机器人' END) AS groupName,
  DATE_FORMAT(device.RUN_DATE,'%Y-%m-%d %h:%i:%s') AS userTime
FROM cisp_dev.v_all_dev device
        LEFT JOIN base.tf_device_type TYPE
          ON type.TYPE_ID = device.CLASS_NAME
       LEFT JOIN base.tf_factory factory
         ON factory.id = device.PRODUCT_FACTORY
      LEFT JOIN cisp_dev.yc_substation station
        ON station.ID = device.SUBSTATION_ID
     LEFT JOIN base.tf_ywzbdz ywz
       ON ywz.whbz = station.MAINTENANCE_TEAM
    LEFT JOIN cisp_platform.bp_org org
      ON org.ORG_NO = station.DEPART
   LEFT JOIN cisp_platform.bp_code devstatus
     ON devstatus.VALUE = device.STATUS
WHERE (station.RUN_STATUS = '20')$$

DELIMITER ;



SELECT * FROM base.v_device

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












