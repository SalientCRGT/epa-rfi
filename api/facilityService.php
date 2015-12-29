<?php

class FacilityService extends RestService{
       
    const TABLE_NAME = "frs_state_facility";

    public function getFacilities(){
        
       
        $params = $this->app->request->get();
        $selectStmt = new SelectStmt();
        $selectStmt->setTableName(self::TABLE_NAME);
        $selectStmt->setParams($params);
        
        try {
            $result = $this->dbService->executeQuery($selectStmt);
            
            $this->setResponse($result->code, $result->msg, $result->pages, $result->rowCount, $result->data);
            
        } catch(Exception $e) {
            $this->setResponse(static::SYSTEM_FAILURE_CODE, "System error occurred", $result->pages, $result->rowCount, array());
        } finally {
            $this->outputResponse();
        }
    }
    
    public function getFacilityById($registryId){
        
        try {
            $selectStmt = new SelectStmt();
            $selectStmt->setTableName(self::TABLE_NAME);
            $whereClauses = array();
            $wc = new WhereClause();
            $wc->setColumn("registry_id");
            $wc->setOperator($wc::OP_EQUAL);
            $wc->setValue($registryId);
            array_push($whereClauses, $wc);
            $selectStmt->setWhereClauses($whereClauses);
            $result = $this->dbService->executeQuery($selectStmt);
            
            $this->setResponse($result->code, $result->msg, $result->pages, $result->rowCount, $result->data);
           
        } catch(Exception $e) {
            $this->setResponse(static::SYSTEM_FAILURE_CODE, "System error occurred, unable retrieve facility with ID: ".$registryId, $result->pages, $result->rowCount, array());
        } finally {
            $this->outputResponse();
        }
    }
}
?>