CALL base.p_delimiterStr_table('32,33',',');
SELECT id AS station_id,
        NAME AS    station_name,
        depart AS subburo,
        voltagelevel_id AS voltagelevelId,
        voltagelevel,
        run_status AS useflag
        FROM  cisp_dev.yc_substation s
        LEFT JOIN base.tf_ywzbdz t ON s.ID = t.zyid    
   
        WHERE 1=1
        AND s.VOLTAGELEVEL_ID IN (SELECT * FROM base.temptables)
        AND t.whbz="1096FA0035D17535E05379FB31000499"
	 
	
 
