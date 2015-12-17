
LOAD DATA INFILE '../../../home/ubuntu/workspace/server/data/VA_FACILITY_FILE.csv' INTO TABLE frs_state_facility
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n' STARTING BY '';