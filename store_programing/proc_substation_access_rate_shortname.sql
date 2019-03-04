 

SELECT * FROM  cisp_platform.bp_org WHERE p_org_no='8a812897493378a001495677ad086663' AND org_code IS NOT NULL

-- 获取子局信息
SELECT GROUP_CONCAT(org_no) FROM  cisp_platform.`bp_org` org WHERE org.p_org_no='1096FA0035D17535E05379FB31000001'
SELECT CHAR_LENGTH('1096FA0035D17535E05379FB31000001');

SELECT * FROM cisp_dev.yc_substation
SELECT * FROM base.`tf_ywz`

SELECT * FROM base.vf_dev_search


-- 电压等级接入率
SELECT a.volName,SUM(a.countrate) AS countrate,SUM(a.accessrate) AS accessrate FROM
(
SELECT COUNT(DISTINCT s.id) AS countrate,s.voltagelevel AS volName,0 AS accessrate
FROM cisp_dev.yc_substation s
WHERE s.depart IN ()
GROUP BY voltagelevel

UNION ALL

SELECT 0 AS countrate,v.volName,COUNT(DISTINCT v.stationId) AS accessrate
FROM base.vf_dev_search v 
WHERE v.subburo IN ()
GROUP BY volName

) a GROUP BY volName

SELECT SUM(countrate),SUM(accessrate),orgName FROM 
(SELECT COUNT(DISTINCT s.id) AS countrate,org.org_name AS orgName,0 AS accessrate,org.org_no
FROM cisp_dev.yc_substation s
INNER JOIN cisp_platform.bp_org org
ON org.org_no=s.depart
-- WHERE s.depart IN ()
GROUP BY org.org_name,org.org_no) a,cisp_platform.bp_org orgout
WHERE a.org_no=orgout.p_org_no AND
GROUP BY a.orgName

-- 地市局接入率(有子局)
SELECT a.orgName,SUM(a.countrate) AS countrate,SUM(a.accessrate) AS accessrate FROM
(
SELECT COUNT(DISTINCT s.id) AS countrate,org.org_name AS orgName,0 AS accessrate
FROM cisp_dev.yc_substation s
INNER JOIN cisp_platform.bp_org org
ON org.org_no=s.depart
WHERE s.depart IN ('1096FA0035D17535E05379FB31510001','1096FA0035D17535E05379FB31520001','1096FA0035D17535E05379FB31531000','1096FA0035D17535E05379FB31540001','1096FA0035D17535E05379FB31550001','1096FA0035D17535E05379FB31560001','1096FA0035D17535E05379FB31570001','1096FA0035D17535E05379FB50152672','8a1278036043716701608bbb873c2e52'
)
GROUP BY org.org_name

UNION ALL

SELECT 0 AS countrate,v.subburoname AS orgName,COUNT(DISTINCT v.stationId) AS accessrate
FROM base.vf_dev_search v 
WHERE v.subburo IN ('1096FA0035D17535E05379FB31510001','1096FA0035D17535E05379FB31520001','1096FA0035D17535E05379FB31531000','1096FA0035D17535E05379FB31540001','1096FA0035D17535E05379FB31550001','1096FA0035D17535E05379FB31560001','1096FA0035D17535E05379FB31570001','1096FA0035D17535E05379FB50152672','8a1278036043716701608bbb873c2e52'
)
GROUP BY v.subburoname
) a GROUP BY a.orgName


-- 地市局接入率(无子局)

SELECT a.ywzName,SUM(a.countrate) AS countrate,SUM(a.accessrate) AS accessrate FROM
(
SELECT COUNT(DISTINCT s.id) AS countrate,ywz.ywz_name AS ywzName,0 AS accessrate
FROM cisp_dev.yc_substation s
INNER JOIN base.`tf_ywz` ywz
ON ywz.ywz_id=s.maintenance_team
-- WHERE s.depart IN ()
GROUP BY ywz.ywz_name

UNION ALL
-- select * from vf_dev_search
SELECT 0 AS countrate,v.ywzName,COUNT(DISTINCT v.stationId) AS accessrate
FROM base.vf_dev_search v 
-- WHERE v.subburo IN ()
GROUP BY v.ywzName
) a GROUP BY a.ywzName

-- 省局人员
SELECT @@sql_mode -- ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION  
SET @@sql_mode='';
-- 地市局接入率(有子局)
SELECT a.org_name,SUM(a.countrate) AS countrate,SUM(a.accessrate) AS accessrate FROM
( 
SELECT org.org_name,COUNT(DISTINCT s.id) AS countrate,0 AS accessrate
FROM cisp_dev.yc_substation s
INNER JOIN cisp_platform.bp_org org
ON org.org_no=s.depart
WHERE s.depart IN ('$','8a812897493378a001495677ad086663','1096FA0035D17535E05379FB00200000','1096FA0035D17535E05379FB00300000','1096FA0035D17535E05379FB20000001','1096FA0035D17535E05379FB21001100','1096FA0035D17535E05379FB21001110','1096FA0035D17535E05379FB21001121','1096FA0035D17535E05379FB21001130','1096FA0035D17535E05379FB21001140','1096FA0035D17535E05379FB21001160','1096FA0035D17535E05379FB21001161','1096FA0035D17535E05379FB31000001','1096FA0035D17535E05379FB31210000','1096FA0035D17535E05379FB32000001','1096FA0035D17535E05379FB33000001','1096FA0035D17535E05379FB34000001','1096FA0035D17535E05379FB35000001','1096FA0035D17535E05379FB36000001','1096FA0035D17535E05379FB37000000','1096FA0035D17535E05379FB38010000','1096FA0035D17535E05379FB42000000','1096FA0035D17535E05379FB47000000','1096FA0035D17535E05379FB48000000','1096FA0035D17535E05379FB50005475','1096FA0035D17535E05379FB50006001','8a127803551645a40156bb8b01b24f59','ff808081551645d1015590d17bbd437f','国网浙江省置业公司','1096FA0035D17535E05379FB00240000','1096FA0035D17535E05379FB00255000','1096FA0035D17535E05379FB00260000','1096FA0035D17535E05379FB00265000','1096FA0035D17535E05379FB00270000','1096FA0035D17535E05379FB50152705','1096FA0035D17535E05379FB00368888','1096FA0035D17535E05379FB00370000','1096FA0035D17535E05379FB00380000','1096FA0035D17535E05379FB00390000','1096FA0035D17535E05379FB50151626','1096FA0035D17535E05379FB21001001','1096FA0035D17535E05379FB21001002','1096FA0035D17535E05379FB36661007','1096FA0035D17535E05379FB36661008','1096FA0035D17535E05379FB31510001','1096FA0035D17535E05379FB31520001','1096FA0035D17535E05379FB31531000','1096FA0035D17535E05379FB31540001','1096FA0035D17535E05379FB31550001','1096FA0035D17535E05379FB31560001','1096FA0035D17535E05379FB31570001','1096FA0035D17535E05379FB50152672','8a1278036043716701608bbb873c2e52','1096FA0035D17535E05379FB32700000','1096FA0035D17535E05379FB32800000','1096FA0035D17535E05379FB32900000','1096FA0035D17535E05379FB50152125','1096FA0035D17535E05379FB33910000','1096FA0035D17535E05379FB33920001','1096FA0035D17535E05379FB33930001','1096FA0035D17535E05379FB33940001','1096FA0035D17535E05379FB33950001','1096FA0035D17535E05379FB33960001','1096FA0035D17535E05379FB50152150','1096FA0035D17535E05379FB34810001','1096FA0035D17535E05379FB34829999','1096FA0035D17535E05379FB34830001','1096FA0035D17535E05379FB34840000','1096FA0035D17535E05379FB34859999','1096FA0035D17535E05379FB34860100','1096FA0035D17535E05379FB34870000','1096FA0035D17535E05379FB34880001','1096FA0035D17535E05379FB34890000','1096FA0035D17535E05379FB50152940','1096FA0035D17535E05379FB35030000','1096FA0035D17535E05379FB35040000','1096FA0035D17535E05379FB35050000','1096FA0035D17535E05379FB35060000','1096FA0035D17535E05379FB35070000','1096FA0035D17535E05379FB35080000','1096FA0035D17535E05379FB35090000','1096FA0035D17535E05379FB50151460','1096FA0035D17535E05379FB36661001','1096FA0035D17535E05379FB36662001','1096FA0035D17535E05379FB36663001','1096FA0035D17535E05379FB36664001','1096FA0035D17535E05379FB50152684','1096FA0035D17535E05379FB37007001','1096FA0035D17535E05379FB37010001','1096FA0035D17535E05379FB37012501','1096FA0035D17535E05379FB37015001','1096FA0035D17535E05379FB37017501','1096FA0035D17535E05379FB37020001','1096FA0035D17535E05379FB37022501','1096FA0035D17535E05379FB37025001','1096FA0035D17535E05379FB37030001','1096FA0035D17535E05379FB37999999','1096FA0035D17535E05379FB25000001','1096FA0035D17535E05379FB26000001','1096FA0035D17535E05379FB27000001','1096FA0035D17535E05379FB38900000','1096FA0035D17535E05379FB38920000','1096FA0035D17535E05379FB38941000','1096FA0035D17535E05379FB38960000','1096FA0035D17535E05379FB38980000','1096FA0035D17535E05379FB50152618','1096FA0035D17535E05379FB50154611','1096FA0035D17535E05379FB48210001','1096FA0035D17535E05379FB48220002','1096FA0035D17535E05379FB50153253'
) 
GROUP BY org.p_org_no
 

UNION ALL 
 
SELECT org.org_name,0 AS countrate,COUNT(DISTINCT v.stationId) AS accessrate
FROM base.vf_dev_search v 
INNER JOIN cisp_platform.bp_org org
ON org.org_no=v.subburo
WHERE v.subburo IN ('8a812897493378a001495677ad086663','1096FA0035D17535E05379FB00200000','1096FA0035D17535E05379FB00300000','1096FA0035D17535E05379FB20000001','1096FA0035D17535E05379FB21001100','1096FA0035D17535E05379FB21001110','1096FA0035D17535E05379FB21001121','1096FA0035D17535E05379FB21001130','1096FA0035D17535E05379FB21001140','1096FA0035D17535E05379FB21001160','1096FA0035D17535E05379FB21001161','1096FA0035D17535E05379FB31000001','1096FA0035D17535E05379FB31210000','1096FA0035D17535E05379FB32000001','1096FA0035D17535E05379FB33000001','1096FA0035D17535E05379FB34000001','1096FA0035D17535E05379FB35000001','1096FA0035D17535E05379FB36000001','1096FA0035D17535E05379FB37000000','1096FA0035D17535E05379FB38010000','1096FA0035D17535E05379FB42000000','1096FA0035D17535E05379FB47000000','1096FA0035D17535E05379FB48000000','1096FA0035D17535E05379FB50005475','1096FA0035D17535E05379FB50006001','8a127803551645a40156bb8b01b24f59','ff808081551645d1015590d17bbd437f','国网浙江省置业公司','1096FA0035D17535E05379FB00240000','1096FA0035D17535E05379FB00255000','1096FA0035D17535E05379FB00260000','1096FA0035D17535E05379FB00265000','1096FA0035D17535E05379FB00270000','1096FA0035D17535E05379FB50152705','1096FA0035D17535E05379FB00368888','1096FA0035D17535E05379FB00370000','1096FA0035D17535E05379FB00380000','1096FA0035D17535E05379FB00390000','1096FA0035D17535E05379FB50151626','1096FA0035D17535E05379FB21001001','1096FA0035D17535E05379FB21001002','1096FA0035D17535E05379FB36661007','1096FA0035D17535E05379FB36661008','1096FA0035D17535E05379FB31510001','1096FA0035D17535E05379FB31520001','1096FA0035D17535E05379FB31531000','1096FA0035D17535E05379FB31540001','1096FA0035D17535E05379FB31550001','1096FA0035D17535E05379FB31560001','1096FA0035D17535E05379FB31570001','1096FA0035D17535E05379FB50152672','8a1278036043716701608bbb873c2e52','1096FA0035D17535E05379FB32700000','1096FA0035D17535E05379FB32800000','1096FA0035D17535E05379FB32900000','1096FA0035D17535E05379FB50152125','1096FA0035D17535E05379FB33910000','1096FA0035D17535E05379FB33920001','1096FA0035D17535E05379FB33930001','1096FA0035D17535E05379FB33940001','1096FA0035D17535E05379FB33950001','1096FA0035D17535E05379FB33960001','1096FA0035D17535E05379FB50152150','1096FA0035D17535E05379FB34810001','1096FA0035D17535E05379FB34829999','1096FA0035D17535E05379FB34830001','1096FA0035D17535E05379FB34840000','1096FA0035D17535E05379FB34859999','1096FA0035D17535E05379FB34860100','1096FA0035D17535E05379FB34870000','1096FA0035D17535E05379FB34880001','1096FA0035D17535E05379FB34890000','1096FA0035D17535E05379FB50152940','1096FA0035D17535E05379FB35030000','1096FA0035D17535E05379FB35040000','1096FA0035D17535E05379FB35050000','1096FA0035D17535E05379FB35060000','1096FA0035D17535E05379FB35070000','1096FA0035D17535E05379FB35080000','1096FA0035D17535E05379FB35090000','1096FA0035D17535E05379FB50151460','1096FA0035D17535E05379FB36661001','1096FA0035D17535E05379FB36662001','1096FA0035D17535E05379FB36663001','1096FA0035D17535E05379FB36664001','1096FA0035D17535E05379FB50152684','1096FA0035D17535E05379FB37007001','1096FA0035D17535E05379FB37010001','1096FA0035D17535E05379FB37012501','1096FA0035D17535E05379FB37015001','1096FA0035D17535E05379FB37017501','1096FA0035D17535E05379FB37020001','1096FA0035D17535E05379FB37022501','1096FA0035D17535E05379FB37025001','1096FA0035D17535E05379FB37030001','1096FA0035D17535E05379FB37999999','1096FA0035D17535E05379FB25000001','1096FA0035D17535E05379FB26000001','1096FA0035D17535E05379FB27000001','1096FA0035D17535E05379FB38900000','1096FA0035D17535E05379FB38920000','1096FA0035D17535E05379FB38941000','1096FA0035D17535E05379FB38960000','1096FA0035D17535E05379FB38980000','1096FA0035D17535E05379FB50152618','1096FA0035D17535E05379FB50154611','1096FA0035D17535E05379FB48210001','1096FA0035D17535E05379FB48220002','1096FA0035D17535E05379FB50153253')
GROUP BY org.p_org_no
) a
GROUP BY a.org_name



SELECT COUNT(*), 
SELECT LENGTH(NULL)>0;

-- 有子局 ok
CALL base.`proc_substation_access_rate_shortname`('1096FA0035D17535E05379FB31000001',FALSE); 

-- 子局 电压等级 
CALL base.`proc_substation_access_rate_shortname`('1096FA0035D17535E05379FB31000001',TRUE);


-- 无子局 电压等级 
CALL base.`proc_substation_access_rate_shortname`('1096FA0035D17535E05379FB31510001',TRUE);
-- 无子局 ok
CALL base.`proc_substation_access_rate_shortname`('1096FA0035D17535E05379FB31510001',FALSE); 

-- SELECT base.getAllChildOrg('8a812897493378a001495677ad086663');

-- 省局  电压等级
CALL base.`proc_substation_access_rate_shortname`('8a812897493378a001495677ad086663',TRUE);

-- 省局 子局信息 8a812897493378a001495677ad086663
CALL base.`proc_substation_access_rate_shortname`('8a812897493378a001495677ad086663',FALSE);



-- version:5.0	date:2019-1-7	reason:优化
 
DROP PROCEDURE IF EXISTS base.proc_substation_access_rate_shortname;
DELIMITER //
CREATE PROCEDURE base.proc_substation_access_rate_shortname(IN org_no CHAR(40),IN voltagelevel BOOL)
BEGIN
	/*
	org_no 局信息
	voltagelevel 电压等级
	变电站下有辅控设备就算接入，没有就不算
	1. org_no 不为空，voltagelevel为false,则为地市局接入率
	2. org_no不为空，voltagelevel是true为，电压等级分类的变电站接入率
	*/
 
DECLARE group_org MEDIUMTEXT;
DECLARE isprovince BOOL;
SET isprovince=STRCMP(org_no,'8a812897493378a001495677ad086663')=0;
IF voltagelevel=FALSE THEN
	-- 地市局接入率	
	SELECT GROUP_CONCAT(org_no) INTO group_org FROM cisp_platform.bp_org bp_org WHERE bp_org.p_org_no=org_no;
	SET @notVolcode=CONCAT(' and s.voltagelevel_id not in (\'83\',\'22\',\'76\')');
	SET @notVolcodeAccessrate=CONCAT(' and dev.volcode not in (\'83\',\'22\',\'76\')');

	IF  isprovince THEN -- 省人员
		SET @sqlstr1=CONCAT('SELECT
						a.org_name,a.org_no,org.org_full_name, SUM(a.countrate) AS countrate, SUM(a.accessrate) AS accessrate, SUM(a.countrate) - SUM(a.accessrate) AS noaccessrate
						FROM
						(SELECT
							sum1.org_name,sum1.org_no, SUM(org.countrate) AS countrate, 0 AS accessrate
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
									s.depart as org_no, COUNT(DISTINCT s.id) AS countrate
								FROM
									cisp_dev.yc_substation s
								INNER JOIN base.tf_ywzbdz ywz
									ON s.id=ywz.zyid  
								WHERE 1 = 1');				
		SET @sqlstr2=CONCAT(' GROUP BY org_no) AS org
							INNER JOIN base.bp_org_shortname sum1
								ON org.org_no = sum1.org_no
						GROUP BY sum1.p_org_no) AS org
						INNER JOIN base.bp_org_shortname sum1
							ON org.p_org_no = sum1.org_no
					GROUP BY sum1.org_no
					UNION
					ALL -- 接入率
						SELECT
						sum1.org_name,sum1.org_no, 0 AS countrate, SUM(org.accessrate) AS accessrate
					FROM
						(SELECT
							CASE
								org.p_org_no
								WHEN \'8a812897493378a001495677ad086663\'
								THEN \'1096FA0035D17535E05379FB31210000\'
								ELSE org.p_org_no
							END AS p_org_no, org.org_name, SUM(v.accessrate) AS accessrate
						FROM
							(SELECT 
								COUNT(DISTINCT dev.stationid) AS accessrate, dev.org_no
							  from base.tf_ywz_bdz_vol_device dev where 1=1');
		SET @sqlstr3=CONCAT(' GROUP BY org_no) AS v
						LEFT JOIN base.bp_org_shortname org
							ON v.org_no = org.org_no
					GROUP BY org.p_org_no) AS org
					INNER JOIN base.bp_org_shortname sum1
						ON sum1.org_no = org.p_org_no
				GROUP BY sum1.org_no) a LEFT JOIN base.bp_org_shortname org on a.org_no=org.org_no
				GROUP BY a.org_name order by org.order_no');
 	 	SET @sqlconcat='';			 
		-- 局信息
		IF !isprovince THEN 
			SET @allorgs=base.getInClause(org_no);		  
			SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);				 
		END IF; 		 
		SET @sqlstr=CONCAT(@sqlstr1,@sqlconcat,@sqlstr2,@sqlconcat,@sqlstr3);
	ELSE -- 其他人yuan	
		IF ISNULL(group_org)=TRUE THEN  -- 没有子局OK	
			SET @sqlstr1=CONCAT('SELECT
							a.ywzName as org_name,
							a.ywzId as org_no,
							a.ywzName as org_full_name,
							SUM(a.countrate) AS countrate,
							SUM(a.accessrate) AS accessrate,
							SUM(a.countrate) - SUM(a.accessrate) AS noaccessrate
						FROM
							(SELECT
								COUNT(DISTINCT s.id) AS countrate,
								0 AS accessrate,
								ywz.whbzmc AS ywzName,
								ywz.whbz as ywzId
							FROM
								cisp_dev.yc_substation s
								INNER JOIN base.tf_ywzbdz ywz
									ON ywz.zyid = s.id
							WHERE 1 = 1');			
			SET @sqlstr2=CONCAT(' GROUP BY ywzName UNION ALL
								SELECT DISTINCT
									0 AS countrate,
									COUNT(DISTINCT dev.stationid) AS accessrate,
									dev.ywzname as ywzname,
									dev.ywzid as ywzId
								FROM
									base.tf_ywz_bdz_vol_device dev WHERE 1 = 1');					 
			SET @sqlstr3=CONCAT(' GROUP BY ywzName) a
						     GROUP BY ywzName order by ywzName');					 
			SET @sqlconcat=''; 
			SET @sqlaccessrate='';
	
			-- 局信息
			IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
				SET @allorgs=base.getInClause(org_no);		  
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart=\'',org_no,'\'');					
				SET @sqlaccessrate=CONCAT(@sqlaccessrate,' and dev.org_no=\'',org_no,'\'');				 
			 
			END IF; 		 
			SET @sqlstr=CONCAT(@sqlstr1,@notVolcode,@sqlconcat,@sqlstr2,@sqlaccessrate,@sqlstr3);					
		ELSE -- 有子局
			SET @sqlstr1=CONCAT('SELECT   org.org_name, org.org_no, 
								org.org_full_name, SUM(a.countrate) AS countrate, 
								SUM(a.accessrate) AS accessrate, SUM(a.countrate) - SUM(a.accessrate) AS noaccessrate
						   FROM
							(SELECT
								s.depart AS org_no, COUNT(DISTINCT s.id) AS countrate, 0 AS accessrate
							FROM
								cisp_dev.yc_substation s
								INNER JOIN base.tf_ywzbdz ywz
									ON s.id = ywz.zyid
							WHERE 1 = 1');			
			SET @sqlstr2=CONCAT(' GROUP BY s.depart UNION ALL
							SELECT
								dev.org_no, 0 AS countrate, COUNT(DISTINCT dev.stationid) AS accessrate
							FROM
								base.tf_ywz_bdz_vol_device dev
							WHERE 1 = 1');
			SET @sqlstr3=CONCAT(' GROUP BY dev.org_no) AS a
							LEFT JOIN base.bp_org_shortname org
								ON a.org_no = org.org_no
							GROUP BY org.org_no ORDER BY org.order_no');
			SET @sqlconcat='';
		      SET @sqlaccessrate='';
			-- 局信息
			IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
				SET @allorgs=base.getInClause(org_no);		  
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);					
				SET @sqlaccessrate=CONCAT(@sqlaccessrate,' and dev.org_no',@allorgs);				 
			 
			END IF;
			SET @sqlstr=CONCAT(@sqlstr1,@notVolcode,@sqlconcat,@sqlstr2,@sqlaccessrate,@sqlstr3);			 
		END IF;	
	END IF;
ELSEIF voltagelevel=TRUE THEN
	-- 电压等级接入率
	SET @sqlstr1=CONCAT('SELECT a.volName,a.volCode,SUM(a.countrate) AS countrate,SUM(a.accessrate) AS accessrate,(SUM(a.countrate)-SUM(a.accessrate)) AS noaccessrate FROM
				(SELECT
					COUNT(DISTINCT s.id) AS countrate,
					0 AS accessrate,
					s.voltagelevel AS volName,
					s.voltagelevel_id AS volCode
				FROM
					cisp_dev.yc_substation s
				INNER JOIN base.tf_ywzbdz ywz
					ON s.id=ywz.zyid 
				WHERE 1=1');
	SET @sqlstr2=CONCAT('GROUP BY volName UNION ALL
				SELECT
					0 AS accessrate,
					COUNT(DISTINCT dev.stationid) AS accessrate,
					dev.volname AS volName,
					dev.volcode AS volCode
				FROM
					 base.tf_ywz_bdz_vol_device dev WHERE 1=1');
	SET @sqlstr3=CONCAT(' GROUP BY dev.volcode) a
							GROUP BY a.volCode order by volCode desc');
      SET @sqlconcat='';
      SET @sqlaccessrate='';
								
	-- 局信息
	IF !isprovince THEN 
		SET @allorgs=base.getInClause(org_no);
		SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);
		SET @sqlaccessrate=CONCAT(@sqlaccessrate,' and dev.org_no',@allorgs);

	END IF;
	-- 电压等级信息
	SET @sqlconcat=CONCAT(@sqlconcat,@notVolcode);
	SET @sqlaccessrate=CONCAT(@sqlaccessrate,@notVolcodeAccessrate);
 	SET @sqlstr=CONCAT(@sqlstr1,@sqlconcat,@sqlstr2,@sqlaccessrate,@sqlstr3);
	-- SELECT @sqlstr;
END IF;
	-- 执行语句
	 -- SELECT @sqlstr;
	 SET @sql_mode=@@sql_mode;
	 SET @@sql_mode='';
	 PREPARE stmt FROM @sqlstr;
	 EXECUTE stmt;
	 SET @@sql_mode=@sql_mode;  
	 DEALLOCATE PREPARE stmt ;
END


-- version:4.0	date:2018-12-24 	加入排序
--			date:2018-12-29	加入单位全称 ywzid ywzname 改成org_no org_name
DROP PROCEDURE IF EXISTS base.proc_substation_access_rate_shortname;
DELIMITER //
CREATE PROCEDURE base.proc_substation_access_rate_shortname(IN org_no CHAR(40),IN voltagelevel BOOL)
BEGIN
	/*
	org_no 局信息
	voltagelevel 电压等级
	变电站下有辅控设备就算接入，没有就不算
	1. org_no 不为空，voltagelevel为false,则为地市局接入率
	2. org_no不为空，voltagelevel是true为，电压等级分类的变电站接入率
	*/
-- DECLARE allorgs TEXT;
DECLARE group_org MEDIUMTEXT;
DECLARE isprovince TINYINT;
SET isprovince=STRCMP(org_no,'8a812897493378a001495677ad086663');
IF voltagelevel=FALSE THEN
	-- 地市局接入率	
	SELECT GROUP_CONCAT(org_no) INTO group_org FROM cisp_platform.bp_org bp_org WHERE bp_org.p_org_no=org_no;
	SET @notVolcode=CONCAT(' and s.voltagelevel_id not in (\'83\',\'22\',\'76\')');
	IF  isprovince=0 THEN -- 省人员
		SET @sqlstr1=CONCAT('SELECT
						a.org_name,a.org_no,org.org_full_name, SUM(a.countrate) AS countrate, SUM(a.accessrate) AS accessrate, SUM(a.countrate) - SUM(a.accessrate) AS noaccessrate
						FROM
						(SELECT
							sum1.org_name,sum1.org_no, SUM(org.countrate) AS countrate, 0 AS accessrate
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
								INNER JOIN base.tf_ywzbdz ywz
									ON s.id=ywz.zyid 
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
						sum1.org_name,sum1.org_no, 0 AS countrate, SUM(org.accessrate) AS accessrate
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
				GROUP BY sum1.org_no) a LEFT JOIN base.bp_org_shortname org on a.org_no=org.org_no
				GROUP BY a.org_name order by org.order_no');
 	 	SET @sqlconcat='';			 
		-- 局信息
		IF isprovince!=0 THEN 
			SET @allorgs=base.getInClause(org_no);		  
			SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);				 
		END IF; 		 
		SET @sqlstr=CONCAT(@sqlstr1,@sqlconcat,@sqlstr2,@sqlconcat,@sqlstr3);
	ELSE -- 其他人yuan	
		IF ISNULL(group_org)=TRUE THEN  -- 没有子局OK	
			SET @sqlstr1=CONCAT('SELECT
							a.ywzName as org_name,
							a.ywzId as org_no,
							a.ywzName as org_full_name,
							SUM(a.countrate) AS countrate,
							SUM(a.accessrate) AS accessrate,
							SUM(a.countrate) - SUM(a.accessrate) AS noaccessrate
						FROM
							(SELECT
								COUNT(DISTINCT s.id) AS countrate,
								0 AS accessrate,
								ywz.whbzmc AS ywzName,
								ywz.whbz as ywzId
							FROM
								cisp_dev.yc_substation s
								INNER JOIN base.tf_ywzbdz ywz
									ON ywz.zyid = s.id
							WHERE 1 = 1');			
			SET @sqlstr2=CONCAT(' GROUP BY ywzName
								UNION
								ALL
								SELECT DISTINCT
									0 AS countrate,
									COUNT(DISTINCT s.ID) AS accessrate,
									ywz.whbzmc AS ywzName,
									ywz.whbz as ywzId
								FROM
									cisp_dev.yc_substation s
									INNER JOIN cisp_dev.v_all_dev d
										ON s.id = d.substation_id
									INNER JOIN base.tf_ywzbdz ywz
										ON ywz.zyid = s.id
								WHERE 1 = 1');					 
			SET @sqlstr3=CONCAT(' GROUP BY ywzName) a
						     GROUP BY ywzName order by countrate desc');					 
			SET @sqlconcat=''; 	
			-- 局信息
			IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
				SET @allorgs=base.getInClause(org_no);		  
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);				 
			END IF; 		 
			SET @sqlstr=CONCAT(@sqlstr1,@notVolcode,@sqlconcat,@sqlstr2,@sqlconcat,@sqlstr3);					
		ELSE -- 有子局
			SET @sqlstr1=CONCAT('SELECT	 
					a.org_name,
					a.org_no,
					org.org_full_name,
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
					     INNER JOIN base.tf_ywzbdz ywz
							ON s.id=ywz.zyid 
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
							ON v.depart = org.org_no   GROUP BY org.org_no) a left join base.bp_org_shortname org on a.org_no=org.org_no
				GROUP BY a.org_no order by org.order_no');
			SET @sqlconcat='';
			-- 局信息
			IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
				SET @allorgs=base.getInClause(org_no);		  
				SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);				 
			END IF;
			SET @sqlstr=CONCAT(@sqlstr1,@notVolcode,@sqlconcat,@sqlstr2,@sqlconcat,@sqlstr3);			 
		END IF;	
	END IF;
ELSEIF voltagelevel=TRUE THEN
	-- 电压等级接入率
	SET @sqlstr1=CONCAT('SELECT a.volName,a.volCode,SUM(a.countrate) AS countrate,SUM(a.accessrate) AS accessrate,(SUM(a.countrate)-SUM(a.accessrate)) AS noaccessrate FROM
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
				INNER JOIN base.tf_ywzbdz ywz
					ON s.id=ywz.zyid 
				WHERE 1=1');
	SET @sqlstr3=CONCAT(' GROUP BY s.voltagelevel) a
							GROUP BY a.volCode order by volCode desc');
      SET @sqlconcat='';								
	-- 局信息
	IF isprovince!=0 THEN 
		SET @allorgs=base.getInClause(org_no);
		SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);
	END IF;
	-- 电压等级信息
	SET @sqlconcat=CONCAT(@sqlconcat,@notVolcode);
	 
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
	 DEALLOCATE PREPARE stmt ;
END




-- version:3.0	date:2018-12-24 	隐藏到直流500k 直流35kV 直流10kV
DROP PROCEDURE IF EXISTS base.proc_substation_access_rate_shortname;
DELIMITER //
CREATE PROCEDURE base.proc_substation_access_rate_shortname(IN org_no CHAR(40),IN voltagelevel BOOL)
BEGIN
	/*
	org_no 局信息
	voltagelevel 电压等级
	变电站下有辅控设备就算接入，没有就不算
	1. org_no 不为空，voltagelevel为false,则为地市局接入率
	2. org_no不为空，voltagelevel是true为，电压等级分类的变电站接入率
	*/
-- DECLARE allorgs TEXT;
DECLARE group_org MEDIUMTEXT;
DECLARE isprovince TINYINT;
SET isprovince=STRCMP(org_no,'8a812897493378a001495677ad086663');
IF voltagelevel=FALSE THEN
	-- 地市局接入率	
	SELECT GROUP_CONCAT(org_no) INTO group_org FROM cisp_platform.bp_org bp_org WHERE bp_org.p_org_no=org_no;
	SET @notVolcode=CONCAT(' and s.voltagelevel_id not in (\'83\',\'22\',\'76\')');
	IF  isprovince=0 THEN -- 省人员
		SET @sqlstr1=CONCAT('SELECT
						a.org_name,a.org_no, SUM(a.countrate) AS countrate, SUM(a.accessrate) AS accessrate, SUM(a.countrate) - SUM(a.accessrate) AS noaccessrate
						FROM
						(SELECT
							sum1.org_name,sum1.org_no, SUM(org.countrate) AS countrate, 0 AS accessrate
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
						sum1.org_name,sum1.org_no, 0 AS countrate, SUM(org.accessrate) AS accessrate
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
				GROUP BY a.org_name order by countrate desc');
 	 	SET @sqlconcat='';			 
		-- 局信息
		IF isprovince!=0 THEN 
			SET @allorgs=base.getInClause(org_no);		  
			SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);				 
		END IF; 		 
		SET @sqlstr=CONCAT(@sqlstr1,@sqlconcat,@sqlstr2,@sqlconcat,@sqlstr3);
	ELSE -- 其他人yuan	
		IF ISNULL(group_org)=TRUE THEN  -- 没有子局OK	
			SET @sqlstr1=CONCAT('SELECT
							a.ywzName,
							a.ywzId,
							SUM(a.countrate) AS countrate,
							SUM(a.accessrate) AS accessrate,
							SUM(a.countrate) - SUM(a.accessrate) AS noaccessrate
						FROM
							(SELECT
								COUNT(DISTINCT s.id) AS countrate,
								0 AS accessrate,
								ywz.whbzmc AS ywzName,
								ywz.whbz as ywzId
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
									ywz.whbzmc AS ywzName,
									ywz.whbz as ywzId
								FROM
									cisp_dev.yc_substation s
									INNER JOIN cisp_dev.v_all_dev d
										ON s.id = d.substation_id
									INNER JOIN base.tf_ywzbdz ywz
										ON ywz.whbz = s.maintenance_team
								WHERE 1 = 1');					 
			SET @sqlstr3=CONCAT(' GROUP BY ywzName) a
						     GROUP BY ywzName order by countrate desc');					 
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
					a.org_no,
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
						INNER JOIN base.tf_ywzbdz ywz
							ON s.id=ywz.zyid 
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
				GROUP BY a.org_no order by countrate desc');
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
	SET @sqlstr1=CONCAT('SELECT a.volName,a.volCode,SUM(a.countrate) AS countrate,SUM(a.accessrate) AS accessrate,(SUM(a.countrate)-SUM(a.accessrate)) AS noaccessrate FROM
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
							GROUP BY a.volCode order by volCode desc');
      SET @sqlconcat='';								
	-- 局信息
	IF isprovince!=0 THEN 
		SET @allorgs=base.getInClause(org_no);
		SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);
	END IF;
	-- 电压等级信息
	SET @sqlconcat=CONCAT(@sqlconcat,@notVolcode);
	 
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


-- version:2.0	date:2018-12-24 	隐藏到直流500k 直流35kV 直流10kV
DROP PROCEDURE IF EXISTS base.proc_substation_access_rate_shortname;
DELIMITER //
CREATE PROCEDURE base.proc_substation_access_rate_shortname(IN org_no CHAR(40),IN voltagelevel BOOL)
BEGIN
	/*
	org_no 局信息
	voltagelevel 电压等级
	变电站下有辅控设备就算接入，没有就不算
	1. org_no 不为空，voltagelevel为false,则为地市局接入率
	2. org_no不为空，voltagelevel是true为，电压等级分类的变电站接入率
	*/
-- DECLARE allorgs TEXT;
DECLARE group_org MEDIUMTEXT;
DECLARE isprovince TINYINT;
SET isprovince=STRCMP(org_no,'8a812897493378a001495677ad086663');
IF voltagelevel=FALSE THEN
	-- 地市局接入率	
	SELECT GROUP_CONCAT(org_no) INTO group_org FROM cisp_platform.bp_org bp_org WHERE bp_org.p_org_no=org_no;
	SET @notVolcode=CONCAT(' and s.voltagelevel_id not in (\'83\',\'22\',\'76\')');
	IF  isprovince=0 THEN -- 省人员
		SET @sqlstr1=CONCAT('SELECT
						a.org_name,a.org_no, SUM(a.countrate) AS countrate, SUM(a.accessrate) AS accessrate, SUM(a.countrate) - SUM(a.accessrate) AS noaccessrate
						FROM
						(SELECT
							sum1.org_name,sum1.org_no, SUM(org.countrate) AS countrate, 0 AS accessrate
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
						sum1.org_name,sum1.org_no, 0 AS countrate, SUM(org.accessrate) AS accessrate
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
				GROUP BY a.org_name order by countrate desc');
 	 	SET @sqlconcat='';			 
		-- 局信息
		IF isprovince!=0 THEN 
			SET @allorgs=base.getInClause(org_no);		  
			SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);				 
		END IF; 		 
		SET @sqlstr=CONCAT(@sqlstr1,@sqlconcat,@sqlstr2,@sqlconcat,@sqlstr3);
	ELSE -- 其他人yuan	
		IF ISNULL(group_org)=TRUE THEN  -- 没有子局OK	
			SET @sqlstr1=CONCAT('SELECT
							a.ywzName,
							a.ywzId,
							SUM(a.countrate) AS countrate,
							SUM(a.accessrate) AS accessrate,
							SUM(a.countrate) - SUM(a.accessrate) AS noaccessrate
						FROM
							(SELECT
								COUNT(DISTINCT s.id) AS countrate,
								0 AS accessrate,
								ywz.whbzmc AS ywzName,
								ywz.whbz as ywzId
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
									ywz.whbzmc AS ywzName,
									ywz.whbz as ywzId
								FROM
									cisp_dev.yc_substation s
									INNER JOIN cisp_dev.v_all_dev d
										ON s.id = d.substation_id
									INNER JOIN base.tf_ywzbdz ywz
										ON ywz.whbz = s.maintenance_team
								WHERE 1 = 1');					 
			SET @sqlstr3=CONCAT(' GROUP BY ywzName) a
						     GROUP BY ywzName order by countrate desc');					 
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
					a.org_no,
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
				GROUP BY a.org_no order by countrate desc');
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
	SET @sqlstr1=CONCAT('SELECT a.volName,a.volCode,SUM(a.countrate) AS countrate,SUM(a.accessrate) AS accessrate,(SUM(a.countrate)-SUM(a.accessrate)) AS noaccessrate FROM
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
							GROUP BY a.volCode order by volCode desc');
      SET @sqlconcat='';								
	-- 局信息
	IF isprovince!=0 THEN 
		SET @allorgs=base.getInClause(org_no);
		SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);
	END IF;
	-- 电压等级信息
	SET @sqlconcat=CONCAT(@sqlconcat,@notVolcode);
	 
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



--  version:1.0	date:2018-12-05 

DROP PROCEDURE IF EXISTS base.proc_substation_access_rate_shortname;
DELIMITER //
CREATE PROCEDURE base.proc_substation_access_rate_shortname(IN org_no CHAR(40),IN voltagelevel BOOL)
BEGIN
	/*
	org_no 局信息
	voltagelevel 电压等级
	变电站下有辅控设备就算接入，没有就不算
	1. org_no 不为空，voltagelevel为false,则为地市局接入率
	2. org_no不为空，voltagelevel是true为，电压等级分类的变电站接入率
	*/
-- DECLARE allorgs TEXT;
DECLARE group_org MEDIUMTEXT;
DECLARE isprovince TINYINT;
SET isprovince=STRCMP(org_no,'8a812897493378a001495677ad086663');
IF voltagelevel=FALSE THEN
	-- 地市局接入率	
	SELECT GROUP_CONCAT(org_no) INTO group_org FROM cisp_platform.bp_org bp_org WHERE bp_org.p_org_no=org_no;
	
	IF isprovince=0 THEN -- 省人员
		SET @sqlstr1=CONCAT('SELECT
						a.org_name,a.org_no, SUM(a.countrate) AS countrate, SUM(a.accessrate) AS accessrate, SUM(a.countrate) - SUM(a.accessrate) AS noaccessrate
						FROM
						(SELECT
							sum1.org_name,sum1.org_no, SUM(org.countrate) AS countrate, 0 AS accessrate
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
						sum1.org_name,sum1.org_no, 0 AS countrate, SUM(org.accessrate) AS accessrate
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
				GROUP BY a.org_name');
 	 	SET @sqlconcat='';			 
		-- 局信息
		IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN 
			SET @allorgs=base.getInClause(org_no);		  
			SET @sqlconcat=CONCAT(@sqlconcat,' and s.depart',@allorgs);				 
		END IF; 		 
		SET @sqlstr=CONCAT(@sqlstr1,@sqlconcat,@sqlstr2,@sqlconcat,@sqlstr3);
	ELSE -- 其他人yuan	
		IF ISNULL(group_org)=TRUE THEN  -- 没有子局OK	
			SET @sqlstr1=CONCAT('SELECT
							a.ywzName,
							a.ywzId,
							SUM(a.countrate) AS countrate,
							SUM(a.accessrate) AS accessrate,
							SUM(a.countrate) - SUM(a.accessrate) AS noaccessrate
						FROM
							(SELECT
								COUNT(DISTINCT s.id) AS countrate,
								0 AS accessrate,
								ywz.whbzmc AS ywzName,
								ywz.whbz as ywzId
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
									ywz.whbzmc AS ywzName,
									ywz.whbz as ywzId
								FROM
									cisp_dev.yc_substation s
									INNER JOIN cisp_dev.v_all_dev d
										ON s.id = d.substation_id
									INNER JOIN base.tf_ywzbdz ywz
										ON ywz.whbz = s.maintenance_team
								WHERE 1 = 1');					 
			SET @sqlstr3=CONCAT(' GROUP BY ywzName) a
						     GROUP BY ywzName order by countrate desc');					 
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
					a.org_no,
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
				GROUP BY a.org_no order by countrate desc');
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
	SET @sqlstr1=CONCAT('SELECT a.volName,a.volCode,SUM(a.countrate) AS countrate,SUM(a.accessrate) AS accessrate,(SUM(a.countrate)-SUM(a.accessrate)) AS noaccessrate FROM
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
							GROUP BY a.volCode order by countrate');
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


p_getUnitOrgTreeNodes
SELECT * FROM base.vf_dev_search

SELECT * FROM cisp_platform.`bp_org` WHERE p_org_no='8a812897493378a001495677ad086663';

-- 有子局 ok
CALL base.`proc_substation_access_rate_shortname`('1096FA0035D17535E05379FB31000001',FALSE); 

-- 子局 电压等级 
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
CALL base.`proc_substation_access_rate_shortname`('8a812897493378a001495677ad086663',FALSE);


SELECT * FROM 
