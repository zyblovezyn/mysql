
DROP PROCEDURE IF EXISTS mydata_on_mysql_v8.optimize_tables;
DELIMITER //
CREATE PROCEDURE mydata_on_mysql_v8.optimize_tables(db_name VARCHAR(64))
BEGIN
	DECLARE t VARCHAR(64);
	DECLARE done INT DEFAULT 0;
	DECLARE c CURSOR FOR 
		SELECT table_name FROM information_schema.tables
		WHERE table_schema=db_name AND table_type='BASE TABLE';
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done=1;
	OPEN c;
	tables_loop:LOOP
	
		FETCH c INTO t;
		IF done THEN
			LEAVE tables_loop;
		END IF;
		SET @stmt_text=CONCAT('optimize table ',db_name,'.',t);-- select @stmt_text;
		PREPARE stmt FROM @stmt_text;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;	
	END LOOP;
	CLOSE c;
END //
DELIMITER ;

