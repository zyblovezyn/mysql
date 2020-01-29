
-- verson :2.0	date:2019-1-2	reason:org_no can be send null

# get volcode by org_no and ywzid ,they are all can multiple
DROP PROCEDURE IF EXISTS base.sp_getVolCodeByOrgAndYwz;

DELIMITER //
CREATE PROCEDURE base.sp_getVolCodeByOrgAndYwz (
     IN org_no CHAR(64), IN ywzid MEDIUMTEXT,IN volcode MEDIUMTEXT
)
BEGIN
	
	SET @sqlstr=CONCAT('SELECT
					distinct volCode, volName
				   FROM
					base.tf_ywzbdz_vol_exists_device where 1=1 ');
	SET @sqlwh=CONCAT(' and volcode is not null 
					and strcmp(volcode,\'\')!=0 and volname is not null 
					and strcmp(volname,\'\')!=0  order by volcode desc');
	
	SET @orgNos='',@ywzids='',@volcodes='';
	IF ISNULL(org_no)=FALSE AND LENGTH(org_no)>0 THEN
		-- SET @ywzids=base.delimiterStr(ywzid);
		SET @sqlstr=CONCAT(@sqlstr,' and org_no ',base.getInClause(org_no));
	END IF;
					
	IF ISNULL(ywzid)=FALSE AND LENGTH(ywzid)>0 THEN
		-- SET @ywzids=base.delimiterStr(ywzid);
		SET @sqlstr=CONCAT(@sqlstr,' and ywzid in ',base.delimiterStr(ywzid,','));
	END IF;
	
	IF ISNULL(volcode)=FALSE AND LENGTH(volcode)>0 THEN
		-- SET @volcodes=base.delimiterStr(volcode);
		SET @sqlstr=CONCAT(@sqlstr,' and volcode in ',base.delimiterStr(volcode,','));
	END IF;	
	-- select @sqlstr;
	SET @sqlstr=CONCAT(@sqlstr,@sqlwh);
 	PREPARE stmt FROM @sqlstr;
	EXECUTE stmt;
END  


# get volcode by org_no and ywzid ,they are all can multiple
DROP PROCEDURE IF EXISTS base.sp_getVolCodeByOrgAndYwz;

DELIMITER //
CREATE PROCEDURE base.sp_getVolCodeByOrgAndYwz (
     IN org_no CHAR(64), IN ywzid MEDIUMTEXT,IN volcode MEDIUMTEXT
)
BEGIN
	SET @sqlstr=CONCAT('SELECT
					distinct volCode, volName
				   FROM
					base.tf_ywzbdz_vol_exists_device where org_no',base.getInClause(org_no),' and volcode is not null 
					and strcmp(volcode,\'\')!=0 and volname is not null 
					and strcmp(volname,\'\')!=0');
					
	IF ISNULL(ywzid)=FALSE AND LENGTH(ywzid)>0 THEN
		-- SET @ywzids=base.delimiterStr(ywzid);
		SET @sqlstr=CONCAT(@sqlstr,' and ywzid in ',base.delimiterStr(ywzid,','));
	END IF;
	
	IF ISNULL(volcode)=FALSE AND LENGTH(volcode)>0 THEN
		-- SET @volcodes=base.delimiterStr(volcode);
		SET @sqlstr=CONCAT(@sqlstr,' and volcode in ',base.delimiterStr(volcode,','));
	END IF;	
	-- select @sqlstr;
	SET @sqlstr=CONCAT(@sqlstr,' order by volcode desc');				 
	PREPARE stmt FROM @sqlstr;
	EXECUTE stmt;
END  

 
CALL base.sp_getVolCodeByOrgAndYwz('8a812897493378a001495677ad086663','','');
CALL base.sp_getVolCodeByOrgAndYwz('','1096FA0035D17535E05379FB31000496','');

CALL base.sp_getVolCodeByOrgAndYwz('8a812897493378a001495677ad086663','1096FA0035D17535E05379FB31000496,1096FA0035D17535E05379FB00301202','33,32');
CALL base.sp_getVolCodeByOrgAndYwz('1096FA0035D17535E05379FB31210000',NULL,NULL);


