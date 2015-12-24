<?php

class RestService {

    // Status Codes
    const SUCCESS_CODE = "success";
    const SERVICE_FAILURE_CODE = "service_failure";
    const SYSTEM_FAILURE_CODE = "system_failure";
    const NO_DATA_FOUND_CODE = "no_data_found";

    // Messages
    const SUCCESS_MESSAGE = "Data successfully fetched from service";
    const SERVICE_FAILURE_MSG = "Service failed to return data";

    public $dbService;

    // Slim app
    public $app;

    // Rest Responses
    public $code = "";
    public $msg = "";
    public $data= "";
    public $pages = 0;

    function __construct(){
         $this->app = \Slim\Slim::getInstance();
        // Establish Database Service
        $this->dbService = new DbService();

    }

    function __destruct() {
        // Close database service
        $this->dbService = null;
        $this->app = null;
    }

    // Setter for Rest Response
    protected function setResponse($code, $msg, $pages, $data){
        $this->code = $code;
        $this->msg = $msg;
        $this->pages = $pages;
        $this->data = $data;
    }

    // Getter for Rest Response
    protected function getResponse(){
        return (object) ['code' => $this->code, 'msg'=> $this->msg, 'pages' => $this->pages, 'data'=> $this->data];
    }

    // Output Rest Response in JSON format
    protected function outputResponse() {
        $responseObject = (object) ['code' => $this->code, 'msg'=> $this->msg, 'pages' => $this->pages, 'data'=> $this->data];
        
        if($this->code == self::NO_DATA_FOUND_CODE){
            $this->app->response->setStatus(404);
        }elseif($this->code == self::SYSTEM_FAILURE_CODE){
            $this->app->response->setStatus(500);
        }else{
            $this->app->response->setStatus(200);
        }
        
        echo json_encode($responseObject);
    }
}
?>