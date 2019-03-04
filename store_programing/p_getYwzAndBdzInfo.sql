DROP PROCEDURE IF EXISTS p_getYwzAndBdzInfo;
DELIMITER$$
-- drop procedure if exists p_getYwzAndBdzInfo;
CREATE PROCEDURE p_getYwzAndBdzInfo(IN orgno VARCHAR(50))
BEGIN
        DECLARE temp VARCHAR(50)    ;
        DECLARE hasnum INT DEFAULT 0;
        DECLARE allorgs VARCHAR(1000);
        SET @sqlstr='SELECT DISTINCT
              ywz.ywz_id              \"id\",
              ywz.ywz_name            \"name\",
              ywz.LNG                 \"ywzx\",
              ywz.LAT                 \"ywzy\",
              station.station_id      \"station_id\",
              station.station_name    \"station_name\",
              vol.vol_code            \"station_dydjcode\",
              vol.vol_value           \"station_dydjname\",
              station.LNG             \"station_x\",
              station.LAT             \"station_y\",
              soe.dev_id              \"station_soe_devid\",
             
              CASE code.value WHEN 1 THEN \'一级告警\'  WHEN 2 THEN   \'二级告警\'  WHEN  3 THEN \'三级告警\'  END AS               \"station_soe_title\",
              soe.eventdesc           \"station_soe_content\"
            FROM base.tf_ywz ywz
            INNER JOIN base.tf_substation station
              ON (station.ywzid = ywz.ywz_id or (locate()))
            INNER JOIN cisp_platform.bp_org org
                ON org.org_no = station.subburo
              INNER JOIN base.tf_device device
                ON device.substation_Id = station.station_id
              INNER JOIN measuredata.me_soe soe
                ON soe.DEV_ID = device.device_id
              INNER JOIN tf_voltagelevel vol
                ON vol.vol_code = station.vol_id
              INNER JOIN bp_code CODE
               ON code.value = soe.eventlevel  AND code.code_type = \'EventLevel\'
             WHERE DATE_ADD(soe.T,INTERVAL 5 DAY) > NOW()
                 and station.useflag=1 and ywz.useflag=1 and soe.isreturn=\'0\' and COALESCE(code.value,\'0\') <> \'0\'';
                IF ISNULL(orgno)=FALSE AND LENGTH(orgno)>0 THEN
                    SET allorgs=base.getAllChildOrg(orgno);
                    SET @sqlstr=CONCAT(@sqlstr,' and station.subburo in (');
                    loopOne:LOOP
			    SET @temp=SUBSTRING_INDEX(allorgs,',',1);
			    SET allorgs=SUBSTR(allorgs,LENGTH(@temp)+2); 
			    IF LENGTH(allorgs)<=0 AND LENGTH(@temp)>0 THEN
				 SET @sqlstr=CONCAT(@sqlstr,'\'',@temp,'\')');
				 LEAVE loopOne;
			    END IF;
			    SET @sqlstr=CONCAT(@sqlstr,'\'',@temp,'\',');
		    END LOOP;
                END IF;
                SET @sqlstr=CONCAT(@sqlstr,'group by station.station_id,code.value  ORDER BY soe.T DESC');
               -- SELECT @sqlstr;
                PREPARE stmt FROM @sqlstr;
                EXECUTE stmt;

END

CALL base.p_getYwzAndBdzInfo('8a812897493378a001495677ad086663');











