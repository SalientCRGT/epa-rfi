<?php

class FacilityService extends RestService{

    protected $dbService;

    function __construct() {
        // Establish Database Service
        $this->dbService = new DbService();

    }

    function __destruct() {
        // Close database service
        $this->dbService = null;
    }

    public function getFacilities(){
        
        $app = \Slim\Slim::getInstance();
        $params = $app->request->get();
        
        try {
            $result = $this->dbService->getFacilities($params);
            
            $this->setResponse($result->code, $result->msg, $result->data);
            
        } catch(Exception $e) {
            $this->setResponse(static::SYSTEM_FAILURE_CODE, "System error occurred", array());
        } finally {
            $this->outputResponse();
        }
    }
    
    public function getFacilityById($registryId){
        
        try {
            $result = $this->dbService->getFacilityById($registryId);
            
            $this->setResponse($result->code, $result->msg, $result->data);
           
        } catch(Exception $e) {
            $this->setResponse(static::SYSTEM_FAILURE_CODE, "System error occurred, unable retrieve facility with ID: ".$registryId, array());
        } finally {
            $this->outputResponse();
        }
    }
    
    public function getFacilitiesByRegEx($search){
        try {
            $result = $this->dbService->getFacilitiesByRegEx($search);
            
            $this->setResponse($result->code, $result->msg, $result->data);
           
        } catch(Exception $e) {
            $this->setResponse(static::SYSTEM_FAILURE_CODE, "System error occurred, unable retrieve facility search: ".$search, array());
        } finally {
            $this->outputResponse();
        }
    }
}
?>