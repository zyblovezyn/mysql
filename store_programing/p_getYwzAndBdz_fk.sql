

CALL base.p_getYwzAndBdz_fk('8a812897493378a001495677ad086663');
CALL base.p_getYwzAndBdz_fk('1096FA0035D17535E05379FB31000001');
CALL base.p_getYwzAndBdz_fk('1096FA0035D17535E05379FB50152672');



-- version 4.0	date:2019-1-8	reason:优化
DROP PROCEDURE IF EXISTS base.p_getYwzAndBdz_fk;
DELIMITER //
CREATE PROCEDURE base.p_getYwzAndBdz_fk(IN org_no VARCHAR(40))
BEGIN
	DECLARE is_p_org_no BOOL;
	SET @sqlStartDate=STR_TO_DATE(DATE_SUB(NOW(),INTERVAL 2 DAY),'%Y-%m-%d');
	SET @sqlEndDate=STR_TO_DATE(NOW(),'%Y-%m-%d %H:%i:%s');
	       
            SET @sqlstr=CONCAT('SELECT DISTINCT
						dev.ywzid AS id, dev.ywzname AS name, \'0\' AS ywzx, \'0\' AS ywzy, 
						station.id station_id, station.name station_name, 
						station.voltagelevel_id station_dydjcode,station.account_id AS accountId, 
						station.voltagelevel station_dydjname, station.lng station_x,
						station.lat station_y, 
						 concat(IF(
							tcount.alarmcount IS NULL, 0, tcount.alarmcount
						),\'\') as countnum, 
						stus.status
						FROM
						base.tf_ywz_bdz_vol_device dev
						left JOIN cisp_dev.yc_substation station
							ON station.id = dev.stationid
						LEFT JOIN base.tf_comm_status stus
							ON station.id = stus.bdz_id
						LEFT JOIN (select count(1) as alarmcount, dev.stationid
							from
								base.tf_ywz_bdz_vol_device dev
								JOIN cisp_platform.me_soe soe
									ON dev.pointid = soe.measurepoint_id
								where soe.t>=? and soe.t<=? and isalarm=1 and isreturn=0 ');
		SET @sqlgroup=CONCAT('GROUP BY dev.stationid
					ORDER BY alarmcount DESC,dev.stationid limit 3) tcount
			  ON tcount.stationid = dev.stationid  WHERE 1=1');
        -- 局信息	
 	IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
		IF STRCMP('8a812897493378a001495677ad086663',org_no)=0 THEN
			SET @sqlstr=CONCAT(@sqlstr,@sqlgroup);
		ELSE
			SELECT COUNT(1)>0 INTO is_p_org_no FROM base.bp_org_shortname org WHERE org.p_org_no=org_no; #is_p_org_no=1 市局 0 县局
			IF is_p_org_no THEN
				SET @sqlstr=CONCAT(@sqlstr,' and dev.p_org_no=\'',org_no,'\'');
				SET @sqlgroup=CONCAT(@sqlgroup,' and dev.p_org_no=\'',org_no,'\'');
 			ELSE
				SET @sqlstr=CONCAT(@sqlstr,' and dev.org_no=\'',org_no,'\'');
				SET @sqlgroup=CONCAT(@sqlgroup,' and dev.org_no=\'',org_no,'\'');
			END IF;
			#SET @sqlstr=CONCAT(@sqlstr,' and dev.org_no',base.getInClause(org_no));
			SET @sqlstr=CONCAT(@sqlstr,@sqlgroup);
		END IF;
	END IF;
      -- SELECT @sqlstr;
      PREPARE stmt FROM @sqlstr;
      EXECUTE stmt USING @sqlStartDate,@sqlEndDate; 
	DEALLOCATE PREPARE stmt;
END




-- version 3.0	date:2018-12-28	reason:two day data get alarm count by myseft
DROP PROCEDURE IF EXISTS base.p_getYwzAndBdz_fk;
DELIMITER //
CREATE PROCEDURE base.p_getYwzAndBdz_fk(IN org_no VARCHAR(40))
BEGIN

/*
 先按一级告警排序，没有 一级告警 按 二级告警，没有 二级告警 按 三级告警排序

 select t.substation,t.substation_name,t.alarmlevel,sum(t.alarm_num) as countnum 
 from base.tf_alarm_statistics t 
 group by t.alarmlevel,t.substation,t.substation_name
 order by t.alarmlevel asc,countnum desc

 按总数排 不分告警告警等级

 SELECT t.substation,t.substation_name,SUM(t.alarm_num) AS countnum 
 FROM base.tf_alarm_statistics t 
 GROUP BY t.substation,t.substation_name
 ORDER BY countnum DESC */
 
  /*    测试数据 因为soe表中数据太少 所以先用测试数据显示 
        SET @sqlstr1=concat('SELECT DISTINCT
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
			IF(tcount.countnum IS NULL,0,tcount.countnum) 		      countnum,
			status.status            
			FROM base.tf_ywzbdz ywzxy
			INNER JOIN cisp_dev.yc_substation station
			ON station.maintenance_team = ywzxy.whbz
			INNER JOIN cisp_platform.bp_org org
			ON org.org_no = station.depart
			INNER JOIN base.`tf_ywz` ywz
			ON ywzxy.whbz=ywz.ywz_id
			LEFT JOIN base.tf_comm_status status
                        ON station.id = status.bdz_id
			LEFT JOIN (SELECT  t.substation AS station_id,t.substation_name,cast(SUM(t.alarm_num) as char) AS countnum 
				FROM base.tf_alarm_statistics t 
				INNER JOIN cisp_dev.yc_substation station
				ON station.id=t.substation
				WHERE station.depart');
	  SET @sqlstr2=concat(' GROUP BY t.substation,t.substation_name
			ORDER BY countnum DESC LIMIT 3) tcount
			ON  tcount.station_id= station.id
			WHERE  ywz.useflag=1 AND 
			station.lng IS NOT NULL AND ywz.lng IS NOT NULL
			AND station.depart');*/
         
           -- 生产数据 测试通过
      
	SET @sqlStartDate=STR_TO_DATE(DATE_SUB(NOW(),INTERVAL 2 DAY),'%Y-%m-%d');
	SET @sqlEndDate=STR_TO_DATE(NOW(),'%Y-%m-%d %H:%i:%s');
	       
      SET @sqlstr1=CONCAT('SELECT DISTINCT
						ywz.whbz AS id, ywz.whbzmc AS name, \'0\' AS ywzx, \'0\' AS ywzy, 
						station.id station_id, station.name station_name, 
						station.voltagelevel_id station_dydjcode,station.account_id AS accountId, 
						station.voltagelevel station_dydjname, station.lng station_x,
						station.lat station_y, 
						 concat(IF(
							tcount.alarmcount IS NULL, 0, tcount.alarmcount
						),\'\') as countnum, stus.status
						FROM
						base.tf_ywzbdz ywz
						left JOIN cisp_dev.yc_substation station
							ON station.id = ywz.zyid
						LEFT JOIN base.tf_comm_status stus
							ON station.id = stus.bdz_id
						LEFT JOIN (');
		-- 其他局人员
		/*SET @slqstr2_1=CONCAT('SELECT
							COUNT(1) AS countnum, dev.stationid
							FROM
							base.tf_ywz_bdz_vol_device dev 
							JOIN cisp_platform.me_soe soe
								ON soe.dev_id = dev.devId
								WHERE soe.t>=\'',@sqlStartDate,'\' AND soe.t<=\'',@sqlEndDate,'\' AND isalarm=1
							GROUP BY dev.stationid
							ORDER BY countnum DESC,dev.stationid LIMIT 3 and dev.org_no ');*/
		SET @slqstr2_1=CONCAT('select count(1) as alarmcount, dev.stationid
							from
							base.tf_ywz_bdz_vol_device dev 
							join cisp_platform.me_conf_measurepoint point
								on point.end_dev_id=dev.devid	
							join cisp_platform.me_soe soe
								ON point.id = soe.measurepoint_id 
								where soe.t>=? and soe.t<=? and isalarm=1 and isreturn=0 and dev.org_no ');
		-- 省局人员 取消单位过滤
		SET @sqlstr2_2=CONCAT('SELECT	COUNT(1) AS alarmcount, dev.stationid
							FROM
							base.tf_ywz_bdz_vol_device dev 
							join cisp_platform.me_conf_measurepoint point
								on point.end_dev_id=dev.devid	
							JOIN cisp_platform.me_soe soe
								ON point.id = soe.measurepoint_id 
								WHERE soe.t>=? AND soe.t<=? AND isalarm=1 and isreturn=0 ');
							
		SET @sqlstr3=CONCAT('GROUP BY dev.stationid
					ORDER BY alarmcount DESC,dev.stationid limit 3) tcount
			  ON tcount.stationid = station.id');
	SET @sqlstr4=CONCAT(' WHERE station.depart');
       -- 局信息
	
 	IF STRCMP(org_no,'8a812897493378a001495677ad086663')=0 THEN  # 省人员
		SET @sqlstr=CONCAT(@sqlstr1,@sqlstr2_2,@sqlstr3);
	ELSE
		IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
			SET @allorgs=base.getInClause(org_no);	-- select allorgs;
		END IF;
		
		SET @sqlstr=CONCAT(@sqlstr1,@slqstr2_1,@allorgs,@sqlstr3,@sqlstr4,@allorgs);
		-- SET @sqlstr=CONCAT(@sqlstr1,@sqlstr2_2,@sqlstr3,' WHERE station.lng IS NOT NULL');

 	END IF;
     -- SELECT @sqlstr,@allorgs,@sqlstr1,@sqlstr2_1,@allorgs,@sqlstr3,@allorgs, @sqlstr4;
      PREPARE stmt FROM @sqlstr;
      EXECUTE stmt USING @sqlStartDate,@sqlEndDate; 
	DEALLOCATE PREPARE stmt;
END



-- version 2.0	date:2018-12-28	reason:two day data
DROP PROCEDURE IF EXISTS base.p_getYwzAndBdz_fk;
DELIMITER //
CREATE PROCEDURE base.p_getYwzAndBdz_fk(IN org_no VARCHAR(40))
BEGIN

/*
 先按一级告警排序，没有 一级告警 按 二级告警，没有 二级告警 按 三级告警排序

 select t.substation,t.substation_name,t.alarmlevel,sum(t.alarm_num) as countnum 
 from base.tf_alarm_statistics t 
 group by t.alarmlevel,t.substation,t.substation_name
 order by t.alarmlevel asc,countnum desc

 按总数排 不分告警告警等级

 SELECT t.substation,t.substation_name,SUM(t.alarm_num) AS countnum 
 FROM base.tf_alarm_statistics t 
 GROUP BY t.substation,t.substation_name
 ORDER BY countnum DESC */
 
  /*    测试数据 因为soe表中数据太少 所以先用测试数据显示 
        SET @sqlstr1=concat('SELECT DISTINCT
			ywz.ywz_id              id,
			ywz.ywz_name            NAME,
			ywz.lng                 ywzx,
			ywz.lat                 ywzy,
			station.id      station_id,
			station.name    station_name,
			station.voltagelevel_id            station_dydjcode,
			station.voltagelevel           station_dydjname,
			station.lng             station_x,
			station.lat             station_y,
			IF(tcount.countnum IS NULL,0,tcount.countnum) 		      countnum,
			status.status            
			FROM base.tf_ywzbdz ywzxy
			INNER JOIN cisp_dev.yc_substation station
			ON station.maintenance_team = ywzxy.whbz
			INNER JOIN cisp_platform.bp_org org
			ON org.org_no = station.depart
			INNER JOIN base.`tf_ywz` ywz
			ON ywzxy.whbz=ywz.ywz_id
			LEFT JOIN base.tf_comm_status STATUS
                        ON station.id = status.bdz_id
			LEFT JOIN (SELECT  t.substation AS station_id,t.substation_name,CAST(SUM(t.alarm_num) AS CHAR) AS countnum 
				FROM base.tf_alarm_statistics t 
				INNER JOIN cisp_dev.yc_substation station
				ON station.id=t.substation
				WHERE station.depart');
	  SET @sqlstr2=concat(' GROUP BY t.substation,t.substation_name
			ORDER BY countnum DESC LIMIT 3) tcount
			ON  tcount.station_id= station.id
			WHERE  ywz.useflag=1 AND 
			station.lng IS NOT NULL AND ywz.lng IS NOT NULL
			AND station.depart');*/
         
           -- 生产数据 测试通过
          
      SET @sqlstr1=CONCAT('SELECT DISTINCT
						ywz.whbz AS id, ywz.whbzmc AS NAME, \'0\' AS ywzx, \'0\' AS ywzy, 
						station.id station_id, station.name station_name, 
						station.voltagelevel_id station_dydjcode,station.account_id AS accountId, 
						station.voltagelevel station_dydjname, station.lng station_x,
						station.lat station_y, 
						 concat(IF(
							tcount.alarmcount IS NULL, 0, tcount.alarmcount
						),\'\') as countnum, stus.status
						FROM
						base.tf_ywzbdz ywz
						left JOIN cisp_dev.yc_substation station
							ON station.id = ywz.zyid
						LEFT JOIN base.tf_comm_status stus
							ON station.id = stus.bdz_id
						LEFT JOIN (');
		-- 其他局人员
		SET @slqstr2_1=CONCAT('SELECT
						t.substation AS stationid, SUM(t.alarm_num) AS alarmcount
						FROM
						base.tf_alarm_statistics t
						left join cisp_dev.yc_substation s
						on s.id=t.substation
						where t.rtime >= date_sub(now(),interval 2 day) and t.substation!=\'30000000-102415259\' and s.depart');
		-- 省局人员 取消单位过滤
		SET @sqlstr2_2=CONCAT('SELECT
						t.substation AS stationid, SUM(t.alarm_num) AS alarmcount
						FROM
						base.tf_alarm_statistics t where t.rtime >= date_format(date_sub(now(),interval 2 day),\'%Y-%m-%d\') ');
							
		SET @sqlstr3=CONCAT('GROUP BY t.substation
			  ORDER BY alarmcount DESC,t.substation limit 3) tcount
			  ON tcount.stationid = station.id');
	SET @sqlstr4=CONCAT(' WHERE station.depart');
       -- 局信息
	
 	IF STRCMP(org_no,'8a812897493378a001495677ad086663')=0 THEN  # 省人员
		SET @sqlstr=CONCAT(@sqlstr1,@sqlstr2_2,@sqlstr3);
	ELSE
		IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
			SET @allorgs=base.getInClause(org_no);	-- select allorgs;
		END IF;
		
		SET @sqlstr=CONCAT(@sqlstr1,@slqstr2_1,@allorgs,@sqlstr3,@sqlstr4,@allorgs);
		-- SET @sqlstr=CONCAT(@sqlstr1,@sqlstr2_2,@sqlstr3,' WHERE station.lng IS NOT NULL');

 	END IF;
       -- SELECT @sqlstr,@allorgs,@sqlstr1,@sqlstr2_1,@allorgs,@sqlstr3,@allorgs, @sqlstr4;
      PREPARE stmt FROM @sqlstr;
      EXECUTE stmt; 

END




SELECT * FROM base.tf_ywz_bdz_vol_device dev
DROP PROCEDURE IF EXISTS base.p_getYwzAndBdz_fk;
DELIMITER //
CREATE PROCEDURE base.p_getYwzAndBdz_fk(IN org_no VARCHAR(40))
BEGIN

/*
 先按一级告警排序，没有 一级告警 按 二级告警，没有 二级告警 按 三级告警排序

 select t.substation,t.substation_name,t.alarmlevel,sum(t.alarm_num) as countnum 
 from base.tf_alarm_statistics t 
 group by t.alarmlevel,t.substation,t.substation_name
 order by t.alarmlevel asc,countnum desc

 按总数排 不分告警告警等级

 SELECT t.substation,t.substation_name,SUM(t.alarm_num) AS countnum 
 FROM base.tf_alarm_statistics t 
 GROUP BY t.substation,t.substation_name
 ORDER BY countnum DESC */
 
  /*    测试数据 因为soe表中数据太少 所以先用测试数据显示 
        SET @sqlstr1=concat('SELECT DISTINCT
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
			IF(tcount.countnum IS NULL,0,tcount.countnum) 		      countnum,
			status.status            
			FROM base.tf_ywzbdz ywzxy
			INNER JOIN cisp_dev.yc_substation station
			ON station.maintenance_team = ywzxy.whbz
			INNER JOIN cisp_platform.bp_org org
			ON org.org_no = station.depart
			INNER JOIN base.`tf_ywz` ywz
			ON ywzxy.whbz=ywz.ywz_id
			LEFT JOIN base.tf_comm_status status
                        ON station.id = status.bdz_id
			LEFT JOIN (SELECT  t.substation AS station_id,t.substation_name,cast(SUM(t.alarm_num) as char) AS countnum 
				FROM base.tf_alarm_statistics t 
				INNER JOIN cisp_dev.yc_substation station
				ON station.id=t.substation
				WHERE station.depart');
	  SET @sqlstr2=concat(' GROUP BY t.substation,t.substation_name
			ORDER BY countnum DESC LIMIT 3) tcount
			ON  tcount.station_id= station.id
			WHERE  ywz.useflag=1 AND 
			station.lng IS NOT NULL AND ywz.lng IS NOT NULL
			AND station.depart');*/
         
           -- 生产数据 测试通过
          
      SET @sqlstr1=CONCAT('SELECT DISTINCT
						ywz.whbz AS id, ywz.whbzmc AS name, \'0\' AS ywzx, \'0\' AS ywzy, 
						station.id station_id, station.name station_name, 
						station.voltagelevel_id station_dydjcode, 
						station.voltagelevel station_dydjname, station.lng station_x,
						station.lat station_y, 
						 concat(IF(
							tcount.alarmcount IS NULL, 0, tcount.alarmcount
						),\'\') as countnum, stus.status
						FROM
						base.tf_ywzbdz ywz
						left JOIN cisp_dev.yc_substation station
							ON station.id = ywz.zyid
						LEFT JOIN base.tf_comm_status stus
							ON station.id = stus.bdz_id
						LEFT JOIN (');
		-- 其他局人员
		SET @slqstr2_1=CONCAT('SELECT
						t.substation AS stationid, SUM(t.alarm_num) AS alarmcount
						FROM
						base.tf_alarm_statistics t
						left join cisp_dev.yc_substation s
						on s.maintenance_team=t.maintenance
						where s.depart');
		-- 省局人员 取消单位过滤
		SET @sqlstr2_2=CONCAT('SELECT
						t.substation AS stationid, SUM(t.alarm_num) AS alarmcount
						FROM
						base.tf_alarm_statistics t ');
							
		SET @sqlstr3=CONCAT('GROUP BY t.substation
			  ORDER BY alarmcount DESC limit 3) tcount
			  ON tcount.stationid = station.id');
	SET @sqlstr4=CONCAT(' WHERE station.lng IS NOT NULL AND station.depart');
       -- 局信息
	
 	IF STRCMP(org_no,'8a812897493378a001495677ad086663')=0 THEN  # 省人员
		SET @sqlstr=CONCAT(@sqlstr1,@sqlstr2_2,@sqlstr3,' WHERE station.lng IS NOT NULL');
	ELSE
		IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
			SET @allorgs=base.getInClause(org_no);	-- select allorgs;
		END IF;
		
		SET @sqlstr=CONCAT(@sqlstr1,@slqstr2_1,@allorgs,@sqlstr3,@sqlstr4,@allorgs);
		-- SET @sqlstr=CONCAT(@sqlstr1,@sqlstr2_2,@sqlstr3,' WHERE station.lng IS NOT NULL');

 	END IF;
      SELECT @sqlstr,@allorgs,@sqlstr1,@sqlstr2_1,@allorgs,@sqlstr3,@allorgs, @sqlstr4;
      PREPARE stmt FROM @sqlstr;
      EXECUTE stmt; 

END



SELECT * FROM cisp_platform.me_soe

SHOW INDEX FROM cisp_platform.me_soe

SELECT
     t.substation AS stationid, SUM(t.alarm_num) AS alarmcount
FROM
     base.tf_alarm_statistics t
GROUP BY t.substation
ORDER BY alarmcount DESC
LIMIT 3

SELECT * FROM base.tf_alarm_statistics t
SELECT * FROM cisp_dev.yc_substation WHERE id= '30000000-102774646'

SELECT * FROM base.tf_ywzbdz WHERE whbz='1096FA0035D17535E05379FB00301221'

SELECT * FROM base.tf_ywzbdz WHERE ssds='1096FA0035D17535E05379FB50151626'

SELECT * FROM cisp_platform.bp_org WHERE org_no='1096FA0035D17535E05379FB50151626'
SELECT * FROM cisp_platform.bp_org WHERE org_no='1096FA0035D17535E05379FB31000001'

SELECT
     t.substation AS stationid, s.depart
FROM
     base.tf_alarm_statistics t
     LEFT JOIN cisp_dev.yc_substation s
          ON t.substation = s.id




SELECT STRCMP('1096FA0035D17535E05379FB31000001','8a812897493378a001495677ad086663')