BEGIN -- test
SELECT * FROM base.`tf_voltagelevel`

SELECT * FROM base.tf_device
SELECT * FROM base.vf_dev_search;
SELECT * FROM base.tf_ywzbdz
SELECT * FROM cisp_dev.v_all_dev d LEFT JOIN base.tfywzbdz s ON s.bdzid=d.DISTRICT;
SELECT d.dydj  FROM cisp_dev.v_all_dev d LEFT JOIN base.ywzbdz s ON s.bdzid=d.DISTRICT

SELECT DISTINCT volcode ,volname FROM base.tf_ywzbdz_vol_exists_device
SELECT * FROM cisp_dev.yc_substation s LEFT JOIN cisp_dev.v_all_dev d ON s.id=d.substation_id

SELECT DISTINCT
	s.VOLTAGELEVEL_ID AS volCode,
	s.VOLTAGELEVEL AS volName,
	s.ID   AS stationId,
	s.MAINTENANCE_TEAM AS  ywzId,
	s.DEPART AS subburo
FROM cisp_dev.yc_substation s 
LEFT JOIN cisp_dev.v_all_dev d 
ON s.id=d.substation_id
WHERE d.ID IS NOT NULL

SELECT DISTINCT
				ss.VOLTAGELEVEL_ID AS volCode,
				ss.VOLTAGELEVEL AS volName,
				ss.ID   AS stationId,
				ss.MAINTENANCE_TEAM AS  ywzId,
				ss.DEPART AS subburo
			FROM cisp_dev.yc_substation ss 
				LEFT JOIN cisp_dev.v_all_dev d 
				ON ss.id=d.substation_id
				WHERE d.ID IS NOT NULL

SELECT * FROM base.tf_voltagelevel
			
CALL base.`proc_substation_access_rate_voltagelevel`('1096FA0035D17535E05379FB31510001','','');

CALL base.`proc_substation_access_rate_voltagelevel`('1096FA0035D17535E05379FB31210000','',NULL);
CALL base.`proc_substation_access_rate_voltagelevel`('1096FA0035D17535E05379FB31210000','','33,22,34,35,36,37,38');

CALL base.`proc_substation_access_rate_voltagelevel`('1096FA0035D17535E05379FB31000001','',NULL);
CALL base.`proc_substation_access_rate_voltagelevel`('1096FA0035D17535E05379FB31000001','','30,32,33,22,34,35,36,37,38');

CALL base.proc_substation_access_rate_voltagelevel('8a812897493378a001495677ad086663','','33,22,34,35,36,37,38');
CALL base.proc_substation_access_rate_voltagelevel('8a812897493378a001495677ad086663','','');
CALL base.proc_substation_access_rate_voltagelevel('8a812897493378a001495677ad086663','','37');


SELECT base.delimiterStr('33,32,34,35,36,37',',');

END 

/*	电压等级
	37        交流1000kV                  
      36        交流750kV                   
      35        交流500kV                   
      34        交流330kV                   
      33        交流220kV                   
      32        交流110kV                   
      31        交流72.5kV                  
      30        交流66kV                    
      25        交流35kV                    
      24        交流20kV                    
      23        交流15.75kV                 
      22        交流10kV                    
      21        交流6kV                     
      20        交流3kV                     
      14        交流3000V                   
      15        交流2500V                   
      13        交流1500V                   
      10        交流1000V（含1140V）         
      12        交流750V                    
      09        交流660V                    
      11        交流600V                    
      8         交流380V（含400V）          
      7         交流220V                    
      6         交流110V                    
      5         交流48V                     
      4         交流36V                     
      3         交流24V                     
      2         交流12V                     
      1         交流6V                      



 	37        交流1000kV                  
      36        交流750kV                   
      35        交流500kV                   
      34        交流330kV                   
      33        交流220kV                   
      32        交流110kV                   
      31        交流72.5kV                  
      30        交流66kV                    
      25        交流35kV                    
      24        交流20kV                    
      23        交流15.75kV                 
      22        交流10kV                    
      21        交流6kV                     
      20        交流3kV                     
      14        交流3000V                   
      15        交流2500V                   
      13        交流1500V                   
      10        交流1000V（含1140V）         
      12        交流750V                    
      09        交流660V                    
      11        交流600V                    
      8         交流380V（含400V）          
      7         交流220V                    
      6         交流110V                    
      5         交流48V                     
      4         交流36V                     
      3         交流24V                     
      2         交流12V                     
      1         交流6V                      

*/

--    version:5.0	date:2019-1-7 	隐藏到直流500k 直流35kV 直流10kV
DROP PROCEDURE IF EXISTS base.proc_substation_access_rate_voltagelevel;
DELIMITER //
CREATE PROCEDURE base.proc_substation_access_rate_voltagelevel(IN org_no VARCHAR(50),IN ywzid MEDIUMTEXT,IN volid MEDIUMTEXT)
BEGIN	
/* 注释
  version:1.0	data:2018-12-1

  version:2.0	data:2018-12-15	reason:电压等级和运维站可以传多个，
 						                   电压等级个数少,声明varchar(60)够用
 						                   运维站多个，大概有262 一个长度32 									
								SELECT DISTINCT maintenance_team FROM cisp_dev.yc_substation
								
  version:3.0	date:2018-12-18 	reason 当人员为省局人员时 电压等级按500Kv及以上 110Kv-330Kv 110Kv以下	
  version:4.0	date:2018-12-22 	隐藏到直流500kV	22	

 */
	DECLARE isProvince BOOL;
	SET @notVolcode=CONCAT(' and s.voltagelevel_id not in (\'83\',\'22\',\'76\')');
	SET isProvince=STRCMP(org_no,'8a812897493378a001495677ad086663')=0;
	SET @notVolcodeAccessrate=CONCAT(' and dev.volcode not in (\'83\',\'22\',\'76\')');

	IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN
		IF isProvince THEN # 当人员为省局人员时 电压等级按500Kv及以上 220Kv 110Kv 100Kv以下
			SET @sqlstr1=CONCAT('SELECT a.volName,SUM(a.countrate) AS countrate,SUM(a.accessrate) AS accessrate,(SUM(a.countrate)-SUM(a.accessrate)) AS noaccessrate FROM
							(SELECT
								0 AS countrate, COUNT(DISTINCT dev.stationid) AS accessrate, IF(
									CAST(dev.volcode AS CHAR)+0 >= 35, \'500kV及以上\', IF(
										CAST(dev.volcode AS CHAR)+0 BETWEEN 32
										AND 34, \'110kV-330kV\', IF(
											CAST(dev.volcode AS CHAR)+0 < 32, \'110kV以下\', \'\'
										)
									)
								) AS volName
								FROM
								base.tf_ywz_bdz_vol_device dev where 1=1 ');
			SET @sqlstr2=CONCAT(' GROUP BY volName
								UNION
								SELECT
								COUNT(DISTINCT s.id) AS countrate, 0 AS accessrate, IF(
									s.voltagelevel_id >= 35, \'500kV及以上\', IF(
										s.voltagelevel_id BETWEEN 32
										AND 34, \'110kV-330kV\', IF(
											s.voltagelevel_id < 32, \'110kV以下\', \'\'
										)
									)
								) AS volName
								FROM
								cisp_dev.yc_substation s
								INNER JOIN base.tf_ywzbdz ywz
									ON s.id=ywz.zyid 
								WHERE 1 = 1 ');
			SET @sqlstr3=CONCAT(' GROUP BY volName) a
									GROUP BY a.volName');
		ELSE
			-- 电压等级接入率
			SET @sqlstr1=CONCAT('SELECT replace(replace(a.volName,\'直流\',\'\'),\'交流\',\'\') as volName,SUM(a.countrate) AS countrate,SUM(a.accessrate) AS accessrate,(SUM(a.countrate)-SUM(a.accessrate)) AS noaccessrate FROM
						(SELECT 
							0 AS countrate,
							COUNT(DISTINCT dev.stationid) AS accessrate,
							dev.volname AS volName,
							dev.volcode AS volCode
						FROM
							base.tf_ywz_bdz_vol_device dev where 1=1 ');
			SET @sqlstr2=CONCAT(' GROUP BY volName UNION ALL
						SELECT
							COUNT(DISTINCT s.id) AS countrate,
							0 AS accessrate,
							s.voltagelevel AS volName,
							s.voltagelevel_id AS volCode
						FROM
							cisp_dev.yc_substation s
							INNER JOIN base.tf_ywzbdz ywz
								ON s.id=ywz.zyid 
						WHERE 1=1 ');
			SET @sqlstr3=CONCAT(' GROUP BY s.voltagelevel) a
									GROUP BY a.volCode order by a.volCode');
		END IF;
	END IF;
	

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
		IF !isProvince THEN
			SET @allorgs=base.getInClause(org_no);		  
			SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);	
			SET @sqlaccessrate=CONCAT(@sqlaccessrate,' and dev.org_no',@allorgs);
		END IF;			 
	END IF;
 	-- select  @sqlstr1,@sqlstr2,@sqlstr3,@sqlstr4;
	SET @sqlstr=CONCAT(@sqlstr1,@sqlaccessrate,@sqlstr2,@sqlconcat,@sqlstr3);
	
	SET @sql_mode=@@session.sql_mode;
	SET @@session.sql_mode='';
	
	-- SELECT @sqlstr;
	PREPARE stmt FROM @sqlstr;
	EXECUTE stmt;
	
	SET @@session.sql_mode=@sql_mode;
	
END//



--    version:4.0	date:2018-12-22 	隐藏到直流500k 直流35kV 直流10kV
DROP PROCEDURE IF EXISTS base.proc_substation_access_rate_voltagelevel;
DELIMITER //
CREATE PROCEDURE base.proc_substation_access_rate_voltagelevel(IN org_no VARCHAR(50),IN ywzid MEDIUMTEXT,IN volid MEDIUMTEXT)
BEGIN	
/* 注释
  version:1.0	data:2018-12-1

  version:2.0	data:2018-12-15	reason:电压等级和运维站可以传多个，
 						                   电压等级个数少,声明varchar(60)够用
 						                   运维站多个，大概有262 一个长度32 									
								SELECT DISTINCT maintenance_team FROM cisp_dev.yc_substation
								
  version:3.0	date:2018-12-18 	reason 当人员为省局人员时 电压等级按500Kv及以上 110Kv-330Kv 110Kv以下	
  version:4.0	date:2018-12-22 	隐藏到直流500kV	22	

 */
	SET @notVolcode=CONCAT(' and s.voltagelevel_id not in (\'83\',\'22\',\'76\')');
	IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN
		IF STRCMP(org_no,'8a812897493378a001495677ad086663')=0 THEN # 当人员为省局人员时 电压等级按500Kv及以上 220Kv 110Kv 100Kv以下
			SET @sqlstr1=CONCAT('SELECT a.volName,SUM(a.countrate) AS countrate,SUM(a.accessrate) AS accessrate,(SUM(a.countrate)-SUM(a.accessrate)) AS noaccessrate FROM
							(SELECT
								0 AS countrate, COUNT(DISTINCT s.ID) AS accessrate, IF(
									s.voltagelevel_id >= 35, \'500kV及以上\', IF(
										s.voltagelevel_id BETWEEN 32
										AND 34, \'110kV-330kV\', IF(
											s.voltagelevel_id < 32, \'110kV以下\', \'\'
										)
									)
								) AS volName
								FROM
								cisp_dev.yc_substation s
								LEFT JOIN cisp_dev.v_all_dev d
									ON s.id = d.substation_id
								WHERE d.ID IS NOT NULL ');
			SET @sqlstr2=CONCAT(' GROUP BY volName
								UNION
								SELECT
								COUNT(DISTINCT s.id) AS countrate, 0 AS accessrate, IF(
									s.voltagelevel_id >= 35, \'500kV及以上\', IF(
										s.voltagelevel_id BETWEEN 32
										AND 34, \'110kV-330kV\', IF(
											s.voltagelevel_id < 32, \'110kV以下\', \'\'
										)
									)
								) AS volName
								FROM
								cisp_dev.yc_substation s
								INNER JOIN base.tf_ywzbdz ywz
									ON s.id=ywz.zyid 
								WHERE 1 = 1 ');
			SET @sqlstr3=CONCAT(' GROUP BY volName) a
									GROUP BY a.volName');
		ELSE
			-- 电压等级接入率
			SET @sqlstr1=CONCAT('SELECT replace(replace(a.volName,\'直流\',\'\'),\'交流\',\'\') as volName,SUM(a.countrate) AS countrate,SUM(a.accessrate) AS accessrate,(SUM(a.countrate)-SUM(a.accessrate)) AS noaccessrate FROM
						(SELECT
							0 AS countrate,
							COUNT(DISTINCT s.ID) AS accessrate,
							s.voltagelevel AS volName,
							s.voltagelevel_id AS volCode
						FROM
							cisp_dev.yc_substation s
							LEFT JOIN cisp_dev.v_all_dev d
									ON s.id = d.substation_id
						WHERE d.ID IS NOT NULL ');
			SET @sqlstr2=CONCAT(' GROUP BY volName UNION ALL
						SELECT
							COUNT(DISTINCT s.id) AS countrate,
							0 AS accessrate,
							s.voltagelevel AS volName,
							s.voltagelevel_id AS volCode
						FROM
							cisp_dev.yc_substation s
							INNER JOIN base.tf_ywzbdz ywz
								ON s.id=ywz.zyid 
						WHERE 1=1 ');
			SET @sqlstr3=CONCAT(' GROUP BY s.voltagelevel) a
									GROUP BY a.volCode');
		END IF;
	END IF;
	

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
	
	SET @sql_mode=@@session.sql_mode;
	SET @@session.sql_mode='';
	
	-- SELECT @sqlstr;
	PREPARE stmt FROM @sqlstr;
	EXECUTE stmt;
	
	SET @@session.sql_mode=@sql_mode;
	
END//



--    version:3.0	date:2018-12-18 reason 当人员为省局人员时 电压等级按500Kv及以上 220Kv 110Kv 100Kv以下
DROP PROCEDURE IF EXISTS base.proc_substation_access_rate_voltagelevel;
DELIMITER //
CREATE PROCEDURE base.proc_substation_access_rate_voltagelevel(IN org_no VARCHAR(50),IN ywzid MEDIUMTEXT,IN volid MEDIUMTEXT)
BEGIN	
/* 注释
  version:1.0	data:2018-12-1

  version:2.0	data:2018-12-15	reason:电压等级和运维站可以传多个，
 						                   电压等级个数少,声明varchar(60)够用
 						                   运维站多个，大概有262 一个长度32 									
								SELECT DISTINCT maintenance_team FROM cisp_dev.yc_substation
								
  version:3.0	date:2018-12-18 	reason 当人员为省局人员时 电压等级按500Kv及以上 110Kv-330Kv 110Kv以下			

 */
	IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN
		IF STRCMP(org_no,'8a812897493378a001495677ad086663')=0 THEN # 当人员为省局人员时 电压等级按500Kv及以上 220Kv 110Kv 100Kv以下
			SET @sqlstr1=CONCAT('SELECT a.volName,SUM(a.countrate) AS countrate,SUM(a.accessrate) AS accessrate,(SUM(a.countrate)-SUM(a.accessrate)) AS noaccessrate FROM
							(SELECT
								0 AS countrate, COUNT(DISTINCT s.ID) AS accessrate, IF(
									s.voltagelevel_id >= 35, \'500Kv及以上\', IF(
										s.voltagelevel_id BETWEEN 32
										AND 34, \'110Kv-330Kv\', IF(
											s.voltagelevel_id < 32, \'110Kv以下\', \'\'
										)
									)
								) AS volName
								FROM
								cisp_dev.yc_substation s
								LEFT JOIN cisp_dev.v_all_dev d
									ON s.id = d.substation_id
								WHERE d.ID IS NOT NULL');
			SET @sqlstr2=CONCAT(' GROUP BY volName
								UNION
								SELECT
								COUNT(DISTINCT s.id) AS countrate, 0 AS accessrate, IF(
									s.voltagelevel_id >= 35, \'500Kv及以上\', IF(
										s.voltagelevel_id BETWEEN 32
										AND 34, \'110Kv-330Kv\', IF(
											s.voltagelevel_id < 32, \'110Kv以下\', \'\'
										)
									)
								) AS volName
								FROM
								cisp_dev.yc_substation s
								WHERE 1 = 1');
			SET @sqlstr3=CONCAT(' GROUP BY volName) a
									GROUP BY a.volName');
		ELSE
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
			SET @sqlstr2=CONCAT(' GROUP BY volName UNION ALL
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
		END IF;
	END IF;
	

  	SET @sqlconcat='';
		-- 运维站信息
		IF ISNULL(ywzid)=FALSE AND LENGTH(ywzid)>0 THEN
			SET @ywzids=base.delimiterStr(ywzid,',');
			SET @sqlconcat=CONCAT(@sqlconcat,' and s.maintenance_team in ',@ywzids);				 
		END IF;
		-- 电压等级信息
		IF ISNULL(volid)=FALSE AND LENGTH(volid)>0 THEN
			SET @volids=base.delimiterStr(volid,',');
			SET @sqlconcat=CONCAT(@sqlconcat,' and s.voltagelevel_id in ',@volids,' and s.voltagelevel_id != ');				 
		END IF;	
		-- 局信息
		IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
			SET @allorgs=base.getInClause(org_no);		  
			SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);				 
		END IF;
 	-- select  @sqlstr1,@sqlstr2,@sqlstr3,@sqlstr4;
	SET @sqlstr=CONCAT(@sqlstr1,@sqlconcat,@sqlstr2,@sqlconcat,@sqlstr3);
	
	SET @sql_mode=@@session.sql_mode;
	SET @@session.sql_mode='';
	
	-- SELECT @sqlstr;
	PREPARE stmt FROM @sqlstr;
	EXECUTE stmt;
	
	SET @@session.sql_mode=@sql_mode;
	
END//


--  version:1.0		data:2018-12-1
--  version:2.0		data:2018-12-15
DROP PROCEDURE IF EXISTS base.proc_substation_access_rate_voltagelevel;
DELIMITER //
CREATE PROCEDURE base.proc_substation_access_rate_voltagelevel(IN org_no VARCHAR(50),IN ywzid VARCHAR(50),IN volid VARCHAR(10))
BEGIN
	
	DECLARE allorgs TEXT;
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
	SET @sqlstr2=CONCAT(' GROUP BY volName UNION ALL
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
			SET allorgs=base.getInClause(org_no);		  
			SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',allorgs);				 
		END IF;
 	-- select  @sqlstr1,@sqlstr2,@sqlstr3,@sqlstr4;
	SET @sqlstr=CONCAT(@sqlstr1,@sqlconcat,@sqlstr2,@sqlconcat,@sqlstr3);
	
	SET @sql_mode=@@session.sql_mode;
	SET @@session.sql_mode='';
	
	-- SELECT @sqlstr;
	PREPARE stmt FROM @sqlstr;
	EXECUTE stmt;
	
	SET @@session.sql_mode=@sql_mode;
	
END//


SELECT DISTINCT VOLTAGELEVEL FROM cisp_dev.yc_substation ORDER BY VOLTAGELEVEL_id WHERE VOLTAGELEVEL LIKE '%330%'




-- 按运维站进行统计
DROP PROCEDURE IF EXISTS base.proc_substation_access_rate_ywz();
CREATE PROCEDURE base.proc_substation_access_rate_ywz(IN org_no VARCHAR(50),IN ywzid VARCHAR(50),IN volid VARCHAR(10))


SELECT * FROM base.tf_voltagelevel

SHOW CREATE TABLE base.tf_voltagelevel

DESCRIBE base.tf_voltagelevel

SELECT * FROM cisp_dev.yc_substation s WHERE VOLTAGELEVEL LIKE '%交流10%'


SELECT * FROM base.tf_voltagelevel WHERE useflag=1