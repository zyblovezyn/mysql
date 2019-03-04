DROP TRIGGER ins_meausre_soe

DELIMITER $$ 
 
CREATE
    TRIGGER ins_meausre_soe AFTER INSERT ON cisp_platform.me_soe 
    FOR EACH ROW BEGIN
   IF LOCATE('CommError',new.MEASURETAG) >0 THEN 
     INSERT INTO base.tf_dev_commuciation_error 
     VALUES(new.soeid,
            new.dev_id,            
            new.measuretag,
            new.value,
            new.eventlevel,
            new.eventtype,
            new.eventdesc,
            new.t,
            new.isprocessed,
            new.operator,
            new.optime,
            new.isreturn,
            new.returntime,
            new.buro,
            new.subburo,
            new.issoe,
            new.isalarm,
            new.ishold,
            new.lastalarmid,
            new.dev_name,
            new.source,
            new.measurename,
            new.runningnumber         
            );
       /*insert into base.tf_dev_currentstatus(dev_id,dev_status)
             select new.dev_id,'2006' from dual where not exists(
                 select * from base.tf_dev_currentstatus where
                    dev_id=new.dev_id);  */                               
   ELSEIF  LOCATE('故障',new.MEASURENAME)>0 THEN
      INSERT INTO base.tf_dev_fault
        VALUES(new.soeid,
            new.dev_id,            
            new.measuretag,
            new.value,
            new.eventlevel,
            new.eventtype,
            new.eventdesc,
            new.t,
            new.isprocessed,
            new.operator,
            new.optime,
            new.isreturn,
            new.returntime,
            new.buro,
            new.subburo,
            new.issoe,
            new.isalarm,
            new.ishold,
            new.lastalarmid,
            new.dev_name,
            new.source,
            new.measurename,
            new.runningnumber         
            );
       /*insert into base.tf_dev_currentstatus(dev_id,dev_status)
             select new.dev_id,'2001' from dual where not exists(
                 select * from ins_meausre_soebase.tf_dev_currentstatus where
                    dev_id=new.dev_id);*/
   END IF;
END;
$$
