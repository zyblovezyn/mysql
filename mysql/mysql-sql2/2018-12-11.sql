DROP PROCEDURE IF EXISTS sp2;

DELIMITER //

CREATE PROCEDURE sp2 (IN XVARCHAR (5))
BEGIN
      DECLARE xname VARCHAR (5) DEFAULT 'bob';
      DECLARE newname VARCHAR (5);
      DECLARE xid INT;
      DECLARE done TINYINT DEFAULT 0;
      DECLARE cur1 CURSOR FOR
      SELECT
            xname, id
      FROM
            table1;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
      OPEN cur1;
      read_loop :
      LOOP
            FETCH FROM cur1 INTO newname, xid;
            IF done
            THEN LEAVE read_loop;
            END IF;
            SELECT
                  newname;
      END LOOP;
      CLOSE cur1;
END;
CREATE TABLE sp3 (IN XVARCHAR (5))
BEGIN
      DECLARE xname VARCHAR (5) DEFAULT 'bob';
      DECLARE newname VARCHAR (5);
      DECLARE xid INT;
      DECLARE done TINYINT DEFAULT 0;
      DECLARE cur1 CURSOR FOR
      SELECT
            xname, id
      FROM
            table1;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
      FETCH FROM cur1 INTO newname, id INTO newname, xid;
END DROP PROCEDURE IF EXISTS curdemo ()
BEGIN
      DECLARE done INT DEFAULT FALSE;
      DECLARE a CHAR(16);
      DECLARE b, c INT;
      DECLARE cur1 CURSOR FOR
      SELECT
            id, DATA
      FROM
            test.t1;
      DECLARE cur2 CURSOR FOR
      SELECT
            i
      FROM
            test.t2;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
      OPEN cur1;
      OPEN cur2;
      read_loop :
      LOOP
      END LOOP;
END
DELIMITER //

CREATE PROCEDURE p ()
BEGIN
      DECLARE v INT DEFAULT 1;
      CASE
            v
            WHEN 2
            THEN
            SELECT
                  v;
            WHEN 3
            THEN
            SELECT
                  0;
            ELSE
            BEGIN
            END;
      END CASE;
END;
DROP FUNCTION IF EXISTS comp;
DELIMITER //

CREATE FUNCTION comp (n INT, m INT) RETURNS VARCHAR (20)
BEGIN
      DECLARE s VARCHAR (20);
      IF n > m
      THEN SET s = '>';
      ELSEIF n = m
      THEN SET s = '=';
      ELSE SET s = '<';
      END IF;
      SET s = CONCAT(n, s, m);
      RETURN s;
END //

DELIMITER;

DELIMITER //

CREATE FUNCTION vcomp (n INT, m INT) RETURNS VARCHAR (20)
BEGIN
      DECLARE s VARCHAR (20);
      IF n = m
      THEN SET s = 'equals';
      ELSE IF n > m
      THEN SET s = 'great';
      ELSE SET s = 'less';
      END IF;
      END IF;
      SET s = CONCAT(n, s, ' than ', m);
      RETURN s;
END //

DELIMITER;

DECLARE done TINYINT DEFAULT 0;

DECLARE done TINYINT DECLARE 0;

DECLARE done TINYINT DEFAULT 0;

DECLARE cur1 CURSOR FOR
SELECT
      xname, id
FROM
      table1;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

END DROP PROCEDURE IF EXISTS curdemo ()
BEGIN
DECLARE done INT DEFAULT FALSE;

DECLARE a CHAR(16);

DECLARE b, c INT;

DECLARE cur1 CURSOR FOR
SELECT
      id, DATA
FROM
      test.t1;

DECLARE cur2 CURSOR FOR
SELECT
      i
FROM
      test.t2;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

OPEN cur1;

OPEN cur2;

read_loop :
LOOP

FETCH cur1 INTO a,b;
FETCH cur2 INTO c;
IF done THEN LEAVE read_loop;END IF;
IF b<c THEN 
	INSERT INTO test.t3 VALUES(a,b);
ELSE
	INSERT INTO test.t3 VALUES(a,c);
END IF;
END LOOP;

CLOSE cuer1;CLOSE cur2;


END LOOP;
	
END



CREATE USER 'zhang'@'localhost' IDENTIFIED WITH mysql_native_password;

SET old_passwords=0;

SET PASSWORD FOR 'zhang'@'localhost' ='password';

SELECT * FROM mysql.`user`

DROP USER 'zhang'@'localhost'
