SELECT
        ORG_NO            "id",
        ORG_NAME          "name",
        ORG_SHORT_NAME    "shortName",
        "buro" AS "typeName",
        #{id} as "pId",
        REPLACE(CONCAT("/querycount/getBuroTree?","id=",ORG_NO,"<![CDATA[&]]>typeName=","buro"),' ','')  AS   "requestUrl"
        FROM base.tf_org
        WHERE FIND_IN_SET(org_no,get_childs_by_cameraids_final(#{id},#{typeName}));


SELECT get_childs_by_cameraids_final('1096FA0035D17535E05379FB50152672','buro')



SELECT * FROM base.vf_dev_search v WHERE v.stationId = 1 AND v.devTypeId = 4061



SELECT DISTINCT
  stationId,
  stationName
FROM base.vf_dev_search v
WHERE v.ywzId = 0000383335
    AND v.devTypeId = 4061


-- 县局
SELECT
  ORG_NO                                "id",
  ORG_NAME                              "name",
  "subBuro"                          AS "typeName",
  '1096FA0035D17535E05379FB50152672' AS "pId",
  '/querycount/getBuroTree'          AS "requestUrl"
FROM cisp_platform.bp_org
WHERE FIND_IN_SET(org_no,base.getAllChildOrg('1096FA0035D17535E05379FB31000001'));

SELECT base.getAllChildOrg('1096FA0035D17535E05379FB31000001');



SELECT * FROM cisp_platform.bp_org WHERE FIND_IN_SET(org_no,base.getAllChildOrg('1096FA0035D17535E05379FB31000001')); 
SELECT * FROM cisp_platform.bp_org WHERE org_no='8a812897493378a001495677ad086663'


-- 运维站
SELECT DISTINCT
  v.ywzId                         "id",
  v.ywzName                       "name",
  "ywz"                        AS "typeName",
  v.subBuro                    AS "pId",
  '/querycount/getStationTree' AS "requestUrl"
FROM base.vf_dev_search v
WHERE v.subburo = '1096FA0035D17535E05379FB50152672'
    AND v.devTypeId = 4061


-- 变电站
       SELECT DISTINCT 	v.stationId "id",
	v.stationName "name",
	"station" AS "typeName",
	v.ywzId AS "pId",
	'/querycount/getAreaTree'   AS   "requestUrl"
	FROM base.vf_dev_search v
	WHERE v.ywzId=0000383335
	    AND v.devTypeId = 4061


-- 区域
SELECT DISTINCT
  v.areaId AS 'id',
  v.areaName AS "name",
  v.stationId AS 'pId',
  "area" AS "typeName",
  '/querycount/getCameraTree' AS   "requestUrl"
FROM base.vf_dev_search v
WHERE v.stationId = 1
    AND v.devTypeId = 4061
    
    
-- 摄像头
SELECT DISTINCT
  v.devId AS 'id',
  v.devName AS "name",
   v.areaId AS "pId",
  'camera' AS 'typeName',
  v.useflag AS 'nodeStatus',
  CASE v.useflag WHEN '1' THEN '可用' WHEN '0' THEN '不可用' END AS 'nodeStatusName'
FROM base.vf_dev_search v
WHERE v.areaId = 1
    AND v.devTypeId = 4061
    
    
    
SELECT 	d.device_id "id",
	d.device_name "name",
	"camera" AS "typeName" ,
	 AS "pId",
	d.devDynamicStatus "nodeStatus",
	CASE d.devDynamicStatus WHEN 0 THEN '不可用' WHEN 1 THEN '可用' ELSE NULL  END AS  "nodeStatusName"
	FROM
	base.tf_device_camera c INNER JOIN tf_device d ON d.device_id=c.device_id
	 WHERE  FIND_IN_SET(d.device_id,get_childs_by_cameraids_final(#{id},#{typeName}));    
    
    
    
    
    
    