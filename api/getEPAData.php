<?php

class GetEPAData { 

    protected $dbService;
    protected $type = "FRS";
    protected $subType = "VA";
    protected $fileSaveDir = "/server/sql/data/";  //  ../../../home/ubuntu/workspace

    function __construct() {
        // Establish Database Service
        
        $this->dbService = new DbService();
    }

    function __destruct() {
        // Close database service
        $this->dbService = null;
    }

    public function getFileName($type, $subType){
        try {
            // Retrieve Status of Defaul URL
            $sql = "SELECT url FROM epa_url WHERE url_status = 'A' and epa_category = '"+$type+"' and epa_sub_category = '"+$subType+"'";
            $stmt = $this->dbConnection->prepare($sql);
            $stmt->execute();
            $results = $stmt->fetchObject();
            if ($results == null) {
                $results = (object) ['code' => static::NO_DATA_FOUND_CODE,
                                     'msg' => 'System configuration error, EPA default URL not found'];
            } else {
                $results->code = static::SUCCESS_CODE;
                $results->msg = 'Retrieved EPA default URL status';
            }
        } catch(Exception $e) {
            $results = (object) ['code' => static::ERROR_CODE,
                                 'msg' => $e->getMessage()];
        } finally {
            return $results;
        }
    }

    public function getURL($type, $subType){
        try {
            // Retrieve URL
            $sql = "SELECT url FROM epa_url WHERE url_status = 'A' and epa_category = '"+$type+"' and epa_sub_category = '"+$subType+"'";
            $stmt = $this->dbConnection->prepare($sql);
            $stmt->execute();
            $results = $stmt->fetchObject();
            if ($results == null) {
                $results = (object) ['code' => static::NO_DATA_FOUND_CODE,
                                     'msg' => 'System configuration error, EPA default URL not found'];
            } else {
                $results->code = static::SUCCESS_CODE;
                $results->msg = 'Retrieved EPA default URL status';
            }
        } catch(Exception $e) {
            $results = (object) ['code' => static::ERROR_CODE,
                                 'msg' => $e->getMessage()];
        } finally {
            return $results;
        }
    }

    

    /**
     * getEPAFile($type, $subType)
     * Pull recent file from the EPA dataset. 
     * Params: 
     *      $type - current accepted value is "FRS" -- can be added to if additional data sources added;
     *      $subType - current accepted values are "NAT" or US State codes (2 char) 
     */

    public function getEPAFile($type, $subType) {

        try {
            
            $fileName = getFileName($type, $subType);

            $url = getURL($type,$subType);
            
            if ($filename <> "" && $url <> "") {
                $ch = curl_init();
                //$source = "http://someurl.com/afile.zip";
                curl_setopt($ch, CURLOPT_URL, $url);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
                $data = curl_exec ($ch);
                curl_close ($ch);
                
                $destination = $fileSaveDir + $fileName;
                $file = fopen($destination, "w+");
                fputs($file, $data);
                fclose($file);
    
                $results = "SUCCESSFUL DOWNLOAD";
            } else {
                $results = "FAILED URL RETRIEVAL";
            }
            
        } catch(Exception $e) {
            $results = "FAILED DOWNLOAD";
        } finally {
            return $results;
        }

    }

    /**
     * execCommand($cmd)
     * Calls the shell script file that extracts the CSV file from the zip file and moves it to the data directory for the specified data set. 
     * Param: 
     *      $cmd - current process is for retrieving and moving the FRS National or State facility file
     */

    function execCommand($cmd) { 
        try {
            $results = exec($cmd . " > /dev/null &");   
        } catch (Exception $e) {
            $results = "FAILED PROCESS";
        } finally {
            return results;
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
    
        if ($type == "FRS") {
            $tab = "frs_state_facility";
            if ($subType == "NAT") {
                $data = "load_frs_national_facility.sql";
            } else {
                $data = "load_frs_state_facility.sql";
            }
        } else {
            $tab = "";
            $data = "";    //modify this section to add any other datasets that can be handled similarly
        }
        
        if ($data <> "") {
            try {
                $conn = $dbService->$dbConnection;
                $cmd = "source server/sql/" + $data;
                $stmt = mysqli_prepare($conn, $cmd);

                mysqli_stmt_execute($stmt);

                mysqli_stmt_close($stmt);

                /* check table load */
                $query = "SELECT count(*) FROM " + $tab;
                $result = mysqli_query($conn, $query);
                if ($result > 0) {
                    $results = "SUCCESSFUL LOAD";
                    mysqli_free_result($result);
                }

            } catch(Exception $e) {
                $results = "FAILED LOAD";
            } finally {
                return $results;
            }
        }
    }    

    /**
     * processEPAFile($type, $subType)
     * Calls getEPAFile, execCommand, and loadData. 
     * Params: 
     *      $type - current default value is "FRS" -- can be added to if additional data sources added;
     *      $subType - current accepted values are "NAT" or US State codes (2 char) 
     */

    public function processEPAFile($type, $subType) {
        
        if ($type == "FRS") {
            $cmd = "./server/scripts/frs_file_process.sh";
        } else {
            $cmd = "";
        }
        
        try {
            $results = getEPAFile($type, $subType);
            if ($results == "SUCCESSFUL DOWNLOAD") {
               $results = execCommand($cmd);
               
               if ($results == "SUCCESSFUL EXTRACT") {
                   $results = loadData($type, $subType);
               }
            }
            
        } catch(Exception $e) {
            $results = "FAILED TO LOAD DATA!";
        } finally {
            return $results;
        }
            
    }

}
?>