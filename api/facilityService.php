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
        
        try {
            $facilityData = $this->dbService->getFacilities();

            if ($facilityData->code == DbService::SUCCESS_CODE) {
                $this->setResponse(static::SUCCESS_CODE, "User is logged into the system", $facilityData);
            } else {
                $this->setResponse(static::NO_DATA_FOUND_CODE, "No facilities were found for criteria given", $facilityData);
            }
        } catch(Exception $e) {
            $this->setResponse(static::SYSTEM_FAILURE_CODE, "System error occurred, unable retrieve user", array());
        } finally {
            $this->outputResponse();
        }
    }
    
    public function getFacilityById($registryId){
        
        try {
            $facilityData = $this->dbService->getFacilityById($registryId);

            if ($facilityData->code == DbService::SUCCESS_CODE) {
                $this->setResponse(static::SUCCESS_CODE, "Found Facility", $facilityData);
            } else {
                $this->setResponse(static::NO_DATA_FOUND_CODE, "No facility was found for the given ID", $facilityData);
            }
        } catch(Exception $e) {
            $this->setResponse(static::SYSTEM_FAILURE_CODE, "System error occurred, unable retrieve facility", array());
        } finally {
            $this->outputResponse();
        }
    }
}
?>