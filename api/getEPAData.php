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
                $this->downloadFile($url.$fileName, $this->fileSaveDir.$fileName);
            
    
                $results = "SUCCESSFUL DOWNLOAD";
            } else {
                $results = "FAILED URL RETRIEVAL";
            }
            
        } catch(Exception $e) {
            $results = "FAILED DOWNLOAD";
            echo $e;
        } finally {
            echo $results;
            return $results;
        }

    }

    private function downloadFile($url, $path)
    {
        $newfname = $path;
        $file = fopen ($url, 'rb');
        if ($file) {
            $newf = fopen ($newfname, 'wb');
            if ($newf) {
                while(!feof($file)) {
                    fwrite($newf, fread($file, 1024 * 8), 1024 * 8);
                }
            }
        }
        if ($file) {
            fclose($file);
        }
        if ($newf) {
            fclose($newf);
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
        
        $this->csvName = $subType."_FACILITY_FILE.csv";
        
        if ($type == "FRS") {
            $cmd = ". ../server/scripts/frs_file_process.sh '$subType'";
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