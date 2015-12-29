<?php

class GetEPAData extends RestService { 
    
     protected  $fileSaveDir = "../server/sql/data/";
     protected  $csvName = "VA_FACILITY_FILE.csv";

    /**
     * getEPAFile($type, $subType)
     * Pull recent file from the EPA dataset. 
     * Params: 
     *      $type - current accepted value is "FRS" -- can be added to if additional data sources added;
     *      $subType - current accepted values are "NAT" or US State codes (2 char) 
     */

    public function getEPAFile($type, $subType) {
        $fileName = $this->dbService->getFileName($type, $subType);
        $url = $this->dbService->getURL($type,$subType);

        try {
            
            if ($fileName <> "" && $url <> "") {
                $ch = curl_init();
                curl_setopt($ch, CURLOPT_URL, $url);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
                $data = curl_exec ($ch);
                curl_close ($ch);
                
                $destination = $this->fileSaveDir . $fileName;
                $file = fopen($destination, "w+");
                fputs($file, $data);
                fclose($file);
    
                $results = "SUCCESSFUL DOWNLOAD";
            } else {
                $results = "FAILED URL RETRIEVAL";
            }
            
        } catch(Exception $e) {
            $results = "FAILED DOWNLOAD";
            echo $e;
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
        $filePath = $this->fileSaveDir . $this->csvName;
        //echo $filePath;
        
        try {
            $results = shell_exec($cmd); //exec($cmd); // . " > /dev/null &");   
            //echo $cmd . " completed.";
            if (file_exists($filePath)) {
                echo "\nThe file $filePath exists";
                $results = "SUCCESSFUL EXTRACT";
            } else {
                echo "\nThe file $filePath does not exist";
            }
        } catch (Exception $e) {
            $results = "FAILED PROCESS";
            echo $e;
        } finally {
            echo "\n".$results;
            return $results;
        }
    } 



    /**
     * processEPAFile($type, $subType)
     * Calls getEPAFile, execCommand, and loadData. 
     * Params: 
     *      $type - current default value is "FRS" -- can be added to if additional data sources added;
     *      $subType - current accepted values are "NAT" or US State codes (2 char) 
     */

    public function processEPAFile() { //$type, $subType
        $params = $this->app->request->get();
        $type = $params["type"];
        $subType = $params["subtype"];
        
        if ($type == "FRS") {
            $cmd = "./server/scripts/frs_file_process.sh";
        } else {
            $cmd = "";
        }
        
        try {
            $results = $this->getEPAFile($type, $subType);
            if ($results == "SUCCESSFUL DOWNLOAD") {
                //echo $results;
                 $results = $this->execCommand($cmd);
                //echo $results;
               if ($results == "SUCCESSFUL EXTRACT") {
                  // echo $results;
                   $results = $this->dbService->loadData($type, $subType);
                  // echo $results;
                  if ($results == "SUCCESSFUL LOAD") {
                      $result = $this->dbService->checkData($type, $subType);
                        if ($result > 0) {
                            echo "\n". $result . " records loaded";
                            $results = "SUCCESSFUL LOAD";
                        } else {
                            echo "\nNo records loaded.";
                            $results = "FAILED LOAD PROCESS";
                        }
                  }
               }
            }
            
        } catch(Exception $e) {
            $results = "FAILED TO LOAD DATA!";
            echo $e;
        } finally {
            echo "\n".$results;
            return $results;
        }
            
    }

}
?>