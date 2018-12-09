BEGIN -- 13 SQL Statement Syntax

BEGIN -- 13.1 Data Definition Statements ok

BEGIN -- 13.1.1 ALTER DATABASE Syntax

END -- 13.1.1 ALTER DATABASE Syntax

BEGIN -- 13.1.2 ALTER EVENT Syntax

END -- 13.1.2 ALTER EVENT Syntax

BEGIN -- 13.1.3 ALTER FUNCTION Syntax

END -- 13.1.3 ALTER FUNCTION Syntax

BEGIN -- 13.1.4 ALTER LOGFILE GROUP Syntax

END -- 13.1.4 ALTER LOGFILE GROUP Syntax

BEGIN -- 13.1.5 ALTER PROCEDURE Syntax

END -- 13.1.5 ALTER PROCEDURE Syntax

BEGIN -- 13.1.6 ALTER SERVER Syntax

END -- 13.1.6 ALTER SERVER Syntax

BEGIN -- 13.1.7 ALTER TABLE Syntax

END -- 13.1.7 ALTER TABLE Syntax

BEGIN -- 13.1.8 ALTER TABLESPACE Syntax

END -- 13.1.8 ALTER TABLESPACE Syntax

BEGIN -- 13.1.9 ALTER VIEW Syntax

END -- 13.1.9 ALTER VIEW Syntax

BEGIN -- 13.1.10 CREATE DATABASE Syntax

END -- 13.1.10 CREATE DATABASE Syntax

BEGIN -- 13.1.11 CREATE EVENT Syntax

END -- 13.1.11 CREATE EVENT Syntax

BEGIN -- 13.1.12 CREATE FUNCTION Syntax

END -- 13.1.12 CREATE FUNCTION Syntax

BEGIN -- 13.1.13 CREATE INDEX Syntax

END -- 13.1.13 CREATE INDEX Syntax

BEGIN -- 13.1.14 CREATE LOGFILE GROUP Syntax

END -- 13.1.14 CREATE LOGFILE GROUP Syntax

BEGIN -- 13.1.15 CREATE PROCEDURE and CREATE FUNCTION Syntax

END -- 13.1.15 CREATE PROCEDURE and CREATE FUNCTION Syntax

BEGIN -- 13.1.16 CREATE SERVER Syntax

END -- 13.1.16 CREATE SERVER Syntax

BEGIN -- 13.1.17 CREATE TABLE Syntax

END -- 13.1.17 CREATE TABLE Syntax

BEGIN -- 13.1.18 CREATE TABLESPACE Syntax ok

CREATE TABLESPACE tablespace_name
    ADD DATAFILE 'file_name'
    USE LOGFILE GROUP logfile_group
    [EXTENT_SIZE [=] EXTENT_SIZE]
    [INITIAL_SIZE [=] INITIAL_SIZE]
    [AUTOEXTEND_SIZE [=] AUTOEXTEND_SIZE]
    [MAX_SIZE [=] MAX_SIZE]
    [NODEGROUP [=] nodegroup_id]
    [WAIT]
    [COMMENT [=] comment_text]
    ENGINE [=] engine_name
    
    
    
SELECT logfile_group_name,file_name,extra FROM information_schema.`FILES`


END -- 13.1.18 CREATE TABLESPACE Syntax

BEGIN -- 13.1.19 CREATE TRIGGER Syntax ok

CREATE
    [DEFINER = { USER | CURRENT_USER }]
    TRIGGER trigger_name
    trigger_time trigger_event
    ON tbl_name FOR EACH ROW
    trigger_body

trigger_time: { BEFORE | AFTER }

trigger_event: { INSERT | UPDATE | DELETE }

END -- 13.1.19 CREATE TRIGGER Syntax

BEGIN -- 13.1.20 CREATE VIEW Syntax ok


CREATE
    [OR REPLACE]
    [ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]
    [DEFINER = { USER | CURRENT_USER }]
    [SQL SECURITY { DEFINER | INVOKER }]
    VIEW view_name [(column_list)]
    AS select_statement
    [WITH [CASCADED | LOCAL] CHECK OPTION]
 
CREATE VIEW test.v AS SELECT * FROM t;

CREATE VIEW v_today (today) AS SELECT CURRENT_DATE;

SELECT v_today.`today` FROM v_today;

DROP TABLE t;
DROP VIEW v;
CREATE TABLE t(qty INT,price INT);
INSERT INTO t VALUES(3,50);
CREATE VIEW v AS SELECT qty,price,qty*price AS VALUE FROM t;
SELECT * FROM v;


-- A view definition is subject to the following restrictions:
-- 
-- The SELECT statement cannot contain a subquery in the FROM clause.
-- 
-- The SELECT statement cannot refer to system variables or user-defined variables.
-- 
-- Within a stored program, the SELECT statement cannot refer to program parameters or local variables.
-- 
-- The SELECT statement cannot refer to prepared statement parameters.
-- 
-- Any table or view referred to in the definition must exist. If, after the view has been created, a table or view that the definition refers to is dropped, use of the view results in an error. To check a view definition for problems of this kind, use the CHECK TABLE statement.
-- 
-- The definition cannot refer to a TEMPORARY table, and you cannot create a TEMPORARY view.
-- 
-- You cannot associate a trigger with a view.
-- 
-- Aliases for column names in the SELECT statement are checked against the maximum column length of 64 characters (not the maximum alias length of 256 characters).

DROP VIEW v;CREATE VIEW v (mycol) AS SELECT 'abc';
SET @@sql_mode='';
SELECT mycol FROM v;

SET @@sql_mode='ANSI_QUOTES';
SELECT "mycol" FROM v;


END -- 13.1.20 CREATE VIEW Syntax

BEGIN -- 13.1.21 DROP DATABASE Syntax ok

DROP {DATABASE | SCHEMA} [IF EXISTS] db_name

END -- 13.1.21 DROP DATABASE Syntax

BEGIN -- 13.1.22 DROP EVENT Syntax ok

DROP EVENT [IF EXISTS] event_name

END -- 13.1.22 DROP EVENT Syntax

BEGIN -- 13.1.23 DROP FUNCTION Syntax ok

END -- 13.1.23 DROP FUNCTION Syntax

BEGIN -- 13.1.24 DROP INDEX Syntax ok

DROP [ONLINE|OFFLINE] INDEX index_name ON tbl_name

DROP INDEX `PRIMARY` ON t;
-- The ONLINE and OFFLINE keywords are available only in NDB Cluster

END -- 13.1.24 DROP INDEX Syntax

BEGIN -- 13.1.25 DROP LOGFILE GROUP Syntax ok

DROP LOGFILE GROUP logfile_group
    ENGINE [=] engine_name


END -- 13.1.25 DROP LOGFILE GROUP Syntax

BEGIN -- 13.1.26 DROP PROCEDURE and DROP FUNCTION Syntax ok

DROP {PROCEDURE | FUNCTION} [IF EXISTS] sp_name

END -- 13.1.26 DROP PROCEDURE and DROP FUNCTION Syntax

BEGIN -- 13.1.27 DROP SERVER Syntax ok

DROP SERVER [IF EXISTS] server_name;

END -- 13.1.27 DROP SERVER Syntax

BEGIN -- 13.1.28 DROP TABLE Syntax ok

DROP [TEMPORARY] TABLE [IF EXISTS] tbl_name [.tbl_name] ... [RESTRICT|CASCADE]

END -- 13.1.28 DROP TABLE Syntax

BEGIN -- 13.1.29 DROP TABLESPACE Syntax ok

DROP TABLESPACE tablespace_name ENGINE[=] engine_name;

-- DROP TABLESPACE is useful only with Disk Data storage for NDB Cluster. 

END -- 13.1.29 DROP TABLESPACE Syntax

BEGIN -- 13.1.30 DROP TRIGGER Syntax ok

DROP TRIGGER [IF EXISTS] [shceme_name.]trigger_name;

-- Triggers for a table are also dropped if you drop the table.

END -- 13.1.30 DROP TRIGGER Syntax

BEGIN -- 13.1.31 DROP VIEW Syntax ok

DROP VIEW [IF EXISTS] view_name [,view_name] [RESTRICT|CASCADE]

END -- 13.1.31 DROP VIEW Syntax

BEGIN -- 13.1.32 RENAME TABLE Syntax ok

RENAME TABLE old_tbl TO new_tbl[,tbl_name2 TO new_tbl_name2] ...

RENAME TABLE old_table TO new_table;
-- That statement is equivalent to the following ALTER TABLE statement:
ALTER TABLE old_table RENAME new_table;

-- it can rename multiple tables whitin a single statement.
RENAME TABLE old_tbl1 TO new_tbl1,
	     old_tbl2 TO new_tbl2,
	     old_tbl3 TO new_tbl3;

-- You can use RENAME TABLE to move a table from one database to another:
RENAME TABLE schema_old.old_tbl TO schema_new.new_tbl

-- If a table has triggers, attempts to rename the table into a different database fail with a Trigger in wrong schema (ER_TRG_IN_WRONG_SCHEMA) error.
-- 
-- To rename TEMPORARY tables, RENAME TABLE does not work. Use ALTER TABLE instead.
-- 
-- RENAME TABLE works for views, except that views cannot be renamed into a different database.

END -- 13.1.32 RENAME TABLE Syntax

BEGIN -- 13.1.33 TRUNCATE TABLE Syntax

TRUNCATE [TABLE] tbl_name

-- TRUNCATE TABLE empties a table completely. It requires the DROP privilege.

END -- 13.1.33 TRUNCATE TABLE Syntax

END -- 13.1 Data Definition Statements

BEGIN -- 13.2 Data Manipulation Statements

BEGIN -- 13.2.1 CALL Syntax ok

END -- 13.2.1 CALL Syntax

BEGIN -- 13.2.2 DELETE Syntax ok

END -- 13.2.2 DELETE Syntax

BEGIN -- 13.2.3 DO Syntax ok

END -- 13.2.3 DO Syntax

BEGIN -- 13.2.4 HANDLER Syntax ok

END -- 13.2.4 HANDLER Syntax

BEGIN -- 13.2.5 INSERT Syntax ok

INSERT [LOW_PRIORITY | DELAYED | HIGH_PRIORITY] [IGNORE]
    [INTO] tbl_name
    [(col_name [, col_name] ...)]
    {VALUES | VALUE} (value_list) [, (value_list)] ...
    [ON DUPLICATE KEY UPDATE assignment_list]

INSERT [LOW_PRIORITY | DELAYED | HIGH_PRIORITY] [IGNORE]
    [INTO] tbl_name
    SET assignment_list
    [ON DUPLICATE KEY UPDATE assignment_list]

INSERT [LOW_PRIORITY | HIGH_PRIORITY] [IGNORE]
    [INTO] tbl_name
    [(col_name [, col_name] ...)]
    SELECT ...
    [ON DUPLICATE KEY UPDATE assignment_list]

VALUE:
    {expr | DEFAULT}

value_list:
    VALUE [, VALUE] ...

assignment:
    col_name = VALUE

assignment_list:
    assignment [, assignment] ...

-- if both the column list and the values list are empty,insert creates
-- a row with each column set to its default value.
INSERT INTO tbl_name() VALUES();

INSERT INTO tbl_name(col1,col2) VALUES(15, col1*2); -- right

INSERT INTO tbl_name(col1,col2) VALUES(col2*2,15);-- not legal,because col2 after col1

INSERT INTO tbl_name(a,b,c) VALUES(1,2,3),(4,5,6),(7,8,9)

-- value is synonym for values in this context.

SELECT ROW_COUNT();
SELECT mysql_info();

BEGIN -- 13.2.5.1 INSERT ... SELECT Syntax ok

INSERT [LOW_PRIORITY | HIGH_PRIORITY] [IGNORE]
    [INTO] tbl_name
    [(col_name [, col_name] ...)]
    SELECT ...
    [ON DUPLICATE KEY UPDATE assignment_list]

VALUE:
    {expr | DEFAULT}

assignment:
    col_name = VALUE

assignment_list:
    assignment [, assignment] ...
    

INSERT INTO tbl_name(field1) SELECT tbl_name1.filed1 FROM tbl_name1 
WHERE tbl_name1.filed1>100


BEGIN -- 13.2.5.1 INSERT ... SELECT Syntax

END -- 13.2.5 INSERT Syntax

BEGIN -- 13.2.6 LOAD DATA INFILE Syntax

END -- 13.2.6 LOAD DATA INFILE Syntax

BEGIN -- 13.2.7 LOAD XML Syntax

END -- 13.2.7 LOAD XML Syntax

BEGIN -- 13.2.8 REPLACE Syntax

END -- 13.2.8 REPLACE Syntax

BEGIN -- 13.2.9 SELECT Syntax

END -- 13.2.9 SELECT Syntax

BEGIN -- 13.2.10 Subquery Syntax

END -- 13.2.10 Subquery Syntax

BEGIN -- 13.2.11 UPDATE Syntax

END -- 13.2.11 UPDATE Syntax

END -- 13.2 Data Manipulation Statements

BEGIN -- 13.2.5.2 INSERT ... ON DUPLICATE KEY UPDATE Syntax ok

-- the two statement have similar effect.if column a is declared as unique and conctains the value 1
INSERT INTO t1 (a,b,c) VALUES(1,2,3)
ON DUPLICATE KEY UPDATE c+=1;

UPDATE t1 SET c+=1 WHERE a=1;


INSERT INTO t1(a,b) 
SELECT c,d FROM t2
UNION
SELECT e,f FROM t3
ON DUPLICATE KEY UPDATE b=b+c;

INSERT INTO t1(a,b)
SELECT * FROM 
(SELECT c,d FROM t2 UNION SELECT e,f FROM t3) AS dt
ON DUPLICATE KEY UPDATE b=b+c;


END -- 13.2.5.2 INSERT ... ON DUPLICATE KEY UPDATE Syntax

BEGIN -- 13.2.5.3 INSERT DELAYED Syntax ok


END -- 13.2.5.3 INSERT DELAYED Syntax


END -- 13.2.5 INSERT Syntax

BEGIN -- 13.2.6 LOAD DATA INFILE Syntax

END -- 13.2.6 LOAD DATA INFILE Syntax

BEGIN -- 13.2.7 LOAD XML Syntax

END -- 13.2.7 LOAD XML Syntax

BEGIN -- 13.2.8 REPLACE Syntax ok


REPLACE [LOW_PRIORITY | DELAYED]
    [INTO] tbl_name
    [(col_name [, col_name] ...)]
    {VALUES | VALUE} (value_list) [, (value_list)] ...

REPLACE [LOW_PRIORITY | DELAYED]
    [INTO] tbl_name
    SET assignment_list

REPLACE [LOW_PRIORITY | DELAYED]
    [INTO] tbl_name
    [(col_name [, col_name] ...)]
    SELECT ...

VALUE:
    {expr | DEFAULT}

value_list:
    VALUE [, VALUE] ...

assignment:
    col_name = VALUE

assignment_list:
    assignment [, assignment] ...
    
 
DROP TABLE IF EXISTS test     
CREATE TABLE test(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	DATA VARCHAR(64) DEFAULT NULL,
	ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY(id)
);

REPLACE INTO test VALUES(1,'Old','2014-08-20 18:47:00');
SELECT * FROM test;
REPLACE INTO test VALUES(1,'New','2014-08-20 18:47:42');


CREATE TABLE test2(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	DATA VARCHAR(64) NOT NULL,
	ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY(id,ts)
);

REPLACE INTO test2 VALUES(1,'old','2014-08-20 18:47:00');
REPLACE INTO test2 VALUES(1,'new','2014-08-20 18:47:42');

SELECT * FROM test2;


END -- 13.2.8 REPLACE Syntax

BEGIN -- 13.2.9 SELECT Syntax ok

SELECT
    [ALL | DISTINCT | DISTINCTROW ]
      [HIGH_PRIORITY]
      [STRAIGHT_JOIN]
      [SQL_SMALL_RESULT] [SQL_BIG_RESULT] [SQL_BUFFER_RESULT]
      [SQL_CACHE | SQL_NO_CACHE] [SQL_CALC_FOUND_ROWS]
    select_expr [, select_expr ...]
    [FROM table_references
    [WHERE where_condition]
    [GROUP BY {col_name | expr | POSITION}
      [ASC | DESC], ... [WITH ROLLUP]]
    [HAVING where_condition]
    [ORDER BY {col_name | expr | POSITION}
      [ASC | DESC], ...]
    [LIMIT {[OFFSET,] ROW_COUNT | ROW_COUNT OFFSET OFFSET}]
    [PROCEDURE procedure_name(argument_list)]
    [INTO OUTFILE 'file_name'
        [CHARACTER SET charset_name]
        export_options
      | INTO DUMPFILE 'file_name'
      | INTO var_name [, var_name]]
    [FOR UPDATE | LOCK IN SHARE MODE]]

SELECT 1+1;

SELECT 1+1 FROM DUAL;

BEGIN -- 13.2.9.1 SELECT ... INTO Syntax ok

SELECT CONCAT(last_name,'，',first_name) AS fullname
FROM mytable ORDER BY fullname;

SET @a=1;
PREPARE stmt FROM 'select * from tbl limit ?';
EXECUTE stmt USING @a;

SET @skip=1;SET @numrows=5;
PREPARE stmt FROM 'select * from tbl limit ?,?';
EXECUTE stmt @skip,@numrows;

(SELECT ... LIMIT 1) LIMIT 2; -- 显示结果为2

SELECT id,DATE INTO @x,@y FROM test.t1 LIMIT 1;

SELECT a,b,a+b OUTFILE 'C:\Users\zhang\Desktop\文档\outfile.sql'
FIELDS TERMINATED BY ' ' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM test_table;



END -- 13.2.9.1 SELECT ... INTO Syntax 

BEGIN -- 13.2.9.2 JOIN Syntax ok 

table_references:
    escaped_table_reference [, escaped_table_reference] ...

escaped_table_reference:
    table_reference
  | { OJ table_reference }

table_reference:
    table_factor
  | join_table

table_factor:
    tbl_name [[AS] alias] [index_hint_list]
  | table_subquery [AS] alias
  | ( table_references )

join_table:
    table_reference [INNER | CROSS] JOIN table_factor [join_condition]
  | table_reference STRAIGHT_JOIN table_factor
  | table_reference STRAIGHT_JOIN table_factor ON conditional_expr
  | table_reference {LEFT|RIGHT} [OUTER] JOIN table_reference join_condition
  | table_reference NATURAL [{LEFT|RIGHT} [OUTER]] JOIN table_factor

join_condition:
    ON conditional_expr
  | USING (column_list)

index_hint_list:
    index_hint [, index_hint] ...

index_hint:
    USE {INDEX|KEY}
      [FOR {JOIN|ORDER BY|GROUP BY}] ([index_list])
  | IGNORE {INDEX|KEY}
      [FOR {JOIN|ORDER BY|GROUP BY}] (index_list)
  | FORCE {INDEX|KEY}
      [FOR {JOIN|ORDER BY|GROUP BY}] (index_list)

index_list:
    index_name [, index_name] ...
    
    
SELECT * FROM t1 LEFT JOIN (t4,t2,t3)
ON (t2.a=t1.a AND t3.b=t1.b AND t4.c=t1.c);

SELECT * FROM t1 LEFT JOIN (t2 CROSS JOIN t3 CROSS JOIN t4)
ON (t2.a=t1.a AND t3.b=t1.b AND t4.c=t1.c);

-- in  mysql join ,cross join ,inner join are syntactic equivalents

SELECT t1.name,t2.salary FROM emplyee AS t1 INNER JOIN info AS t2 ON t1.name=t2.name;

SELECT t1.name,t2.salary FROM employee t1 INNER JOIN t2 ON t1.name=t2.name;

SELECT * FROM (SELECT 1,2,3) AS t1;

SELECT left_tbl.* FROM left_tbl LEFT JOIN right_tbl ON left_tbl.id=right_tbl.id WHERE right_tbl.id IS NULL;

SHOW CREATE TABLE test2;

CREATE TABLE a(
id INT NOT NULL AUTO_INCREMENT,
ts TIMESTAMP NOT NULL 
DEFAULT CURRENT_TIMESTAMP 
ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY(id));

CREATE TABLE b(
id INT NOT NULL AUTO_INCREMENT,
ts TIMESTAMP NOT NULL 
DEFAULT CURRENT_TIMESTAMP 
ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY(id));

CREATE TABLE c(
id INT NOT NULL AUTO_INCREMENT,
ts TIMESTAMP NOT NULL 
DEFAULT CURRENT_TIMESTAMP 
ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY(id));

SELECT * FROM c
DELETE FROM c WHERE id<5;

INSERT INTO a(ts) VALUES(CURRENT_TIMESTAMP);
INSERT INTO b(ts) VALUES(CURRENT_TIMESTAMP);

INSERT INTO c(ts) VALUES(CURRENT_TIMESTAMP);

SELECT * FROM a,b;

SELECT * FROM a INNER JOIN b ON a.id=b.`id`;

SELECT * FROM a LEFT JOIN b ON a.id=b.id;

SELECT * FROM a LEFT JOIN b USING(id);

SELECT * FROM a LEFT JOIN b ON a.id=b.id LEFT JOIN c ON b.id=c.id

SELECT * FROM a NATURAL JOIN b;

SELECT * FROM a JOIN b;

COALESCE(X,Y)=(CASE X WHEN X IS NULL THEN X ELSE Y END)

SELECT REPEAT('a',1) UNION SELECT REPEAT('b',10);


END -- 13.2.9.2 JOIN Syntax

BEGIN -- 13.2.9.3 UNION Syntax ok

END -- 13.2.9.3 UNION Syntax



END -- 13.2.9 SELECT Syntax

BEGIN -- 13.2.10 Subquery Syntax ok

CREATE TABLE t1(s1 INT);
INSERT INTO t1 VALUES(1);
CREATE TABLE t2(s1 INT);
INSERT INTO t2 VALUES(2);

SELECT (SELECT s1 FROM t2) FROM t1;

SELECT UPPER((SELECT s1 FROM t1)) FROM t2;

SELECT * FROM t1 WHERE column1=(SELECT MAX(column2) FROM t2);

SELECT s1 FROM t1 WHERE s1>ANY(SELECT s1 FROM t2);

SELECT s1 FROM t1 WHERE s1=ANY(SELECT s1 FROM t2);
SELECT s1 FROM t1 WHERE s1 IN (SELECT s1 FROM t2);

-- The word SOME is an alias for ANY. Thus, these two statements are the same:

SELECT s1 FROM t1 WHERE s1 <> ANY  (SELECT s1 FROM t2);
SELECT s1 FROM t1 WHERE s1 <> SOME (SELECT s1 FROM t2);

SELECT s1 FROM t1 WHERE s1 > ALL(SELECT s1 FROM t2);

-- not in is alias for <> all.thus ,these two statements are the same.
SELECT s1 FROM t1 WHERE s1 <> ALL (SELECT s1 FROM t2);
SELECT s1 FROM t1 WHERE s1 NOT IN (SELECT s1 FROM t2);

SELECT * FROM t1
WHERE (col1,col2)=(SELECT col3,col4 FROM t2 WHERE id=10);

SELECT * FROM t1
WHERE ROW(col1,col2)=(SELECT col3,col4 FROM t2 WHERE id=10);

-- The expressions (1,2) and ROW(1,2) are sometimes called row constructors. The two are equivalent

SELECT * FROM t1 WHERE ROW(1)=(SELECT column1 FROM t2);

SELECT * FROM t1 WHERE (column1,column2)=(1,1);

SELECT * FROM t1 column1=1 AND column2=1;

SELECT column1,column2,column3 FROM t1 WHERE 
(column1,column2,column3) IN
(SELECT column1,column2,column3 FROM t2);

SELECT * FROM t1 WHERE column1=ANY(SELECT column1 FROM t2 WHERE t2.column2=t1.column2);

SELECT column1 FROM t1 AS X(
	WHERE x.column1=(SELECT column1 FROM t2 AS X
		WHERE x.column1=(SELECT column1 FROM t3
			WHERE x.column2=t3.column1)
));

DROP TABLE t1;
CREATE TABLE t1 (s1 INT,s2 CHAR(5),s3 FLOAT);

INSERT INTO t1 VALUES (1,'1',1.0);
INSERT INTO t1 VALUES (2,'2',2.0);

SELECT sb1,sb2,sb3
FROM (SELECT s1 AS sb1,s2 AS sb2,s3*2 AS sb3 FROM t1) AS sb
WHERE sb1>1;

SELECT AVG(SUM(s1)) FROM t1 GROUP BY s1;

SELECT AVG(sum_column1) FROM
(SELECT SUM(s1) AS sum_column1 FROM t1 GROUP BY s1) AS t1


CREATE DATABASE d1;
USE d1;
CREATE TABLE t1(c1 INT);
CREATE TABLE t2(c1 INT);

CREATE FUNCTION f1(p1 INT) RETURN INT
BEGIN
	INSERT INTO t2 VALUES(p1);
	RETURN p1;
RETURN p1;
END;

SELECT * FROM t2;

EXPLAIN SELECT * FROM t2 \G;

SELECT * FROM t1 WHERE t1.column1 IN (SELECT column1 FROM t2 ORDER BY column1);

SELECT * FROM t1 WHERE t1.column1 IN (SELECT DISTINCT column1 FROM t2);

SELECT * FROM t1 WHERE EXISTS (SELECT * FROM t2 LIMIT 1);

SELECT DISTINCT column1 FROM t1 WHERE t1.column1 IN (SELECT column1 FROM t2);

SELECT DISTINCT t1.column1 FROM t1,t2 WHERE t1.column1=t2.column2;

SELECT * FROM t1
     WHERE s1 IN (SELECT s1 FROM t1 UNION ALL SELECT c1 FROM t2);
     
SELECT * FROM t1
     WHERE s1 IN (SELECT s1 FROM t1) OR s1 IN (SELECT s1 FROM t2);
     
SELECT (SELECT column1+5 FROM t1) FROM t2;

SELECT (SELECT column1 FROM t1)+5 FROM t2;

SELECT * FROM t1
	WHERE (column1,column2) IN (SELECT column1,column2 FROM t2);
	
SELECT * FROM t1
	WHERE EXISTS (SELECT * FROM t2 WHERE t2.column1=t1.column1 AND t1.column2=t2.column2);
	
WHERE 5> ALL(SELECT X FROM t);
might be treated BY the optimizer LIKE this:
WHERE 5>(SELECT MAX(X) FROM t);

SELECT * FROM t1 WHERE id IN (SELECT id FROM t2);

SELECT DISTINCT t1.* FROM t1,t2 WHERE t1.id=t2.id;

SELECT * FROM t1 WHERE id NOT IN (SELECT id FROM t2);

SELECT * FROM t1 WHERE NOT EXISTS (SELECT id FROM t2 WHERE t1.id=t2.id);

SELECT tbl1.* FROM tbl1 LEFT JOIN tbl2 ON tbl1.id=tbl2.id
WHERE tbl2.id IS NULL;


 
END -- 13.2.10 Subquery Syntax

BEGIN -- 13.2.11 UPDATE Syntax ok
Single-TABLE syntax:

UPDATE [LOW_PRIORITY] [IGNORE] table_reference
    SET assignment_list
    [WHERE where_condition]
    [ORDER BY ...]
    [LIMIT ROW_COUNT]

VALUE:
    {expr | DEFAULT}

assignment:
    col_name = VALUE

assignment_list:
    assignment [, assignment] ...


Multiple-TABLE syntax:

UPDATE [LOW_PRIORITY] [IGNORE] table_references
    SET assignment_list
    [WHERE where_condition]
    
UPDATE t1 SET col1=col1+1;

UPDATE t1 SET col1=col1+1,col2=col1;

UPDATE items,MONTH SET items.price=month.price WHERE items.id=month.id;


END -- 13.2.11 UPDATE Syntax

END -- 13.2 Data Manipulation Statements

BEGIN -- 13.3 Transactional and Locking Statements

START TRANSACTION [WITH CONSISTENT SNAPSHOT]
-- BEGIN [WORK]
-- COMMIT [WORK] [AND [NO] CHAIN] [[NO] RELEASE]
-- ROLLBACK [WORK] [AND [NO] CHAIN] [[NO] RELEASE]
-- SET autocommit = {0 | 1}
-- 
-- 
-- start transaction;
-- select @A:=sum(salary) from tbl1 where type=1;
-- update tbl2 set summary=@A where type=1;
-- commit;

START TRANSACTION WITH CONSISTENT SNAPSHOT;

-- To disable autocommit mode explicitly,use the fllowing statement.

SET autocommit=0;


BEGIN -- 13.3.1 START TRANSACTION, COMMIT, and ROLLBACK Syntax ok

END -- 13.3.1 START TRANSACTION, COMMIT, and ROLLBACK Syntax

BEGIN -- 13.3.2 Statements That Cannot Be Rolled Back ok

END -- 13.3.2 Statements That Cannot Be Rolled Back

BEGIN -- 13.3.3 Statements That Cause an Implicit Commit

END -- 13.3.3 Statements That Cause an Implicit Commit

BEGIN -- 13.3.4 SAVEPOINT, ROLLBACK TO SAVEPOINT, and RELEASE SAVEPOINT Syntax

SAVEPOINT identifier
ROLLBACK [WORK] TO [SAVEPOINT] identifier
RELEASE SAVEPOINT identifier

END -- 13.3.4 SAVEPOINT, ROLLBACK TO SAVEPOINT, and RELEASE SAVEPOINT Syntax

BEGIN -- 13.3.5 LOCK TABLES and UNLOCK TABLES Syntax

END -- 13.3.5 LOCK TABLES and UNLOCK TABLES Syntax

BEGIN -- 13.3.6 SET TRANSACTION Syntax

END -- 13.3.6 SET TRANSACTION Syntax

BEGIN -- 13.3.7 XA Transactions

END -- 13.3.7 XA Transactions

END -- 13.3 Transactional and Locking Statements

BEGIN -- 13.4 Replication Statements

BEGIN -- 13.4.1 SQL Statements for Controlling Master Servers

END -- 13.4.1 SQL Statements for Controlling Master Servers

BEGIN -- 13.4.2 SQL Statements for Controlling Slave Servers

END -- 13.4.2 SQL Statements for Controlling Slave Servers

END -- 13.4 Replication Statements

BEGIN -- 13.5 Prepared SQL Statement Syntax

BEGIN -- 13.5.1 PREPARE Syntax

END -- 13.5.1 PREPARE Syntax

BEGIN -- 13.5.2 EXECUTE Syntax

END -- 13.5.2 EXECUTE Syntax

BEGIN -- 13.5.3 DEALLOCATE PREPARE Syntax

END -- 13.5.3 DEALLOCATE PREPARE Syntax

BEGIN -- 13.5.4 Automatic Prepared Statement Repreparation

END -- 13.5.4 Automatic Prepared Statement Repreparation

END -- 13.5 Prepared SQL Statement Syntax

BEGIN -- 13.6 Compound-Statement Syntax

BEGIN -- 13.6.1 BEGIN ... END Compound-Statement Syntax

END -- 13.6.1 BEGIN ... END Compound-Statement Syntax

BEGIN -- 13.6.2 Statement Label Syntax

END -- 13.6.2 Statement Label Syntax

BEGIN -- 13.6.3 DECLARE Syntax

END -- 13.6.3 DECLARE Syntax

BEGIN -- 13.6.4 Variables in Stored Programs

END -- 13.6.4 Variables in Stored Programs

BEGIN -- 13.6.5 Flow Control Statements

END -- 13.6.5 Flow Control Statements

BEGIN -- 13.6.6 Cursors

END -- 13.6.6 Cursors

BEGIN -- 13.6.7 Condition Handling

END -- 13.6.7 Condition Handling

END -- 13.6 Compound-Statement Syntax

BEGIN -- 13.7 Database Administration Statements

BEGIN -- 13.7.1 Account Management Statements

END -- 13.7.1 Account Management Statements

BEGIN -- 13.7.2 Table Maintenance Statements

END -- 13.7.2 Table Maintenance Statements

BEGIN -- 13.7.3 Plugin and User-Defined Function Statements

END -- 13.7.3 Plugin and User-Defined Function Statements

BEGIN -- 13.7.4 SET Syntax

END -- 13.7.4 SET Syntax

BEGIN -- 13.7.5 SHOW Syntax

END -- 13.7.5 SHOW Syntax

BEGIN -- 13.7.6 Other Administrative Statements

END -- 13.7.6 Other Administrative Statements

END -- 13.7 Database Administration Statements

BEGIN -- 13.8 Utility Statements

BEGIN -- 13.8.1 DESCRIBE Syntax

END -- 13.8.1 DESCRIBE Syntax

BEGIN -- 13.8.2 EXPLAIN Syntax

END -- 13.8.2 EXPLAIN Syntax

BEGIN -- 13.8.3 HELP Syntax

END -- 13.8.3 HELP Syntax

BEGIN -- 13.8.4 USE Syntax

END -- 13.8.4 USE Syntax

END -- 13.8 Utility Statements

END -- 13 SQL Statement Syntax

