DROP PROCEDURE IF EXISTS p_device_status;

DELIMITER $$
CREATE PROCEDURE p_device_status(IN org VARCHAR(256),IN station VARCHAR(255),IN factory VARCHAR(255),IN devstatus VARCHAR(255),IN groupid VARCHAR(20),IN vol VARCHAR(256),IN devtype VARCHAR(1000),IN startline INT,IN endline INT,OUT totalPropery INT)
BEGIN
	DECLARE gid BIGINT;
	DECLARE ErrorNum INT;
	DECLARE FaultNum INT;
	DECLARE gstatus VARCHAR(1000);	
	DECLARE done INT DEFAULT FALSE;
	DECLARE fdate DATE;
	DECLARE cdate DATE;
	DECLARE sqlstr VARCHAR(1000);
	DECLARE hasnum INT;
	DECLARE temp VARCHAR(255);
	DECLARE gvol VARCHAR(1000);
	DECLARE gdevtype VARCHAR(2000);
	DECLARE allorgs VARCHAR(2000);
		
        DECLARE rc CURSOR FOR SELECT device.devId,
	       IFNULL(status.dev_status,'2005') AS 'devStatus'	 
        FROM base.vf_dev_search device
         LEFT JOIN base.tf_dev_currentstatus STATUS
           ON device.devId = status.dev_id;
        --   WHERE FIND_IN_SET(device.subBuro,base.getAllChildOrg('1096FA0035D17535E05379FB31000001'));
           
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
		WHERE cerror.isreturn = 0
		-- and FIND_IN_SET(device.subBuro,base.getAllChildOrg('1096FA0035D17535E05379FB31000001'))
		ORDER BY cerror.T DESC;
	 
	INSERT INTO temFault   
	SELECT DISTINCT
		device.devId,
		'2001'        AS "devStatus"
		FROM base.vf_dev_search device
		LEFT JOIN measuredata.tf_dev_fault fault
		ON device.devId = fault.dev_id
		WHERE fault.isreturn = 0
		-- AND FIND_IN_SET(device.subBuro,base.getAllChildOrg('1096FA0035D17535E05379FB31000001'))
		ORDER BY fault.T DESC;
   
        OPEN rc;

	read_loop:LOOP
		FETCH rc INTO gid, gstatus;
		IF done THEN
			LEAVE read_loop;
		END IF;
	       
	       IF gstatus = '2005' THEN
		        SET ErrorNum=0;
		        SET FaultNum=0;
			SELECT COUNT(*) INTO ErrorNum FROM temError t WHERE t.devId=gid; 
			SELECT COUNT(*) INTO FaultNum FROM temFault t WHERE t.devId=gid; 
			IF ErrorNum = 1 THEN
				INSERT INTO temTable  SELECT * FROM temError t WHERE t.devId=gid;
				
				IF (FaultNum=1) THEN
					SELECT T INTO fdate FROM measuredata.tf_dev_fault t WHERE t.dev_id=gid ORDER BY T LIMIT 1;
					SELECT T INTO cdate FROM measuredata.tf_dev_commuciation_error t WHERE t.dev_id=gid ORDER BY T LIMIT 1;
					IF (UNIX_TIMESTAMP(fdate)>UNIX_TIMESTAMP(cdate)) THEN
						UPDATE temTable t,temFault f SET t.devStatus=f.devStatus WHERE t.devId=f.devId;
					END IF;		
				END IF;
			ELSE
			      IF FaultNum = 1 THEN
				        INSERT INTO temTable  SELECT * FROM temFault t WHERE t.devId=gid;
			      END IF; 
			 
			 END IF;
		END IF;
	END LOOP;
	CLOSE rc;
	SET @rowNo=NULL; 	
	SET @sqlstr=CONCAT('SELECT @rowNo := IFNULL(@rowNo,',startline,') + 1 AS \'xuhao\',s.*,	 
	 IFNULL(t.devStatus,IFNULL(c.dev_status,\'2005\')) AS "devStatus",
	CASE IFNULL(t.devStatus,IFNULL(c.dev_status,\'2005\')) WHEN \'2004\' THEN \'调试\'  WHEN \'2001\' THEN \'故障\'  
	     WHEN \'2002\' THEN \'退运\'  WHEN \'2005\' THEN \'投运\'  WHEN \'2006\' THEN \'通讯异常\' 
	     ELSE \'未知\' END AS "devStatusName"	
	   FROM base.vf_dev_search s
	     LEFT JOIN temTable t ON s.devId=t.devId 
	       LEFT JOIN tf_dev_currentstatus c ON c.dev_id=s.devId
	    WHERE 1=1 '); 
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
		-- 变电站
		IF ISNULL(station)=FALSE AND LENGTH(station)>0 THEN
			SET @sqlstr=CONCAT(@sqlstr,' and s.stationId=\'',station,'\'');
		END IF;
		-- 厂家
		IF ISNULL(factory)=FALSE AND LENGTH(factory)>0 THEN
			SET @sqlstr=CONCAT(@sqlstr,' and s.factoryId=\'',factory,'\'');
		END IF;
		-- 状态 2005是投运状态及useflag=1的状态 
		IF ISNULL(devstatus)=FALSE AND LENGTH(devstatus)>0 THEN
			IF devstatus='2005' THEN
				SET @sqlstr=CONCAT(@sqlstr,' and s.useflag=1');
			ELSE
				SET @sqlstr=CONCAT(@sqlstr,' and  IFNULL(t.devStatus,IFNULL(c.dev_status,\'2005\'))=\'',devstatus,'\'');
			END IF;
			
		END IF;
		
		-- 分组
		IF ISNULL(groupid)=FALSE AND LENGTH(groupid)>0 THEN
			SET @sqlstr=CONCAT(@sqlstr,' and s.groupId=\'',groupid,'\'');
		END IF;
		 
		SET gvol=CAST(vol AS CHAR);
		SET hasnum=0;
		IF ISNULL(vol)=FALSE AND LENGTH(vol)>0 THEN
			SET @sqlstr=CONCAT(@sqlstr,' and s.volCode in (');
			
			  loop1:LOOP
				SET hasnum=LOCATE(',',gvol);
				IF hasnum<=0 THEN
					IF LENGTH(gvol)>0 THEN
						SET @sqlstr=CONCAT(@sqlstr,'\'',gvol,'\'');
					END IF;
					LEAVE loop1;
				END IF;
				SET temp='';
				SET temp=SUBSTRING_INDEX(gvol,',',1);
				SET gvol=SUBSTRING(gvol,hasnum+1);
				SET @sqlstr=CONCAT(@sqlstr,'\'',temp,'\',');	
			
		        END LOOP;
			SET @sqlstr=CONCAT(@sqlstr,')');
		END IF;
		
		SET gdevtype=CAST(devtype AS CHAR);
		SET hasnum=0;
		IF ISNULL(devtype)=FALSE AND LENGTH(devtype)>0 THEN
			SET @sqlstr=CONCAT(@sqlstr,' and s.devTypeId in (');
			
			loop2:LOOP
				SET hasnum=LOCATE(',',gdevtype);
				IF hasnum<=0 THEN
					IF LENGTH(gdevtype)>0 THEN
						SET @sqlstr=CONCAT(@sqlstr,'\'',gdevtype,'\'');
						END IF;
					LEAVE loop2;
				END IF;
				SET temp='';
				SET temp=SUBSTRING_INDEX(gdevtype,',',1);
				SET gdevtype=SUBSTRING(gdevtype,hasnum+1);
				SET @sqlstr=CONCAT(@sqlstr,'\'',temp,'\',');	
			
		        END LOOP;
			
		END IF;
		
		
		-- SELECT @sqlstr;	
		SET @counsql=CONCAT('select count(t.devId) into @total from (' ,@sqlstr,') t');
	        PREPARE stmt FROM @counsql;
	        EXECUTE stmt;
	        SET totalPropery=@total;
		-- select totalPropery;
		SET @rowNo=NULL;
		SET @sqlstr=CONCAT(@sqlstr,' limit ',startline,',',endline);			
		
		-- SELECT @sqlstr;	
		PREPARE stmt FROM @sqlstr;
		EXECUTE stmt;
	 
END$$
-- DELIMITER

 
-- 下面为测试 
SELECT * FROM temTable;EXIT;
SELECT * FROM temError;
SELECT * FROM temFault;

SELECT * FROM vf_dev_search WHERE stationId IN ('1','1200')
DROP PROCEDURE p_device_status

CREATE PROCEDURE p_device_status(org ,station ,factory , devstatus , groupid , vol ,devtype ,startline,endline)

DECLARE total INT;
CALL p_device_status('1096FA0035D17535E05379FB31000001',NULL,NULL,NULL,NULL,NULL,NULL,'0','100',@totalp);
SELECT @totalp
CALL p_device_status('1096FA0035D17535E05379FB31000001',NULL,NULL,NULL,NULL,NULL,NULL)
CALL p_device_status('1096FA0035D17535E05379FB31000001',NULL,NULL,'2001',NULL,NULL,NULL,'0','100')

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



SELECT
  device.devId,
  IFNULL(status.dev_status,'2005') AS "dev_status"
FROM base.vf_dev_search device
  LEFT JOIN base.tf_dev_currentstatus STATUS
    ON device.devId = status.dev_id;
          
  SELECT DISTINCT
     device.devId,
     '2006'        AS "dev_status"
   FROM base.vf_dev_search device
     LEFT JOIN measuredata.tf_dev_commuciation_error cerror
       ON device.devId = cerror.dev_id
   WHERE cerror.isreturn = 0
   ORDER BY cerror.T DESC;   
   
   SELECT DISTINCT
     device.devId,
     '2001'        AS "dev_status"
   FROM base.vf_dev_search device
     LEFT JOIN measuredata.tf_dev_fault fault
       ON device.devId = fault.dev_id
   WHERE fault.isreturn = 0
   ORDER BY fault.T DESC; 
   


