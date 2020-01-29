

SELECT DISTINCT subsystem FROM base.tf_device_type;

SELECT *  FROM base.tf_device_type;

SELECT DISTINCT subsystemname AS NAME ,subsystem AS TYPE FROM base.tf_device_type

UPDATE base.tf_device_type SET subsystemname='动环子系统' WHERE subsystem='POWERENVIOR'

UPDATE base.tf_device_type SET subsystemname='视频子系统' WHERE subsystem='VIDEOCONTROL'

UPDATE base.tf_device_type SET subsystemname='消防子系统' WHERE subsystem='FIRECONTROL'

UPDATE base.tf_device_type SET subsystemname='安防子系统' WHERE subsystem='SECURITYCONTROL'


-- 1:视频监控 ；2：安防监视；3、消防监视；4：在线监测；5：环境监测；6：环境监控------用于工况的子分类



ALTER TABLE base.tf_device_type ADD COLUMN subsystemname VARCHAR(100) COMMENT '子系统名称' 






