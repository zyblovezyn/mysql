-- 查询单位下的所有变电站
DROP PROCEDURE IF EXISTS base.p_getStationsByOrgNo;
DELIMITER//
CREATE PROCEDURE base.p_getStationsByOrgNo(IN org_no VARCHAR(40))
BEGIN
	SET @sqlstr='select station.id,station.name from cisp_dev.yc_substation station
				inner join cisp_platform.bp_org org
				on station.depart=org.org_no';
	 IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN
		SET @sqlstr=CONCAT(@sqlstr,' where station.depart',base.getInClause(org_no));      
       END IF;  
      -- select @sqlstr;     
      PREPARE stmt FROM @sqlstr;
      EXECUTE stmt; 
 END


CALL base.p_getStationsByOrgNo('8a812897493378a001495677ad086663');
CALL base.p_getStationsByOrgNo('1096FA0035D17535E05379FB31510001');


SET @sqlstr = '';

IF ISNULL(org_no) = FALSE
AND LENGTH(org_no) > 0
THEN SET @sqlstr = CONCAT(
      @sqlstr, 'select station.id,station.name from cisp_dev.yc_substation station
				inner join cisp_platform.bp_org org
				on station.depart=org.org_no
				where station.depart base.getInClause(?)'
);

END IF;

PREPARE stmt FROM @sqlstr;

EXECUTE stmt;

