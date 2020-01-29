CREATE VIEW vf_dev_search
AS
SELECT DISTINCT device_id "devId",
                device_name "devName",
                device.useflag,
                CASE device.useflag
                  WHEN 0 THEN
                   '禁用'
                  WHEN 1 THEN
                   '启用'
                  ELSE
                   NULL
                END AS "useflagName",
                CASE device.devDynamicStatus
                  WHEN 0 THEN
                   '在线'
                  WHEN 1 THEN
                   '离线'
                  WHEN 2 THEN
                   '异常'
                  ELSE
                   NULL
                END AS "devDynamicStatusName",
                TYPE.type_id "devTypeId",
                TYPE.type_name "devTypeName",
                area.area_id "areaId",
                area.area_name "areaName",
                station.station_id "stationId",
                station.station_name "stationName",
                vol.vol_code "volCode",
                vol.vol_value "volName",
                org.org_no "subBuro",
                org.org_name "subBuroName",
                org.org_short_name "subBuroShortName",
                (SELECT org_no FROM tf_org WHERE ORG_no = station.buro) "buro",
                (SELECT org_name FROM tf_org WHERE ORG_no = station.buro) "buroName",
                (SELECT org_short_name
                   FROM tf_org
                  WHERE ORG_no = station.buro) "buroShortName",
                factory.id "factoryId",
                factory.name "factoryName",
                /* case #{deviceZt} when '2004' then '调试'  when '2001' then '故障'  when '2002' then '退运'  when '2005' then '投运'  when '2006' then '通讯异常' else '未知' end as "deviceZt",*/
                device.user_time     "userTime",
                device.manager_id    "managerId",
                device.manager,
                device.grid_code     "gridCode"
               /* device.mpxh,
                device.out_time,
                device.install_date,
                device.install_place,
                device.locate_zyid,
                device.create_time,
                device.modify_time,
                device.comtype,
                device.linkobj,
                device.linktype,
                device.remark*/
  FROM tf_device device
 INNER JOIN tf_device_type TYPE
    ON TYPE.type_id = device.dev_type_id
 INNER JOIN tf_substation station
    ON station.station_id = device.substation_Id
 INNER JOIN tf_voltagelevel vol
    ON vol.vol_code = station.vol_id
 INNER JOIN tf_factory factory
    ON factory.id = device.factory_id
 INNER JOIN tf_device_area AREA
    ON area.area_id = device.area_id
 INNER JOIN tf_org org
    ON org.org_no = station.subburo;
    

