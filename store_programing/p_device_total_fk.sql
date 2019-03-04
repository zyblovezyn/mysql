

SELECT
  COUNT(t.devId) AS total,
  CASE t.devStatus WHEN '2004' THEN '调试'  WHEN '2001' THEN '故障'  WHEN '2002' THEN '退运'  WHEN '2005' THEN '投运'  WHEN '2006' THEN '通讯异常' ELSE '未知' END AS "devStatus",
  CASE t.groupId WHEN '1' THEN '在线监测' WHEN '2' THEN '辅控' WHEN '3' THEN '机器人' END AS "groupName"
FROM (SELECT
        s.*,
        IFNULL(t.devStatus,'2005') AS 'devStatus'
      FROM base.vf_dev_search s
        LEFT JOIN temTable t
          ON s.devId = t.devId
      WHERE 1 = 1
          AND s.subburo IN('$','1096FA0035D17535E05379FB31000001','1096FA0035D17535E05379FB31510001','1096FA0035D17535E05379FB31520001','1096FA0035D17535E05379FB31531000','1096FA0035D17535E05379FB31540001','1096FA0035D17535E05379FB31550001','1096FA0035D17535E05379FB31560001','1096FA0035D17535E05379FB31570001','1096FA0035D17535E05379FB50152672')) t
GROUP BY devStatus,groupId

SELECT * FROM base.vf_dev_search device LEFT JOIN base.tf_dev_currentstatus STATUS
           ON device.devId = status.dev_id
           WHERE device.groupId='2'

-- 传入局信息获取统计值
DROP PROCEDURE IF EXISTS base.p_device_total_fk;
DELIMITER $$
CREATE PROCEDURE base.p_device_total_fk(IN org VARCHAR(40)) -- 辅控设备工况
BEGIN
	 SET @sqlstr=CONCAT('SELECT
					CASE
						s.dev_status
						WHEN \'2004\'
						THEN \'调试状态\'
						WHEN \'2001\'
						THEN \'装置故障\'
						WHEN \'2002\'
						THEN \'退运\'
						WHEN \'2005\'
						THEN \'投运\'
						WHEN \'2006\'
						THEN \'通讯异常\'
						ELSE \'未知\'
					END AS devStatus,
					COUNT(v.id) AS \'total\'
				FROM
					base.tf_dev_currentstatus s
					INNER JOIN cisp_dev.v_all_dev v
						ON v.id = s.dev_id
					JOIN base.tf_device_type t
						ON  v.class_name=t.type_id
				WHERE s.dev_status IN (\'2001\', \'2006\', \'2004\')  AND t.group_id=2') ;
	  
	-- 局信息
	IF ISNULL(org)=FALSE AND LENGTH(org)>0 THEN 
		SET @allorgs=base.getInClause(org);
		SET @sqlstr=CONCAT(@sqlstr,' and v.depart',@allorgs,' GROUP BY devStatus');		 
	END IF;	 
	SET @sql_mode=@@sql_mode;
      SET @@sql_mode='';
	
	-- select @sqlstr;
		
	PREPARE stmt FROM @sqlstr;
	EXECUTE stmt;
	SET @@sql_mode=@sql_mode;
END$$



/*
SELECT COUNT(t.devId) AS total,
				CASE t.devStatus WHEN '2004' THEN '调试状态'  WHEN '2001' THEN '装置故障'  WHEN '2002' THEN '退运'  WHEN '2005' THEN '投运'  WHEN '2006' THEN '通讯异常' ELSE '未知' END AS "devStatus",
				CASE t.groupId WHEN '1' THEN '在线监测' WHEN '2' THEN '辅控' WHEN '3' THEN '机器人' END AS "groupName" FROM 
(SELECT s.*, IFNULL(t.devStatus,'2005') AS 'devStatus' FROM base.vf_dev_search s LEFT JOIN temTable t ON s.devId=t.devId WHERE 1=1  AND s.subburo IN ('$','1096FA0035D17535E05379FB31000001','1096FA0035D17535E05379FB31510001','1096FA0035D17535E05379FB31520001','1096FA0035D17535E05379FB31531000','1096FA0035D17535E05379FB31540001','1096FA0035D17535E05379FB31550001','1096FA0035D17535E05379FB31560001','1096FA0035D17535E05379FB31570001','1096FA0035D17535E05379FB50152672','8a1278036043716701608bbb873c2e52')) t GROUP BY devStatus,groupId


SELECT * FROM  tf_dev_currentstatus

SELECT CONCAT('123'
	,'456'
	,'789')

 
SELECT 
SELECT * FROM vf_dev_search WHERE stationId IN ('1','1200')
DROP PROCEDURE p_device_total

CREATE PROCEDURE p_device_status(org ,station ,factory , devstatus , groupid , vol ,devtype )
*/
CALL base.p_device_total_fk('1096FA0035D17535E05379FB31000001') --  "1096FA0035D17535E05379FB31000001"
CALL base.p_device_total_fk('8a812897493378a001495677ad086663') --  "1096FA0035D17535E05379FB31000001"
            

CALL p_device_status('1096FA0035D17535E05379FB31000001',NULL,NULL,NULL,NULL,NULL,NULL)
CALL p_device_status('1096FA0035D17535E05379FB31000001',NULL,NULL,'2005',NULL,NULL,NULL)

-- 工厂不为null 
CALL p_device_status('1096FA0035D17535E05379FB31000001',NULL,NULL,NULL,'',NULL)
SELECT
  s.*,
  IFNULL(t.devStatus,'2005') AS 'devStatus'
FROM base.vf_dev_search s
  LEFT JOIN temTable t
    ON s.devId = t.devId
WHERE 1 = 1
    AND FIND_IN_SET(s.subburo,base.getAllChildOrg('1096FA0035D17535E05379FB31000001')) > 0
    AND s.stationId = '2'


-- 变电站不为null 
CALL p_device_status('1096FA0035D17535E05379FB31000001',2,NULL,NULL,NULL,NULL)
SELECT
  s.*,
  IFNULL(t.devStatus,'2005') AS 'devStatus'
FROM base.vf_dev_search s
  LEFT JOIN temTable t
    ON s.devId = t.devId
WHERE 1 = 1
    AND FIND_IN_SET(s.subburo,base.getAllChildOrg('1096FA0035D17535E05379FB31000001')) > 0
    AND s.stationId = '2'

-- 参数全是null时
CALL p_device_status('1096FA0035D17535E05379FB31000001',NULL,NULL,NULL,NULL,NULL)
SELECT
  s.*,
  IFNULL(t.devStatus,'2005') AS 'devStatus'
FROM base.vf_dev_search s
  LEFT JOIN temTable t
    ON s.devId = t.devId
WHERE 1 = 1
    AND FIND_IN_SET(s.subburo,base.getAllChildOrg('1096FA0035D17535E05379FB31000001')) > 0
    
    
    

SELECT LOCATE(',','123,456,789')
SELECT SUBSTRING('123,456,789',5);

SELECT
  s.*,
  IFNULL(t.devStatus,'2005') AS 'devStatus'
FROM base.vf_dev_search s
  LEFT JOIN temTable t
    ON s.devId = t.devId
WHERE 1 = 1
    AND FIND_IN_SET(s.subburo,base.getAllChildOrg('1096FA0035D17535E05379FB31000001')) > 0
 CREATE TEMPORARY TABLE IF NOT EXISTS temError
	(
		devId BIGINT,
		devStatus VARCHAR(255)
	);
 
INSERT INTO temError   
	SELECT DISTINCT
     device.devId,
     '2006'        AS "dev_status"
   FROM base.vf_dev_search device
     LEFT JOIN measuredata.tf_dev_commuciation_error cerror
       ON device.devId = cerror.dev_id
   WHERE cerror.isreturn = 0
   ORDER BY cerror.T DESC
   
DROP TEMPORARY TABLE temError

SELECT CONCAT('12','34','567');

CALL p_device_status()


SELECT * FROM vf_dev_search



SELECT * FROM cisp_platform.`bp_org`

 SELECT
        r.record_id,
        a.uuid,
        a.name,
        a.reason,
        r.operator_type,
        r.operator_time,
        r.operator_name,
        a .writer_name,
        a.writer_time
        FROM
        config.tf_inout_record r
        INNER JOIN config.TF_INOUT_AUTH a ON R.UUID = A.UUID
        WHERE A.person_type=0
 
   
SELECT
  @rowno := @rowno+1 AS xuhao,
  r.record_id,
  a.uuid,
  a.name,
  a.reason,
  r.operator_type,
  r.operator_time,
  r.operator_name,
  a.writer_name,
  a.writer_time
FROM
  config.tf_inout_record r
  INNER JOIN config.TF_INOUT_AUTH a
    ON R.UUID = A.UUID
  ,(SELECT @rowno := 0) AS num
WHERE A.person_type = 1
  AND r.auth_persontagid LIKE '%%'
  AND (DATE_FORMAT(r.OPERATOR_TIME, '%Y%m%d') >= STR_TO_DATE(
    '2011-11-11',
    '%Y-%m-%d')
    OR r.OPERATOR_TIME IS NULL
  )
  AND (
    DATE_FORMAT(r.OPERATOR_TIME, '%Y%m%d') <= STR_TO_DATE(NOW(), '%Y-%m-%d')
    OR r.OPERATOR_TIME IS NULL
  )
  AND (
    DATE_FORMAT(a.ORDER_STARTTIME, '%Y%m%d') >= STR_TO_DATE('2011-11-11', '%Y-%m-%d')
    OR a.ORDER_STARTTIME IS NULL
  )
  AND (
    DATE_FORMAT(a.ORDER_STARTTIME, '%Y%m%d') <= STR_TO_DATE(NOW(), '%Y-%m-%d')
    OR a.ORDER_STARTTIME IS NULL
  )
ORDER BY r.OPERATOR_TIME DESC

SELECT (SELECT @rowno:=2) r,@rowno;
SELECT @rowno
SELECT * FROM v_device LIMIT CAST('0' AS SIGNED),CAST('15'AS SIGNED)
SELECT * FROM v_device LIMIT '1','2'

SELECT CAST('0' AS SIGNED),CAST('15'AS SIGNED)