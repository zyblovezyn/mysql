DELIMITER $$

USE `base`$$

DROP FUNCTION IF EXISTS `getAllParentsOrg`$$

CREATE DEFINER=`zhxm`@`` FUNCTION `getAllParentsOrg`(rootId VARCHAR(50)) RETURNS TEXT CHARSET utf8
BEGIN
	DECLARE sTemp TEXT(65535);
	DECLARE sTempChd TEXT(1500);
	SET sTemp = '$';
	SET sTempChd = rootId;
	WHILE sTempChd IS NOT NULL DO
		-- if sTempChd=rootId then
-- 			continue;
-- 		end if
		SET sTemp = CONCAT(sTemp,',',sTempChd);
		SELECT GROUP_CONCAT(P_ORG_NO) INTO sTempChd FROM cisp_platform.bp_org WHERE FIND_IN_SET(ORG_NO,sTempChd)>0;
	END WHILE;
	SET sTemp= RIGHT(sTemp,LENGTH(sTemp)-LOCATE(',',sTemp)); -- 去除$
	-- SET sTemp= RIGHT(sTemp,LENGTH(sTemp)-LOCATE(',',sTemp)); -- 去除自身
	-- set sTemp=LEFT(sTemp,LENGTH(sTemp)-(LENGTH(SUBSTRING_INDEX(sTemp,',',-1))+1));

	RETURN sTemp;
END$$

DELIMITER ;


