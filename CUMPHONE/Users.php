<?php

	$user = 'id15446174_progman';
	$pass = 'Progaman4.5~';
	$db = 'id15446174_progmen';

    /*$cookie_signIn = array(
        'path' => '/',
        'domain' => 'progmen.000webhostapp.com',
        'secure' => true,
        'httponly' => true,
        'samesite' => 'Lax'
    );*/

function SignIn($login, $password) {
    global $user, $pass, $db, $cookie_signIn;
    $link = database('localhost', $user, $pass, $db);
    $response = new stdClass;
    if($_COOKIE['SignIn_times'] > 4) {
        $response->Value = ['Too much attempts of login in', 'Try again in 15 minutes'];
        say('Error', $response);
    }
    else {
    if($result = $link->query("SELECT Login, Password FROM Clients WHERE Login = '" . $login . "';")) {
		if($result->num_rows > 0) {
			$value = $result->fetch_array(MYSQLI_ASSOC);
			if(password_verify($password, $value['Password'])) {
				$link->close();
				$response->Login = $login;
				say('Authorisation', $response);
			}
			else {
			    setcookie('SignIn_times', $_COOKIE['SignIn_times']+1, time() + 900, '/', '', true, true);
			    $response->Value = 'Invalid username or password';
				say('Error', $response);
			}
		}
		else {
		   	setcookie('SignIn_times', $_COOKIE['SignIn_times']+1, time() + 900, '/', '', true, true);
		    $response->Value = 'Invalid username or password';
			say('Error', $response);
		}
		}
		else {
		write_error($link->error);
		$response->Value = 'Server_error';
		say('Error', $response);
		}
    }
}

function SignUp($login, $password, $vpassword) {
    global $user, $pass, $db;
    $response = new stdClass;
    if($password == $vpassword) {
    $password = password_hash($password, PASSWORD_DEFAULT, ['memory_cost' => 2048, 'time_cost' => 4, 'threads' => 4]);
    $link = database('localhost', $user, $pass, $db);
        if($result = $link->query('SELECT Login FROM Clients WHERE Login = \'' . $login . '\';')) {
            if($result->num_rows > 0) {
                $response->Value = 'Login already exists';
                say('Error', $response);
            }
            else {
                $result->free();
                if($link->query('INSERT INTO Clients VALUES (NULL, "' . $login . '", "' . $password . '");')) {
                    setcookie('SignUp_times', $_COOKIE['SignUp_times']+1, time() + 86400, '/', '', true, true);
                    say('Registration');
                }
                else {
                    $response->Value = 'Server_error';
                    say('Error', $response);
    	            writeError('Insert error (' . $link->errno . ') ' . $link->error);
                }
            }
        }
        else {
            $response->Value = 'Server_error';
            say('Error', $response);
    	   writeError('Insert error (' . $link->errno . ') ' . $link->error);
        }
    }
    else {
        $response->Value = 'Passwords don\'t match';
        say('Error', $response);
    }
}

$request = file_get_contents('php://input');
$request = json_decode($request, true);
require 'DB.php';
if($request['Type'] == 'Users') {
    $request = $request['data'];
    $login = substr($request['Login'], 0, 55);
    $password = substr($request['Password'], 0, 55);
	if($request['Action'] == 'Sign in') {
	    if (!isset($_COOKIE['SignIn_times']))
    	setcookie('SignIn_times', 0, time() + 900, '/', '', true, true);
    	SignIn($login, $password);
    }
	else if ($request['Action'] == 'Sign up') {
	   $vpassword = substr($request['VPassword'], 0, 55);
	   	   if (!isset($_COOKIE['SignUp_times'])) setcookie('SignUp_times', 0, time() + 86400, '/', '', true, true);
	       if($_COOKIE['SignUp_times'] > 2) say('Error', ['Too much times of registrations', 'You can repeat it again in 1 day']);
	       else {
	           SignUp($login, $password, $vpassword);
	       }
	    }
	else say('Error', 'Bad_request');
}
else say('Error', 'Bad_request');
?>