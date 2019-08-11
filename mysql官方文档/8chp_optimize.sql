CREATE DATABASE 8chp;
USE 8chp;

BEGIN #test
SHOW TABLES;

CREATE TABLE test(
	id TINYINT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
	NAME CHAR(20)
 	);
 	
 INSERT INTO 8chp.test(NAME) VALUES('zhang'),('zhang1'),('zhang2'),('zhang3'),('yuanbo')


SELECT * FROM 8chp.test;

DROP PROCEDURE IF EXISTS 8chp.test0102;
DELIMITER //
CREATE PROCEDURE 8chp.test0102()
BEGIN

	SET @sqlstr=CONCAT('select * from 8chp.test where 1=1 and ?');
	SET @pp='';
	SET @pp=' in (\'zhang\')';
	SELECT @sqlstr,@pp;
	PREPARE stmt FROM @sqlstr;
	EXECUTE stmt USING @pp;
	DEALLOCATE PREPARE stmt;
END //
DELIMITER ;

SELECT * FROM 8chp.test WHERE NAME IN ('zhang','zhang1')
SELECT * FROM 8chp.test WHERE NAME IN ('zhang','zhang1')
CALL 8chp.test0102();


SELECT * FROM information_schema.TABLES WHERE ENGINE='innodb'

END


BEGIN -- 8 Optimization 

BEGIN -- 8.1 Optimization Overview 

# the most importmant factor in making a database apllication fast is its basic design

END -- 8.1 Optimization Overview 

BEGIN -- 8.2 Optimizing SQL Statements 

BEGIN -- 8.2.1 Optimizing SELECT Statements 



END -- 8.2.1 Optimizing SELECT Statements 
BEGIN -- 8.2.2 Subquery Optimization 
END -- 8.2.2 Subquery Optimization 
BEGIN -- 8.2.3 Optimizing INFORMATION_SCHEMA Queries 
END -- 8.2.3 Optimizing INFORMATION_SCHEMA Queries 
BEGIN -- 8.2.4 Optimizing Data Change Statements 
END -- 8.2.4 Optimizing Data Change Statements 
BEGIN -- 8.2.5 Optimizing Database Privileges 
END -- 8.2.5 Optimizing Database Privileges 
BEGIN -- 8.2.6 Other Optimization Tips 
END -- 8.2.6 Other Optimization Tips 
END -- 8.2 Optimizing SQL Statements 
BEGIN -- 8.3 Optimization and Indexes 
BEGIN -- 8.3.1 How MySQL Uses Indexes 
END -- 8.3.1 How MySQL Uses Indexes 
BEGIN -- 8.3.2 Primary Key Optimization 
END -- 8.3.2 Primary Key Optimization 
BEGIN -- 8.3.3 Foreign Key Optimization 
END -- 8.3.3 Foreign Key Optimization 
BEGIN -- 8.3.4 Column Indexes 
END -- 8.3.4 Column Indexes 
BEGIN -- 8.3.5 Multiple-Column Indexes 
END -- 8.3.5 Multiple-Column Indexes 
BEGIN -- 8.3.6 Verifying Index Usage 
END -- 8.3.6 Verifying Index Usage 
BEGIN -- 8.3.7 InnoDB and MyISAM Index Statistics Collection 
END -- 8.3.7 InnoDB and MyISAM Index Statistics Collection 
BEGIN -- 8.3.8 Comparison of B-Tree and Hash Indexes 
END -- 8.3.8 Comparison of B-Tree and Hash Indexes 
END -- 8.3 Optimization and Indexes 
BEGIN -- 8.4 Optimizing Database Structure 
BEGIN -- 8.4.1 Optimizing Data Size 
END -- 8.4.1 Optimizing Data Size 
BEGIN -- 8.4.2 Optimizing MySQL Data Types 
END -- 8.4.2 Optimizing MySQL Data Types 
BEGIN -- 8.4.3 Optimizing for Many Tables 
END -- 8.4.3 Optimizing for Many Tables 
BEGIN -- 8.4.4 Internal Temporary Table Use in MySQL 
END -- 8.4.4 Internal Temporary Table Use in MySQL 
END -- 8.4 Optimizing Database Structure 
BEGIN -- 8.5 Optimizing for InnoDB Tables 
BEGIN -- 8.5.1 Optimizing Storage Layout for InnoDB Tables 
END -- 8.5.1 Optimizing Storage Layout for InnoDB Tables 
BEGIN -- 8.5.2 Optimizing InnoDB Transaction Management 
END -- 8.5.2 Optimizing InnoDB Transaction Management 
BEGIN -- 8.5.3 Optimizing InnoDB Redo Logging 
END -- 8.5.3 Optimizing InnoDB Redo Logging 
BEGIN -- 8.5.4 Bulk Data Loading for InnoDB Tables 
END -- 8.5.4 Bulk Data Loading for InnoDB Tables 
BEGIN -- 8.5.5 Optimizing InnoDB Queries 
END -- 8.5.5 Optimizing InnoDB Queries 
BEGIN -- 8.5.6 Optimizing InnoDB DDL Operations 
END -- 8.5.6 Optimizing InnoDB DDL Operations 
BEGIN -- 8.5.7 Optimizing InnoDB Disk I/O 
END -- 8.5.7 Optimizing InnoDB Disk I/O 
BEGIN -- 8.5.8 Optimizing InnoDB Configuration Variables 
END -- 8.5.8 Optimizing InnoDB Configuration Variables 
BEGIN -- 8.5.9 Optimizing InnoDB for Systems with Many Tables 
END -- 8.5.9 Optimizing InnoDB for Systems with Many Tables 
END -- 8.5 Optimizing for InnoDB Tables 
BEGIN -- 8.6 Optimizing for MyISAM Tables 
BEGIN -- 8.6.1 Optimizing MyISAM Queries 
END -- 8.6.1 Optimizing MyISAM Queries 
BEGIN -- 8.6.2 Bulk Data Loading for MyISAM Tables 
END -- 8.6.2 Bulk Data Loading for MyISAM Tables 
BEGIN -- 8.6.3 Optimizing REPAIR TABLE Statements 
END -- 8.6.3 Optimizing REPAIR TABLE Statements 
END -- 8.6 Optimizing for MyISAM Tables 
BEGIN -- 8.7 Optimizing for MEMORY Tables 
END -- 8.7 Optimizing for MEMORY Tables 
BEGIN -- 8.8 Understanding the Query Execution Plan 
BEGIN -- 8.8.1 Optimizing Queries with EXPLAIN 
END -- 8.8.1 Optimizing Queries with EXPLAIN 
BEGIN -- 8.8.2 EXPLAIN Output Format 
END -- 8.8.2 EXPLAIN Output Format 
BEGIN -- 8.8.3 Extended EXPLAIN Output Format 
END -- 8.8.3 Extended EXPLAIN Output Format 
BEGIN -- 8.8.4 Estimating Query Performance 
END -- 8.8.4 Estimating Query Performance 
END -- 8.8 Understanding the Query Execution Plan 
BEGIN -- 8.9 Controlling the Query Optimizer 
BEGIN -- 8.9.1 Controlling Query Plan Evaluation 
END -- 8.9.1 Controlling Query Plan Evaluation 
BEGIN -- 8.9.2 Switchable Optimizations 
END -- 8.9.2 Switchable Optimizations 
BEGIN -- 8.9.3 Index Hints 
END -- 8.9.3 Index Hints 
END -- 8.9 Controlling the Query Optimizer 
BEGIN -- 8.10 Buffering and Caching 
BEGIN -- 8.10.1 InnoDB Buffer Pool Optimization 
END -- 8.10.1 InnoDB Buffer Pool Optimization 
BEGIN -- 8.10.2 The MyISAM Key Cache 
END -- 8.10.2 The MyISAM Key Cache 
BEGIN -- 8.10.3 The MySQL Query Cache 
END -- 8.10.3 The MySQL Query Cache 
END -- 8.10 Buffering and Caching 
BEGIN -- 8.11 Optimizing Locking Operations 
BEGIN -- 8.11.1 Internal Locking Methods 
END -- 8.11.1 Internal Locking Methods 
BEGIN -- 8.11.2 Table Locking Issues 
END -- 8.11.2 Table Locking Issues 
BEGIN -- 8.11.3 Concurrent Inserts 
END -- 8.11.3 Concurrent Inserts 
BEGIN -- 8.11.4 Metadata Locking 
END -- 8.11.4 Metadata Locking 
BEGIN -- 8.11.5 External Locking 
END -- 8.11.5 External Locking 
END -- 8.11 Optimizing Locking Operations 
BEGIN -- 8.12 Optimizing the MySQL Server 
BEGIN -- 8.12.1 System Factors 
END -- 8.12.1 System Factors 
BEGIN -- 8.12.2 Optimizing Disk I/O 
END -- 8.12.2 Optimizing Disk I/O 
BEGIN -- 8.12.3 Using Symbolic Links 
END -- 8.12.3 Using Symbolic Links 
BEGIN -- 8.12.4 Optimizing Memory Use 
END -- 8.12.4 Optimizing Memory Use 
BEGIN -- 8.12.5 Optimizing Network Use 
END -- 8.12.5 Optimizing Network Use 
END -- 8.12 Optimizing the MySQL Server 
BEGIN -- 8.13 Measuring Performance (Benchmarking) 
BEGIN -- 8.13.1 Measuring the Speed of Expressions and Functions 
END -- 8.13.1 Measuring the Speed of Expressions and Functions 
BEGIN -- 8.13.2 The MySQL Benchmark Suite 
END -- 8.13.2 The MySQL Benchmark Suite 
BEGIN -- 8.13.3 Using Your Own Benchmarks 
END -- 8.13.3 Using Your Own Benchmarks 
BEGIN -- 8.13.4 Measuring Performance with performance_schema 
END -- 8.13.4 Measuring Performance with performance_schema 
END -- 8.13 Measuring Performance (Benchmarking) 
BEGIN -- 8.14 Examining Thread Information 
BEGIN -- 8.14.1 Thread Command Values 
END -- 8.14.1 Thread Command Values 
BEGIN -- 8.14.2 General Thread States 
END -- 8.14.2 General Thread States 
BEGIN -- 8.14.3 Delayed-Insert Thread States 
END -- 8.14.3 Delayed-Insert Thread States 
BEGIN -- 8.14.4 Query Cache Thread States 
END -- 8.14.4 Query Cache Thread States 
BEGIN -- 8.14.5 Replication Master Thread States 
END -- 8.14.5 Replication Master Thread States 
BEGIN -- 8.14.6 Replication Slave I/O Thread States 
END -- 8.14.6 Replication Slave I/O Thread States 
BEGIN -- 8.14.7 Replication Slave SQL Thread States 
END -- 8.14.7 Replication Slave SQL Thread States 
BEGIN -- 8.14.8 Replication Slave Connection Thread States 
END -- 8.14.8 Replication Slave Connection Thread States 
BEGIN -- 8.14.9 NDB Cluster Thread States 
END -- 8.14.9 NDB Cluster Thread States 
BEGIN -- 8.14.10 Event Scheduler Thread States 
END -- 8.14.10 Event Scheduler Thread States 
END -- 8.14 Examining Thread Information 
END -- 8 Optimization 