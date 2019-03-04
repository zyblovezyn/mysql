SELECT * FROM base.tf_device_type;


SHOW CREATE TABLE base.tf_device_type

CREATE TABLE `tf_device_type_temp` (
     `TYPE_ID` CHAR (52) NOT NULL COMMENT '类型编码',
     `TYPE_NAME` CHAR (84) NOT NULL COMMENT '类型说明',
     `GROUP_ID` TINYINT UNSIGNED NOT NULL COMMENT '1:在线监测装置；2：辅助设备；3：机器人',
     `CONTENT` VARCHAR (52) DEFAULT NULL COMMENT '备注',
     `USEFLAG` TINYINT UNSIGNED DEFAULT NULL COMMENT '是否启用',
     `PAIXU` TINYINT UNSIGNED DEFAULT NULL COMMENT '排序号',
     `CATEGORY` TINYINT UNSIGNED DEFAULT NULL COMMENT '1:视频监控 ；2：安防监视；3、消防监视；4：在线监测；5：环境监测；6：环境监控------用于工况的子分类',
     `SUBSYSTEM` VARCHAR (64) DEFAULT NULL COMMENT '消防、安防、动环、视频、锁控、压板6大子系统',
     `ChildSubSystem` VARCHAR (64) DEFAULT NULL COMMENT '子系统的分系统。目前消防子系统分：火灾报警系统、水系统、主变固定灭火系统',
     `subsystemname` VARCHAR (15) DEFAULT NULL COMMENT '子系统名称',
     PRIMARY KEY (`TYPE_ID`)
) ENGINE = INNODB DEFAULT CHARSET = utf8 COMMENT = '设备类型表'


INSERT INTO tf_device_type_temp SELECT * FROM base.tf_device_type;

SELECT MAX(LENGTH(TYPE_NAME)) FROM base.tf_device_type

ALTER TABLE base.tf_device_type_temp ADD KEY (SUBSYSTEM,GROUP_ID)

RENAME TABLE base.tf_device_type_temp TO base.tf_device_type

SELECT * FROM base.tf_device_type


