FLUSH LOGS;
FLUSH NO_WRITE_TO_BINLOG BINARY LOGS, ENGINE LOGS, ERROR LOGS, GENERAL LOGS, HOSTS;
FLUSH LOCAL PRIVILEGES, OPTIMIZER_COSTS, RELAY LOGS, SLOW LOGS, STATUS, USER_RESOURCES;
FLUSH RELAY LOGS FOR CHANNEL my_channel;
FLUSH TABLES;
FLUSH TABLES WITH READ LOCK;
FLUSH TABLES table1;
FLUSH TABLES table1, `foo`.`bar`;
FLUSH TABLES table1, `foo`.`bar` WITH READ LOCK;
FLUSH TABLES table1, `foo`.`bar` FOR EXPORT;
