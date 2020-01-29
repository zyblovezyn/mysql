DROP PROCEDURE IF EXISTS p_getYwzAndBdzInfo_fk;
DELIMITER$$
-- drop procedure if exists p_getYwzAndBdzInfo;
CREATE PROCEDURE p_getYwzAndBdzInfo_fk(IN orgno VARCHAR(50))
BEGIN
        DECLARE temp VARCHAR(50)    ;
        DECLARE hasnum INT DEFAULT 0;
        DECLARE allorgs VARCHAR(1000);
        SET @sqlstr='SELECT DISTINCT
              ywz.ywz_id              \"id\",
              ywz.ywz_name            \"name\",
              ywz.LNG                 \"ywzx\",
              ywz.LAT                 \"ywzy\",
              station.station_id      \"station_id\",
              station.station_name    \"station_name\",
              vol.vol_code            \"station_dydjcode\",
              vol.vol_value           \"station_dydjname\",
              station.LNG             \"station_x\",
              station.LAT             \"station_y\",
              soe.dev_id              \"station_soe_devid\",
             
              CASE code.value WHEN 1 THEN \'一级告警\'  WHEN 2 THEN   \'二级告警\'  WHEN  3 THEN \'三级告警\'  END AS               \"station_soe_title\",
              soe.eventdesc           \"station_soe_content\"
            FROM base.tf_ywz ywz
            INNER JOIN base.tf_substation station
              ON (station.ywzid = ywz.ywz_id or (locate()))
            INNER JOIN cisp_platform.bp_org org
                ON org.org_no = station.subburo
              INNER JOIN base.tf_device device
                ON device.substation_Id = station.station_id
              INNER JOIN measuredata.me_soe soe
                ON soe.DEV_ID = device.device_id
              INNER JOIN tf_voltagelevel vol
                ON vol.vol_code = station.vol_id
              INNER JOIN bp_code CODE
               ON code.value = soe.eventlevel  AND code.code_type = \'EventLevel\'
             WHERE DATE_ADD(soe.T,INTERVAL 5 DAY) > NOW()
                 and station.useflag=1 and ywz.useflag=1 and soe.isreturn=\'0\' and isalarm=\'1\' and COALESCE(code.value,\'0\') <> \'0\'';
                IF ISNULL(orgno)=FALSE AND LENGTH(orgno)>0 THEN
                    SET allorgs=base.getAllChildOrg(orgno);
                    SET @sqlstr=CONCAT(@sqlstr,' and station.subburo in (');
                    loopOne:LOOP
			    SET @temp=SUBSTRING_INDEX(allorgs,',',1);
			    SET allorgs=SUBSTR(allorgs,LENGTH(@temp)+2); 
			    IF LENGTH(allorgs)<=0 AND LENGTH(@temp)>0 THEN
				 SET @sqlstr=CONCAT(@sqlstr,'\'',@temp,'\')');
				 LEAVE loopOne;
			    END IF;
			    SET @sqlstr=CONCAT(@sqlstr,'\'',@temp,'\',');
		    END LOOP;
                END IF;
                SET @sqlstr=CONCAT(@sqlstr,'group by station.station_id,code.value  ORDER BY soe.T DESC');
               -- SELECT @sqlstr;
                PREPARE stmt FROM @sqlstr;
                EXECUTE stmt;

END

CALL base.p_getYwzAndBdzInfo_fk('8a812897493378a001495677ad086663');




SELECT * FROM base.`tf_alarm_statistics`

SELECT LENGTH('8a812897493378a001495677ad086663');



-- 插入测试数据
--  白浪变 一级告警2 二级告警2
INSERT INTO `base`.`tf_alarm_statistics` ( `SUBSTATION`, `SUBSTATION_NAME`, `DEVICETYPE`, `DEVICETYPE_NAME`, `SUBSYSTEM`, `ALARMLEVEL`, `RTIME`, `MAINTENANCE`, `MAINTENANCE_NAME`, `ALARM_NUM`, `UPTIME`)
VALUES
  (
    '30000000-102414616',
    '白浪变',
    'MagnetMonitAsset',
    'test1',
    'VIDEOCONTROL',
    '1',
    NOW(),
    'MAINTENANCE',
    'MAINTENANCE_NAME',
    2,
    NOW()
  );

INSERT INTO `base`.`tf_alarm_statistics` ( `SUBSTATION`, `SUBSTATION_NAME`, `DEVICETYPE`, `DEVICETYPE_NAME`, `SUBSYSTEM`, `ALARMLEVEL`, `RTIME`, `MAINTENANCE`, `MAINTENANCE_NAME`, `ALARM_NUM`, `UPTIME`)
VALUES
  (
    '30000000-102414616',
    '白浪变',
    'MagnetMonitAsset',
    'test1',
    'VIDEOCONTROL',
    '2',
    NOW(),
    'MAINTENANCE',
    'MAINTENANCE_NAME',
    2,
    NOW()
  );
 
 -- 前进变 一级告警1 二级告警1
INSERT INTO `base`.`tf_alarm_statistics` ( `SUBSTATION`, `SUBSTATION_NAME`, `DEVICETYPE`, `DEVICETYPE_NAME`, `SUBSYSTEM`, `ALARMLEVEL`, `RTIME`, `MAINTENANCE`, `MAINTENANCE_NAME`, `ALARM_NUM`, `UPTIME`)
VALUES
  (
    '30000000-102414651',
    '前进变',
    'MagnetMonitAsset',
    'test3',
    'VIDEOCONTROL',
    '1',
    NOW(),
    'MAINTENANCE',
    'MAINTENANCE_NAME',
    1,
    NOW()
  );

INSERT INTO `base`.`tf_alarm_statistics` ( `SUBSTATION`, `SUBSTATION_NAME`, `DEVICETYPE`, `DEVICETYPE_NAME`, `SUBSYSTEM`, `ALARMLEVEL`, `RTIME`, `MAINTENANCE`, `MAINTENANCE_NAME`, `ALARM_NUM`, `UPTIME`)
VALUES
  (
    '30000000-102414651',
    '前进变',
    'MagnetMonitAsset',
    'test4',
    'VIDEOCONTROL',
    '2',
    NOW(),
    'MAINTENANCE',
    'MAINTENANCE_NAME',
    1,
    NOW()
  );
 


DROP PROCEDURE IF EXISTS base.p_getYwzAndBdzInfo_fk;
DELIMITER //
CREATE PROCEDURE base.p_getYwzAndBdzInfo_fk(IN org_no VARCHAR(40))
BEGIN

-- 先按一级告警排序，没有 一级告警 按 二级告警，没有 二级告警 按 三级告警排序
 
-- select t.substation,t.substation_name,t.alarmlevel,sum(t.alarm_num) as countnum 
-- from base.tf_alarm_statistics t 
-- group by t.alarmlevel,t.substation,t.substation_name
-- order by t.alarmlevel asc,countnum desc

-- 按总数排 不分告警告警等级

-- SELECT t.substation,t.substation_name,SUM(t.alarm_num) AS countnum 
-- FROM base.tf_alarm_statistics t 
-- GROUP BY t.substation,t.substation_name
-- ORDER BY countnum DESC

 DECLARE temp VARCHAR(50);
 DECLARE hasnum INT DEFAULT 0;
 DECLARE allorgs TEXT(50000);
 DECLARE group_org VARCHAR(1000);
  /*    测试数据 因为soe表中数据太少 所以先用测试数据显示 */
        SET @sqlstr1='SELECT DISTINCT
			ywz.ywz_id              id,
			ywz.ywz_name            name,
			ywz.lng                 ywzx,
			ywz.lat                 ywzy,
			station.id      station_id,
			station.name    station_name,
			station.voltagelevel_id            station_dydjcode,
			station.voltagelevel           station_dydjname,
			station.lng             station_x,
			station.lat             station_y,
			IF(tcount.countnum IS NULL,0,tcount.countnum) 		      countnum               
			FROM base.tf_ywzbdz ywzxy
			INNER JOIN cisp_dev.yc_substation station
			ON station.maintenance_team = ywzxy.whbz
			INNER JOIN cisp_platform.bp_org org
			ON org.org_no = station.depart
			INNER JOIN base.`tf_ywz` ywz
			ON ywzxy.whbz=ywz.ywz_id
			LEFT JOIN (SELECT  t.substation AS station_id,t.substation_name,cast(SUM(t.alarm_num) as char) AS countnum 
				FROM base.tf_alarm_statistics t 
				INNER JOIN cisp_dev.yc_substation station
				ON station.id=t.substation
				WHERE station.depart IN (';
	SET @sqlstr2=')
			GROUP BY t.substation,t.substation_name
			ORDER BY countnum DESC LIMIT 3) tcount
			ON  tcount.station_id= station.id
			WHERE  ywz.useflag=1 AND 
			station.lng IS NOT NULL AND ywz.lng IS NOT NULL
			AND station.depart IN (';
         
         /*  生产数据 测试通过
          
          SET @sqlstr1='SELECT DISTINCT
			ywz.ywz_id              id,
			ywz.ywz_name            name,
			ywz.lng                 ywzx,
			ywz.lat                 ywzy,
			station.id      station_id,
			station.name    station_name,
			station.voltagelevel_id            station_dydjcode,
			station.voltagelevel           station_dydjname,
			station.lng             station_x,
			station.lat             station_y,
			IF(tcount.countnum IS NULL,0,tcount.countnum) 		      countnum               
			FROM base.tf_ywzbdz ywzxy
			INNER JOIN cisp_dev.yc_substation station
			ON station.maintenance_team = ywzxy.whbz
			INNER JOIN cisp_platform.bp_org org
			ON org.org_no = station.depart
			INNER JOIN base.`tf_ywz` ywz
			ON ywzxy.whbz=ywz.ywz_id
			LEFT JOIN ( SELECT COUNT(dev.stationId) AS countnum,dev.stationId FROM measuredata.me_soe soe
					INNER JOIN base.vf_dev_search dev
					ON dev.devId=soe.dev_id
					WHERE soe.isreturn=0 AND dev.subBuro IN (';
	set @sqlstr2=')
			GROUP BY dev.stationId
			ORDER BY countnum DESC
			LIMIT 3) tcount
			ON  tcount.stationId= station.id
			WHERE  ywz.useflag=1 AND 
			station.lng IS NOT NULL AND ywz.lng IS NOT NULL
			AND station.depart IN (';
         
         */
                -- 局信息
		IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
			SET allorgs=base.getAllChildOrg(org_no);	-- select allorgs;
			-- sET @sqlstr=CONCAT(@sqlstr,' AND station.depart IN (');
			loopin:LOOP
				SET hasnum=LOCATE(',',allorgs);
				IF hasnum<=0 THEN
					IF LENGTH(allorgs)>0 THEN
						SET @sqlstr1=CONCAT(@sqlstr1,'\'',allorgs,'\'');
						SET @sqlstr2=CONCAT(@sqlstr2,'\'',allorgs,'\'');						 						 
					END IF;
					LEAVE loopin;
				END IF;						 
				SET temp='';
				SET temp=SUBSTRING_INDEX(allorgs,',',1);
				SET allorgs=SUBSTRING(allorgs,hasnum+1);
				SET @sqlstr1=CONCAT(@sqlstr1,'\'',temp,'\',');	
				SET @sqlstr2=CONCAT(@sqlstr2,'\'',temp,'\',');
			END LOOP;
 		END IF;
 		
                SET @sqlstr=CONCAT(@sqlstr1,@sqlstr2,')');
                -- SELECT @sqlstr;
                PREPARE stmt FROM @sqlstr;
                EXECUTE stmt; 

END//




CALL base.`p_getYwzAndBdzInfo_fk`('8a812897493378a001495677ad086663');

SHOW WARNINGS;
SELECT * FROM base.tf_alarm_statistics t
SELECT * FROM cisp_dev.`yc_substation` WHERE maintenance_team='1096FA0035D17535E05379FB31000499' -- id='30000000-102415259'

SELECT * FROM tf_ywzbdz WHERE bdzid='30000000-102415259'

INSERT INTO base.`tf_alarm_statistics`(substation,substation_anme,alarmlevel,)






