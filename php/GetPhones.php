<?php 
/*class Phone {
    public $model, $display, $processor, $ROM, $RAM, $camera, $img, $price;
    public function Phone(string $model, $display, $processor, $ROM, $RAM, $camera, $img, int $price) {
        $this->model = $model;
        $this->display = $display;
        $this->processor = $processor;
		$this->ROM = $ROM;
		$this->RAM = $RAM;
		$this->camera = $camera;
		$this->img = $img;
		$this->price = $price;
    }
    public function getInfo() {
		return $this;
	}
}
*/

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
        if ($result = $link->query("SELECT Model, Display, Processor, ROM, RAM, Camera, Image, Price FROM `Products`;")) {
            $i = 0;
            while($phone = $result->fetch_array(MYSQLI_ASSOC)) {
                $phones[$i] = $phone;
                $i++;
            }
        return $phones;
        }
    else {
    	say('Error', 'Server_error');
    	writeError('Prepare error (' . $link->errno . ') ' . $link->error);
    	}
    }
    function getModel($model) {
        global $user, $pass, $db;
        $link = database('localhost', $user, $pass, $db);
        if($result = $link->query("SELECT Model, Display, Processor, ROM, RAM, Camera, Image, Price  FROM `Products` WHERE Model = '" . $model . "' ;")) {
            if($result == null) {
               return 'Model_doesn\'t_exist'; 
            }
            else return $result->fetch_array(MYSQLI_ASSOC);
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
    require 'DB.php';
	if($request['model'] == 'all') {
	    /*$phones = new class{
	        public $status = 'OK';
	        public $data = getAll();
	    };*/
	say('OK', getAll());
	}
	else if ($request['model']) say('OK', getModel($request['model']));
}
else say('Error', 'Bad_request');
?>