# 1 create replication user
GRANT REPLICATION SLAVE,REPLICATION CLIENT ON *.* TO repl@'192.168.0.%' IDENTIFIED BY 'password';

# 2 check bin-log created?
SHOW MASTER STATUS;

# 3 start replication
CHANGE MASTER TO MASTER_HOST = ' server1',
MASTER_USER = ' repl',
MASTER_PASSWORD = ' p4ssword',
MASTER_LOG_FILE = ' mysql- bin. 000001',
MASTER_LOG_POS = 0;

# 4 check replication is started?
SHOW SLAVE STATUS;

# 5 start slave
START SLAVE;
SHOW SLAVE STATUS;

