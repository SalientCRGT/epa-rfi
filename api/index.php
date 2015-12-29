<?php

require 'Slim/Slim.php';
\Slim\Slim::registerAutoloader();
require 'SelectStmt.php';
require 'restService.php';
require 'dbService.php';
require 'facilityService.php';
require 'getEPAData.php';

ini_set('display_errors', '1');
error_reporting(-1);

$app = new \Slim\Slim();

// Facility Services
$app->get('/facilities', 'FacilityService:getFacilities');
$app->get('/facilities/:registryId', 'FacilityService:getFacilityById');

// File Processing Services
$app->get('/files', 'GetEPAData:processEPAFile');

$app->run();


?>