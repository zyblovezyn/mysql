DROP FUNCTION IF EXISTS getChildOrg;
DELIMITER$$
-- 获取局信息的子局信息，不包含子局下的子局
CREATE FUNCTION getChildOrg(orgno VARCHAR(50)) RETURNS MEDIUMTEXT CHARSET utf8
BEGIN
    DECLARE result VARCHAR(1300);
   
        SELECT GROUP_CONCAT(org2.org_no) INTO result FROM
            cisp_platform.bp_org  org1,
            cisp_platform.bp_org  org2
            WHERE org1.org_no=CAST(orgno AS CHAR) AND
            org2.p_org_no=org1.org_no;
        RETURN result;
 END 


SELECT base.getChildOrg('1096FA0035D17535E05379FB31000001');