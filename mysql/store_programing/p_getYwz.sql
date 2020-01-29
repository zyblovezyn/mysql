DROP PROCEDURE IF EXISTS p_getYwz;
DELIMITER$$
CREATE PROCEDURE p_getYwz(IN orgno VARCHAR(100))
label_pro:BEGIN
  
    DECLARE temp VARCHAR(50);
    DECLARE allorgs VARCHAR(1300);
    IF orgno <=> NULL || LENGTH(orgno) <= 0 THEN
        LEAVE label_pro;
    END IF;
    
    SET allorgs=base.getAllChildOrg(orgno);
    
    IF LENGTH(allorgs) <= 0 THEN
        LEAVE label_pro;
    END IF;
    SET @sqlstr=CONCAT('select distinct v.ywzid as id,v.ywzname as name,v.subBuro AS pId,
                      \'/common/cameraTree/getVol\' AS requestUrl from vf_dev_search v where 1=1 and v.subburo in (');
    loop_name:LOOP
        SET temp=SUBSTRING_INDEX(allorgs,',',1);
        SET allorgs=SUBSTR(allorgs,LENGTH(temp)+2);
        IF LENGTH(allorgs)<=0 AND LENGTH(temp)>0 THEN
            SET @sqlstr=CONCAT(@sqlstr,'\'',temp,'\')');
            LEAVE loop_name;
        END IF;
        SET @sqlstr=CONCAT(@sqlstr,'\'',temp,'\',');      
    END LOOP;
    -- select @sqlstr;
    PREPARE stmt FROM @sqlstr;
    EXECUTE stmt;
END;

CALL p_getYwz('1096FA0035D17535E05379FB31000001')

SELECT * FROM vf_dev_search v WHERE v.ywzId='0000383335'


SELECT DISTINCT
  v.volCode                       AS id,
  v.volName                       AS NAME,
  v.ywzId                         AS pId,
  '/common/cameraTree/getStation' AS requestUrl
FROM vf_dev_search v
WHERE v.ywzId = '0000383335'

SELECT DISTINCT
  v.stationId                       AS id,
  v.stationName                       AS NAME,
  v.volCode                         AS pId,
  '/common/cameraTree/getArea' AS requestUrl
FROM vf_dev_search v
WHERE v.volCode = '50'
    AND v.ywzId = '0000383335'
    
    
    
SELECT DISTINCT
  v.areaId                       AS id,
  v.areaName                       AS NAME,
  v.stationId                         AS pId,
  '/common/cameraTree/getDevice' AS requestUrl
FROM vf_dev_search v
WHERE v.stationId='1'


SELECT DISTINCT
  v.devId   AS id,
  v.devName AS NAME,
  v.areaId  AS pId,
  ''        AS requestUrl
FROM vf_dev_search v
WHERE v.areaId = '1' 


SELECT * FROM td_dictionary






