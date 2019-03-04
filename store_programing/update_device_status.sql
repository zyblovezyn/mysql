DROP TRIGGER IF EXISTS update_device_status;

DELIMITER $$ 
 
CREATE TRIGGER update_device_status AFTER INSERT ON cisp_platform.me_soe 
FOR EACH ROW BEGIN
/*
	2018-12-17
	通讯异常和故障 实时修改base.tf_dev_currentstatus的状态。不再插入到故障表和通讯异常表。
*/

   IF LOCATE('CommError',new.measuretag) >0 THEN 
		INSERT INTO base.tf_dev_currentstatus(dev_id,dev_status) VALUES(new.dev_id,'2006')
		ON DUPLICATE KEY UPDATE dev_status=VALUES(dev_status);
            
   ELSEIF  LOCATE('故障',new.measurename)>0 THEN
	INSERT INTO base.tf_dev_currentstatus(dev_id,dev_status) VALUES(new.dev_id,'2001')
	ON DUPLICATE KEY UPDATE dev_status=VALUES(dev_status);
   END IF;
END

