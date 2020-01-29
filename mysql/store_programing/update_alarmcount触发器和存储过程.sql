# 触发器
DROP EVENT IF EXISTS base.update_alarmcount;
CREATE EVENT base.update_alarmcount
ON SCHEDULE EVERY 30 MINUTE COMMENT '以变电站为单位的告警总数' DO CALL base.update_station_alarmcount ();


SELECT * FROM base.tf_station_alarmcount;
TRUNCATE base.tf_station_alarmcount;
CALL base.update_station_alarmcount ();


# 存储过程

DROP PROCEDURE IF EXISTS base.update_station_alarmcount;

DELIMITER //

CREATE PROCEDURE base.update_station_alarmcount ()
BEGIN
     /*
		此存储过程由触发器执行，
		对告警信息进行统计，
		数据存储在base.tf_station_alarmcount，
		取告警变电站排名前三的数据。
	*/
     DECLARE done INT DEFAULT 0;
     DECLARE num BIGINT DEFAULT 0;
     DECLARE stationid VARCHAR (64);
     DECLARE orgno VARCHAR (64);
     DECLARE cur CURSOR FOR
     SELECT
          dev.depart AS orgno,COUNT(dev.id) AS countnum, dev.substation_id AS stationId
     FROM
          cisp_platform.me_soe soe
          INNER JOIN cisp_dev.v_all_dev dev
               ON dev.Id = soe.dev_id
     WHERE soe.isreturn = 0
     GROUP BY orgno,stationId; 
    
     DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
     SET @@sql_mode='';
     OPEN cur;
     loopin :
     LOOP
          FETCH cur INTO orgno,num, stationid;
          IF done
          THEN LEAVE loopin;
          END IF;
          INSERT INTO base.tf_station_alarmcount (orgno,stationid, alarmcount)
          VALUES
               (orgno,stationid, num)
               ON DUPLICATE KEY
               UPDATE
                    alarmcount =
                    VALUES
                         (alarmcount);
     END LOOP;
     CLOSE cur;
END;

SELECT * FROM cisp_dev.v_all_dev dev
