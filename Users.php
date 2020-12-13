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
				$response->Times = $_COOKIE['SignIn_times'];
				say('Authorisation', $response);
			}
			else {
			    setcookie('SignIn_times', $_COOKIE['SignIn_times']+1, time() + 900, '/', '', true, true);
			    $response->Value = 'Invalid username or password';
			    $response->Time = date('Y-m-d H:i:s', time()+900);
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
		say('Error', 'Server_error');
		}
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
                    say('Registration');
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
	   if (!isset($_COOKIE['SignUp_times']))
	   setcookie('SignUp_times', 0, strtotime('+1 day'), '/', '', true, true);
	   else  {
	       if($_COOKIE['SignUp_times'] > 2) say('Error', ['Too much times of registrations', 'You can repeat it again in 1 day']);
	       else {
	           setcookie('SignUp_times', 0, time() + 86400, '/', '', true, true);
	           SignUp($login, $password, $vpassword);
	       }
	   }
	}
	else say('Error', 'Bad_request');
}
else say('Error', 'Bad_request');
?>