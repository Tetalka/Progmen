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
function database($url, $user, $pass, $db) {
    $link = new mysqli($url, $user, $pass, $db);
    if ($link->connect_error) {
    		$db_error_reason = 'Connect Error (' . $link->connect_errno . ') ' . $link->connect_error;
    		writeError($db_error_reason);
            say('Error', 'Server_error');
        }
    return $link;
};
?>