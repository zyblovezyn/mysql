
BEGIN -- 14 The InnoDB Storage Engine 
BEGIN -- 14.1 Introduction to InnoDB 
BEGIN -- 14.1.1 Benefits of Using InnoDB Tables 
END -- 14.1.1 Benefits of Using InnoDB Tables 
BEGIN -- 14.1.2 Best Practices for InnoDB Tables 
END -- 14.1.2 Best Practices for InnoDB Tables 
BEGIN -- 14.1.3 Checking InnoDB Availability 

SHOW ENGINES;

SELECT * FROM information_schema.ENGINES;

SHOW VARIABLES;

ALTER TABLE tbl_name ENGINE=INNODB;

CREATE TABLE innodb_table ENGINE=INNODB AS SELECT * FROM other_engine_table;




END -- 14.1.3 Checking InnoDB Availability 
BEGIN -- 14.1.4 Upward and Downward Compatibility 
END -- 14.1.4 Upward and Downward Compatibility 
BEGIN -- 14.1.5 Testing and Benchmarking with InnoDB 
END -- 14.1.5 Testing and Benchmarking with InnoDB 
BEGIN -- 14.1.6 Turning Off InnoDB 
END -- 14.1.6 Turning Off InnoDB 
BEGIN -- 14.1.7 Third-Party Software Contributions 
END -- 14.1.7 Third-Party Software Contributions 
END -- 14.1 Introduction to InnoDB 
BEGIN -- 14.2 Installing the InnoDB Storage Engine 
END -- 14.2 Installing the InnoDB Storage Engine 
BEGIN -- 14.3 Upgrading the InnoDB Storage Engine 
END -- 14.3 Upgrading the InnoDB Storage Engine 
BEGIN -- 14.4 Downgrading the InnoDB Storage Engine 
END -- 14.4 Downgrading the InnoDB Storage Engine 
BEGIN -- 14.5 InnoDB and the ACID Model 
END -- 14.5 InnoDB and the ACID Model 
BEGIN -- 14.6 InnoDB Multi-Versioning 
END -- 14.6 InnoDB Multi-Versioning 
BEGIN -- 14.7 InnoDB Architecture 
BEGIN -- 14.7.1 Buffer Pool 
END -- 14.7.1 Buffer Pool 
BEGIN -- 14.7.2 Change Buffer 
END -- 14.7.2 Change Buffer 
BEGIN -- 14.7.3 Adaptive Hash Index 
END -- 14.7.3 Adaptive Hash Index 
BEGIN -- 14.7.4 Redo Log Buffer 
END -- 14.7.4 Redo Log Buffer 
BEGIN -- 14.7.5 System Tablespace 
END -- 14.7.5 System Tablespace 
BEGIN -- 14.7.6 InnoDB Data Dictionary 
END -- 14.7.6 InnoDB Data Dictionary 
BEGIN -- 14.7.7 Doublewrite Buffer 
END -- 14.7.7 Doublewrite Buffer 
BEGIN -- 14.7.8 Undo Logs 
END -- 14.7.8 Undo Logs 
BEGIN -- 14.7.9 File-Per-Table Tablespaces 
END -- 14.7.9 File-Per-Table Tablespaces 
BEGIN -- 14.7.10 Redo Log 
END -- 14.7.10 Redo Log 
END -- 14.7 InnoDB Architecture 
BEGIN -- 14.8 InnoDB Locking and Transaction Model 
BEGIN -- 14.8.1 InnoDB Locking 
END -- 14.8.1 InnoDB Locking 
BEGIN -- 14.8.2 InnoDB Transaction Model 
END -- 14.8.2 InnoDB Transaction Model 
BEGIN -- 14.8.3 Locks Set by Different SQL Statements in InnoDB 
END -- 14.8.3 Locks Set by Different SQL Statements in InnoDB 
BEGIN -- 14.8.4 Phantom Rows 
END -- 14.8.4 Phantom Rows 
BEGIN -- 14.8.5 Deadlocks in InnoDB 
END -- 14.8.5 Deadlocks in InnoDB 
END -- 14.8 InnoDB Locking and Transaction Model 
BEGIN -- 14.9 InnoDB Configuration 
BEGIN -- 14.9.1 InnoDB Startup Configuration 
END -- 14.9.1 InnoDB Startup Configuration 
BEGIN -- 14.9.2 InnoDB Buffer Pool Configuration 
END -- 14.9.2 InnoDB Buffer Pool Configuration 
BEGIN -- 14.9.3 Configuring the Memory Allocator for InnoDB 
END -- 14.9.3 Configuring the Memory Allocator for InnoDB 
BEGIN -- 14.9.4 Configuring InnoDB Change Buffering 
END -- 14.9.4 Configuring InnoDB Change Buffering 
BEGIN -- 14.9.5 Configuring Thread Concurrency for InnoDB 
END -- 14.9.5 Configuring Thread Concurrency for InnoDB 
BEGIN -- 14.9.6 Configuring the Number of Background InnoDB I/O Threads 
END -- 14.9.6 Configuring the Number of Background InnoDB I/O Threads 
BEGIN -- 14.9.7 Using Asynchronous I/O on Linux 
END -- 14.9.7 Using Asynchronous I/O on Linux 
BEGIN -- 14.9.8 Configuring the InnoDB Master Thread I/O Rate 
END -- 14.9.8 Configuring the InnoDB Master Thread I/O Rate 
BEGIN -- 14.9.9 Configuring Spin Lock Polling 
END -- 14.9.9 Configuring Spin Lock Polling 
BEGIN -- 14.9.10 Configuring InnoDB Purge Scheduling 
END -- 14.9.10 Configuring InnoDB Purge Scheduling 
BEGIN -- 14.9.11 Configuring Optimizer Statistics for InnoDB 
END -- 14.9.11 Configuring Optimizer Statistics for InnoDB 
END -- 14.9 InnoDB Configuration 
BEGIN -- 14.10 InnoDB Tablespaces 
BEGIN -- 14.10.1 Resizing the InnoDB System Tablespace 
END -- 14.10.1 Resizing the InnoDB System Tablespace 
BEGIN -- 14.10.2 Changing the Number or Size of InnoDB Redo Log Files 
END -- 14.10.2 Changing the Number or Size of InnoDB Redo Log Files 
BEGIN -- 14.10.3 Using Raw Disk Partitions for the System Tablespace 
END -- 14.10.3 Using Raw Disk Partitions for the System Tablespace 
BEGIN -- 14.10.4 InnoDB File-Per-Table Tablespaces 
END -- 14.10.4 InnoDB File-Per-Table Tablespaces 
END -- 14.10 InnoDB Tablespaces 
BEGIN -- 14.11 InnoDB Tables and Indexes 
BEGIN -- 14.11.1 InnoDB Tables 
END -- 14.11.1 InnoDB Tables 
BEGIN -- 14.11.2 InnoDB Indexes 
END -- 14.11.2 InnoDB Indexes 
END -- 14.11 InnoDB Tables and Indexes 
BEGIN -- 14.12 InnoDB Table Compression 
BEGIN -- 14.12.1 Overview of Table Compression 
END -- 14.12.1 Overview of Table Compression 
BEGIN -- 14.12.2 Enabling Compression for a Table 
END -- 14.12.2 Enabling Compression for a Table 
BEGIN -- 14.12.3 Tuning Compression for InnoDB Tables 
END -- 14.12.3 Tuning Compression for InnoDB Tables 
BEGIN -- 14.12.4 Monitoring InnoDB Table Compression at Runtime 
END -- 14.12.4 Monitoring InnoDB Table Compression at Runtime 
BEGIN -- 14.12.5 How Compression Works for InnoDB Tables 
END -- 14.12.5 How Compression Works for InnoDB Tables 
BEGIN -- 14.12.6 SQL Compression Syntax Warnings and Errors 
END -- 14.12.6 SQL Compression Syntax Warnings and Errors 
END -- 14.12 InnoDB Table Compression 
BEGIN -- 14.13 InnoDB File-Format Management 
BEGIN -- 14.13.1 Enabling File Formats 
END -- 14.13.1 Enabling File Formats 
BEGIN -- 14.13.2 Verifying File Format Compatibility 
END -- 14.13.2 Verifying File Format Compatibility 
BEGIN -- 14.13.3 Identifying the File Format in Use 
END -- 14.13.3 Identifying the File Format in Use 
BEGIN -- 14.13.4 Downgrading the File Format 
END -- 14.13.4 Downgrading the File Format 
END -- 14.13 InnoDB File-Format Management 
BEGIN -- 14.14 InnoDB Row Storage and Row Formats 
BEGIN -- 14.14.1 Overview of InnoDB Row Storage 
END -- 14.14.1 Overview of InnoDB Row Storage 
BEGIN -- 14.14.2 Specifying the Row Format for a Table 
END -- 14.14.2 Specifying the Row Format for a Table 
BEGIN -- 14.14.3 DYNAMIC and COMPRESSED Row Formats 
END -- 14.14.3 DYNAMIC and COMPRESSED Row Formats 
BEGIN -- 14.14.4 COMPACT and REDUNDANT Row Formats 
END -- 14.14.4 COMPACT and REDUNDANT Row Formats 
END -- 14.14 InnoDB Row Storage and Row Formats 
BEGIN -- 14.15 InnoDB Disk I/O and File Space Management 
BEGIN -- 14.15.1 InnoDB Disk I/O 
END -- 14.15.1 InnoDB Disk I/O 
BEGIN -- 14.15.2 File Space Management 
END -- 14.15.2 File Space Management 
BEGIN -- 14.15.3 InnoDB Checkpoints 
END -- 14.15.3 InnoDB Checkpoints 
BEGIN -- 14.15.4 Defragmenting a Table 
END -- 14.15.4 Defragmenting a Table 
BEGIN -- 14.15.5 Reclaiming Disk Space with TRUNCATE TABLE 
END -- 14.15.5 Reclaiming Disk Space with TRUNCATE TABLE 
END -- 14.15 InnoDB Disk I/O and File Space Management 
BEGIN -- 14.16 InnoDB Fast Index Creation 
BEGIN -- 14.16.1 Overview of Fast Index Creation 
END -- 14.16.1 Overview of Fast Index Creation 
BEGIN -- 14.16.2 Examples of Fast Index Creation 
END -- 14.16.2 Examples of Fast Index Creation 
BEGIN -- 14.16.3 Implementation Details of Fast Index Creation 
END -- 14.16.3 Implementation Details of Fast Index Creation 
BEGIN -- 14.16.4 Concurrency Considerations for Fast Index Creation 
END -- 14.16.4 Concurrency Considerations for Fast Index Creation 
BEGIN -- 14.16.5 How Crash Recovery Works with Fast Index Creation 
END -- 14.16.5 How Crash Recovery Works with Fast Index Creation 
BEGIN -- 14.16.6 Limitations of Fast Index Creation 
END -- 14.16.6 Limitations of Fast Index Creation 
END -- 14.16 InnoDB Fast Index Creation 
BEGIN -- 14.17 InnoDB Startup Options and System Variables 
END -- 14.17 InnoDB Startup Options and System Variables 
BEGIN -- 14.18 InnoDB INFORMATION_SCHEMA Tables 
BEGIN -- 14.18.1 InnoDB INFORMATION_SCHEMA Tables about Compression 
END -- 14.18.1 InnoDB INFORMATION_SCHEMA Tables about Compression 
BEGIN -- 14.18.2 InnoDB INFORMATION_SCHEMA Transaction and Locking Information 
END -- 14.18.2 InnoDB INFORMATION_SCHEMA Transaction and Locking Information 
BEGIN -- 14.18.3 InnoDB INFORMATION_SCHEMA Buffer Pool Tables 
END -- 14.18.3 InnoDB INFORMATION_SCHEMA Buffer Pool Tables 
END -- 14.18 InnoDB INFORMATION_SCHEMA Tables 
BEGIN -- 14.19 InnoDB Integration with MySQL Performance Schema 
BEGIN -- 14.19.1 Monitoring InnoDB Mutex Waits Using Performance Schema 
END -- 14.19.1 Monitoring InnoDB Mutex Waits Using Performance Schema 
END -- 14.19 InnoDB Integration with MySQL Performance Schema 
BEGIN -- 14.20 InnoDB Monitors 
BEGIN -- 14.20.1 InnoDB Monitor Types 
END -- 14.20.1 InnoDB Monitor Types 
BEGIN -- 14.20.2 Enabling InnoDB Monitors 
END -- 14.20.2 Enabling InnoDB Monitors 
BEGIN -- 14.20.3 InnoDB Standard Monitor and Lock Monitor Output 
END -- 14.20.3 InnoDB Standard Monitor and Lock Monitor Output 
BEGIN -- 14.20.4 InnoDB Tablespace Monitor Output 
END -- 14.20.4 InnoDB Tablespace Monitor Output 
BEGIN -- 14.20.5 InnoDB Table Monitor Output 
END -- 14.20.5 InnoDB Table Monitor Output 
END -- 14.20 InnoDB Monitors 
BEGIN -- 14.21 InnoDB Backup and Recovery 
BEGIN -- 14.21.1 InnoDB Backup 
END -- 14.21.1 InnoDB Backup 
BEGIN -- 14.21.2 InnoDB Recovery 
END -- 14.21.2 InnoDB Recovery 
END -- 14.21 InnoDB Backup and Recovery 
BEGIN -- 14.22 InnoDB and MySQL Replication 
END -- 14.22 InnoDB and MySQL Replication 
BEGIN -- 14.23 InnoDB Troubleshooting 
BEGIN -- 14.23.1 Troubleshooting InnoDB I/O Problems 
END -- 14.23.1 Troubleshooting InnoDB I/O Problems 
BEGIN -- 14.23.2 Forcing InnoDB Recovery 
END -- 14.23.2 Forcing InnoDB Recovery 
BEGIN -- 14.23.3 Troubleshooting InnoDB Data Dictionary Operations 
END -- 14.23.3 Troubleshooting InnoDB Data Dictionary Operations 
BEGIN -- 14.23.4 InnoDB Error Handling 
END -- 14.23.4 InnoDB Error Handling 
END -- 14.23 InnoDB Troubleshooting 
END -- 14 The InnoDB Storage Engine 
