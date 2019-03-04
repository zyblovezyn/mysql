CREATE TABLE midxy(mrid VARCHAR(500),geo_x VARCHAR(120),geo_y VARCHAR(120));

SELECT * FROM midxy



CREATE TABLE stationMridxy(bdz_id VARCHAR(120),pms_id VARCHAR(120));

CREATE TABLE ywzxy(ACTUALID VARCHAR(120),LNG VARCHAR(120),LAT VARCHAR(120),ID VARCHAR(120))



SELECT * FROM midxy;
SELECT * FROM stationMridxy ORDER BY bdz_id ;
SELECT * FROM ywzxy;

SELECT COUNT(*) FROM midxy;
SELECT COUNT(*) FROM stationMridxy;
SELECT COUNT(*) FROM ywzxy;

SELECT RIGHT('000059593.0',LENGTH('000059593.0')-4) WHERE 


SELECT LPAD('123',10,'0')

SELECT LENGTH('0000041234')

UPDATE ywzxy SET ID=LPAD(ID,10,'0');

-- update ywzxy set ACTUALID=left(ACTUALID,length(ACTUALID)-2) where ACTUALID is not null
UPDATE ywzxy SET id=LEFT(id,LENGTH(id)-2) WHERE id IS NOT NULL

SELECT s.bdz_id,m.geo_x,m.geo_y
FROM midxy m
  JOIN stationMridxy s
    ON s.pms_id = m.mrid;

SELECT station_id,lng,lat FROM tf_substation

UPDATE tf_substation station,
  midxy m,
  stationMridxy s
SET station.lng = m.geo_x,
  station.lat = m.geo_y
WHERE s.bdz_id = station.station_id AND s.pms_id = m.mrid;

SELECT * FROM
 tf_substation station
 INNER JOIN stationMridxy s ON s.bdz_id = station.station_id


SELECT *  FROM midxy;
SELECT * FROM stationMridxy;
SELECT * FROM ywzxy;

SELECT y.ID,m.geo_x,m.geo_y FROM ywzxy Y ,stationMridxy s,midxy m WHERE s.pms_id = m.mrid AND y.ACTUALID;


-- 运维站 当有经纬度时
SELECT * FROM ywzxy WHERE lat IS NOT NULL;
SELECT * FROM tf_ywz

UPDATE tf_ywz ywz,
  ywzxy xy
SET ywz.lng = xy.LNG,
  ywz.lat = xy.LAT
WHERE ywz.ywz_id = xy.ID
    AND xy.LAT IS NOT NULL;



SELECT
  s.bdz_id,
  m.geo_x,
  m.geo_y,
  xy.*
FROM ywzxy xy,
  midxy m,
  stationMridxy s
WHERE lat IS NULL
    AND ACTUALID IS NOT NULL
    AND s.pms_id = m.mrid
    AND xy.ACTUALID=s.bdz_id;

SELECT * FROM tf_ywz WHERE ywz_id IN ('0000385482','0000383337')
SELECT * FROM YWZXY xy, stationMridxy s WHERE xy.lat IS NULL AND xy.ACTUALID IS NOT NULL AND s.bdz_id=xy.actualid

SELECT s.bdz_id,m.geo_x,m.geo_y
FROM midxy m
  JOIN stationMridxy s
    ON s.pms_id = m.mrid;

