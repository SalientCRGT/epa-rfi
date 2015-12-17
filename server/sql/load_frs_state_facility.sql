
LOAD DATA INFILE '/var/lib/jenkins/workspace/4840W/epa-agile-rfi/epa_db_runscript/server/data/VA_FACILITY_FILE.csv' INTO TABLE FRS_STATE_FACILITY
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n' STARTING BY '';
