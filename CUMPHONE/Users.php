<?php

function SignIn($login, $password) {
    global $progman;
	$user = $progman->makeQuery("SELECT Login, Password FROM Clients WHERE Login = '" . $login . "';");
    if($user->num_rows != 0) {
		$value = $user->fetch_array(MYSQLI_ASSOC);
		if(password_verify($password, $value['Password'])) {
			return $value['Login'];
		}
	}
	return false;
}

function SignUp($login, $password, $vpassword) {
    global $progman;
    $password = password_hash($password, PASSWORD_DEFAULT, ['memory_cost' => 2048, 'time_cost' => 4, 'threads' => 4]);
    $user = $progman->makeQuery('SELECT Login FROM Clients WHERE Login = \'' . $login . '\';');
    if($user->num_rows != 0) {
        return false;
    }
    else {
        $progman->makeQuery('INSERT INTO Clients VALUES (NULL, "' . $login . '", "' . $password . '");');
		return true;
    }
}

$request = file_get_contents('php://input');
$request = json_decode($request, true);
require 'DB.php';
$response = new Response();
if($request['Type'] == 'Users') {
    $request = $request['Data'];
    $login = substr($request['Login'], 0, 55);
    $password = substr($request['Password'], 0, 55);
	if($request['Action'] == 'Sign in') {
	    if (!isset($_COOKIE['SignIn_times'])) {
			setcookie('SignIn_times', 0, time() + 900, '/', '', true, true);
		}
		if($_COOKIE['SignIn_times'] >= 5) {
			$response->writeError('Too much attempts of login in'); 
			$response->writeError('Try again in 15 minutes');
		}	
		else {
			$status = SignIn($login, $password);
			if($status) $response->writeData($status);
			else {
				setcookie('SignIn_times', $_COOKIE['SignIn_times']+1, time() + 900, '/', '', true, true);
				$response->writeError('Invalid login or password');
			}
		}
    }
	else if ($request['Action'] == 'Sign up') {
	   $vpassword = substr($request['VPassword'], 0, 55);
	   	if (!isset($_COOKIE['SignUp_times'])) setcookie('SignUp_times', 0, time() + 86400, '/', '', true, true);
	    if($_COOKIE['SignUp_times'] >= 3) {
			$response->WriteError('Too much times of registrations');
			$response->WriteError('You can repeat it again in 1 day');
		}
	    else {
			if($password === $vpassword) {
				$status = SignUp($login, $password, $vpassword);
				if($status) {
					setcookie('SignUp_times', $_COOKIE['SignUp_times']+1, time() + 86400, '/', '', true, true);
					$response->writeData(true);
				}
				else $response->writeError('User already exists');
			}
			else $response->writeError('Passwords don\'t match');
	    }
	}
	else $response->WriteError('Bad_request');
}
else $response->WriteError('Bad_request');
$response->send();
?>