-- 存储过程
DROP PROCEDURE IF EXISTS base.proc_substation_access_rate;
DELIMITER //
CREATE PROCEDURE base.proc_substation_access_rate(IN org_no CHAR(40),IN voltagelevel BOOL)
BEGIN
	/*
	org_name 是短名称
	org_no 局信息
	voltagelevel 电压等级
	变电站下有辅控设备就算接入，没有就不算
	1. org_no 不为空，voltagelevel为false,则为地市局接入率
	2. org_no不为空，voltagelevel是true为，电压等级分类的变电站接入率
	*/
-- DECLARE allorgs TEXT;
DECLARE group_org MEDIUMTEXT;
IF voltagelevel=FALSE THEN
	-- 地市局接入率	
	SELECT GROUP_CONCAT(org_no) INTO group_org FROM cisp_platform.bp_org bp_org WHERE bp_org.p_org_no=org_no;
	
	IF org_no='8a812897493378a001495677ad086663' THEN -- 省人员
		SET @sqlstr1=CONCAT('SELECT	 
					a.org_name,
					SUM(a.countrate) AS countrate,
					SUM(a.accessrate) AS accessrate,
					SUM(a.countrate) - SUM(a.accessrate) AS noaccessrate
				FROM
					(SELECT
						org.p_org_no, org.org_name,           
						COUNT(DISTINCT s.id) AS countrate,
						0 AS accessrate
					FROM
						cisp_dev.yc_substation s
						INNER JOIN base.bp_org_shortname org
							ON org.org_no = s.depart
			  		WHERE 1=1');				
		SET @sqlstr2=CONCAT(' GROUP BY org.p_org_no
					UNION
					ALL
					SELECT
						org.p_org_no, org.org_name,   
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
							ON v.depart = org.org_no   GROUP BY org.p_org_no) a
				GROUP BY a.p_org_no');
 	 	SET @sqlconcat='';			 
		-- 局信息
		IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
			SET @allorgs=base.getInClause(org_no);		  
			SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);				 
		END IF; 		 
		SET @sqlstr=CONCAT(@sqlstr1,@sqlconcat,@sqlstr2,@sqlconcat,@sqlstr3);
		SELECT @sqlstr;
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
			-- 局信息
			IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
				SET @allorgs=base.getInClause(org_no);		  
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);				 
			END IF;
			SET @sqlstr=CONCAT(@sqlstr1,@sqlconcat,@sqlstr2,@sqlconcat,@sqlstr3);			 
		END IF;	
	END IF;
ELSEIF voltagelevel=TRUE THEN
	-- 电压等级接入率
	SET @sqlstr1=CONCAT('SELECT a.volName,SUM(a.countrate) AS countrate,SUM(a.accessrate) AS accessrate,(SUM(a.countrate)-SUM(a.accessrate)) AS noaccessrate FROM
				(SELECT
					0 AS countrate,
					COUNT(DISTINCT s.ID) AS accessrate,
					s.voltagelevel AS volName,
					s.voltagelevel_id AS volCode
				FROM
					cisp_dev.yc_substation s
					LEFT JOIN cisp_dev.v_all_dev d
							ON s.id = d.substation_id
				WHERE d.ID IS NOT NULL');
	SET @sqlstr2=CONCAT('GROUP BY volName UNION ALL
				SELECT
					COUNT(DISTINCT s.id) AS countrate,
					0 AS accessrate,
					s.voltagelevel AS volName,
					s.voltagelevel_id AS volCode
				FROM
					cisp_dev.yc_substation s
				WHERE 1=1');
	SET @sqlstr3=CONCAT(' GROUP BY s.voltagelevel) a
							GROUP BY a.volCode');
      SET @sqlconcat='';								
	-- 局信息
	IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
		SET @allorgs=base.getInClause(org_no);
		SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);
	END IF;
 	SET @sqlstr=CONCAT(@sqlstr1,@sqlconcat,@sqlstr2,@sqlconcat,@sqlstr3);
	-- SELECT @sqlstr;
END IF;
	-- 执行语句
	 -- SELECT @sqlstr;
	 SET @sql_mode=@@sql_mode;
	 SET @@sql_mode='';
	 PREPARE stmt FROM @sqlstr;
	 EXECUTE stmt;
	 SET @@sql_mode=@sql_mode;  
END

SELECT * FROM base.bp_org_shortname

SELECT * FROM base.vf_dev_search

SELECT * FROM cisp_platform.`bp_org` WHERE p_org_no='8a812897493378a001495677ad086663';
SELECT * FROM cisp_platform.`bp_org` WHERE org_no= '1096FA0035D17535E05379FB31000001'

-- 有子局 ok
CALL base.`proc_substation_access_rate_shortname`('1096FA0035D17535E05379FB31000001',FALSE); 

-- 有子局 电压等级 
CALL base.`proc_substation_access_rate_shortname`('1096FA0035D17535E05379FB31000001',TRUE);


-- 无子局 电压等级 
CALL base.`proc_substation_access_rate_shortname`('1096FA0035D17535E05379FB31510001',TRUE);
SELECT base.getInclause('1096FA0035D17535E05379FB31510001');

-- 无子局 ok
CALL base.`proc_substation_access_rate_shortname`('1096FA0035D17535E05379FB31510001',FALSE); 

-- SELECT base.getAllChildOrg('8a812897493378a001495677ad086663');

-- 省局  电压等级
CALL base.`proc_substation_access_rate_shortname`('8a812897493378a001495677ad086663',TRUE);

-- 省局 子局信息 8a812897493378a001495677ad086663
CALL base.proc_substation_access_rate_shortname('8a812897493378a001495677ad086663',FALSE);
