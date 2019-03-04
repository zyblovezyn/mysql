
BEGIN # test

-- 萧山
CALL base.proc_substation_access_rate_ywzandvol('1096FA0035D17535E05379FB31510001',NULL,'33,32,34');
CALL base.proc_substation_access_rate_ywzandvol('1096FA0035D17535E05379FB31510001',NULL,'');

-- 杭州
CALL base.proc_substation_access_rate_ywzandvol('1096FA0035D17535E05379FB31000001',NULL,'33,32,34');
CALL base.proc_substation_access_rate_ywzandvol('1096FA0035D17535E05379FB31000001',NULL,'');

-- 国网
CALL base.proc_substation_access_rate_ywzandvol('8a812897493378a001495677ad086663','','33,32,34');
CALL base.proc_substation_access_rate_ywzandvol('8a812897493378a001495677ad086663','','');


-- 淳安
CALL base.proc_substation_access_rate_ywzandvol('1096FA0035D17535E05379FB31510001',NULL,'33,32,34');
CALL base.proc_substation_access_rate_ywzandvol('1096FA0035D17535E05379FB31570001',NULL,'');

SELECT * FROM base.vf_dev_search


SELECT * FROM cisp_dev.yc_substation
SELECT * FROM cisp_platform.bp_org WHERE org_name LIKE '%检%'

SELECT * FROM cisp_platform.bp_org WHERE org_name LIKE '%淳安%'

END 

-- version 9.0	date:2019-1-10	reason:+优化
DELIMITER $$

USE `base`$$

DROP PROCEDURE IF EXISTS `proc_substation_access_rate_ywzandvol`$$

CREATE DEFINER=`zhxm`@`` PROCEDURE `proc_substation_access_rate_ywzandvol`(IN org_no VARCHAR(50),IN ywzid TEXT,IN volid TEXT)
BEGIN
-- org_no 局信息
-- voltagelevel 电压等级
-- ywzid 运维站信息
	DECLARE group_org VARCHAR(1000);
	
	-- 地市局接入率	
	SELECT GROUP_CONCAT(org_no) INTO group_org FROM cisp_platform.bp_org bp_org WHERE bp_org.p_org_no=org_no;
	SET @notVolcode=CONCAT(' and s.voltagelevel_id not in (\'83\',\'22\',\'76\')');
	SET @notVolcodeAccessrate=CONCAT(' and dev.volcode not in (\'83\',\'22\',\'76\')');

	IF org_no='8a812897493378a001495677ad086663' THEN -- 省人员		 
		SET @sqlstr1=CONCAT('SELECT
						? as orgName,
						a.org_name as unitName,a.volCode,replace(replace(a.volName,\'直流\',\'\'),\'交流\',\'\') as volName, cast(SUM(a.countrate) as char) AS countrate, cast(SUM(a.accessrate) as char) AS accessrate, cast(SUM(a.countrate) - SUM(a.accessrate) as char) AS noaccessrate
						FROM
						(SELECT
							sum1.org_name,sum1.org_no, org.volCode,org.volName, SUM(org.countrate) AS countrate, 0 AS accessrate
						FROM
							(SELECT
								CASE
									sum1.p_org_no
									WHEN \'8a812897493378a001495677ad086663\'
									THEN \'1096FA0035D17535E05379FB31210000\'
									ELSE sum1.p_org_no
								END AS p_org_no, org.volCode,org.volName, SUM(org.countrate) AS countrate
							FROM
								(SELECT
									org.org_no, org.org_name, s.voltagelevel AS volName,s.voltagelevel_id AS volCode,COUNT(DISTINCT s.id) AS countrate
								FROM
									cisp_dev.yc_substation s
								INNER JOIN base.tf_ywzbdz ywz
									ON s.id=ywz.zyid 
								INNER JOIN base.bp_org_shortname org
										ON org.org_no = s.depart
								WHERE 1 = 1');				
		SET @sqlstr2=CONCAT('GROUP BY org.org_no, volCode) AS org
						INNER JOIN base.bp_org_shortname sum1
							ON org.org_no = sum1.org_no
					GROUP BY sum1.p_org_no, org.volCode) AS org
					INNER JOIN base.bp_org_shortname sum1
						ON org.p_org_no = sum1.org_no
				GROUP BY sum1.org_no, org.volCode
				UNION
				ALL
				SELECT
					sum1.org_name,sum1.org_no, org.volCode,org.volName, 0 AS countrate, SUM(org.accessrate) AS accessrate
				FROM
					(SELECT
						CASE
							org.p_org_no
							WHEN \'8a812897493378a001495677ad086663\'
							THEN \'1096FA0035D17535E05379FB31210000\'
							ELSE org.p_org_no
						END AS p_org_no, v.volName, v.volCode, org.org_name, SUM(v.accessrate) AS accessrate
					FROM
						(SELECT
							dev.org_no,
							dev.volcode AS volCode,
							dev.volname AS volName,
							0 AS countrate,
							COUNT(DISTINCT dev.stationid) AS accessrate
						FROM
							base.tf_ywz_bdz_vol_device dev
						WHERE 1 = 1');
		SET @sqlstr3=CONCAT(' GROUP BY dev.org_no,volCode) AS v
							LEFT JOIN base.bp_org_shortname org
								ON v.org_no = org.org_no
						GROUP BY org.p_org_no, v.volCode) AS org
						INNER JOIN base.bp_org_shortname sum1
							ON sum1.org_no = org.p_org_no
					GROUP BY sum1.org_no, org.volCode) a
					 LEFT JOIN base.bp_org_shortname org
						ON org.org_no=a.org_no
					GROUP BY a.org_no, a.volCode order by org.order_no,a.volCode DESC');
 	 	SET @sqlconcat='';
 	 	SET @sqlaccessrate='';	
			-- 运维站信息
		IF ISNULL(ywzid)=FALSE AND LENGTH(ywzid)>0 THEN
			SET @ywzids=base.delimiterStr(ywzid,',');
			SET @sqlconcat=CONCAT(@slconcat,' and s.maintenance_team in ',@ywzids);				 
			SET @sqlaccessrate=CONCAT(@sqlaccessrate,' and dev.ywzid in ',@ywzids);	
		END IF;
		-- 电压等级信息
		IF ISNULL(volid)=FALSE AND LENGTH(volid)>0 THEN
			SET @volids=base.delimiterStr(volid,',');
			SET @sqlconcat=CONCAT(@sqlconcat,' and s.voltagelevel_id in ',@volids,@notVolcode);	
			SET @sqlaccessrate=CONCAT(@sqlaccessrate,' and dev.volcode in ',@volids,@notVolcodeAccessrate);
		ELSE
			SET @sqlconcat=CONCAT(@sqlconcat,@notVolcode);SET @sqlaccessrate=CONCAT(@sqlaccessrate,@notVolcodeAccessrate);
		END IF;	
		-- 局信息
		/*IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
			-- SET @allorgs=base.getInClause(org_no);		  
			SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart=\'',org_no,'\'');	
			SET @sqlaccessrate=CONCAT(@sqlaccessrate,' and dev.org_no=\'',org_no,'\'');				 
		END IF; */		 
		SET @sqlstr=CONCAT(@sqlstr1,@sqlconcat,@sqlstr2,@sqlaccessrate,@sqlstr3);
		 
	ELSE -- 其他人yuan
	
		IF ISNULL(group_org)=TRUE THEN  -- 没有子局OK
			SET @sqlstr1=CONCAT('SELECT
							? as orgName,
							a.ywzName as unitName,
							replace(replace(a.volName,\'直流\',\'\'),\'交流\',\'\') as volName,
							cast(SUM(a.countrate) as char) AS countrate,
							cast(SUM(a.accessrate) as char)  AS accessrate,
							cast(SUM(a.countrate) - SUM(a.accessrate) as char)  AS noaccessrate
						FROM
							(SELECT
								ywz.whbzmc AS ywzName,
								s.voltagelevel_id AS volCode,
								s.voltagelevel AS volName,
								COUNT(DISTINCT s.id) AS countrate,
								0 AS accessrate
							FROM
								cisp_dev.yc_substation s
								INNER JOIN base.tf_ywzbdz ywz
									ON ywz.zyid = s.id
							WHERE 1 = 1');
			
			SET @sqlstr2=CONCAT(' GROUP BY ywzName,volCode
							UNION ALL
							SELECT 
								dev.ywzname,
								dev.volcode AS volCode,
								dev.volname AS volName,
								0 AS countrate,
								COUNT(DISTINCT dev.stationid) AS accessrate
							FROM
								base.tf_ywz_bdz_vol_device dev
								WHERE 1 = 1');
					 
			SET @sqlstr3=CONCAT(' GROUP BY ywzName,volCode) a
							GROUP BY ywzName,volCode desc ORDER BY ywzName');
					 
			SET @sqlconcat='';
			SET @sqlaccessrate='';
			-- 运维站信息
			IF ISNULL(ywzid)=FALSE AND LENGTH(ywzid)>0 THEN
				SET @ywzids=base.delimiterStr(ywzid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.maintenance_team in ',@ywzids);
				SET @sqlaccessrate=CONCAT(@sqlaccessrate,' and dev.ywzid in ',@ywzids);				 
			END IF;
			-- 电压等级信息
			IF ISNULL(volid)=FALSE AND LENGTH(volid)>0 THEN
				SET @volids=base.delimiterStr(volid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.voltagelevel_id in ',@volids,@notVolcode);	
				SET @sqlaccessrate=CONCAT(@sqlaccessrate,' and dev.volcode in ',@volids,@notVolcodeAccessrate);
			ELSE
				SET @sqlconcat=CONCAT(@sqlconcat,@notVolcode);SET @sqlaccessrate=CONCAT(@sqlaccessrate,@notVolcodeAccessrate);
			END IF;	
			-- 局信息
			IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
				-- SET @allorgs=base.getInClause(org_no);		  
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart=\'',org_no,'\'');	
				SET @sqlaccessrate=CONCAT(@sqlaccessrate,' and dev.org_no=\'',org_no,'\'');				 
			END IF; 		 
			SET @sqlstr=CONCAT(@sqlstr1,@sqlconcat,@sqlstr2,@sqlaccessrate,@sqlstr3);
		ELSE -- 有子局			
			SET @sqlstr1=CONCAT('SELECT
					? as orgName,
					org.org_name as unitName,
					replace(replace(a.volName,\'直流\',\'\'),\'交流\',\'\') as volName,
					cast(SUM(a.countrate) as char) AS countrate,
					cast(SUM(a.accessrate) as char) AS accessrate,
					cast(SUM(a.countrate) - SUM(a.accessrate) as char) AS noaccessrate
				FROM
					(SELECT
						s.depart AS org_no,
						s.voltagelevel_id AS volCode,
						s.voltagelevel AS volName,
						COUNT(DISTINCT s.id) AS countrate,
						0 AS accessrate
					FROM
						cisp_dev.yc_substation s
						INNER JOIN base.tf_ywzbdz ywz
							ON s.id = ywz.zyid
					WHERE 1 = 1');			
			SET @sqlstr2=CONCAT(' GROUP BY org_no,volCode
					UNION
					ALL
					SELECT
						dev.org_no,
						dev.volcode AS volCode,
						dev.volname AS volName,
						0 AS countrate,
						COUNT(DISTINCT dev.stationid) AS accessrate
					FROM
						base.tf_ywz_bdz_vol_device dev
					WHERE 1 = 1');
			SET @sqlstr3=CONCAT(' GROUP BY org_no,volCode) AS a
						LEFT JOIN base.bp_org_shortname org
							ON a.org_no = org.org_no
						GROUP BY a.org_no,volCode
						ORDER BY org.order_no,volCode DESC');
			SET @sqlconcat='';
			SET @sqlaccessrate='';
			-- 运维站信息
			IF ISNULL(ywzid)=FALSE AND LENGTH(ywzid)>0 THEN
				SET @ywzids=base.delimiterStr(ywzid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.maintenance_team in ',@ywzids);
				SET @sqlaccessrate=CONCAT(@sqlaccessrate,' and dev.ywzid in ',@ywzids);					 
			END IF;
			-- 电压等级信息
			IF ISNULL(volid)=FALSE AND LENGTH(volid)>0 THEN
				SET @volids=base.delimiterStr(volid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.voltagelevel_id in ',@volids,@notVolcode);	
				SET @sqlaccessrate=CONCAT(@sqlaccessrate,' and dev.volcode in ',@volids,@notVolcodeAccessrate);

			ELSE
				SET @sqlconcat=CONCAT(@sqlconcat,@notVolcode);SET @sqlaccessrate=CONCAT(@sqlaccessrate,@notVolcodeAccessrate);

			END IF;				
			-- 局信息
			IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
				SET @allorgs=base.getInClause(org_no);		  
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);	
				SET @sqlaccessrate=CONCAT(@sqlaccessrate,' and dev.org_no',@allorgs);			 
			 
			END IF;
 		-- select  @sqlstr1,@sqlstr2,@sqlstr3,@sqlconcat,@sqlaccessrate;
		SET @sqlstr=CONCAT(@sqlstr1,@sqlconcat,@sqlstr2,@sqlaccessrate,@sqlstr3);
		END IF;
	END IF;	

	-- 执行语句
	 -- SELECT @sqlstr;
	 SELECT t.org_full_name INTO @org_no FROM base.bp_org_shortname t WHERE t.org_no=org_no;
	 -- set @org_no=org_no;
	 SET @sql_mode=@@sql_mode;
	 SET @@sql_mode='';
	 PREPARE stmt FROM @sqlstr;
	 EXECUTE stmt USING @org_no;
	 SET @@sql_mode=@sql_mode;
	 DEALLOCATE PREPARE stmt;
END$$

DELIMITER ;



-- version 8.0	date:2019-1-7	reason:+优化
DROP PROCEDURE IF EXISTS base.proc_substation_access_rate_ywzandvol; 
DELIMITER //
CREATE PROCEDURE base.proc_substation_access_rate_ywzandvol(IN org_no VARCHAR(50),IN ywzid TEXT,IN volid TEXT)
BEGIN
-- org_no 局信息
-- voltagelevel 电压等级
-- ywzid 运维站信息
	DECLARE group_org VARCHAR(1000);
	
	-- 地市局接入率	
	SELECT GROUP_CONCAT(org_no) INTO group_org FROM cisp_platform.bp_org bp_org WHERE bp_org.p_org_no=org_no;
	SET @notVolcode=CONCAT(' and s.voltagelevel_id not in (\'83\',\'22\',\'76\')');
	IF org_no='8a812897493378a001495677ad086663' THEN -- 省人员		 
		SET @sqlstr1=CONCAT('SELECT
						? as orgName,
						a.org_name as unitName, IF(
							a.volCode >= 35, \'500Kv及以上\', IF(
								a.volCode=34, \'330Kv\', IF(a.volCode =33, \'220Kv\', IF(a.volCode<=32, \'110Kv及以下\', \'\'))
							)
						) AS volName, cast(SUM(a.countrate) as char) AS countrate, cast(SUM(a.accessrate) as char) AS accessrate, cast(SUM(a.countrate) - SUM(a.accessrate) as char) AS noaccessrate
						FROM
						(SELECT
							sum1.org_name,sum1.org_no, org.volCode, SUM(org.countrate) AS countrate, 0 AS accessrate
						FROM
							(SELECT
								CASE
									sum1.p_org_no
									WHEN \'8a812897493378a001495677ad086663\'
									THEN \'1096FA0035D17535E05379FB31210000\'
									ELSE sum1.p_org_no
								END AS p_org_no, org.volCode, SUM(org.countrate) AS countrate
							FROM
								(SELECT
									org.org_no, org.org_name, s.voltagelevel AS volName,s.voltagelevel_id AS volCode,COUNT(DISTINCT s.id) AS countrate
								FROM
									cisp_dev.yc_substation s
								INNER JOIN base.tf_ywzbdz ywz
									ON s.id=ywz.zyid 
								INNER JOIN base.bp_org_shortname org
										ON org.org_no = s.depart
								WHERE 1 = 1');				
		SET @sqlstr2=CONCAT('GROUP BY org.org_no, volCode) AS org
						INNER JOIN base.bp_org_shortname sum1
							ON org.org_no = sum1.org_no
					GROUP BY sum1.p_org_no, org.volCode) AS org
					INNER JOIN base.bp_org_shortname sum1
						ON org.p_org_no = sum1.org_no
				GROUP BY sum1.org_no, org.volCode
				UNION
				ALL
				SELECT
					sum1.org_name,sum1.org_no, org.volCode, 0 AS countrate, SUM(org.accessrate) AS accessrate
				FROM
					(SELECT
						CASE
							org.p_org_no
							WHEN \'8a812897493378a001495677ad086663\'
							THEN \'1096FA0035D17535E05379FB31210000\'
							ELSE org.p_org_no
						END AS p_org_no, v.volName, v.volCode, org.org_name, SUM(v.accessrate) AS accessrate
					FROM
						(SELECT
							dev.org_no,
							dev.volcode AS volCode,
							dev.volname AS volName,
							0 AS countrate,
							COUNT(DISTINCT dev.stationid) AS accessrate
						FROM
							base.tf_ywz_bdz_vol_device dev
						WHERE 1 = 1');
		SET @sqlstr3=CONCAT(' GROUP BY dev.org_no,volCode) AS v
							LEFT JOIN base.bp_org_shortname org
								ON v.org_no = org.org_no
						GROUP BY org.p_org_no, v.volCode) AS org
						INNER JOIN base.bp_org_shortname sum1
							ON sum1.org_no = org.p_org_no
					GROUP BY sum1.org_no, org.volCode) a
					 LEFT JOIN base.bp_org_shortname org
						ON org.org_no=a.org_no
					GROUP BY a.org_no, volName order by org.order_no');
 	 	SET @sqlconcat='';
 	 	SET @sqlaccessrate='';	
			-- 运维站信息
		IF ISNULL(ywzid)=FALSE AND LENGTH(ywzid)>0 THEN
			SET @ywzids=base.delimiterStr(ywzid,',');
			SET @sqlconcat=CONCAT(@slconcat,' and s.maintenance_team in ',@ywzids);				 
			SET @sqlaccessrate=CONCAT(@sqlaccessrate,' and dev.ywzid in ',@ywzids);	
		END IF;
		-- 电压等级信息
		IF ISNULL(volid)=FALSE AND LENGTH(volid)>0 THEN
			SET @volids=base.delimiterStr(volid,',');
			SET @sqlconcat=CONCAT(@sqlconcat,' and s.voltagelevel_id in ',@volids,@notVolcode);	
			SET @sqlaccessrate=CONCAT(@sqlaccessrate,' and dev.volcode in ',@volids,@notVolcodeAccessrate);
		ELSE
			SET @sqlconcat=CONCAT(@sqlconcat,@notVolcode);SET @sqlaccessrate=CONCAT(@sqlaccessrate,@notVolcodeAccessrate);
		END IF;	
		-- 局信息
		/*IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
			-- SET @allorgs=base.getInClause(org_no);		  
			SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart=\'',org_no,'\'');	
			SET @sqlaccessrate=CONCAT(@sqlaccessrate,' and dev.org_no=\'',org_no,'\'');				 
		END IF; */		 
		SET @sqlstr=CONCAT(@sqlstr1,@sqlconcat,@sqlstr2,@sqlaccessrate,@sqlstr3);
		 
	ELSE -- 其他人yuan
	
		IF ISNULL(group_org)=TRUE THEN  -- 没有子局OK
			SET @sqlstr1=CONCAT('SELECT
							? as orgName,
							a.ywzName as unitName,
							replace(replace(a.volName,\'直流\',\'\'),\'交流\',\'\') as volName,
							cast(SUM(a.countrate) as char) AS countrate,
							cast(SUM(a.accessrate) as char)  AS accessrate,
							cast(SUM(a.countrate) - SUM(a.accessrate) as char)  AS noaccessrate
						FROM
							(SELECT
								ywz.whbzmc AS ywzName,
								s.voltagelevel_id AS volCode,
								s.voltagelevel AS volName,
								COUNT(DISTINCT s.id) AS countrate,
								0 AS accessrate
							FROM
								cisp_dev.yc_substation s
								INNER JOIN base.tf_ywzbdz ywz
									ON ywz.zyid = s.id
							WHERE 1 = 1');
			
			SET @sqlstr2=CONCAT(' GROUP BY ywzName,volCode UNION ALL
							SELECT 
								dev.ywzname,
								dev.volcode AS volCode,
								dev.volname AS volName,
								0 AS countrate,
								COUNT(DISTINCT dev.stationid) AS accessrate
							FROM
								base.tf_ywz_bdz_vol_device dev
								WHERE 1 = 1');
					 
			SET @sqlstr3=CONCAT(' GROUP BY ywzName,volCode) a
							GROUP BY ywzName,volCode desc ORDER BY ywzName');
					 
			SET @sqlconcat='';
			SET @sqlaccessrate='';
			-- 运维站信息
			IF ISNULL(ywzid)=FALSE AND LENGTH(ywzid)>0 THEN
				SET @ywzids=base.delimiterStr(ywzid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.maintenance_team in ',@ywzids);
				SET @sqlaccessrate=CONCAT(@sqlaccessrate,' and dev.ywzid in ',@ywzids);				 
			END IF;
			-- 电压等级信息
			IF ISNULL(volid)=FALSE AND LENGTH(volid)>0 THEN
				SET @volids=base.delimiterStr(volid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.voltagelevel_id in ',@volids,@notVolcode);	
				SET @sqlaccessrate=CONCAT(@sqlaccessrate,' and dev.volcode in ',@volids,@notVolcodeAccessrate);
			ELSE
				SET @sqlconcat=CONCAT(@sqlconcat,@notVolcode);SET @sqlaccessrate=CONCAT(@sqlaccessrate,@notVolcodeAccessrate);
			END IF;	
			-- 局信息
			IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
				-- SET @allorgs=base.getInClause(org_no);		  
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart=\'',org_no,'\'');	
				SET @sqlaccessrate=CONCAT(@sqlaccessrate,' and dev.org_no=\'',org_no,'\'');				 
			END IF; 		 
			SET @sqlstr=CONCAT(@sqlstr1,@sqlconcat,@sqlstr2,@sqlaccessrate,@sqlstr3);
		ELSE -- 有子局			
			SET @sqlstr1=CONCAT('SELECT
					? as orgName,
					org.org_name as unitName,
					replace(replace(a.volName,\'直流\',\'\'),\'交流\',\'\') as volName,
					cast(SUM(a.countrate) as char) AS countrate,
					cast(SUM(a.accessrate) as char) AS accessrate,
					cast(SUM(a.countrate) - SUM(a.accessrate) as char) AS noaccessrate
				FROM
					(SELECT
						s.depart AS org_no,
						s.voltagelevel_id AS volCode,
						s.voltagelevel AS volName,
						COUNT(DISTINCT s.id) AS countrate,
						0 AS accessrate
					FROM
						cisp_dev.yc_substation s
						INNER JOIN base.tf_ywzbdz ywz
							ON s.id = ywz.zyid
					WHERE 1 = 1');			
			SET @sqlstr2=CONCAT(' GROUP BY org_no,volCode
					UNION
					ALL
					SELECT
						dev.org_no,
						dev.volcode AS volCode,
						dev.volname AS volName,
						0 AS countrate,
						COUNT(DISTINCT dev.stationid) AS accessrate
					FROM
						base.tf_ywz_bdz_vol_device dev
					WHERE 1 = 1');
			SET @sqlstr3=CONCAT(' GROUP BY org_no,volCode) AS a
						LEFT JOIN base.bp_org_shortname org
							ON a.org_no = org.org_no
						GROUP BY a.org_no,volCode
						ORDER BY org.order_no,volCode DESC');
			SET @sqlconcat='';
			SET @sqlaccessrate='';
			-- 运维站信息
			IF ISNULL(ywzid)=FALSE AND LENGTH(ywzid)>0 THEN
				SET @ywzids=base.delimiterStr(ywzid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.maintenance_team in ',@ywzids);
				SET @sqlaccessrate=CONCAT(@sqlaccessrate,' and dev.ywzid in ',@ywzids);					 
			END IF;
			-- 电压等级信息
			IF ISNULL(volid)=FALSE AND LENGTH(volid)>0 THEN
				SET @volids=base.delimiterStr(volid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.voltagelevel_id in ',@volids,@notVolcode);	
				SET @sqlaccessrate=CONCAT(@sqlaccessrate,' and dev.volcode in ',@volids,@notVolcodeAccessrate);

			ELSE
				SET @sqlconcat=CONCAT(@sqlconcat,@notVolcode);SET @sqlaccessrate=CONCAT(@sqlaccessrate,@notVolcodeAccessrate);

			END IF;				
			-- 局信息
			IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
				SET @allorgs=base.getInClause(org_no);		  
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);	
				SET @sqlaccessrate=CONCAT(@sqlaccessrate,' and dev.org_no',@allorgs);			 
			 
			END IF;
 		-- select  @sqlstr1,@sqlstr2,@sqlstr3,@sqlstr4;
		SET @sqlstr=CONCAT(@sqlstr1,@sqlconcat,@sqlstr2,@sqlaccessrate,@sqlstr3);
		END IF;
	END IF;	

	-- 执行语句
	 -- SELECT @sqlstr;
	 SELECT t.org_full_name INTO @org_no FROM base.bp_org_shortname t WHERE t.org_no=org_no;
	 -- set @org_no=org_no;
	 SET @sql_mode=@@sql_mode;
	 SET @@sql_mode='';
	 PREPARE stmt FROM @sqlstr;
	 EXECUTE stmt USING @org_no;
	 SET @@sql_mode=@sql_mode;
	 DEALLOCATE PREPARE stmt;
END;



-- version 7.0	date:2018-12-29	reason:+省局人员排序 添加父级局名称
DROP PROCEDURE IF EXISTS base.proc_substation_access_rate_ywzandvol; 
DELIMITER //
CREATE PROCEDURE base.proc_substation_access_rate_ywzandvol(IN org_no VARCHAR(50),IN ywzid TEXT,IN volid TEXT)
BEGIN
-- org_no 局信息
-- voltagelevel 电压等级
-- ywzid 运维站信息
	DECLARE group_org VARCHAR(1000);
	
	-- 地市局接入率	
	SELECT GROUP_CONCAT(org_no) INTO group_org FROM cisp_platform.bp_org bp_org WHERE bp_org.p_org_no=org_no;
	SET @notVolcode=CONCAT(' and s.voltagelevel_id not in (\'83\',\'22\',\'76\')');
	IF org_no='8a812897493378a001495677ad086663' THEN -- 省人员		 
		SET @sqlstr1=CONCAT('SELECT
						? as orgName,
						a.org_name as unitName, IF(
							a.volCode >= 35, \'500Kv及以上\', IF(
								a.volCode=34, \'330Kv\', IF(a.volCode =33, \'220Kv\', IF(a.volCode<=32, \'110Kv及以下\', \'\'))
							)
						) AS volName, cast(SUM(a.countrate) as char) AS countrate, cast(SUM(a.accessrate) as char) AS accessrate, cast(SUM(a.countrate) - SUM(a.accessrate) as char) AS noaccessrate
						FROM
						(SELECT
							sum1.org_name,sum1.org_no, org.volCode, SUM(org.countrate) AS countrate, 0 AS accessrate
						FROM
							(SELECT
								CASE
									sum1.p_org_no
									WHEN \'8a812897493378a001495677ad086663\'
									THEN \'1096FA0035D17535E05379FB31210000\'
									ELSE sum1.p_org_no
								END AS p_org_no, org.volCode, SUM(org.countrate) AS countrate
							FROM
								(SELECT
									org.org_no, org.org_name, s.voltagelevel AS volName,s.voltagelevel_id AS volCode,COUNT(DISTINCT s.id) AS countrate
								FROM
									cisp_dev.yc_substation s
								INNER JOIN base.tf_ywzbdz ywz
									ON s.id=ywz.zyid 
								INNER JOIN base.bp_org_shortname org
										ON org.org_no = s.depart
								WHERE 1 = 1');				
		SET @sqlstr2=CONCAT('GROUP BY org.org_no, volCode) AS org
						INNER JOIN base.bp_org_shortname sum1
							ON org.org_no = sum1.org_no
					GROUP BY sum1.p_org_no, org.volCode) AS org
					INNER JOIN base.bp_org_shortname sum1
						ON org.p_org_no = sum1.org_no
				GROUP BY sum1.org_no, org.volCode
				UNION
				ALL
				SELECT
					sum1.org_name,sum1.org_no, org.volCode, 0 AS countrate, SUM(org.accessrate) AS accessrate
				FROM
					(SELECT
						CASE
							org.p_org_no
							WHEN \'8a812897493378a001495677ad086663\'
							THEN \'1096FA0035D17535E05379FB31210000\'
							ELSE org.p_org_no
						END AS p_org_no, v.volName, v.volCode, org.org_name, SUM(v.accessrate) AS accessrate
					FROM
						(SELECT DISTINCT
							COUNT(DISTINCT s.id) AS accessrate, s.DEPART, s.voltagelevel AS volName, s.voltagelevel_id AS volCode
						FROM
							cisp_dev.yc_substation s
							LEFT JOIN cisp_dev.v_all_dev d
								ON s.id = d.substation_id
						WHERE d.ID IS NOT NULL');
		SET @sqlstr3=CONCAT(' GROUP BY s.DEPART, volcode) AS v
							LEFT JOIN base.bp_org_shortname org
								ON v.depart = org.org_no
						GROUP BY org.p_org_no, v.volCode) AS org
						INNER JOIN base.bp_org_shortname sum1
							ON sum1.org_no = org.p_org_no
					GROUP BY sum1.org_no, org.volCode) a
					 LEFT JOIN base.bp_org_shortname org
						ON org.org_no=a.org_no
					GROUP BY a.org_no, volName order by org.order_no');
 	 	SET @sqlconcat='';	
			-- 运维站信息
			IF ISNULL(ywzid)=FALSE AND LENGTH(ywzid)>0 THEN
				SET @ywzids=base.delimiterStr(ywzid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.maintenance_team in ',@ywzids);				 
			END IF;
			-- 电压等级信息
			IF ISNULL(volid)=FALSE AND LENGTH(volid)>0 THEN
				SET @volids=base.delimiterStr(volid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.voltagelevel_id in ',@volids,@notVolcode);	
			ELSE
				SET @sqlconcat=CONCAT(@sqlconcat,@notVolcode);
			END IF;	
			-- 局信息
			/*IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
				SET @allorgs=base.getInClause(org_no);		  
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);				 
			END IF;*/
 		-- select  @sqlstr1,@sqlstr2,@sqlstr3,@sqlstr4;
		SET @sqlstr=CONCAT(@sqlstr1,@sqlconcat,@sqlstr2,@sqlconcat,@sqlstr3);
		 
	ELSE -- 其他人yuan
	
		IF ISNULL(group_org)=TRUE THEN  -- 没有子局OK
			SET @sqlstr1=CONCAT('SELECT
							? as orgName,
							a.ywzName as unitName,
							replace(replace(a.volName,\'直流\',\'\'),\'交流\',\'\') as volName,
							cast(SUM(a.countrate) as char) AS countrate,
							cast(SUM(a.accessrate) as char)  AS accessrate,
							cast(SUM(a.countrate) - SUM(a.accessrate) as char)  AS noaccessrate
						FROM
							(SELECT
								COUNT(DISTINCT s.id) AS countrate,
								0 AS accessrate,
								s.voltagelevel AS volName, 
								s.voltagelevel_id AS volCode,
								ywz.whbzmc AS ywzName
							FROM
								cisp_dev.yc_substation s
								INNER JOIN base.tf_ywzbdz ywz
									ON ywz.zyid = s.id
							WHERE 1 = 1');
			
			SET @sqlstr2=CONCAT(' GROUP BY ywzName,volName
								UNION
								ALL
								SELECT DISTINCT
									0 AS countrate,
									COUNT(DISTINCT s.ID) AS accessrate,
									s.voltagelevel AS volName, 
									s.voltagelevel_id AS volCode, 
									ywz.whbzmc AS ywzName
								FROM
									cisp_dev.yc_substation s
									INNER JOIN cisp_dev.v_all_dev d
										ON s.id = d.substation_id
									INNER JOIN base.tf_ywzbdz ywz
										ON ywz.zyid = s.id
								WHERE 1 = 1');
					 
			SET @sqlstr3=CONCAT(' GROUP BY ywzName,volName) a
						     GROUP BY ywzName,volName order by ywzName');
					 
			SET @sqlconcat='';
			-- 运维站信息
			IF ISNULL(ywzid)=FALSE AND LENGTH(ywzid)>0 THEN
				SET @ywzids=base.delimiterStr(ywzid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.maintenance_team in ',@ywzids);				 
			END IF;
			-- 电压等级信息
			IF ISNULL(volid)=FALSE AND LENGTH(volid)>0 THEN
				SET @volids=base.delimiterStr(volid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.voltagelevel_id in ',@volids,@notVolcode);	
			ELSE
				SET @sqlconcat=CONCAT(@sqlconcat,@notVolcode);
			END IF;
 			-- 局信息
			IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
				SET @allorgs=base.getInClause(org_no);		  
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);				 
			END IF; 		 
			SET @sqlstr=CONCAT(@sqlstr1,@sqlconcat,@sqlstr2,@sqlconcat,@sqlstr3);
		ELSE -- 有子局			
			SET @sqlstr1=CONCAT('SELECT
					? as orgName,
					a.org_name as unitName,
					replace(replace(a.volName,\'直流\',\'\'),\'交流\',\'\') as volName,
					cast(SUM(a.countrate) as char) AS countrate,
					cast(SUM(a.accessrate) as char) AS accessrate,
					cast(SUM(a.countrate) - SUM(a.accessrate) as char) AS noaccessrate
				FROM
					(SELECT
						org.org_no, org.org_name,org.order_no,
						s.voltagelevel AS volName,
						s.voltagelevel_id AS volCode,             
						COUNT(DISTINCT s.id) AS countrate,
						0 AS accessrate
					FROM
						cisp_dev.yc_substation s
					INNER JOIN base.tf_ywzbdz ywz
						ON s.id=ywz.zyid 
					INNER JOIN base.bp_org_shortname org
							ON org.org_no = s.depart
			  		WHERE 1=1');			
			SET @sqlstr2=CONCAT(' GROUP BY org.org_no,volName
					UNION
					ALL
					SELECT
						org.org_no, org.org_name, org.order_no,
						v.volName, 
						v.volCode,    
						0 AS countrate,
						SUM(v.accessrate) AS accessrate
					FROM
						(SELECT DISTINCT
							COUNT(DISTINCT s.id) AS accessrate,
							s.voltagelevel AS volName, 
							s.voltagelevel_id AS volCode,   
							s.DEPART
						FROM
							cisp_dev.yc_substation s
							LEFT JOIN cisp_dev.v_all_dev d
								ON s.id = d.substation_id
						WHERE d.ID IS NOT NULL');
			SET @sqlstr3=CONCAT(' GROUP BY s.DEPART,volName) AS v
						LEFT JOIN base.bp_org_shortname org
							ON v.depart = org.org_no GROUP BY org.org_no,v.volName) a
				GROUP BY a.org_no,a.volName order by a.order_no,volCode desc');
			SET @sqlconcat='';
			-- 运维站信息
			IF ISNULL(ywzid)=FALSE AND LENGTH(ywzid)>0 THEN
				SET @ywzids=base.delimiterStr(ywzid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.maintenance_team in ',@ywzids);				 
			END IF;
			-- 电压等级信息
			IF ISNULL(volid)=FALSE AND LENGTH(volid)>0 THEN
				SET @volids=base.delimiterStr(volid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.voltagelevel_id in ',@volids,@notVolcode);	
			ELSE
				SET @sqlconcat=CONCAT(@sqlconcat,@notVolcode);
			END IF;				
			-- 局信息
			IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
				SET @allorgs=base.getInClause(org_no);		  
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);				 
			END IF;
 		-- select  @sqlstr1,@sqlstr2,@sqlstr3,@sqlstr4;
		SET @sqlstr=CONCAT(@sqlstr1,@sqlconcat,@sqlstr2,@sqlconcat,@sqlstr3);
		END IF;
	END IF;	

	-- 执行语句
	--  SELECT @sqlstr;
	 SELECT t.org_full_name INTO @org_no FROM base.bp_org_shortname t WHERE t.org_no=org_no;
	 -- set @org_no=org_no;
	 SET @sql_mode=@@sql_mode;
	 SET @@sql_mode='';
	 PREPARE stmt FROM @sqlstr;
	 EXECUTE stmt USING @org_no;
	 SET @@sql_mode=@sql_mode;
	 DEALLOCATE PREPARE stmt;
END;



-- version 6.0	date:2018-12-29	reason:+排序
DROP PROCEDURE IF EXISTS base.proc_substation_access_rate_ywzandvol; 
DELIMITER //
CREATE PROCEDURE base.proc_substation_access_rate_ywzandvol(IN org_no VARCHAR(50),IN ywzid TEXT,IN volid TEXT)
BEGIN
-- org_no 局信息
-- voltagelevel 电压等级
-- ywzid 运维站信息
	DECLARE group_org VARCHAR(1000);

	-- 地市局接入率	
	SELECT GROUP_CONCAT(org_no) INTO group_org FROM cisp_platform.bp_org bp_org WHERE bp_org.p_org_no=org_no;
	SET @notVolcode=CONCAT(' and s.voltagelevel_id not in (\'83\',\'22\',\'76\')');
	IF org_no='8a812897493378a001495677ad086663' THEN -- 省人员		 
		SET @sqlstr1=CONCAT('SELECT
						a.org_name as unitName, IF(
							a.volCode >= 35, \'500Kv及以上\', IF(
								a.volCode=34, \'330Kv\', IF(a.volCode =33, \'220Kv\', IF(a.volCode<=32, \'110Kv及以下\', \'\'))
							)
						) AS volName, SUM(a.countrate) AS countrate, SUM(a.accessrate) AS accessrate, SUM(a.countrate) - SUM(a.accessrate) AS noaccessrate
						FROM
						(SELECT
							sum1.org_name, org.volCode, SUM(org.countrate) AS countrate, 0 AS accessrate
						FROM
							(SELECT
								CASE
									sum1.p_org_no
									WHEN \'8a812897493378a001495677ad086663\'
									THEN \'1096FA0035D17535E05379FB31210000\'
									ELSE sum1.p_org_no
								END AS p_org_no, org.volCode, SUM(org.countrate) AS countrate
							FROM
								(SELECT
									org.org_no, org.org_name, s.voltagelevel AS volName,s.voltagelevel_id AS volCode,COUNT(DISTINCT s.id) AS countrate
								FROM
									cisp_dev.yc_substation s
									INNER JOIN base.bp_org_shortname org
										ON org.org_no = s.depart
								WHERE 1 = 1');				
		SET @sqlstr2=CONCAT('GROUP BY org.org_no, volCode) AS org
						INNER JOIN base.bp_org_shortname sum1
							ON org.org_no = sum1.org_no
					GROUP BY sum1.p_org_no, org.volCode) AS org
					INNER JOIN base.bp_org_shortname sum1
						ON org.p_org_no = sum1.org_no
				GROUP BY sum1.org_no, org.volCode
				UNION
				ALL
				SELECT
					sum1.org_name, org.volCode, 0 AS countrate, SUM(org.accessrate) AS accessrate
				FROM
					(SELECT
						CASE
							org.p_org_no
							WHEN \'8a812897493378a001495677ad086663\'
							THEN \'1096FA0035D17535E05379FB31210000\'
							ELSE org.p_org_no
						END AS p_org_no, v.volName, v.volCode, org.org_name, SUM(v.accessrate) AS accessrate
					FROM
						(SELECT DISTINCT
							COUNT(DISTINCT s.id) AS accessrate, s.DEPART, s.voltagelevel AS volName, s.voltagelevel_id AS volCode
						FROM
							cisp_dev.yc_substation s
							LEFT JOIN cisp_dev.v_all_dev d
								ON s.id = d.substation_id
						WHERE d.ID IS NOT NULL');
		SET @sqlstr3=CONCAT(' GROUP BY s.DEPART, volcode) AS v
							LEFT JOIN base.bp_org_shortname org
								ON v.depart = org.org_no
						GROUP BY org.p_org_no, v.volCode) AS org
						INNER JOIN base.bp_org_shortname sum1
							ON sum1.org_no = org.p_org_no
					GROUP BY sum1.org_no, org.volCode) a
					GROUP BY a.org_name, volName');
 	 	SET @sqlconcat='';	
			-- 运维站信息
			IF ISNULL(ywzid)=FALSE AND LENGTH(ywzid)>0 THEN
				SET @ywzids=base.delimiterStr(ywzid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.maintenance_team in ',@ywzids);				 
			END IF;
			-- 电压等级信息
			IF ISNULL(volid)=FALSE AND LENGTH(volid)>0 THEN
				SET @volids=base.delimiterStr(volid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.voltagelevel_id in ',@volids,@notVolcode);	
			ELSE
				SET @sqlconcat=CONCAT(@sqlconcat,@notVolcode);
			END IF;	
			-- 局信息
			IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
				SET @allorgs=base.getInClause(org_no);		  
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);				 
			END IF;
 		-- select  @sqlstr1,@sqlstr2,@sqlstr3,@sqlstr4;
		SET @sqlstr=CONCAT(@sqlstr1,@sqlconcat,@sqlstr2,@sqlconcat,@sqlstr3);
		 
	ELSE -- 其他人yuan
	
		IF ISNULL(group_org)=TRUE THEN  -- 没有子局OK
			SET @sqlstr1=CONCAT('SELECT
							a.ywzName as unitName,
							replace(replace(a.volName,\'直流\',\'\'),\'交流\',\'\') as volName,
							cast(SUM(a.countrate) as char) AS countrate,
							cast(SUM(a.accessrate) as char)  AS accessrate,
							cast(SUM(a.countrate) - SUM(a.accessrate) as char)  AS noaccessrate
						FROM
							(SELECT
								COUNT(DISTINCT s.id) AS countrate,
								0 AS accessrate,
								s.voltagelevel AS volName, 
								s.voltagelevel_id AS volCode,
								ywz.whbzmc AS ywzName
							FROM
								cisp_dev.yc_substation s
								INNER JOIN base.tf_ywzbdz ywz
									ON ywz.whbz = s.maintenance_team
							WHERE 1 = 1');
			
			SET @sqlstr2=CONCAT(' GROUP BY ywzName,volName
								UNION
								ALL
								SELECT DISTINCT
									0 AS countrate,
									COUNT(DISTINCT s.ID) AS accessrate,
									s.voltagelevel AS volName, 
									s.voltagelevel_id AS volCode, 
									ywz.whbzmc AS ywzName
								FROM
									cisp_dev.yc_substation s
									INNER JOIN cisp_dev.v_all_dev d
										ON s.id = d.substation_id
									INNER JOIN base.tf_ywzbdz ywz
										ON ywz.zyid = s.id
								WHERE 1 = 1');
					 
			SET @sqlstr3=CONCAT(' GROUP BY ywzName,volName) a
						     GROUP BY ywzName,volName order by ywzName,volCode desc');
					 
			SET @sqlconcat='';
			-- 运维站信息
			IF ISNULL(ywzid)=FALSE AND LENGTH(ywzid)>0 THEN
				SET @ywzids=base.delimiterStr(ywzid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.maintenance_team in ',@ywzids);				 
			END IF;
			-- 电压等级信息
			IF ISNULL(volid)=FALSE AND LENGTH(volid)>0 THEN
				SET @volids=base.delimiterStr(volid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.voltagelevel_id in ',@volids,@notVolcode);	
			ELSE
				SET @sqlconcat=CONCAT(@sqlconcat,@notVolcode);
			END IF;
 			-- 局信息
			IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
				SET @allorgs=base.getInClause(org_no);		  
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);				 
			END IF; 		 
			SET @sqlstr=CONCAT(@sqlstr1,@sqlconcat,@sqlstr2,@sqlconcat,@sqlstr3);
		ELSE -- 有子局			
			SET @sqlstr1=CONCAT('SELECT	 
					a.org_name as unitName,
					replace(replace(a.volName,\'直流\',\'\'),\'交流\',\'\') as volName,
					cast(SUM(a.countrate) as char) AS countrate,
					cast(SUM(a.accessrate) as char) AS accessrate,
					cast(SUM(a.countrate) - SUM(a.accessrate) as char) AS noaccessrate
				FROM
					(SELECT
						org.org_no, org.org_name,org.order_no,
						s.voltagelevel AS volName,
						s.voltagelevel_id AS volCode,             
						COUNT(DISTINCT s.id) AS countrate,
						0 AS accessrate
					FROM
						cisp_dev.yc_substation s
						INNER JOIN cisp_platform.bp_org org
							ON org.org_no = s.depart
			  		WHERE 1=1');			
			SET @sqlstr2=CONCAT(' GROUP BY org.org_no,volName
					UNION
					ALL
					SELECT
						org.org_no, org.org_name, org.order_no,
						v.volName, 
						v.volCode,    
						0 AS countrate,
						SUM(v.accessrate) AS accessrate
					FROM
						(SELECT DISTINCT
							COUNT(DISTINCT s.id) AS accessrate,
							s.voltagelevel AS volName, 
							s.voltagelevel_id AS volCode,   
							s.DEPART
						FROM
							cisp_dev.yc_substation s
							LEFT JOIN cisp_dev.v_all_dev d
								ON s.id = d.substation_id
						WHERE d.ID IS NOT NULL');
			SET @sqlstr3=CONCAT(' GROUP BY s.DEPART,volName) AS v
						LEFT JOIN cisp_platform.bp_org org
							ON v.depart = org.org_no GROUP BY org.org_no,v.volName) a
				GROUP BY a.org_no,a.volName order by a.order_no,volCode desc');
			SET @sqlconcat='';
			-- 运维站信息
			IF ISNULL(ywzid)=FALSE AND LENGTH(ywzid)>0 THEN
				SET @ywzids=base.delimiterStr(ywzid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.maintenance_team in ',@ywzids);				 
			END IF;
			-- 电压等级信息
			IF ISNULL(volid)=FALSE AND LENGTH(volid)>0 THEN
				SET @volids=base.delimiterStr(volid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.voltagelevel_id in ',@volids,@notVolcode);	
			ELSE
				SET @sqlconcat=CONCAT(@sqlconcat,@notVolcode);
			END IF;				
			-- 局信息
			IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
				SET @allorgs=base.getInClause(org_no);		  
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);				 
			END IF;
 		-- select  @sqlstr1,@sqlstr2,@sqlstr3,@sqlstr4;
		SET @sqlstr=CONCAT(@sqlstr1,@sqlconcat,@sqlstr2,@sqlconcat,@sqlstr3);
		END IF;
	END IF;	

	-- 执行语句
	 -- SELECT @sqlstr;
	 SET @sql_mode=@@sql_mode;
	 SET @@sql_mode='';
	 PREPARE stmt FROM @sqlstr;
	 EXECUTE stmt;
	 SET @@sql_mode=@sql_mode;

END;




-- version 5.0	date:2018-12-29	reason:+使用总计 在代码中实现
DROP PROCEDURE IF EXISTS base.proc_substation_access_rate_ywzandvol; 
DELIMITER //
CREATE PROCEDURE base.proc_substation_access_rate_ywzandvol(IN org_no VARCHAR(50),IN ywzid TEXT,IN volid TEXT)
BEGIN
-- org_no 局信息
-- voltagelevel 电压等级
-- ywzid 运维站信息
	DECLARE group_org VARCHAR(1000);

	-- 地市局接入率	
	SELECT GROUP_CONCAT(org_no) INTO group_org FROM cisp_platform.bp_org bp_org WHERE bp_org.p_org_no=org_no;
	SET @notVolcode=CONCAT(' and s.voltagelevel_id not in (\'83\',\'22\',\'76\')');
	IF org_no='8a812897493378a001495677ad086663' THEN -- 省人员		 
		SET @sqlstr1=CONCAT('SELECT
						a.org_name as unitName, IF(
							a.volCode >= 35, \'500Kv及以上\', IF(
								a.volCode=34, \'330Kv\', IF(a.volCode =33, \'220Kv\', IF(a.volCode<=32, \'110Kv及以下\', \'\'))
							)
						) AS volName, SUM(a.countrate) AS countrate, SUM(a.accessrate) AS accessrate, SUM(a.countrate) - SUM(a.accessrate) AS noaccessrate
						FROM
						(SELECT
							sum1.org_name, org.volCode, SUM(org.countrate) AS countrate, 0 AS accessrate
						FROM
							(SELECT
								CASE
									sum1.p_org_no
									WHEN \'8a812897493378a001495677ad086663\'
									THEN \'1096FA0035D17535E05379FB31210000\'
									ELSE sum1.p_org_no
								END AS p_org_no, org.volCode, SUM(org.countrate) AS countrate
							FROM
								(SELECT
									org.org_no, org.org_name, s.voltagelevel AS volName,s.voltagelevel_id AS volCode,COUNT(DISTINCT s.id) AS countrate
								FROM
									cisp_dev.yc_substation s
									INNER JOIN base.bp_org_shortname org
										ON org.org_no = s.depart
								WHERE 1 = 1');				
		SET @sqlstr2=CONCAT('GROUP BY org.org_no, volCode) AS org
						INNER JOIN base.bp_org_shortname sum1
							ON org.org_no = sum1.org_no
					GROUP BY sum1.p_org_no, org.volCode) AS org
					INNER JOIN base.bp_org_shortname sum1
						ON org.p_org_no = sum1.org_no
				GROUP BY sum1.org_no, org.volCode
				UNION
				ALL
				SELECT
					sum1.org_name, org.volCode, 0 AS countrate, SUM(org.accessrate) AS accessrate
				FROM
					(SELECT
						CASE
							org.p_org_no
							WHEN \'8a812897493378a001495677ad086663\'
							THEN \'1096FA0035D17535E05379FB31210000\'
							ELSE org.p_org_no
						END AS p_org_no, v.volName, v.volCode, org.org_name, SUM(v.accessrate) AS accessrate
					FROM
						(SELECT DISTINCT
							COUNT(DISTINCT s.id) AS accessrate, s.DEPART, s.voltagelevel AS volName, s.voltagelevel_id AS volCode
						FROM
							cisp_dev.yc_substation s
							LEFT JOIN cisp_dev.v_all_dev d
								ON s.id = d.substation_id
						WHERE d.ID IS NOT NULL');
		SET @sqlstr3=CONCAT(' GROUP BY s.DEPART, volcode) AS v
							LEFT JOIN base.bp_org_shortname org
								ON v.depart = org.org_no
						GROUP BY org.p_org_no, v.volCode) AS org
						INNER JOIN base.bp_org_shortname sum1
							ON sum1.org_no = org.p_org_no
					GROUP BY sum1.org_no, org.volCode) a
					GROUP BY a.org_name, volName');
 	 	SET @sqlconcat='';	
			-- 运维站信息
			IF ISNULL(ywzid)=FALSE AND LENGTH(ywzid)>0 THEN
				SET @ywzids=base.delimiterStr(ywzid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.maintenance_team in ',@ywzids);				 
			END IF;
			-- 电压等级信息
			IF ISNULL(volid)=FALSE AND LENGTH(volid)>0 THEN
				SET @volids=base.delimiterStr(volid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.voltagelevel_id in ',@volids,@notVolcode);	
			ELSE
				SET @sqlconcat=CONCAT(@sqlconcat,@notVolcode);
			END IF;	
			-- 局信息
			IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
				SET @allorgs=base.getInClause(org_no);		  
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);				 
			END IF;
 		-- select  @sqlstr1,@sqlstr2,@sqlstr3,@sqlstr4;
		SET @sqlstr=CONCAT(@sqlstr1,@sqlconcat,@sqlstr2,@sqlconcat,@sqlstr3);
		 
	ELSE -- 其他人yuan
	
		IF ISNULL(group_org)=TRUE THEN  -- 没有子局OK
			SET @sqlstr1=CONCAT('SELECT
							a.ywzName as unitName,
							replace(replace(a.volName,\'直流\',\'\'),\'交流\',\'\') as volName,
							cast(SUM(a.countrate) as char) AS countrate,
							cast(SUM(a.accessrate) as char)  AS accessrate,
							cast(SUM(a.countrate) - SUM(a.accessrate) as char)  AS noaccessrate
						FROM
							(SELECT
								COUNT(DISTINCT s.id) AS countrate,
								0 AS accessrate,
								s.voltagelevel AS volName, 
								s.voltagelevel_id AS volCode,
								ywz.whbzmc AS ywzName
							FROM
								cisp_dev.yc_substation s
								INNER JOIN base.tf_ywzbdz ywz
									ON ywz.zyid = s.id
							WHERE 1 = 1');
			
			SET @sqlstr2=CONCAT(' GROUP BY ywzName,volName
								UNION
								ALL
								SELECT DISTINCT
									0 AS countrate,
									COUNT(DISTINCT s.ID) AS accessrate,
									s.voltagelevel AS volName, 
									s.voltagelevel_id AS volCode, 
									ywz.whbzmc AS ywzName
								FROM
									cisp_dev.yc_substation s
									INNER JOIN cisp_dev.v_all_dev d
										ON s.id = d.substation_id
									INNER JOIN base.tf_ywzbdz ywz
										ON ywz.zyid = s.id
								WHERE 1 = 1');
					 
			SET @sqlstr3=CONCAT(' GROUP BY ywzName,volName) a
						     GROUP BY ywzName,volName order by ywzName,volCode desc');
					 
			SET @sqlconcat='';
			-- 运维站信息
			IF ISNULL(ywzid)=FALSE AND LENGTH(ywzid)>0 THEN
				SET @ywzids=base.delimiterStr(ywzid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.maintenance_team in ',@ywzids);				 
			END IF;
			-- 电压等级信息
			IF ISNULL(volid)=FALSE AND LENGTH(volid)>0 THEN
				SET @volids=base.delimiterStr(volid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.voltagelevel_id in ',@volids,@notVolcode);	
			ELSE
				SET @sqlconcat=CONCAT(@sqlconcat,@notVolcode);
			END IF;
 			-- 局信息
			IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
				SET @allorgs=base.getInClause(org_no);		  
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);				 
			END IF; 		 
			SET @sqlstr=CONCAT(@sqlstr1,@sqlconcat,@sqlstr2,@sqlconcat,@sqlstr3);
		ELSE -- 有子局			
			SET @sqlstr1=CONCAT('SELECT	 
					a.org_name as unitName,
					replace(replace(a.volName,\'直流\',\'\'),\'交流\',\'\') as volName,
					cast(SUM(a.countrate) as char) AS countrate,
					cast(SUM(a.accessrate) as char) AS accessrate,
					cast(SUM(a.countrate) - SUM(a.accessrate) as char) AS noaccessrate
				FROM
					(SELECT
						org.org_no, org.org_name,
						s.voltagelevel AS volName,
						s.voltagelevel_id AS volCode,             
						COUNT(DISTINCT s.id) AS countrate,
						0 AS accessrate
					FROM
						cisp_dev.yc_substation s
						INNER JOIN cisp_platform.bp_org org
							ON org.org_no = s.depart
			  		WHERE 1=1');			
			SET @sqlstr2=CONCAT(' GROUP BY org.org_no,volName
					UNION
					ALL
					SELECT
						org.org_no, org.org_name, 
						v.volName, 
						v.volCode,    
						0 AS countrate,
						SUM(v.accessrate) AS accessrate
					FROM
						(SELECT DISTINCT
							COUNT(DISTINCT s.id) AS accessrate,
							s.voltagelevel AS volName, 
							s.voltagelevel_id AS volCode,   
							s.DEPART
						FROM
							cisp_dev.yc_substation s
							LEFT JOIN cisp_dev.v_all_dev d
								ON s.id = d.substation_id
						WHERE d.ID IS NOT NULL');
			SET @sqlstr3=CONCAT(' GROUP BY s.DEPART,volName) AS v
						LEFT JOIN cisp_platform.bp_org org
							ON v.depart = org.org_no GROUP BY org.org_no,v.volName) a
				GROUP BY a.org_no,a.volName order by a.org_no,volCode desc');
			SET @sqlconcat='';
			-- 运维站信息
			IF ISNULL(ywzid)=FALSE AND LENGTH(ywzid)>0 THEN
				SET @ywzids=base.delimiterStr(ywzid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.maintenance_team in ',@ywzids);				 
			END IF;
			-- 电压等级信息
			IF ISNULL(volid)=FALSE AND LENGTH(volid)>0 THEN
				SET @volids=base.delimiterStr(volid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.voltagelevel_id in ',@volids,@notVolcode);	
			ELSE
				SET @sqlconcat=CONCAT(@sqlconcat,@notVolcode);
			END IF;				
			-- 局信息
			IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
				SET @allorgs=base.getInClause(org_no);		  
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);				 
			END IF;
 		-- select  @sqlstr1,@sqlstr2,@sqlstr3,@sqlstr4;
		SET @sqlstr=CONCAT(@sqlstr1,@sqlconcat,@sqlstr2,@sqlconcat,@sqlstr3);
		END IF;
	END IF;	

	-- 执行语句
	 -- SELECT @sqlstr;
	 SET @sql_mode=@@sql_mode;
	 SET @@sql_mode='';
	 PREPARE stmt FROM @sqlstr;
	 EXECUTE stmt;
	 SET @@sql_mode=@sql_mode;

END;




-- version 4.0	date:2018-12-27	reason:+单位统一用unitName
-- version 3.0	date:2018-12-24	reason:+以电压等级排序(逆序) 隐藏到直流500k 直流35kV 直流10kV
DROP PROCEDURE IF EXISTS base.proc_substation_access_rate_ywzandvol; 
DELIMITER //
CREATE PROCEDURE base.proc_substation_access_rate_ywzandvol(IN org_no VARCHAR(50),IN ywzid TEXT,IN volid TEXT)
BEGIN
-- org_no 局信息
-- voltagelevel 电压等级
-- ywzid 运维站信息
	DECLARE group_org VARCHAR(1000);

	-- 地市局接入率	
	SELECT GROUP_CONCAT(org_no) INTO group_org FROM cisp_platform.bp_org bp_org WHERE bp_org.p_org_no=org_no;
	SET @notVolcode=CONCAT(' and s.voltagelevel_id not in (\'83\',\'22\',\'76\')');
	IF org_no='8a812897493378a001495677ad086663' THEN -- 省人员		 
		SET @sqlstr1=CONCAT('SELECT
						a.org_name as unitName, IF(
							a.volCode >= 35, \'500Kv及以上\', IF(
								a.volCode=34, \'330Kv\', IF(a.volCode =33, \'220Kv\', IF(a.volCode<=32, \'110Kv及以下\', \'\'))
							)
						) AS volName, SUM(a.countrate) AS countrate, SUM(a.accessrate) AS accessrate, SUM(a.countrate) - SUM(a.accessrate) AS noaccessrate
						FROM
						(SELECT
							sum1.org_name, org.volCode, SUM(org.countrate) AS countrate, 0 AS accessrate
						FROM
							(SELECT
								CASE
									sum1.p_org_no
									WHEN \'8a812897493378a001495677ad086663\'
									THEN \'1096FA0035D17535E05379FB31210000\'
									ELSE sum1.p_org_no
								END AS p_org_no, org.volCode, SUM(org.countrate) AS countrate
							FROM
								(SELECT
									org.org_no, org.org_name, s.voltagelevel AS volName,s.voltagelevel_id AS volCode,COUNT(DISTINCT s.id) AS countrate
								FROM
									cisp_dev.yc_substation s
									INNER JOIN base.bp_org_shortname org
										ON org.org_no = s.depart
								WHERE 1 = 1');				
		SET @sqlstr2=CONCAT('GROUP BY org.org_no, volCode) AS org
						INNER JOIN base.bp_org_shortname sum1
							ON org.org_no = sum1.org_no
					GROUP BY sum1.p_org_no, org.volCode) AS org
					INNER JOIN base.bp_org_shortname sum1
						ON org.p_org_no = sum1.org_no
				GROUP BY sum1.org_no, org.volCode
				UNION
				ALL
				SELECT
					sum1.org_name, org.volCode, 0 AS countrate, SUM(org.accessrate) AS accessrate
				FROM
					(SELECT
						CASE
							org.p_org_no
							WHEN \'8a812897493378a001495677ad086663\'
							THEN \'1096FA0035D17535E05379FB31210000\'
							ELSE org.p_org_no
						END AS p_org_no, v.volName, v.volCode, org.org_name, SUM(v.accessrate) AS accessrate
					FROM
						(SELECT DISTINCT
							COUNT(DISTINCT s.id) AS accessrate, s.DEPART, s.voltagelevel AS volName, s.voltagelevel_id AS volCode
						FROM
							cisp_dev.yc_substation s
							LEFT JOIN cisp_dev.v_all_dev d
								ON s.id = d.substation_id
						WHERE d.ID IS NOT NULL');
		SET @sqlstr3=CONCAT(' GROUP BY s.DEPART, volcode) AS v
							LEFT JOIN base.bp_org_shortname org
								ON v.depart = org.org_no
						GROUP BY org.p_org_no, v.volCode) AS org
						INNER JOIN base.bp_org_shortname sum1
							ON sum1.org_no = org.p_org_no
					GROUP BY sum1.org_no, org.volCode) a
					GROUP BY a.org_name, volName');
 	 	SET @sqlconcat='';	
			-- 运维站信息
			IF ISNULL(ywzid)=FALSE AND LENGTH(ywzid)>0 THEN
				SET @ywzids=base.delimiterStr(ywzid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.maintenance_team in ',@ywzids);				 
			END IF;
			-- 电压等级信息
			IF ISNULL(volid)=FALSE AND LENGTH(volid)>0 THEN
				SET @volids=base.delimiterStr(volid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.voltagelevel_id in ',@volids,@notVolcode);	
			ELSE
				SET @sqlconcat=CONCAT(@sqlconcat,@notVolcode);
			END IF;	
			-- 局信息
			IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
				SET @allorgs=base.getInClause(org_no);		  
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);				 
			END IF;
 		-- select  @sqlstr1,@sqlstr2,@sqlstr3,@sqlstr4;
		SET @sqlstr=CONCAT(@sqlstr1,@sqlconcat,@sqlstr2,@sqlconcat,@sqlstr3);
		 
	ELSE -- 其他人yuan
	
		IF ISNULL(group_org)=TRUE THEN  -- 没有子局OK
			SET @sqlstr1=CONCAT('SELECT
							a.ywzName as unitName,
							replace(replace(a.volName,\'直流\',\'\'),\'交流\',\'\') as volName,
							cast(SUM(a.countrate) as char) AS countrate,
							cast(SUM(a.accessrate) as char)  AS accessrate,
							cast(SUM(a.countrate) - SUM(a.accessrate) as char)  AS noaccessrate
						FROM
							(SELECT
								COUNT(DISTINCT s.id) AS countrate,
								0 AS accessrate,
								s.voltagelevel AS volName, 
								s.voltagelevel_id AS volCode,
								ywz.whbzmc AS ywzName
							FROM
								cisp_dev.yc_substation s
								INNER JOIN base.tf_ywzbdz ywz
									ON ywz.whbz = s.maintenance_team
							WHERE 1 = 1');
			
			SET @sqlstr2=CONCAT(' GROUP BY ywzName,volName
								UNION
								ALL
								SELECT DISTINCT
									0 AS countrate,
									COUNT(DISTINCT s.ID) AS accessrate,
									s.voltagelevel AS volName, 
									s.voltagelevel_id AS volCode, 
									ywz.whbzmc AS ywzName
								FROM
									cisp_dev.yc_substation s
									INNER JOIN cisp_dev.v_all_dev d
										ON s.id = d.substation_id
									INNER JOIN base.tf_ywzbdz ywz
										ON ywz.whbz = s.maintenance_team
								WHERE 1 = 1');
					 
			SET @sqlstr3=CONCAT(' GROUP BY ywzName,volName) a
						     GROUP BY ywzName,volName order by ywzName,volCode desc');
					 
			SET @sqlconcat='';
			-- 运维站信息
			IF ISNULL(ywzid)=FALSE AND LENGTH(ywzid)>0 THEN
				SET @ywzids=base.delimiterStr(ywzid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.maintenance_team in ',@ywzids);				 
			END IF;
			-- 电压等级信息
			IF ISNULL(volid)=FALSE AND LENGTH(volid)>0 THEN
				SET @volids=base.delimiterStr(volid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.voltagelevel_id in ',@volids,@notVolcode);	
			ELSE
				SET @sqlconcat=CONCAT(@sqlconcat,@notVolcode);
			END IF;
 			-- 局信息
			IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
				SET @allorgs=base.getInClause(org_no);		  
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);				 
			END IF; 		 
			SET @sqlstr=CONCAT(@sqlstr1,@sqlconcat,@sqlstr2,@sqlconcat,@sqlstr3);
		ELSE -- 有子局			
			SET @sqlstr1=CONCAT('SELECT	 
					a.org_name as unitName,
					replace(replace(a.volName,\'直流\',\'\'),\'交流\',\'\') as volName,
					cast(SUM(a.countrate) as char) AS countrate,
					cast(SUM(a.accessrate) as char) AS accessrate,
					cast(SUM(a.countrate) - SUM(a.accessrate) as char) AS noaccessrate
				FROM
					(SELECT
						org.org_no, org.org_name,
						s.voltagelevel AS volName,
						s.voltagelevel_id AS volCode,             
						COUNT(DISTINCT s.id) AS countrate,
						0 AS accessrate
					FROM
						cisp_dev.yc_substation s
						INNER JOIN cisp_platform.bp_org org
							ON org.org_no = s.depart
			  		WHERE 1=1');			
			SET @sqlstr2=CONCAT(' GROUP BY org.org_no,volName
					UNION
					ALL
					SELECT
						org.org_no, org.org_name, 
						v.volName, 
						v.volCode,    
						0 AS countrate,
						SUM(v.accessrate) AS accessrate
					FROM
						(SELECT DISTINCT
							COUNT(DISTINCT s.id) AS accessrate,
							s.voltagelevel AS volName, 
							s.voltagelevel_id AS volCode,   
							s.DEPART
						FROM
							cisp_dev.yc_substation s
							LEFT JOIN cisp_dev.v_all_dev d
								ON s.id = d.substation_id
						WHERE d.ID IS NOT NULL');
			SET @sqlstr3=CONCAT(' GROUP BY s.DEPART,volName) AS v
						LEFT JOIN cisp_platform.bp_org org
							ON v.depart = org.org_no GROUP BY org.org_no,v.volName) a
				GROUP BY a.org_no,a.volName with rollup order by a.org_no,volCode desc');
			SET @sqlconcat='';
			-- 运维站信息
			IF ISNULL(ywzid)=FALSE AND LENGTH(ywzid)>0 THEN
				SET @ywzids=base.delimiterStr(ywzid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.maintenance_team in ',@ywzids);				 
			END IF;
			-- 电压等级信息
			IF ISNULL(volid)=FALSE AND LENGTH(volid)>0 THEN
				SET @volids=base.delimiterStr(volid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.voltagelevel_id in ',@volids,@notVolcode);	
			ELSE
				SET @sqlconcat=CONCAT(@sqlconcat,@notVolcode);
			END IF;				
			-- 局信息
			IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
				SET @allorgs=base.getInClause(org_no);		  
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);				 
			END IF;
 		-- select  @sqlstr1,@sqlstr2,@sqlstr3,@sqlstr4;
		SET @sqlstr=CONCAT(@sqlstr1,@sqlconcat,@sqlstr2,@sqlconcat,@sqlstr3);
		END IF;
	END IF;	

	-- 执行语句
	 -- SELECT @sqlstr;
	 SET @sql_mode=@@sql_mode;
	 SET @@sql_mode='';
	 PREPARE stmt FROM @sqlstr;
	 EXECUTE stmt;
	 SET @@sql_mode=@sql_mode;

END;



SELECT * FROM cisp_dev.yc_substation WHERE voltagelevel LIKE '%500%'

-- version 2.0	date:2018-12-05	reason:以单位名称和电压等级分组,电压等级分为500Kv及以上 220Kv 110Kv及以下
DROP PROCEDURE IF EXISTS base.proc_substation_access_rate_ywzandvol; 
DELIMITER //
CREATE PROCEDURE base.proc_substation_access_rate_ywzandvol(IN org_no VARCHAR(50),IN ywzid TEXT,IN volid TEXT)
BEGIN
-- org_no 局信息
-- voltagelevel 电压等级
-- ywzid 运维站信息
	DECLARE group_org VARCHAR(1000);

	-- 地市局接入率	
	SELECT GROUP_CONCAT(org_no) INTO group_org FROM cisp_platform.bp_org bp_org WHERE bp_org.p_org_no=org_no;
	
	IF org_no='8a812897493378a001495677ad086663' THEN -- 省人员		 
		SET @sqlstr1=CONCAT('SELECT
						a.org_name, IF(
							a.volCode >= 35, \'500Kv及以上\', IF(
								a.volCode=34, \'330Kv\', IF(a.volCode =33, \'220Kv\', IF(a.volCode<=32, \'110Kv及以下\', \'\'))
							)
						) AS volName, SUM(a.countrate) AS countrate, SUM(a.accessrate) AS accessrate, SUM(a.countrate) - SUM(a.accessrate) AS noaccessrate
						FROM
						(SELECT
							sum1.org_name, org.volCode, SUM(org.countrate) AS countrate, 0 AS accessrate
						FROM
							(SELECT
								CASE
									sum1.p_org_no
									WHEN \'8a812897493378a001495677ad086663\'
									THEN \'1096FA0035D17535E05379FB31210000\'
									ELSE sum1.p_org_no
								END AS p_org_no, org.volCode, SUM(org.countrate) AS countrate
							FROM
								(SELECT
									org.org_no, org.org_name, s.voltagelevel AS volName,s.voltagelevel_id AS volCode,COUNT(DISTINCT s.id) AS countrate
								FROM
									cisp_dev.yc_substation s
									INNER JOIN base.bp_org_shortname org
										ON org.org_no = s.depart
								WHERE 1 = 1');				
		SET @sqlstr2=CONCAT('GROUP BY org.org_no, volCode) AS org
						INNER JOIN base.bp_org_shortname sum1
							ON org.org_no = sum1.org_no
					GROUP BY sum1.p_org_no, org.volCode) AS org
					INNER JOIN base.bp_org_shortname sum1
						ON org.p_org_no = sum1.org_no
				GROUP BY sum1.org_no, org.volCode
				UNION
				ALL
				SELECT
					sum1.org_name, org.volCode, 0 AS countrate, SUM(org.accessrate) AS accessrate
				FROM
					(SELECT
						CASE
							org.p_org_no
							WHEN \'8a812897493378a001495677ad086663\'
							THEN \'1096FA0035D17535E05379FB31210000\'
							ELSE org.p_org_no
						END AS p_org_no, v.volName, v.volCode, org.org_name, SUM(v.accessrate) AS accessrate
					FROM
						(SELECT DISTINCT
							COUNT(DISTINCT s.id) AS accessrate, s.DEPART, s.voltagelevel AS volName, s.voltagelevel_id AS volCode
						FROM
							cisp_dev.yc_substation s
							LEFT JOIN cisp_dev.v_all_dev d
								ON s.id = d.substation_id
						WHERE d.ID IS NOT NULL');
		SET @sqlstr3=CONCAT(' GROUP BY s.DEPART, volcode) AS v
							LEFT JOIN base.bp_org_shortname org
								ON v.depart = org.org_no
						GROUP BY org.p_org_no, v.volCode) AS org
						INNER JOIN base.bp_org_shortname sum1
							ON sum1.org_no = org.p_org_no
					GROUP BY sum1.org_no, org.volCode) a
					GROUP BY a.org_name, volName');
 	 	SET @sqlconcat='';	
			-- 运维站信息
			IF ISNULL(ywzid)=FALSE AND LENGTH(ywzid)>0 THEN
				SET @ywzids=base.delimiterStr(ywzid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.maintenance_team in ',@ywzids);				 
			END IF;
			-- 电压等级信息
			IF ISNULL(volid)=FALSE AND LENGTH(volid)>0 THEN
				SET @volids=base.delimiterStr(volid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.voltagelevel_id in ',@volids);				 
			END IF;	
			-- 局信息
			IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
				SET @allorgs=base.getInClause(org_no);		  
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);				 
			END IF;
 		-- select  @sqlstr1,@sqlstr2,@sqlstr3,@sqlstr4;
		SET @sqlstr=CONCAT(@sqlstr1,@sqlconcat,@sqlstr2,@sqlconcat,@sqlstr3);
		 
	ELSE -- 其他人yuan
	
		IF ISNULL(group_org)=TRUE THEN  -- 没有子局OK
			SET @sqlstr1=CONCAT('SELECT
							a.ywzName,
							replace(replace(a.volName,\'直流\',\'\'),\'交流\',\'\') as volName,
							cast(SUM(a.countrate) as char) AS countrate,
							cast(SUM(a.accessrate) as char)  AS accessrate,
							cast(SUM(a.countrate) - SUM(a.accessrate) as char)  AS noaccessrate
						FROM
							(SELECT
								COUNT(DISTINCT s.id) AS countrate,
								0 AS accessrate,
								s.voltagelevel AS volName, 
								ywz.whbzmc AS ywzName
							FROM
								cisp_dev.yc_substation s
								INNER JOIN base.tf_ywzbdz ywz
									ON ywz.whbz = s.maintenance_team
							WHERE 1 = 1');
			
			SET @sqlstr2=CONCAT(' GROUP BY ywzName,volName
								UNION
								ALL
								SELECT DISTINCT
									0 AS countrate,
									COUNT(DISTINCT s.ID) AS accessrate,
									s.voltagelevel AS volName, 
									ywz.whbzmc AS ywzName
								FROM
									cisp_dev.yc_substation s
									INNER JOIN cisp_dev.v_all_dev d
										ON s.id = d.substation_id
									INNER JOIN base.tf_ywzbdz ywz
										ON ywz.whbz = s.maintenance_team
								WHERE 1 = 1');
					 
			SET @sqlstr3=CONCAT(' GROUP BY ywzName,volName) a
						     GROUP BY ywzName,volName');
					 
			SET @sqlconcat='';
			-- 运维站信息
			IF ISNULL(ywzid)=FALSE AND LENGTH(ywzid)>0 THEN
				SET @ywzids=base.delimiterStr(ywzid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.maintenance_team in ',@ywzids);				 
			END IF;
			-- 电压等级信息
			IF ISNULL(volid)=FALSE AND LENGTH(volid)>0 THEN
				SET @volids=base.delimiterStr(volid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.voltagelevel_id in ',@volids);				 
			END IF;	
			-- 局信息
			IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
				SET @allorgs=base.getInClause(org_no);		  
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);				 
			END IF; 		 
			SET @sqlstr=CONCAT(@sqlstr1,@sqlconcat,@sqlstr2,@sqlconcat,@sqlstr3);
		ELSE -- 有子局			
			SET @sqlstr1=CONCAT('SELECT	 
					a.org_name,
					replace(replace(a.volName,\'直流\',\'\'),\'交流\',\'\') as volName,
					cast(SUM(a.countrate) as char) AS countrate,
					cast(SUM(a.accessrate) as char) AS accessrate,
					cast(SUM(a.countrate) - SUM(a.accessrate) as char) AS noaccessrate
				FROM
					(SELECT
						org.org_no, org.org_name,
						s.voltagelevel AS volName,            
						COUNT(DISTINCT s.id) AS countrate,
						0 AS accessrate
					FROM
						cisp_dev.yc_substation s
						INNER JOIN cisp_platform.bp_org org
							ON org.org_no = s.depart
			  		WHERE 1=1');			
			SET @sqlstr2=CONCAT(' GROUP BY org.org_no,volName
					UNION
					ALL
					SELECT
						org.org_no, org.org_name, 
						v.volName,   
						0 AS countrate,
						SUM(v.accessrate) AS accessrate
					FROM
						(SELECT DISTINCT
							COUNT(DISTINCT s.id) AS accessrate,
							s.voltagelevel AS volName,   
							s.DEPART
						FROM
							cisp_dev.yc_substation s
							LEFT JOIN cisp_dev.v_all_dev d
								ON s.id = d.substation_id
						WHERE d.ID IS NOT NULL');
			SET @sqlstr3=CONCAT(' GROUP BY s.DEPART,volName) AS v
						LEFT JOIN cisp_platform.bp_org org
							ON v.depart = org.org_no GROUP BY org.org_no,v.volName) a
				GROUP BY a.org_no,a.volName');
			SET @sqlconcat='';
			-- 运维站信息
			IF ISNULL(ywzid)=FALSE AND LENGTH(ywzid)>0 THEN
				SET @ywzids=base.delimiterStr(ywzid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.maintenance_team in ',@ywzids);				 
			END IF;
			-- 电压等级信息
			IF ISNULL(volid)=FALSE AND LENGTH(volid)>0 THEN
				SET @volids=base.delimiterStr(volid,',');
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.voltagelevel_id in ',@volids);				 
			END IF;	
			-- 局信息
			IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
				SET @allorgs=base.getInClause(org_no);		  
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);				 
			END IF;
 		-- select  @sqlstr1,@sqlstr2,@sqlstr3,@sqlstr4;
		SET @sqlstr=CONCAT(@sqlstr1,@sqlconcat,@sqlstr2,@sqlconcat,@sqlstr3);
		END IF;
	END IF;	

	-- 执行语句
	 -- SELECT @sqlstr;
	 SET @sql_mode=@@sql_mode;
	 SET @@sql_mode='';
	 PREPARE stmt FROM @sqlstr;
	 EXECUTE stmt;
	 SET @@sql_mode=@sql_mode;

END;
