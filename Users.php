<?php

	$user = 'id15446174_progman';
	$pass = 'Progaman4.5~';
	$db = 'id15446174_progmen';

function SignIn($login, $password) {
    global $user, $pass, $db;
    $link = database('localhost', $user, $pass, $db);
    if($result = $link->query("SELECT Login, Password FROM Clients WHERE Login = '" . $login . "';")) {
		if($result->num_rows > 0) {
			$value = $result->fetch_array(MYSQLI_ASSOC);
			if(password_verify($password, $value['Password'])) {
				$link->close();
				$response = new stdClass;
				$response->Login = $login;
				say('OK', $response);
			}
			else {
				say('Error', 'Invalid username or password.');
			}
		}
		else {
			say('Error', 'Invalid username or password.');
		}
		}
		else {
		write_error($link->error);
		say('Error', 'Server_error');
		}
}

function SignUp($login, $password, $vpassword) {
    global $user, $pass, $db;
    if($password == $vpassword) {
    $password = password_hash($password, PASSWORD_DEFAULT, ['memory_cost' => 2048, 'time_cost' => 4, 'threads' => 4]);
    $link = database('localhost', $user, $pass, $db);
        if($result = $link->query('SELECT Login FROM Clients WHERE Login = \'' . $login . '\';')) {
            if($result->num_rows > 0) {
                say('Error', 'Login is already exist');
            }
            else {
                $result->free();
                if($result = $link->query('INSERT INTO Clients VALUES (NULL, "' . $login . '", "' . $password . '");')) {
                    say('OK');
                }
                else {
                    say('Error', 'Server_error');
    	            writeError('Insert error (' . $link->errno . ') ' . $link->error);
                }
            }
        }
        else {
            say('Error', 'Server_error');
    	   writeError('Insert error (' . $link->errno . ') ' . $link->error);
        }
    }
    else {
        say('Error', 'Passwords don\'t match');
    }
}

$request = file_get_contents('php://input');
$request = json_decode($request, true);
require 'DB.php';
if($request['type'] == 'Users') {
    $request = $request['data'];
	if($request['Action'] == 'Sign in') {
	SignIn($request['Login'], $request['Password']);
	}
	else if ($request['Action'] == 'Sign up') SignUp($request['Login'], $request['Password'], $request['VPassword']);
}
else say('Error', 'Bad_request');
?>