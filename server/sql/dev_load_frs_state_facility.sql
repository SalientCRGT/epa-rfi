
LOAD DATA INFILE '../../../home/ubuntu/workspace/server/data/VA_FACILITY_FILE.csv' INTO TABLE FRS_STATE_FACILITY
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n' STARTING BY '';