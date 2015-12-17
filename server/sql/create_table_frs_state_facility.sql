use 4840w;


DROP TABLE IF EXISTS FRS_STATE_FACILITY;

CREATE TABLE FRS_STATE_FACILITY (
FRS_FACILITY_DETAIL_REPORT_URL VARCHAR(255),
REGISTRY_ID VARCHAR(255),
PRIMARY_NAME VARCHAR(255),
LOCATION_ADDRESS VARCHAR(255),
SUPPLEMENTAL_LOCATION VARCHAR(255),
CITY_NAME VARCHAR(255),
COUNTY_NAME VARCHAR(255),
FIPS_CODE VARCHAR(255),
STATE_CODE VARCHAR(255),
STATE_NAME VARCHAR(255),
COUNTRY_NAME VARCHAR(255),
POSTAL_CODE VARCHAR(255),
FEDERAL_FACILITY_CODE VARCHAR(255),
FEDERAL_AGENCY_NAME VARCHAR(255),
TRIBAL_LAND_CODE VARCHAR(255),
TRIBAL_LAND_NAME VARCHAR(255),
CONGRESSIONAL_DIST_NUM VARCHAR(255),
CENSUS_BLOCK_CODE VARCHAR(255),
HUC_CODE VARCHAR(255),
EPA_REGION_CODE VARCHAR(255),
SITE_TYPE_NAME VARCHAR(255),
LOCATION_DESCRIPTION VARCHAR(255),
CREATE_DATE VARCHAR(255),
UPDATE_DATE VARCHAR(255),
US_MEXICO_BORDER_IND VARCHAR(255),
LATITUDE83 VARCHAR(255),
LONGITUDE83 VARCHAR(255),
CONVEYOR VARCHAR(255),
COLLECT_DESC VARCHAR(255),
ACCURACY_VALUE VARCHAR(255),
REF_POINT_DESC VARCHAR(255),
HDATUM_DESC VARCHAR(255));    
COMMIT;