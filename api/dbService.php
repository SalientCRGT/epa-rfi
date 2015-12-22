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
    
    public function getFacilities($params){
        
        try {
            
            $sql = "SELECT * FROM frs_state_facility ";
            if($params != null){
                $sqlWhere = $this->createWhere($params);
            }else{
                $sqlWhere = " WHERE postal_code = '22046'";
            }
            
            $sql = $sql.$sqlWhere;    
            
            $stmt = $this->dbConnection->prepare($sql);
            $stmt->execute();
            $data = $stmt->fetchAll(PDO::FETCH_CLASS);

            if ($data == null) {
                $results = (object) ['code' => static::NO_DATA_FOUND_CODE,
                                     'msg' => 'No facilities found for given criteria',
                                     'data' => array()];
            } else {
                $data = $this->propNameToCamelCase($data);
                $results = (object) ['code' => static::SUCCESS_CODE,
                                     'msg' => 'Retrieved facilities in Postal Code 22046',
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
    
    function getFacilitiesByRegEx($search)
    {
        $search = strtoupper($search);
        $search = "%$search%";
        try {
            $sql = "SELECT * FROM frs_state_facility 
                        where UPPER(registry_id) LIKE :search 
                        or UPPER(primary_name) LIKE :search 
                        or UPPER(city_name) LIKE :search 
                        or UPPER(county_name) LIKE :search 
                        or UPPER(state_code) LIKE :search 
                        or UPPER(state_name) LIKE :search 
                        or UPPER(country_name) LIKE :search 
                        or UPPER(postal_code) LIKE :search 
                        or UPPER(site_type_name) LIKE :search";

            $stmt = $this->dbConnection->prepare($sql);
            $stmt->bindParam(':search', $search);
            $stmt->execute();
            $data = $stmt->fetchAll(PDO::FETCH_CLASS);
            $data = $this->propNameToCamelCase($data);

            if ($data == null) {
                $results = (object) ['code' => static::NO_DATA_FOUND_CODE,
                                     'msg' => 'No facilities found for given criteria',
                                     'data' => array()];
            } else {
                $results = (object) ['code' => static::SUCCESS_CODE,
                                     'msg' => 'Retrieved facility with registry id: ' . $search,
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
    
    protected function propNameToCamelCase($arr){
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
    
    protected function underScoreToCamelCase($string){


        $str = str_replace(' ', '', ucwords(str_replace('_', ' ', $string)));
        
        $str[0] = strtolower($str[0]);

        return $str;
    }
    
    function camelCaseToUnderScore($input) {
        preg_match_all('!([A-Z][A-Z0-9]*(?=$|[A-Z][a-z0-9])|[A-Za-z][a-z0-9]+)!', $input, $matches);
        $ret = $matches[0];
        foreach ($ret as &$match) {
            $match = $match == strtoupper($match) ? strtolower($match) : lcfirst($match);
        }
        return implode('_', $ret);
    }

    function createWhere($params){
        $max = sizeof($params);
        $counter = 1;
        
        $sqlWhere = " WHERE ";
        foreach($params as $key => $value){
            $newKey = (String)$this->camelCaseToUnderScore($key);
            $multiParam = explode("|", $value);
            $paramCount = count($multiParam);
           
            if($paramCount > 1){
                $sqlWhere = $sqlWhere." ( ";
                for($i = 0; $i < $paramCount; $i++){
                    $val = $multiParam[$i];
                    $sqlWhere = $sqlWhere." $newKey LIKE '%$val%' ";
                    if($i != $paramCount - 1){
                        $sqlWhere = $sqlWhere." OR ";
                    }
                }
                $sqlWhere = $sqlWhere." ) ";
            }else{
                $sqlWhere = $sqlWhere." $newKey LIKE '%$value%' ";
            }
            
            
            if($counter != $max){
               $sqlWhere = $sqlWhere." AND ";
            }
            $counter++;
        }
        
        return $sqlWhere;
    }

}
?>