SELECT COUNT(*) FROM me_soe


SELECT * FROM me_soe WHERE isalarm=9



# version 1.0 	data:2018-12-27	reason:添加运维站过滤条件
DROP PROCEDURE IF EXISTS base.sp_getVolInSubStation;

DELIMITER //

CREATE PROCEDURE base.sp_getVolInSubStation (IN org_no VARCHAR (50),IN ywzids MEDIUMTEXT)
BEGIN
     SET @sqlstr = CONCAT(
          'select distinct
			voltagelevel_id as volCode, voltagelevel as volName
			from
			cisp_dev.yc_substation s
			where voltagelevel_id < 38 and length(s.maintenance_team)>0 '
     );
     SET @sqlorder = ' order by voltagelevel_id desc';
     SET @sqlconcat = '';
     IF ISNULL(org_no) = FALSE AND LENGTH(org_no) > 0 THEN 
		SET @sqlorg = base.getInClause (org_no);
		SET @sqlconcat = CONCAT(@sqlconcat,' and s.depart ', @sqlorg);
     END IF;
     IF ISNULL(ywzids) = FALSE AND LENGTH(ywzids) > 0 THEN 
		SET @ywzs = base.delimiterStr (ywzids,',');
		SET @sqlconcat = CONCAT(@sqlconcat,' and s.maintenance_team in ', @ywzs);
     END IF;
     SET @sqlstr = CONCAT(@sqlstr, @sqlconcat, @sqlorder);
     PREPARE stmt FROM @sqlstr;
     EXECUTE stmt;
END //




DELIMITER;

SELECT * FROM cisp_dev.yc_substation s WHERE maintenance_team='1096FA0035D17535E05379FB31000500'

CALL base.sp_getVolInSubStation(NULL,'1096FA0035D17535E05379FB31000500');
CALL base.sp_getVolInSubStation('1096FA0035D17535E05379FB31210000');

CALL base.sp_getVolInSubStation('1096FA0035D17535E05379FB31510001');

CALL base.sp_getVolInSubStation('8a812897493378a001495677ad086663');

