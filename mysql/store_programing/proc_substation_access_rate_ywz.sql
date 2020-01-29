
BEGIN # test
CALL base.proc_substation_access_rate_ywz('1096FA0035D17535E05379FB31510001',NULL,'33,32,34');


CALL base.proc_substation_access_rate_ywz('1096FA0035D17535E05379FB31510001',NULL,'33,32,34');
CALL base.proc_substation_access_rate_ywz('1096FA0035D17535E05379FB31510001',NULL,'');

CALL base.proc_substation_access_rate_ywz('1096FA0035D17535E05379FB31000001',NULL,'33,32,34');
CALL base.proc_substation_access_rate_ywz('1096FA0035D17535E05379FB31000001','','');

CALL base.proc_substation_access_rate_ywz('1096FA0035D17535E05379FB31000001','1096FA0035D17535E05379FB31000496','');

CALL base.proc_substation_access_rate_ywz('8a812897493378a001495677ad086663','','33,32,34');
CALL base.proc_substation_access_rate_ywz('8a812897493378a001495677ad086663','','');

SELECT * FROM base.vf_dev_search

SELECT * FROM cisp_platform.bp_org WHERE org_name LIKE '%检%'

END 

SELECT * FROM cisp_dev.yc_substation WHERE VOLTAGELEVEL LIKE '%直流35%'
SELECT * FROM cisp_dev.yc_substation WHERE VOLTAGELEVEL_id LIKE '%22%'

-- version 4.0	date:2019-01-07	reason:+排序
DROP PROCEDURE IF EXISTS base.proc_substation_access_rate_ywz; 
DELIMITER //
CREATE PROCEDURE base.proc_substation_access_rate_ywz(IN org_no VARCHAR(50),IN ywzid TEXT,IN volid TEXT)
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
						a.org_name, SUM(a.countrate) AS countrate, SUM(a.accessrate) AS accessrate, SUM(a.countrate) - SUM(a.accessrate) AS noaccessrate
						FROM
						(SELECT
							sum1.org_name, org.volName, SUM(org.countrate) AS countrate, 0 AS accessrate,org.volCode
						FROM
							(SELECT
								CASE
									sum1.p_org_no
									WHEN \'8a812897493378a001495677ad086663\'
									THEN \'1096FA0035D17535E05379FB31210000\'
									ELSE sum1.p_org_no
								END AS p_org_no, org.volName, SUM(org.countrate) AS countrate,volCode
							FROM
								(SELECT
									s.depart as org_no, s.voltagelevel AS volName,s.voltagelevel_id AS volCode,COUNT(DISTINCT s.id) AS countrate
								FROM
									cisp_dev.yc_substation s
								INNER JOIN base.tf_ywzbdz ywz
									ON s.id=ywz.zyid 
								WHERE 1 = 1');				
		SET @sqlstr2=CONCAT('GROUP BY org_no, volCode) AS org
						INNER JOIN base.bp_org_shortname sum1
							ON org.org_no = sum1.org_no
					GROUP BY sum1.p_org_no, org.volCode) AS org
					INNER JOIN base.bp_org_shortname sum1
						ON org.p_org_no = sum1.org_no
				GROUP BY sum1.org_no, org.volName
				UNION
				ALL
				SELECT
					sum1.org_name, org.volName, 0 AS countrate, SUM(org.accessrate) AS accessrate,org.volCode
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
							COUNT(DISTINCT dev.stationid) AS accessrate, dev.org_no, dev.volname AS volName, dev.volcode AS volCode
							FROM
							base.tf_ywz_bdz_vol_device dev where 1=1 ');
		SET @sqlstr3=CONCAT(' GROUP BY org_no, volCode) AS v
							LEFT JOIN base.bp_org_shortname org
								ON v.org_no = org.org_no
						GROUP BY org.p_org_no, v.volCode) AS org
						INNER JOIN base.bp_org_shortname sum1
							ON sum1.org_no = org.p_org_no
					GROUP BY sum1.org_no, org.volCode) a left join base.bp_org_shortname org on a.org_name=org.org_name
					GROUP BY a.org_name order by org.order_no');
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
							a.ywzName as org_name,
							SUM(a.countrate) AS countrate,
							SUM(a.accessrate) AS accessrate,
							SUM(a.countrate) - SUM(a.accessrate) AS noaccessrate
						FROM
							(SELECT
								ywz.whbzmc AS ywzName,
								COUNT(DISTINCT s.id) AS countrate,
								0 AS accessrate
							FROM
								cisp_dev.yc_substation s
								INNER JOIN base.tf_ywzbdz ywz
									ON ywz.zyid = s.id
							WHERE 1 = 1');
										
			SET @sqlstr2=CONCAT(' GROUP BY ywzName
								UNION ALL
								SELECT
									dev.ywzname AS ywzName,
									0 AS countrate,
									COUNT(DISTINCT dev.stationid) AS accessrate
								FROM
									base.tf_ywz_bdz_vol_device dev
								WHERE 1 = 1');
					 
			SET @sqlstr3=CONCAT(' GROUP BY ywzName) a
							GROUP BY a.ywzName
							ORDER BY a.ywzName');
					 
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
					org.org_name,
					SUM(a.countrate) AS countrate,
					SUM(a.accessrate) AS accessrate,
					SUM(a.countrate) - SUM(a.accessrate) AS noaccessrate
				FROM
					(SELECT
						s.depart AS org_no,          
						COUNT(DISTINCT s.id) AS countrate,
						0 AS accessrate
					FROM
						cisp_dev.yc_substation s
						INNER JOIN base.tf_ywzbdz ywz
							ON s.id = ywz.zyid
					WHERE 1 = 1 ');			
			SET @sqlstr2=CONCAT(' GROUP BY s.depart 
					UNION
					ALL
					SELECT 
						dev.org_no,
						0 AS countrate,
						COUNT(DISTINCT dev.stationid) AS accessrate
					FROM
						base.tf_ywz_bdz_vol_device dev
					WHERE 1 = 1 ');
			SET @sqlstr3=CONCAT(' GROUP BY dev.org_no) AS a
					LEFT JOIN base.bp_org_shortname org
						ON a.org_no=org.org_no
					GROUP BY a.org_no ORDER BY org.order_no');
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
	 SET @sql_mode=@@sql_mode;
	 SET @@sql_mode='';
	 PREPARE stmt FROM @sqlstr;
	 EXECUTE stmt;
	 SET @@sql_mode=@sql_mode;
	 DEALLOCATE PREPARE stmt;
END;


 

-- version 3.0	date:2019-01-07	reason:+排序
DROP PROCEDURE IF EXISTS base.proc_substation_access_rate_ywz; 
DELIMITER //
CREATE PROCEDURE base.proc_substation_access_rate_ywz(IN org_no VARCHAR(50),IN ywzid TEXT,IN volid TEXT)
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
						a.org_name, SUM(a.countrate) AS countrate, SUM(a.accessrate) AS accessrate, SUM(a.countrate) - SUM(a.accessrate) AS noaccessrate
						FROM
						(SELECT
							sum1.org_name, org.volName, SUM(org.countrate) AS countrate, 0 AS accessrate,org.volCode
						FROM
							(SELECT
								CASE
									sum1.p_org_no
									WHEN \'8a812897493378a001495677ad086663\'
									THEN \'1096FA0035D17535E05379FB31210000\'
									ELSE sum1.p_org_no
								END AS p_org_no, org.volName, SUM(org.countrate) AS countrate,volCode
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
		SET @sqlstr2=CONCAT('GROUP BY org.org_no, volName) AS org
						INNER JOIN base.bp_org_shortname sum1
							ON org.org_no = sum1.org_no
					GROUP BY sum1.p_org_no, org.volCode) AS org
					INNER JOIN base.bp_org_shortname sum1
						ON org.p_org_no = sum1.org_no
				GROUP BY sum1.org_no, org.volName
				UNION
				ALL
				SELECT
					sum1.org_name, org.volName, 0 AS countrate, SUM(org.accessrate) AS accessrate,org.volCode
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
		SET @sqlstr3=CONCAT(' GROUP BY s.DEPART, volCode) AS v
							LEFT JOIN base.bp_org_shortname org
								ON v.depart = org.org_no
						GROUP BY org.p_org_no, v.volCode) AS org
						INNER JOIN base.bp_org_shortname sum1
							ON sum1.org_no = org.p_org_no
					GROUP BY sum1.org_no, org.volCode) a left join base.bp_org_shortname org on a.org_name=org.org_name
					GROUP BY a.org_name order by org.order_no');
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
							a.ywzName as org_name,
							SUM(a.countrate) AS countrate,
							SUM(a.accessrate) AS accessrate,
							SUM(a.countrate) - SUM(a.accessrate) AS noaccessrate
						FROM
							(SELECT
								ywz.whbzmc AS ywzName,
								COUNT(DISTINCT s.id) AS countrate,
								0 AS accessrate
							FROM
								cisp_dev.yc_substation s
								INNER JOIN base.tf_ywzbdz ywz
									ON ywz.zyid = s.id
							WHERE 1 = 1');
										
			SET @sqlstr2=CONCAT(' GROUP BY ywzName
								UNION ALL
								SELECT
									dev.ywzname AS ywzName,
									0 AS countrate,
									COUNT(DISTINCT dev.stationid) AS accessrate
								FROM
									base.tf_ywz_bdz_vol_device dev
								WHERE 1 = 1');
					 
			SET @sqlstr3=CONCAT(' GROUP BY ywzName) a
							GROUP BY a.ywzName
							ORDER BY a.ywzName');
					 
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
					org.org_name,
					SUM(a.countrate) AS countrate,
					SUM(a.accessrate) AS accessrate,
					SUM(a.countrate) - SUM(a.accessrate) AS noaccessrate
				FROM
					(SELECT
						s.depart AS org_no,          
						COUNT(DISTINCT s.id) AS countrate,
						0 AS accessrate
					FROM
						cisp_dev.yc_substation s
						INNER JOIN base.tf_ywzbdz ywz
							ON s.id = ywz.zyid
					WHERE 1 = 1 ');			
			SET @sqlstr2=CONCAT(' GROUP BY s.depart 
					UNION
					ALL
					SELECT 
						dev.org_no,
						0 AS countrate,
						COUNT(DISTINCT dev.stationid) AS accessrate
					FROM
						base.tf_ywz_bdz_vol_device dev
					WHERE 1 = 1 ');
			SET @sqlstr3=CONCAT(' GROUP BY dev.org_no) AS a
					LEFT JOIN base.bp_org_shortname org
						ON a.org_no=org.org_no
					GROUP BY a.org_no ORDER BY org.order_no');
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
	 SET @sql_mode=@@sql_mode;
	 SET @@sql_mode='';
	 PREPARE stmt FROM @sqlstr;
	 EXECUTE stmt;
	 SET @@sql_mode=@sql_mode;
	 DEALLOCATE PREPARE stmt;
END;




-- version 2.0	date:2018-12-05	reason:以单位名称和电压等级分组,电压等级不分为500Kv及以上 220Kv 110Kv及以下，按获得的数据分组
DROP PROCEDURE IF EXISTS base.proc_substation_access_rate_ywz; 
DELIMITER //
CREATE PROCEDURE base.proc_substation_access_rate_ywz(IN org_no VARCHAR(50),IN ywzid TEXT,IN volid TEXT)
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
						a.org_name, SUM(a.countrate) AS countrate, SUM(a.accessrate) AS accessrate, SUM(a.countrate) - SUM(a.accessrate) AS noaccessrate
						FROM
						(SELECT
							sum1.org_name, org.volName, SUM(org.countrate) AS countrate, 0 AS accessrate,org.volCode
						FROM
							(SELECT
								CASE
									sum1.p_org_no
									WHEN \'8a812897493378a001495677ad086663\'
									THEN \'1096FA0035D17535E05379FB31210000\'
									ELSE sum1.p_org_no
								END AS p_org_no, org.volName, SUM(org.countrate) AS countrate,volCode
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
		SET @sqlstr2=CONCAT('GROUP BY org.org_no, volName) AS org
						INNER JOIN base.bp_org_shortname sum1
							ON org.org_no = sum1.org_no
					GROUP BY sum1.p_org_no, org.volCode) AS org
					INNER JOIN base.bp_org_shortname sum1
						ON org.p_org_no = sum1.org_no
				GROUP BY sum1.org_no, org.volName
				UNION
				ALL
				SELECT
					sum1.org_name, org.volName, 0 AS countrate, SUM(org.accessrate) AS accessrate,org.volCode
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
		SET @sqlstr3=CONCAT(' GROUP BY s.DEPART, volCode) AS v
							LEFT JOIN base.bp_org_shortname org
								ON v.depart = org.org_no
						GROUP BY org.p_org_no, v.volCode) AS org
						INNER JOIN base.bp_org_shortname sum1
							ON sum1.org_no = org.p_org_no
					GROUP BY sum1.org_no, org.volCode) a left join base.bp_org_shortname org on a.org_name=org.org_name
					GROUP BY a.org_name order by org.order_no');
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
							a.ywzName as org_name,
							SUM(a.countrate) AS countrate,
							SUM(a.accessrate) AS accessrate,
							SUM(a.countrate) - SUM(a.accessrate) AS noaccessrate
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
			
			SET @sqlstr2=CONCAT(' GROUP BY ywzName,volCode
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
						     GROUP BY ywzName order by countrate desc');
					 
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
					a.org_name,
					SUM(a.countrate) AS countrate,
					SUM(a.accessrate) AS accessrate,
					SUM(a.countrate) - SUM(a.accessrate) AS noaccessrate
				FROM
					(SELECT
						org.org_no, org.org_name,
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
			  		WHERE 1=1 ');			
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
						LEFT JOIN base.bp_org_shortname org
							ON v.depart = org.org_no GROUP BY org.org_no,v.volName) a
				GROUP BY a.org_no order by countrate desc');
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


-- version 1.0	date:2018-12-05
DROP PROCEDURE IF EXISTS base.proc_substation_access_rate_ywz; 
DELIMITER //
CREATE PROCEDURE base.proc_substation_access_rate_ywz(IN org_no VARCHAR(50),IN ywzid TEXT,IN volid TEXT)
BEGIN
-- org_no 局信息
-- voltagelevel 电压等级
-- ywzid 运维站信息
	DECLARE group_org VARCHAR(1000);

	-- 地市局接入率	
	SELECT GROUP_CONCAT(org_no) INTO group_org FROM cisp_platform.bp_org bp_org WHERE bp_org.p_org_no=org_no;
	
	IF org_no='8a812897493378a001495677ad086663' THEN -- 省人员		 
		SET @sqlstr1=CONCAT('SELECT
						a.org_name, SUM(a.countrate) AS countrate, SUM(a.accessrate) AS accessrate, SUM(a.countrate) - SUM(a.accessrate) AS noaccessrate
						FROM
						(SELECT
							sum1.org_name, SUM(org.countrate) AS countrate, 0 AS accessrate
						FROM
							(SELECT
								CASE
									sum1.p_org_no
									WHEN \'8a812897493378a001495677ad086663\'
									THEN \'1096FA0035D17535E05379FB31210000\'
									ELSE sum1.p_org_no
								END AS p_org_no, SUM(org.countrate) AS countrate
							FROM
								(SELECT
									org.org_no, org.org_name, COUNT(DISTINCT s.id) AS countrate
								FROM
									cisp_dev.yc_substation s
									INNER JOIN base.bp_org_shortname org
										ON org.org_no = s.depart
								WHERE 1 = 1');				
		SET @sqlstr2=CONCAT(' GROUP BY org.org_no) AS org
							INNER JOIN base.bp_org_shortname sum1
								ON org.org_no = sum1.org_no
						GROUP BY sum1.p_org_no) AS org
						INNER JOIN base.bp_org_shortname sum1
							ON org.p_org_no = sum1.org_no
					GROUP BY sum1.org_no
					UNION
					ALL -- 接入率
						SELECT
						sum1.org_name, 0 AS countrate, SUM(org.accessrate) AS accessrate
					FROM
						(SELECT
							CASE
								org.p_org_no
								WHEN \'8a812897493378a001495677ad086663\'
								THEN \'1096FA0035D17535E05379FB31210000\'
								ELSE org.p_org_no
							END AS p_org_no, org.org_name, SUM(v.accessrate) AS accessrate
						FROM
							(SELECT DISTINCT
								COUNT(DISTINCT s.id) AS accessrate, s.DEPART
							FROM
								cisp_dev.yc_substation s
								LEFT JOIN cisp_dev.v_all_dev d
									ON s.id = d.substation_id
							WHERE d.ID IS NOT NULL');
		SET @sqlstr3=CONCAT(' GROUP BY s.DEPART) AS v
						LEFT JOIN base.bp_org_shortname org
							ON v.depart = org.org_no
					GROUP BY org.p_org_no) AS org
					INNER JOIN base.bp_org_shortname sum1
						ON sum1.org_no = org.p_org_no
				GROUP BY sum1.org_no) a
				GROUP BY a.org_name order by a.org_name ');
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
							SUM(a.countrate) AS countrate,
							SUM(a.accessrate) AS accessrate,
							SUM(a.countrate) - SUM(a.accessrate) AS noaccessrate
						FROM
							(SELECT
								COUNT(DISTINCT s.id) AS countrate,
								0 AS accessrate,
								ywz.whbzmc AS ywzName
							FROM
								cisp_dev.yc_substation s
								INNER JOIN base.tf_ywzbdz ywz
									ON ywz.whbz = s.maintenance_team
							WHERE 1 = 1');
			
			SET @sqlstr2=CONCAT(' GROUP BY ywzName
								UNION
								ALL
								SELECT DISTINCT
									0 AS countrate,
									COUNT(DISTINCT s.ID) AS accessrate,
									ywz.whbzmc AS ywzName
								FROM
									cisp_dev.yc_substation s
									INNER JOIN cisp_dev.v_all_dev d
										ON s.id = d.substation_id
									INNER JOIN base.tf_ywzbdz ywz
										ON ywz.whbz = s.maintenance_team
								WHERE 1 = 1');
					 
			SET @sqlstr3=CONCAT(' GROUP BY ywzName) a
						     GROUP BY ywzName');
					 
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
					SUM(a.countrate) AS countrate,
					SUM(a.accessrate) AS accessrate,
					SUM(a.countrate) - SUM(a.accessrate) AS noaccessrate
				FROM
					(SELECT
						org.org_no, org.org_name,           
						COUNT(DISTINCT s.id) AS countrate,
						0 AS accessrate
					FROM
						cisp_dev.yc_substation s
						INNER JOIN base.bp_org_shortname org
							ON org.org_no = s.depart
			  		WHERE 1=1');			
			SET @sqlstr2=CONCAT(' GROUP BY org.org_no
					UNION
					ALL
					SELECT
						org.org_no, org.org_name,   
						0 AS countrate,
						SUM(v.accessrate) AS accessrate
					FROM
						(SELECT DISTINCT
							COUNT(DISTINCT s.id) AS accessrate,
							s.DEPART
						FROM
							cisp_dev.yc_substation s
							LEFT JOIN cisp_dev.v_all_dev d
								ON s.id = d.substation_id
						WHERE d.ID IS NOT NULL');
			SET @sqlstr3=CONCAT(' GROUP BY s.DEPART) AS v
						LEFT JOIN base.bp_org_shortname org
							ON v.depart = org.org_no   GROUP BY org.org_no) a
				GROUP BY a.org_no');
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
	--  SELECT @sqlstr;
	 SET @sql_mode=@@sql_mode;
	 SET @@sql_mode='';
	 PREPARE stmt FROM @sqlstr;
	 EXECUTE stmt;
	 SET @@sql_mode=@sql_mode;

END;



