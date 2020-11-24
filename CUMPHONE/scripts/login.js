var inputForm = document.getElementsByClassName('input-form')[0];

function changeLoginDisplay(){
	inputForm.classList.toggle("disabled");
}


var loginField = document.getElementsByClassName('inplogin')[0];
var passwordField = document.getElementsByClassName('password')[0];
var confirmPasswordField = document.getElementsByClassName('password')[1];
var passwordResetText = document.getElementsByClassName('forgot-password')[0];

var signinSignupButton = document.getElementsByClassName('input-form__button')[0];


function changeSigning(sender){
	confirmPasswordField.classList.toggle('disabled');
	passwordResetText.classList.toggle('disabled');
	signinSignupButton.classList.toggle('si');
	signinSignupButton.classList.toggle('su');
	if (signinSignupButton.classList[2] == 'si') {
		signinSignupButton.value = "SIGN IN";
		sender.innerHTML = "REGISTRATION";
	}
	else if (signinSignupButton.classList[2] == 'su') {
		signinSignupButton.value = "SIGN UP";
		sender.innerHTML = "SIGN IN";
	}
}


function AUTHORISE(){
	if (signinSignupButton.classList[2] == 'si') {
		alert(loginField.value);
		//вот тут че будет при входе
	}
	else if (signinSignupButton.classList[2] == 'su') {
		//вот тут че будет при регистрации
	}
}

document.getElementsByClassName('logo logo-input align-center')[0].onclick = function() {
window.location.href = 'main.html';
};