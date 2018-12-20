
DROP PROCEDURE IF EXISTS mydata_on_mysql_v8.dorepeat;
DELIMITER //
CREATE PROCEDURE mydata_on_mysql_v8.dorepeat (p1 INT)
BEGIN
      SET @x = 0;
      
      REPEAT
            SET @x = @x + 1;
            
            UNTIL @x > p1
      END REPEAT;
      
END
//
DELIMITER ;

CALL mydata_on_mysql_v8.dorepeat(1000);
SELECT @x;

CREATE FUNCTION hello(s CHAR(20)) RETURNS CHAR(50) DETERMINISTIC
RETURN CONCAT('Hello ',s,'!');

SELECT hello('World');

SHOW CREATE FUNCTION hello;

CREATE TABLE account(acct_num INT,amount DECIMAL(10,2));

CREATE TRIGGER ins_sum BEFORE INSERT ON account
FOR EACH ROW SET @sum=@sum+new.amount;

SET @sum=0;
INSERT INTO account VALUES(137,14.98),(141,1937.50),(97,-100.00);
SELECT @sum;

DELIMITER //
CREATE TRIGGER upd_check BEFORE UPDATE ON mydata_on_mysql_v8.account
FOR EACH ROW
BEGIN
	IF new.amount<0 THEN SET new.amount=0;
	ELSEIF new.amount>100 THEN SET new.amount=100;
	END IF;

END;//
DELIMITER ;


DROP TABLE IF EXISTS test1,test2,test3,test4;

CREATE TABLE test1(a1 INT);
CREATE TABLE test2(a2 INT);
CREATE TABLE test3(a3 INT NOT NULL AUTO_INCREMENT PRIMARY KEY);
CREATE TABLE test4(
	a4 INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	b4 INT DEFAULT 0
);

DROP TRIGGER IF EXISTS testref;
DELIMITER //
CREATE TRIGGER testref BEFORE INSERT ON test1
FOR EACH ROW 
BEGIN
	INSERT INTO test2 SET a2=new.a1;
	DELETE FROM test3 WHERE a3=new.a1;
	UPDATE test4 SET b4=b4+1 WHERE a4=new.a1;
END;//
DELIMITER ;


INSERT INTO test3 (a3) VALUES
  (NULL), (NULL), (NULL), (NULL), (NULL),
  (NULL), (NULL), (NULL), (NULL), (NULL);

SELECT * FROM test1;
SELECT * FROM test2;
SELECT * FROM test3;
SELECT * FROM test4;

INSERT INTO test1 VALUES 
       (1), (3), (1), (7), (1), (8), (4), (4);
       INSERT INTO test4 (a4) VALUES
  (0), (0), (0), (0), (0), (0), (0), (0), (0), (0);
  
  
  
 SHOW PROCESSLIST;
 
 SET GLOBAL event_scheduler=ON;
 SET @@global.event_scheduler=ON;
 SET GLOBAL event_scheduler=1;
 SET @@global.event_scheduler=1;
 
 SET GLOBAL event_scheduler=off;
 
 SET @@global.event_scheduler=off;
 
 SET GLOBAL event_scheduler=0;
 
 SET @@global.event_scheduler=0;
 
 