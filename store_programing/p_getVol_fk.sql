DELIMITER $$

USE `base`$$

DROP PROCEDURE IF EXISTS `p_getVol_fk`$$

CREATE DEFINER=`zhxm`@`` PROCEDURE `p_getVol_fk`(IN org VARCHAR(200))
BEGIN

	SET @sqlstr='SELECT DISTINCT
					station.voltagelevel_id AS stationVolCode, station.voltagelevel AS stationVolName
					FROM
					cisp_dev.yc_substation station
					WHERE station.lng IS NOT NULL and station.depart';
	SET @sqlstr1='ORDER BY station.voltagelevel_id DESC'; 
	 
 
	SET @sqlstr=CONCAT(@sqlstr,base.getInClause(org),@sqlstr1);
	  -- SELECT @sqlstr;	
	
	 PREPARE stmt FROM @sqlstr;
	 EXECUTE stmt;
END$$

DELIMITER ;

SELECT 

SELECT * FROM cisp_dev.yc_substation

CALL base.p_getVol_fk('1096FA0035D17535E05379FB31000001');
CALL base.p_getVol_fk('8a812897493378a001495677ad086663');