BEGIN -- 13 SQL Statement Syntax

BEGIN -- 13.1 Data Definition Statements

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

BEGIN -- 13.1.20 CREATE VIEW Syntax

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

BEGIN -- 13.1.21 DROP DATABASE Syntax

END -- 13.1.21 DROP DATABASE Syntax

BEGIN -- 13.1.22 DROP EVENT Syntax

END -- 13.1.22 DROP EVENT Syntax

BEGIN -- 13.1.23 DROP FUNCTION Syntax

END -- 13.1.23 DROP FUNCTION Syntax

BEGIN -- 13.1.24 DROP INDEX Syntax

END -- 13.1.24 DROP INDEX Syntax

BEGIN -- 13.1.25 DROP LOGFILE GROUP Syntax

END -- 13.1.25 DROP LOGFILE GROUP Syntax

BEGIN -- 13.1.26 DROP PROCEDURE and DROP FUNCTION Syntax

END -- 13.1.26 DROP PROCEDURE and DROP FUNCTION Syntax

BEGIN -- 13.1.27 DROP SERVER Syntax

END -- 13.1.27 DROP SERVER Syntax

BEGIN -- 13.1.28 DROP TABLE Syntax

END -- 13.1.28 DROP TABLE Syntax

BEGIN -- 13.1.29 DROP TABLESPACE Syntax

END -- 13.1.29 DROP TABLESPACE Syntax

BEGIN -- 13.1.30 DROP TRIGGER Syntax

END -- 13.1.30 DROP TRIGGER Syntax

BEGIN -- 13.1.31 DROP VIEW Syntax

END -- 13.1.31 DROP VIEW Syntax

BEGIN -- 13.1.32 RENAME TABLE Syntax

END -- 13.1.32 RENAME TABLE Syntax

BEGIN -- 13.1.33 TRUNCATE TABLE Syntax

END -- 13.1.33 TRUNCATE TABLE Syntax

END -- 13.1 Data Definition Statements

BEGIN -- 13.2 Data Manipulation Statements

BEGIN -- 13.2.1 CALL Syntax

END -- 13.2.1 CALL Syntax

BEGIN -- 13.2.2 DELETE Syntax

END -- 13.2.2 DELETE Syntax

BEGIN -- 13.2.3 DO Syntax

END -- 13.2.3 DO Syntax

BEGIN -- 13.2.4 HANDLER Syntax

END -- 13.2.4 HANDLER Syntax

BEGIN -- 13.2.5 INSERT Syntax

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

BEGIN -- 13.3 Transactional and Locking Statements

BEGIN -- 13.3.1 START TRANSACTION, COMMIT, and ROLLBACK Syntax

END -- 13.3.1 START TRANSACTION, COMMIT, and ROLLBACK Syntax

BEGIN -- 13.3.2 Statements That Cannot Be Rolled Back

END -- 13.3.2 Statements That Cannot Be Rolled Back

BEGIN -- 13.3.3 Statements That Cause an Implicit Commit

END -- 13.3.3 Statements That Cause an Implicit Commit

BEGIN -- 13.3.4 SAVEPOINT, ROLLBACK TO SAVEPOINT, and RELEASE SAVEPOINT Syntax

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

