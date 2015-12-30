DELETE FROM frs_state_facility WHERE state_code = '{SUB_TYPE}';
COMMIT;
LOAD DATA LOCAL INFILE '../server/sql/data/{SUB_TYPE}_FACILITY_FILE.csv' INTO TABLE frs_state_facility
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"'
LINES TERMINATED BY '\n' STARTING BY ''
IGNORE 1 LINES
                (frs_facility_detail_report_url, registry_id, @primary_name, @location_address, @supplemental_location, @city_name,
                 @county_name, @fips_code, @state_code, @state_name, @country_name, @postal_code, @federal_facility_code, @federal_agency_name,
                 @tribal_land_code, @tribal_land_name, @congressional_dist_num, @census_block_code, @huc_code, @epa_region_code, @site_type_name,
                 @location_description, @create_date, @update_date, @us_mexico_border_ind, @latitude83, @longitude83, @conveyor, @collect_desc,
                 @accuracy_value, @ref_point_desc, @hdatum_desc, @source_desc, refresh_date)
                SET
                primary_name = nullif(@primary_name,''),
                location_address = nullif(@location_address,''),
                supplemental_location = nullif(@supplemental_location,''),
                city_name = nullif(@city_name,''),
                county_name = nullif(@county_name,''),
                fips_code = nullif(@fips_code,''),
                state_code = nullif(@state_code,''),
                state_name = nullif(@state_name,''),
                country_name = nullif(@country_name,''),
                postal_code = nullif(@postal_code,''),
                federal_facility_code = nullif(@federal_facility_code,''),
                federal_agency_name = nullif(@federal_agency_name,''),
                tribal_land_code = nullif(@tribal_land_code,''),
                tribal_land_name = nullif(@tribal_land_name,''),
                congressional_dist_num = nullif(@congressional_dist_num,''),
                census_block_code = nullif(@census_block_code,''),
                huc_code = nullif(@huc_code,''),
                epa_region_code = nullif(@epa_region_code,''),
                site_type_name = nullif(@site_type_name,''),
                location_description = nullif(@location_description,''),
                create_date = nullif(@create_date,''),
                update_date = nullif(@update_date,''),
                us_mexico_border_ind = nullif(@us_mexico_border_ind,''),
                latitude83 = nullif(@latitude83,''),
                longitude83 = nullif(@longitude83,''),
                conveyor = nullif(@conveyor,''),
                collect_desc = nullif(@collect_desc,''),
                accuracy_value = nullif(@accuracy_value,''),
                ref_point_desc = nullif(@ref_point_desc,''),
                hdatum_desc = nullif(@hdatum_desc,''),
                source_desc = nullif(@source_desc,''),
                refresh_date = now();