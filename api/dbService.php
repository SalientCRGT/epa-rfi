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
        $this->dbConnection = new PDO("mysql:host=" .static::DB_HOST. ";dbname=" .static::DB_NAME, static::DB_USERNAME, static::DB_PASSWORD);
        $this->dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $this->sessionId = session_id();
    }

    function __destruct() {
        // Close database connection
        $this->dbConnection = null;
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