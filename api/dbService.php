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
    const INVALID_CREDENTIALS_CODE = "invald_credentials";

    // Messages
    const USER_NOT_FOUND_MSG = "User not found";

    function __construct() {
        // Open database connection
        $this->dbConnection = new PDO("mysql:host=" .static::DB_HOST. ";dbname=" .static::DB_NAME, static::DB_USERNAME, static::DB_PASSWORD, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
        $this->dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $this->sessionId = session_id();
    }

    function __destruct() {
        // Close database connection
        $this->dbConnection = null;
    }

    public function getFacilities(){
        
        try {
            // Retrieve Open FDA api key
            $sql = "SELECT * FROM FRS_STATE_FACILITY where POSTAL_CODE like '22046%'";
            $stmt = $this->dbConnection->prepare($sql);
            $stmt->execute();
            $resultsArr = $stmt->fetchAll(PDO::FETCH_CLASS);
            if ($resultsArr == null) {
                $results = (object) ['code' => static::NO_DATA_FOUND_CODE,
                                     'msg' => 'No facilities found for given criteria'];
            } else {
                $results = (object) ['code' => static::SUCCESS_CODE,
                                     'msg' => 'Retrieved facilities in Postal Code 22046',
                                     'data' => $resultsArr];
            }
        } catch(Exception $e) {
            print_r('exception... ').print_r($e);
            $results = (object) ['code' => static::ERROR_CODE,
                                 'msg' => $e->getMessage()];
        } finally {
            return $results;
        }
        
    }
    
    function getFacilityById($registryId){
        
        try {
            $sql = "SELECT * FROM FRS_STATE_FACILITY where REGISTRY_ID = :registryId";
            $stmt = $this->dbConnection->prepare($sql);
            $stmt->bindValue(':registryId', $registryId);
            $stmt->execute();
            $results = $stmt->fetchObject();
            if ($results == null) {
                $results = (object) ['code' => static::NO_DATA_FOUND_CODE,
                                     'msg' => 'No facilities found for given criteria'];
            } else {
                $results->code = static::SUCCESS_CODE;
                $results->msg = 'Retrieved facility with registry id: ' . $registryId;
            }
        } catch(Exception $e) {
            $results = (object) ['code' => static::ERROR_CODE,
                                 'msg' => $e->getMessage()];
        } finally {
            return $results;
        }
    }

}
?>