DROP PROCEDURE IF EXISTS p_getStationByOrg;
DELIMITER$$
CREATE PROCEDURE p_getStationByOrg(IN orgno VARCHAR(256))
BEGIN
    DECLARE allorgs VARCHAR(1300);
    DECLARE temp VARCHAR(200); 
    SET @sqlstr=CONCAT('SELECT id AS station_id,
          NAME AS    station_name,          
          depart AS subburo,
         -- voltagelevel AS vol_id,
          run_status AS useflag            
         FROM  cisp_dev.yc_substation s where s.depart in (');
    IF ISNULL(orgno)=FALSE AND LENGTH(orgno)>0 THEN
        SET allorgs=base.getAllChildOrg(orgno);
        IF ISNULL(allorgs)=FALSE AND LENGTH(allorgs)>0 THEN
           loop_name:LOOP
            SET temp=SUBSTRING_INDEX(allorgs,',',1);
            SET allorgs=SUBSTR(allorgs,LENGTH(temp)+2);
            IF LENGTH(temp)>0 AND LENGTH(allorgs)<=0 THEN
                SET @sqlstr=CONCAT(@sqlstr,'\'',temp,'\')');
                LEAVE loop_name;
            END IF;
            SET @sqlstr=CONCAT(@sqlstr,'\'',temp,'\',');
	    END LOOP;
        END IF;
    END IF;
    -- select @sqlstr;
    PREPARE stmt FROM @sqlstr;
    EXECUTE stmt;
END;

 
SELECT SUBSTRING_INDEX('45',',',1);
SELECT SUBSTR('45',4);


CALL base.p_getStationByOrg('1096FA0035D17535E05379FB31000001');

