SELECT DISTINCT
     org.org_no AS org_no,
     org.org_name AS org_name,
     org.org_full_name AS org_full_name,
     org.order_no AS order_no,
     ywz.whbz AS ywzid,
     ywz.whbzmc AS ywzname,
     station.id AS stationid,
     station.name AS stationname,
     station.voltagelevel_id AS volcode,
     station.voltagelevel AS volname,
     devtype.subsystem AS subsystem,
     devtype.subsystemname AS subsystemname,
     devtype.type_id AS devtype,
     devtype.type_name AS devtypename,
     dev.id AS devid,
     dev.name AS devname
FROM
     cisp_dev.v_all_dev dev
     LEFT JOIN cisp_dev.yc_substation station
          ON dev.substation_id = station.id
     LEFT JOIN base.tf_ywzbdz ywz
          ON ywz.zyid = station.id
     LEFT JOIN base.tf_device_type devtype
          ON dev.class_name = devtype.type_id
     LEFT JOIN base.bp_org_shortname org
          ON dev.depart = org.org_no
WHERE ywz.whbz IS NOT NULL
