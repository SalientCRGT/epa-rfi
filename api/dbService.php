<?php

class DbService {
    protected $dbConnection;
    protected $sessionId;

    // MySQL Connection constants
    //const DB_HOST = "127.0.0.1";
    const DB_HOST = "52.3.5.215:3306";
    const DB_NAME = "4840w";
    const DB_USERNAME = "4840w";
    const DB_PASSWORD = "4840w";

    // Status Codes
    const ERROR_CODE = "error";
    const NO_DATA_FOUND_CODE = "no_data_found";
    const SUCCESS_CODE = "success";


    function __construct() {
        // Open database connection
        $this->dbConnection = new PDO("mysql:host=" .static::DB_HOST. ";dbname=" .static::DB_NAME, static::DB_USERNAME, static::DB_PASSWORD, array(PDO::MYSQL_ATTR_LOCAL_INFILE=>1));
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
        
        $scriptDir = "../server/sql/";
        if ($type == "FRS") {
            if ($subType == "NAT") {
                $data = "NATIONAL_FACILITY_FILE.csv"; //"load_frs_national_facility.sql";
            } else {
            
                $data = "load_frs_state_facility.sql";
            }
        } else {
            $data = "";    //modify this section to add any other datasets that can be handled similarly
        }
        
        $location = $scriptDir.$data;
        $sql = file_get_contents($location);

        $sql = str_replace("{SUB_TYPE}", $subType, $sql);
        
        if ($data <> "") {
            try {
                $stmt = $this->dbConnection->prepare($sql);
                $stmt->execute();

                $results = "SUCCESSFUL LOAD";
            } catch (Exception $e) {
                $results = "FAILED LOAD";
            } finally {
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
            } catch(Exception $e) {
               // $result = 0;
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
                                     'pages' => 0,
                                     'rowCount'=> 0];
            } else {
                $data = $this->propNameToCamelCase($data);
                $results = (object) ['code' => static::SUCCESS_CODE,
                                     'msg' => 'Retrieved facilities',
                                     'data' => $data,
                                     'pages' => $pages,
                                     'rowCount'=> $count];
            }
        } catch(Exception $e) {
            $results = (object) ['code' => static::ERROR_CODE,
                                 'msg' => $e->getMessage(),
                                 'data' => array(),
                                 'pages' => 0,
                                 'rowCount'=> 0];
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
                                     'data' => array(),
                                     'pages' => 0,
                                     'rowCount'=> 0];
            } else {
                $data = $this->propNameToCamelCase($data);
                $results = (object) ['code' => static::SUCCESS_CODE,
                                     'msg' => 'Retrieved facility with registry id: ' . $registryId,
                                     'data' => $data,
                                     'pages' => 0,
                                     'rowCount'=> 1];
            }
        } catch(Exception $e) {
            $results = (object) ['code' => static::ERROR_CODE,
                                 'msg' => $e->getMessage(),
                                     'data' => array(),
                                     'pages' => 0,
                                     'rowCount'=> 0];
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