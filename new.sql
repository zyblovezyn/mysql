SELECT tt FROM tbl_name WHERE DATE_SUB(CURDATE(),INTERVAL 20 DAY)<=date_col;
subtract 减去

SELECT CURDATE();
SELECT NOW();
SELECT CURTIME();

SELECT DAYOFMONTH(NOW());

SELECT DATE_ADD('2019-06-01',INTERVAL 2 DAY);

SELECT DAYNAME(NOW());

SELECT DATE_ADD('2018-01-02',INTERVAL 31 DAY);
SELECT ADDDATE('2018-1-02',INTERVAL 31 DAY);

SELECT CONVERT_TZ('2014-01-01 12:00:00','GMT','MET')
SELECT CONVERT_TZ('2004-01-01 12:00:00','+00:00','+10:00');

SELECT CURDATE()

SELECT CURDATE()+0;

SELECT CURTIME();

SELECT CURTIME()+0;

SELECT DATE('2013-12-31 01:02:03');

#datediff