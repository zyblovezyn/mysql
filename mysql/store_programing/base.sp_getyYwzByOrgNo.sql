DROP PROCEDURE IF EXISTS base.sp_getyYwzByOrgNo;

DELIMITER //

CREATE PROCEDURE base.sp_getyYwzByOrgNo (IN org_no CHAR(50))
BEGIN
     SET @sqlstr = CONCAT(
          'select distinct ywzId,ywzName from base.tf_ywzbdz_vol_exists_device where org_no', base.getInClause (org_no)
     );
     PREPARE stmt FROM @sqlstr;
     EXECUTE stmt;
END;
 
 
CALL base.sp_getyYwzByOrgNo('8a812897493378a001495677ad086663');
CALL base.sp_getyYwzByOrgNo('1096FA0035D17535E05379FB31000001');
CALL base.sp_getyYwzByOrgNo('1096FA0035D17535E05379FB31210000');