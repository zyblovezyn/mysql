

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



-- 传入局信息获取统计值
DELIMITER $$
CREATE PROCEDURE p_device_total(IN org VARCHAR(256))
BEGIN
	DECLARE gid BIGINT;
	DECLARE ErrorNum INT;
	DECLARE FaultNum INT;
	DECLARE gstatus VARCHAR(1000);	
	DECLARE done INT DEFAULT FALSE;
	DECLARE sqlstr VARCHAR(1000);
	DECLARE hasnum INT;
	DECLARE temp VARCHAR(255);
	DECLARE fdate DATE;
	DECLARE cdate DATE;
	DECLARE allorgs VARCHAR(2000);
		
        DECLARE rc CURSOR FOR SELECT device.devId,
	       IFNULL(status.dev_status,'2005') AS 'devStatus'	 
        FROM base.vf_dev_search device
         LEFT JOIN base.tf_dev_currentstatus STATUS
           ON device.devId = status.dev_id;
          -- WHERE FIND_IN_SET(device.subBuro,base.getAllChildOrg('1096FA0035D17535E05379FB31000001'));
           
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
        
        DROP TABLE IF EXISTS temTable;
	CREATE TEMPORARY TABLE IF NOT EXISTS temTable
	(
		devId BIGINT,
		devStatus VARCHAR(255)
	);
	DROP  TABLE  IF EXISTS temError;
	CREATE TEMPORARY TABLE IF NOT EXISTS temError
	(
		devId BIGINT,
		devStatus VARCHAR(255)
	);	
	  DROP  TABLE  IF EXISTS temFault;
	CREATE TEMPORARY TABLE IF NOT EXISTS temFault
	(
		devId BIGINT,
		devStatus VARCHAR(255)
	);	
	
	
	INSERT INTO temError   
	SELECT DISTINCT device.devId,
			'2006' AS "devStatus"
	FROM base.vf_dev_search device
	LEFT JOIN measuredata.tf_dev_commuciation_error cerror
		ON device.devId = cerror.dev_id
		WHERE cerror.isreturn = 0 -- and FIND_IN_SET(device.subBuro,base.getAllChildOrg('1096FA0035D17535E05379FB31000001'))
		ORDER BY cerror.T DESC;
	 
	INSERT INTO temFault   
	SELECT DISTINCT
		device.devId,
		'2001'        AS "devStatus"
		FROM base.vf_dev_search device
		LEFT JOIN measuredata.tf_dev_fault fault
		ON device.devId = fault.dev_id
		WHERE fault.isreturn = 0 -- and FIND_IN_SET(device.subBuro,base.getAllChildOrg('1096FA0035D17535E05379FB31000001'))
		ORDER BY fault.T DESC;
   
        OPEN rc;

	read_loop:LOOP
		FETCH rc INTO gid, gstatus;
		IF done THEN
			LEAVE read_loop;
		END IF;
	       
	       IF (gstatus='2005') THEN
		        SET ErrorNum=0;
		        SET FaultNum=0;
			SELECT COUNT(*) INTO ErrorNum FROM temError t WHERE t.devId=gid; 
			SELECT COUNT(*) INTO FaultNum FROM temFault t WHERE t.devId=gid; 
			IF (ErrorNum=1) THEN
				INSERT INTO temTable  SELECT * FROM temError t WHERE t.devId=gid;
				
				IF (FaultNum=1) THEN
					SELECT T INTO fdate FROM measuredata.tf_dev_fault t WHERE t.dev_id=gid ORDER BY T LIMIT 1;
					SELECT T INTO cdate FROM measuredata.tf_dev_commuciation_error t WHERE t.dev_id=gid ORDER BY T LIMIT 1;
					IF (UNIX_TIMESTAMP(fdate)>UNIX_TIMESTAMP(cdate)) THEN
						UPDATE temTable t,temFault f SET t.devStatus=f.devStatus WHERE t.devId=f.devId;
					END IF;		
				END IF;
			ELSE
			      IF (FaultNum=1) THEN
				        INSERT INTO temTable  SELECT * FROM temFault t WHERE t.devId=gid;
			      END IF; 
			 
			 END IF;
		END IF;
	END LOOP;
	CLOSE rc;
	 	
	SET @sqlstr='SELECT s.*,
			IFNULL(t.devStatus,IFNULL(c.dev_status,\'2005\')) AS "devStatus"
			FROM base.vf_dev_search s
			LEFT JOIN temTable t
			ON s.devId = t.devId
			LEFT JOIN tf_dev_currentstatus c
			ON c.dev_id = s.devId
			WHERE 1 = 1 '; 
		-- 局信息
		IF ISNULL(org)=FALSE AND LENGTH(org)>0 THEN 
			SET allorgs=base.getAllChildOrg(org);
			SET @sqlstr=CONCAT(@sqlstr,' and s.subburo in (');
			 loop3:LOOP
				SET hasnum=LOCATE(',',allorgs);
				IF hasnum<=0 THEN
					IF LENGTH(allorgs)>0 THEN
						SET @sqlstr=CONCAT(@sqlstr,'\'',allorgs,'\'');
					ELSE
						SET @sqlstr=LEFT(@sqlstr,LENGTH(@sqlstr)-1);
					END IF;
					LEAVE loop3;
				END IF;
				SET temp='';
				SET temp=SUBSTRING_INDEX(allorgs,',',1);
				SET allorgs=SUBSTRING(allorgs,hasnum+1);
				SET @sqlstr=CONCAT(@sqlstr,'\'',temp,'\',');	
			
		        END LOOP;
			SET @sqlstr=CONCAT(@sqlstr,')');
			-- SET @sqlstr=CONCAT(@sqlstr,' FIND_IN_SET(s.subburo,base.getAllChildOrg(\'',org,'\'))>0');
		END IF;
	SET @sqlstr=CONCAT('SELECT COUNT(t.devId) AS total,
				CASE t.devStatus WHEN \'2004\' THEN \'调试\'  WHEN \'2001\' THEN \'故障\'  WHEN \'2002\' THEN \'退运\'  WHEN \'2005\' THEN \'投运\'  WHEN \'2006\' THEN \'通讯异常\' ELSE \'未知\' END AS "devStatus",
				CASE t.groupId WHEN \'1\' THEN \'在线监测\' WHEN \'2\' THEN \'辅控\' WHEN \'3\' THEN \'机器人\' END AS "groupName"'
				,' from ('
				,@sqlstr
				,') t'
				,' GROUP BY devStatus,groupId');
	-- SELECT @sqlstr;	
	PREPARE stmt FROM @sqlstr;
	EXECUTE stmt;
	 
END$$
-- DELIMITER



SELECT COUNT(t.devId) AS total,
				CASE t.devStatus WHEN '2004' THEN '调试'  WHEN '2001' THEN '故障'  WHEN '2002' THEN '退运'  WHEN '2005' THEN '投运'  WHEN '2006' THEN '通讯异常' ELSE '未知' END AS "devStatus",
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

CALL p_device_total('1096FA0035D17535E05379FB31000001') --  "1096FA0035D17535E05379FB31000001"
            

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


vf_dev_search


 
   


