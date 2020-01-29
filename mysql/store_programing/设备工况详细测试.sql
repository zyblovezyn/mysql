SELECT @rowNo := IFNULL(@rowNo,0) + 1 AS 'xuhao', s.*, IFNULL(t.devStatus,'2005') AS 'devStatus',
	     CASE IFNULL(t.devStatus,'2005') WHEN '2004' THEN '调试'  WHEN '2001' THEN '故障'  
	     WHEN '2002' THEN '退运'  WHEN '2005' THEN '投运'  WHEN '2006' THEN '通讯异常' 
	     ELSE '未知' END AS "devStatusName" FROM base.vf_dev_search s LEFT JOIN temTable t ON s.devId=t.devId
	     LEFT JOIN tf_dev_currentstatus c ON c.dev_id=s.devId
	      WHERE 1=1  AND s.subburo IN ('$','1096FA0035D17535E05379FB31000001','1096FA0035D17535E05379FB31510001','1096FA0035D17535E05379FB31520001','1096FA0035D17535E05379FB31531000','1096FA0035D17535E05379FB31540001','1096FA0035D17535E05379FB31550001','1096FA0035D17535E05379FB31560001','1096FA0035D17535E05379FB31570001','1096FA0035D17535E05379FB50152672','8a1278036043716701608bbb873c2e52')
      
SELECT @rowNo := IFNULL(@rowNo,0) + 1 AS 'xuhao',s.*,	 
	 IFNULL(t.devStatus,IFNULL(c.dev_status,'2005')) AS "devStatus",
	CASE IFNULL(t.devStatus,IFNULL(c.dev_status,'2005')) WHEN '2004' THEN '调试'  WHEN '2001' THEN '故障'  
	     WHEN '2002' THEN '退运'  WHEN '2005' THEN '投运'  WHEN '2006' THEN '通讯异常' 
	     ELSE '未知' END AS "devStatusName"	
	   FROM base.vf_dev_search s
	     LEFT JOIN temTable t ON s.devId=t.devId 
	       LEFT JOIN tf_dev_currentstatus c ON c.dev_id=s.devId
	    WHERE 1=1  AND s.subburo IN ('$','1096FA0035D17535E05379FB31000001','1096FA0035D17535E05379FB31510001','1096FA0035D17535E05379FB31520001','1096FA0035D17535E05379FB31531000','1096FA0035D17535E05379FB31540001','1096FA0035D17535E05379FB31550001','1096FA0035D17535E05379FB31560001','1096FA0035D17535E05379FB31570001','1096FA0035D17535E05379FB50152672','8a1278036043716701608bbb873c2e52')

      
SELECT
  s.devId,
  IFNULL(t.devStatus,IFNULL(c.dev_status,'2005')) AS "devStatus"
FROM base.vf_dev_search s
  LEFT JOIN temTable t
    ON s.devId = t.devId
  LEFT JOIN tf_dev_currentstatus c
    ON c.dev_id = s.devId
WHERE 1 = 1


SELECT * FROM tf_dev_currentstatus      

-- 故障	     
SELECT DISTINCT
  device.devId,
  '2001'       AS "devStatus"
FROM base.vf_dev_search device
  LEFT JOIN measuredata.tf_dev_fault fault
    ON device.devId = fault.dev_id
WHERE fault.isreturn = 0
ORDER BY fault.T DESC;


-- 通讯异常
SELECT DISTINCT
  device.devId,
  '2006'       AS "devStatus"
FROM base.vf_dev_search device
  LEFT JOIN measuredata.tf_dev_commuciation_error cerror
    ON device.devId = cerror.dev_id
WHERE cerror.isreturn = 0
ORDER BY cerror.T DESC;

-- 总数据
SELECT
  device.devId,
  IFNULL(status.dev_status,'2005') AS 'devStatus'
FROM base.vf_dev_search device
  LEFT JOIN base.tf_dev_currentstatus STATUS
    ON device.devId = status.dev_id
WHERE FIND_IN_SET(device.subBuro,base.getAllChildOrg('1096FA0035D17535E05379FB31000001'));

SELECT * FROM tf_dev_currentstatus

SELECT UNIX_TIMESTAMP(NOW())>UNIX_TIMESTAMP('2018-08-07 11:34:00')