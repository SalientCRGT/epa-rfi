<?php

class DbService {
    protected $dbConnection;
    protected $sessionId;

    // MySQL Connection constants
    const DB_HOST = "127.0.0.1";
    const DB_NAME = "4840w";
    const DB_USERNAME = "4840w";
    const DB_PASSWORD = "4840w";

    // Status Codes
    const ERROR_CODE = "error";
    const NO_DATA_FOUND_CODE = "no_data_found";
    const SUCCESS_CODE = "success";


    function __construct() {
        // Open database connection
        $this->dbConnection = new PDO("mysql:host=" .static::DB_HOST. ";dbname=" .static::DB_NAME, static::DB_USERNAME, static::DB_PASSWORD);
        $this->dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $this->sessionId = session_id();
    }

    function __destruct() {
        // Close database connection
        $this->dbConnection = null;
    }

    public function getFileName($type, $subType){
        try {
            // Retrieve Status of Defaul URL
            $sql = "SELECT epa_file_name FROM epa_url WHERE url_status = 'A' and epa_category = '".$type."' and epa_sub_category = '".$subType."'";
            $stmt = $this->dbConnection->prepare($sql);
            $stmt->execute();
            $results = $stmt->fetchObject();
        } catch(Exception $e) {
            $results = $e;
            echo $e;
        } finally {
            return $results->epa_file_name;
        }
    }

    public function getURL($type, $subType){
        try {
            // Retrieve URL
            $sql = "SELECT url FROM epa_url WHERE url_status = 'A' and epa_category = '".$type."' and epa_sub_category = '".$subType."'";
            $stmt = $this->dbConnection->prepare($sql);
            $stmt->execute();
            $results = $stmt->fetchObject();
        } catch(Exception $e) {
            $results = $e;
            echo $e;
        } finally {
            return $results->url;
        }
    }

    /**
     * loadData($type, $subType)
     * Calls the sql script file that loads the CSV file for the specified data set. 
     * Params: 
     *      $type - current default value is "FRS" -- can be added to if additional data sources added;
     *      $subType - current accepted values are "NAT" or US State codes (2 char) 
     */

    function loadData($type, $subType) {
        $scriptDir = "../../../home/ubuntu/workspace/server/sql/data/"; 
        if ($type == "FRS") {
            if ($subType == "NAT") {
                $data = "NATIONAL_FACILITY_FILE.csv"; //"load_frs_national_facility.sql";
            } else {
                $data = $subType."_FACILITY_FILE.csv"; //"load_frs_state_facility.sql";
            }
        } else {
            $data = "";    //modify this section to add any other datasets that can be handled similarly
        }

        $sql1 = "TRUNCATE TABLE frs_state_facility;";
        $sql2 = "LOAD DATA INFILE '".$scriptDir.$data."' INTO TABLE frs_state_facility
                FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"'
                LINES TERMINATED BY '\n' STARTING BY ''
                IGNORE 1 LINES
                (frs_facility_detail_report_url, registry_id, @primary_name, @location_address, @supplemental_location, @city_name,
                 @county_name, @fips_code, @state_code, @state_name, @country_name, @postal_code, @federal_facility_code, @federal_agency_name,
                 @tribal_land_code, @tribal_land_name, @congressional_dist_num, @census_block_code, @huc_code, @epa_region_code, @site_type_name,
                 @location_description, @create_date, @update_date, @us_mexico_border_ind, @latitude83, @longitude83, @conveyor, @collect_desc,
                 @accuracy_value, @ref_point_desc, @hdatum_desc, @source_desc)
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
                source_desc = nullif(@source_desc,'')";

        if ($data <> "") {
            try {
                $stmt = $this->dbConnection->prepare($sql1);
                $stmt->execute();
                echo "\nTable truncated\n";

                $stmt = $this->dbConnection->prepare($sql2);
                $stmt->execute();

                $results = "SUCCESSFUL LOAD";
            } catch (Exception $e) {
                $results = "FAILED LOAD";
                echo $e;
            } finally {
                echo $results;
                return $results;
            }
        } else {
            $results = "NO VALID DATA FOR PARAMS PASSED: ".$type.", ".$subType;
        }
    }

    function checkData($type, $subType) { 
    
        if ($type == "FRS") {
            $tab = "frs_state_facility";
        } else {
            $tab = "";
        }
        
        if ($tab <> "") {
            try {
        
                $query = "SELECT count(*) recs FROM " . $tab;

                /* check table load */
                $stmt = $this->dbConnection->prepare($query);
                $stmt->execute();
                $result = $stmt->fetchObject();                
                echo "\n".$result->recs;
            } catch(Exception $e) {
               // $result = 0;
                echo $e;
            } finally {
                return $result->recs;
            }
        }
    }    
    
    public function executeQuery($selectStmt){
        try {
            $stmt = $this->dbConnection->prepare($selectStmt->getQuery());
            $stmt->execute();
            $data = $stmt->fetchAll(PDO::FETCH_CLASS);
            
            $stmt = $this->dbConnection->prepare($selectStmt->getCountQuery());
            $stmt->execute();
            $count = $stmt->fetchColumn();
            $pages = ceil($count / $selectStmt->getPageSize());

            if ($data == null) {
                $results = (object) ['code' => static::NO_DATA_FOUND_CODE,
                                     'msg' => 'No facilities found for given criteria',
                                     'data' => array(),
                                     'pages' => 0];
            } else {
                $data = $this->propNameToCamelCase($data);
                $results = (object) ['code' => static::SUCCESS_CODE,
                                     'msg' => 'Retrieved facilities in Postal Code 22046',
                                     'data' => $data,
                                     'pages' => $pages];
            }
        } catch(Exception $e) {
            $results = (object) ['code' => static::ERROR_CODE,
                                 'msg' => $e->getMessage(),
                                 'data' => array(),
                                 'pages' => 0];
        } finally {
            return $results;
        }
    }
    
    function getFacilityById($registryId){
        
        try {
            $sql = "SELECT * FROM frs_state_facility where registry_id = :registryId";
            $stmt = $this->dbConnection->prepare($sql);
            $stmt->bindValue(':registryId', $registryId);
            $stmt->execute();
            $data = $stmt->fetchAll(PDO::FETCH_CLASS);
            
            if ($data == null) {
                
                $results = (object) ['code' => static::NO_DATA_FOUND_CODE,
                                     'msg' => 'No facilities found for given criteria',
                                     'data' => array()];
            } else {
                $data = $this->propNameToCamelCase($data);
                $results = (object) ['code' => static::SUCCESS_CODE,
                                     'msg' => 'Retrieved facility with registry id: ' . $registryId,
                                     'data' => $data];
            }
        } catch(Exception $e) {
            $results = (object) ['code' => static::ERROR_CODE,
                                 'msg' => $e->getMessage(),
                                     'data' => array()];
        } finally {
            return $results;
        }
    }
    
    private function propNameToCamelCase($arr){
        $camelArr = array();
        foreach($arr as $obj){
            $camelObj = array();
            foreach($obj as $key => $value){
                
                $newKey = $this->underScoreToCamelCase($key);
                
                $camelObj[$newKey] = $value;

            }
            $camelArr[] = $camelObj;
            
        }
        return $camelArr;
    }
    
    private function underScoreToCamelCase($string){


        $str = str_replace(' ', '', ucwords(str_replace('_', ' ', $string)));
        
        $str[0] = strtolower($str[0]);

        return $str;
    }
    
}
?>