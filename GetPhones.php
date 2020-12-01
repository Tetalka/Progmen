<?php 

	$user = 'id15446174_progman';
	$pass = 'Progaman4.5~';
	$db = 'id15446174_progmen';

function say($type, $message) {
    echo json_encode([$type, $message]);
}

function getAll() {
    global $user, $pass, $db;
        $phones = array();
    $link = database('localhost', $user, $pass, $db);
        if ($result = $link->query("SELECT Model, Diagonal, Display, Resolution, Processor, Cores, ROM, RAM, Camera, Face_image, Price FROM `Products`;")) {
            $i = 0;
            while($phone = $result->fetch_array(MYSQLI_ASSOC)) {
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
    Tempo.Model,
    Tempo.Value,
    Tempo.Color,
    Tempo.Diagonal,
        Tempo.Resolution,
        Tempo.Display,
        Tempo.Processor,
        Tempo.ROM,
        Tempo.RAM,
        Tempo.Cores,
        Tempo.Videoprocessor,
        Tempo.Camera,
        Tempo.`Front camera`,
        Tempo.`Wireless interface`,
        Tempo.`Unit of Wi-Fi`,
        Tempo.`Numbers of SIM-card`,
        Tempo.`Type of SIM`,
        Tempo.Battery,
        Tempo.Face_image,
        Tempo.Price
FROM
    (
    SELECT
        Products.ID,
        Products.Model AS Model,
        Products.Diagonal,
        Products.Resolution,
        Products.Display,
        Products.Processor,
        Products.ROM,
        Products.RAM,
        Products.Cores,
        Products.Videoprocessor,
        Products.Camera,
        Products.`Front camera`,
        Products.`Wireless interface`,
        Products.`Unit of Wi-Fi`,
        Products.`Numbers of SIM-card`,
        Products.`Type of SIM`,
        Products.Battery,
        Products.Face_image,
        Products.Price,
        Products_images.ID_Model,
        Products_images.ID_Image,
        ProductsImages.Value,
        ProductsImages.Color
    FROM
        Products_images
    JOIN Products ON Products_images.ID_Model = Products.ID
    JOIN ProductsImages ON Products_images.ID_Image = ProductsImages.ID
) AS Tempo WHERE Tempo.Color = '" . $color . "' AND Tempo.Model = '" . $model . "' ;")) {
            if($result == null) {
               return 'Model_doesn\'t_exist'; 
            }
            else {
                $phone = new stdclass;
                $phone->Model = $model;
                $phone->Color = $color;
                $images = array();
                $i = 0;
                while($row = $result->fetch_array(MYSQLI_ASSOC)) {
                    $images[$i] = $row['Value'];
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
                    $phone->Face_image = $row['Face_image'];
                    $phone->Price = $row['Price'];
                    $i++;
                }
                $phone->Images = $images;
                return $phone;
            }
        }
        else {
            say('Error', 'Server_error');
    	    writeError('Query error (' . $link->errno . ') ' . $link->error);
        }
    }
function writeError($error) {
    	$log = fopen('Errors.log', 'a');
    	fwrite($log, "\n" . date('F, D, \D\a\y j, H:i:s: ') . $error . '.');
    	fclose($log);
    }

$request = file_get_contents('php://input');
$request = json_decode($request, true);
if($request['type'] == 'GetPhones') {
    $request = $request['object'];
    require 'DB.php';
	if($request['model'] == 'all') {
	say('OK', getAll());
	}
	else if ($request['model']) say('OK', getModel($request['model'], $request['color']));
}
else say('Error', 'Bad_request');
?>