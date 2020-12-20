<?php 

	$user = 'id15446174_progman';
	$pass = 'Progaman4.5~';
	$db = 'id15446174_progmen';

function getAll($filter = '') {
    global $user, $pass, $db;
        $phones = array();
    $link = database('localhost', $user, $pass, $db);
    $query = 'SELECT Model, Diagonal, Display, Resolution, Processor, Cores, ROM, RAM, Camera, Face_image, Price FROM `Products`';
    if($filter !== '') {
        $query = $query . ' WHERE Model LIKE "%' . $filter . '%"';
    }
        if ($result = $link->query($query . ";")) {
            if($result->num_rows == 0) {
                return false;
            }
            else {
            $i = 0;
            while($phone = $result->fetch_array(MYSQLI_ASSOC)) {
                $phones[$i] = new stdclass;
                $phones[$i]->Model = $phone['Model'];
                $phones[$i]->Display = $phone['Diagonal'] . ' ' . $phone['Display'] . ' ' . $phone['Resolution'];
                $phones[$i]->Processor = $phone['Processor'] . ' (' . $phone['Cores'] . ' cores)';
                $phones[$i]->ROM = $phone['ROM'];
                $phones[$i]->RAM = $phone['RAM'];
                $phones[$i]->Camera = $phone['Camera'];
                $phones[$i]->Face_image = $phone['Face_image'];
                $phones[$i]->Price = $phone['Price'];
                $i++;
            }
        return $phones;
        }
    }
    else {
    	say('Error', 'Server_error');
    	writeError('Query error (' . $link->errno . ') ' . $link->error);
    	}
}

function getModel($model, $color) {
    if($color == null) $color = 'Black';
        global $user, $pass, $db;
        $link = database('localhost', $user, $pass, $db);
        if($result = $link->query("SELECT
    * FROM Phones WHERE Model = '" . $model . "' ;")) {
            if($result == null) {
               return 'Model_doesn\'t_exist'; 
            }
            else {
                $phone = new stdclass;
                $phone->Model = $model;
                $phone->Color = $color;
                $images = array();
                $colors = array();
                $colorsCode = array();
                $i = 0;
                while($row = $result->fetch_array(MYSQLI_ASSOC)) {
                    if($row['Color'] == $color && strpos($row['Path'], 'main') === false) $images[count($images)] = $row['Path'];
                    if(!arrayContains($colors, $row['Color'])) {
                        $colors[$i] = $row['Color'];
                        $colorsCode[$i] = $row['Value'];
                    }
                    $phone->Diagonal = $row['Diagonal'];
                    $phone->Resolution = $row['Resolution'];
                    $phone->Display = $row['Display'];
                    $phone->Processor = $row['Processor'];
                    $phone->ROM = $row['ROM'];
                    $phone->RAM = $row['RAM'];
                    $phone->Cores = $row['Cores'];
                    $phone->Videoprocessor = $row['Videoprocessor'];
                    $phone->Camera = $row['Camera'];
                    $phone->Front_camera = $row['Front camera'];
                    $phone->Wireless_interface = $row['Wireless interface'];
                    $phone->Unit_of_WiFi = $row['Unit of Wi-Fi'];
                    $phone->Numbers_of_SIMCard = $row['Numbers of SIM-card'];
                    $phone->Type_of_SIM = $row['Type of SIM'];
                    $phone->Battery = $row['Battery'];
                    if($color != $row['MainColor']) {
                        if(strpos($row['Path'], 'main') !== false && $color == $row['Color']) $phone->Face_image = $row['Path'];
                    }
                    else $phone->Face_image = $row['Face_image'];
                    $phone->Price = $row['Price'];
                    $i++;
                }
                $phone->Images = $images;
                $phone->Colors = $colors;
                $phone->Colors_value = $colorsCode;
                return $phone;
            }
        }
        else {
            say('Error', 'Server_error');
    	    writeError('Query error (' . $link->errno . ') ' . $link->error);
        }
}

$request = file_get_contents('php://input');
$request = json_decode($request, true);
if($request['type'] == 'GetPhones') {
    $request = $request['object'];
    require 'DB.php';
	if($request['model'] == 'all') {
	    if(isset($request['filter'])) {
	        $response = getAll(substr($request['filter'], 0, 60));
	        if($response) say('OK', $response);
	        else say('Error', 'No such models');
	    }
	    else say('OK', getAll());
	}
	else if ($request['model']) say('OK', getModel($request['model'], $request['color']));
}
else say('Error', 'Bad_request');
?>