<?php
/*class Database {
    private $url, $user, $pass, $database;
    public function Database($url, $user, $pass, $database) {
        $this->url = $url;
        $this->user = $user;
        $this->pass = $pass;
        $this->db = $database;
        $link = new mysqli($this->url, $this->user, $this->pass, $this->db);
    return $link;
    }
}*/
class Database {
	function __construct($url, $user, $pass, $db) {
		$this->url = $url;
		$this->user = $user;
		$this->pass = $pass;
		$this->db = $db;
	}
	
	function makeLink() {
		$this->link = new mysqli($this->url, $this->user, $this->pass, $this->db);
		if ($this->link->connect_error) {
				$db_error_reason = 'Connect Error (' . $this->link->connect_errno . ') ' . $this->link->connect_error;
				$this->writeError($db_error_reason);
				//say('Error', 'Server_error');
				return false;
			}
		return true;
	}
	
	function makeQuery($query) {
		if($this->makeLink()) {
			if($result = $this->link->query($query)) {
				$this->link->close();
				return $result;
			}
			else {
				$this->writeError('Query error (' . $this->link->errno . ') ' . $this->link->error);
				$this->link->close();
				return false;
			}
		}
		else return false;
	}
	
	function writeError($error) {
    	$log = fopen('Errors.log', 'a');
    	fwrite($log, "\n" . date('F, D, \D\a\y j, H:i:s: ') . $error . '.');
    	fclose($log);
	}
}

$progman = new Database('localhost', 'id15446174_progman', 'Progaman4.5~', 'id15446174_progmen');

function arrayContains($array, $string) {
    for($i = 0; $i < count($array); $i++) {
        if($array[$i] == $string) return true;
    }
    return false;
}

class Response {
	function __construct() {
		$this->Errors = array();
	}
	
	function writeData($data) {
		$this->Data = $data;
	}
	
	function writeError($error) {
		array_push($this->Errors, $error); 
	}
	
	function send() {
		echo json_encode($this);
	}
}
?>