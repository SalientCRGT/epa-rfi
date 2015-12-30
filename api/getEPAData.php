<?php

class GetEPAData extends RestService { 
    
    protected  $fileSaveDir = "../server/sql/data/";
    protected  $csvName = "VA_FACILITY_FILE.csv";
    protected $type  = "";
    protected  $subType = "";

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
        } finally {
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
        $subType = $this->subType;
        try {
            
            putenv("SUB_TYPE=$subType");
            putenv("SUB_TYPE_LOWER=".strtolower($subType));
            $results = exec($cmd); //exec($cmd); // . " > /dev/null &");   
            if (file_exists($filePath)) {
                $results = "SUCCESSFUL EXTRACT";
            } 
        } catch (Exception $e) {
            $results = "FAILED PROCESS";
        } finally {
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
        $this->type = $params["type"];
        $this->subType = $params["subtype"];
        
        $this->csvName = $this->subType."_FACILITY_FILE.csv";
        
        if ($this->type == "FRS") {
            $cmd = ". ../server/scripts/frs_file_process.sh";
        } else {
            $cmd = "";
        }
        
        try {
            $results = $this->getEPAFile($this->type, $this->subType);
            if ($results == "SUCCESSFUL DOWNLOAD") {
                 $results = $this->execCommand($cmd);
               if ($results == "SUCCESSFUL EXTRACT") {
                   $results = $this->dbService->loadData($this->type, $this->subType);
                  if ($results == "SUCCESSFUL LOAD") {
                      $result = $this->dbService->checkData($this->type, $this->subType);
                        if ($result > 0) {
                            $results = "SUCCESSFUL LOAD";
                        } else {
                            $results = "FAILED LOAD PROCESS";
                        }
                  }
               }
               
            }
            
            $dir =  $this->fileSaveDir.$this->csvName;
            $cmd = "rm $dir";
            $results =  $this->execCommand($cmd);
            
            $dir =  $this->fileSaveDir."state_combined_".strtolower($this->subType).".zip";
            $cmd = "rm $dir";
            $results =  $this->execCommand($cmd);
            
            
        } catch(Exception $e) {
            $results = "FAILED TO LOAD DATA!";
        } finally {
            
            $this->setResponse($results, $results, 0, 0, array());
            $this->outputResponse();
            return $results;
        }
            
    }

}
?>