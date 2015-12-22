use 4840w;


DROP TABLE IF EXISTS frs_state_facility;

CREATE TABLE frs_state_facility (
frs_facility_detail_report_url VARCHAR(255),
registry_id VARCHAR(255),
primary_name VARCHAR(255),
location_address VARCHAR(255),
supplemental_location VARCHAR(255),
city_name VARCHAR(255),
county_name VARCHAR(255),
fips_code VARCHAR(255),
state_code VARCHAR(255),
state_name VARCHAR(255),
country_name VARCHAR(255),
postal_code VARCHAR(255),
federal_facility_code VARCHAR(255),
federal_agency_name VARCHAR(255),
tribal_land_code VARCHAR(255),
tribal_land_name VARCHAR(255),
congressional_dist_num VARCHAR(255),
census_block_code VARCHAR(255),
huc_code VARCHAR(255),
epa_region_code VARCHAR(255),
site_type_name VARCHAR(255),
location_description VARCHAR(255),
create_date VARCHAR(255),
update_date VARCHAR(255),
us_mexico_border_ind VARCHAR(255),
latitude83 VARCHAR(255),
longitude83 VARCHAR(255),
conveyor VARCHAR(255),
collect_desc VARCHAR(255),
accuracy_value VARCHAR(255),
ref_point_desc VARCHAR(255),
hdatum_desc VARCHAR(255));    
COMMIT;