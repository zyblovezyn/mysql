DELIMITER //

DROP PROCEDURE IF EXISTS mydata_on_mysql_v8.sp_sort//

CREATE PROCEDURE mydata_on_mysql_v8.sp_sort(input_number INT)
loopout:BEGIN

	DECLARE l_sort FLOAT;
	SET l_sort=SQRT(input_number);
	SELECT l_sort;

END loopout//
DELIMITER ;

CALL mydata_on_mysql_v8.sp_sort(2);   



SELECT POW(2,2);
SELECT POW(2,3);  -- 幂

SELECT SQRT(3);  -- 平方根 square root



DELIMITER //

DROP PROCEDURE IF EXISTS mydata_on_mysql_v8.sp_sqrt//

CREATE PROCEDURE mydata_on_mysql_v8.sp_sqrt(input_number INT,OUT out_num FLOAT)

loopout:BEGIN

	SET out_num=SQRT(input_number);

END loopout//
DELIMITER ;


CALL mydata_on_mysql_v8.sp_sqrt(12,@num);

SELECT @num;


