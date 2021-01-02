<?php 

class Product {
	function __construct($model, $price) {
		$this->Model = $model;
		$this->Price = $price;
	}
}

function getAll($filter = '') {
    global $progman;
    $phones = array();
    //$link = database($progman);
    $query = 'CALL GetAllPhones("' . $filter . '");';
	//$result = makeQuery($link, $query);
	$result = $progman->makeQuery($query);
    if($result === false || $result->num_rows == 0) return false;
    else {
		$i = 0;
        while($phone = $result->fetch_array(MYSQLI_ASSOC)) {
			$phones[$i] = new Product($phone['Model'], $phone['Price']);
			$phones[$i]->Display = $phone['Diagonal'] . ' ' . $phone['Display'] . ' ' . $phone['Resolution'];
			$phones[$i]->Processor = $phone['Processor'] . ' (' . $phone['Cores'] . ' cores)';
			$phones[$i]->ROM = $phone['ROM'];
			$phones[$i]->RAM = $phone['RAM'];
			$phones[$i]->Camera = $phone['Camera'];
			$phones[$i]->Price = $phone['Price'];
			$phones[$i]->Image = $phone['Path'];
			$i++;
		}
        return $phones;
    }
}

function getModel($model, $color = null) {
    global $progman;
	$query = 'CALL GetPhoneByModel("' . $model . '");';
	$result = $progman->makeQuery($query);
	if($result === false || $result->num_rows == 0) return false;
    $colors = array();	
	$images = array();
	$row1 = $result->fetch_array(MYSQLI_ASSOC);
	$phone = new Product($model, $row1['Price']);
	if($color == null) $color = $row1['Color'];
	$phone->Diagonal = $row1['Diagonal'];
    $phone->Resolution = $row1['Resolution'];
    $phone->Display = $row1['Display'];
    $phone->Processor = $row1['Processor'];
	$phone->ROM = $row1['ROM'];
    $phone->RAM = $row1['RAM'];
    $phone->Cores = $row1['Cores'];
	$phone->Videoprocessor = $row1['Videoprocessor'];
	$phone->Camera = $row1['Camera'];
    $phone->FrontCamera = $row1['Front camera'];
    $phone->WirelessInterface = $row1['Wireless interface'];
    $phone->UnitOfWiFi = $row1['Unit of Wi-Fi'];
    $phone->NumbersOfSIMCard = $row1['Numbers of SIM-card'];
    $phone->TypeOfSIM = $row1['Type of SIM'];
    $phone->Battery = $row1['Battery'];
	$phone->CurrentColor = $color;
	$colors[$row1['Color']] = $row1['Color_Code'];
	if($row1['Color'] == $color) $images[$row1['Image_Rank']] = $row1['Path'];
	while($row = $result->fetch_array(MYSQLI_ASSOC)) {
		if(!arrayContains($colors, $row['Color'])) $colors[$row['Color']] = $row['Color_Code'];
		if($row['Color'] == $color) $images[$row['Image_Rank']] = $row['Path'];
	}
    $phone->Images = $images;
    $phone->Colors = $colors;
    return $phone;
}

$request = file_get_contents('php://input');
$request = json_decode($request, true);
require 'DB.php';
$response = new Response();
if($request['Type'] == 'GetPhones') {
    $request = $request['Data'];
	if($request['Model'] == 'All') {
		$data;
	    if(isset($request['Filter'])) {
			$data = getAll(substr($request['Filter'], 0, 60));
	    }
	    else {
			$data = getAll();
		}
		if(!$data) {
			$response->writeError('No such models');
		}
		else $response->writeData($data);
	}
	else {
		if ($request['Model']) {
			if(isset($request['Color'])) $data = getModel($request['Model'], $request['Color']);
			else $data = getModel($request['Model']);
			if($data) $response->writeData($data);
			else $response->writeError('No such model');
		}
	}
}
else {
	$response->writeError('Bad_request');
}
$response->send();
?>