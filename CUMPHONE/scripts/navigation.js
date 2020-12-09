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

async function Post(type, data) {
	var response = await fetch('Users.php',{
    method: 'POST',
    headers: {
        'Content-Type': 'application/json'
    },
    body: JSON.stringify({type: type, data})
	});
	if(response.ok) {
		var answer = await response.text();
		answer = JSON.parse(answer);
		if(answer) {
			if(answer[0] == 'OK') {changeLoginDisplay(); OnAuthorise(answer[1]['Login'])};
		}
	}
}

function OnAuthorise(login) {
    document.querySelector('.input-form__input.inplogin').value = '';
    document.querySelector('.input-form__input.password').value = '';
    document.querySelectorAll('.input-form__input.password')[1].value = '';
    document.querySelector('.login').parentNode.removeChild(document.querySelector('.login'));
    var login_block = document.createElement('div');
    login_block.classList.add('menu__item');
    login_block.classList.add('login');
    login_block.textContent = login;
    document.querySelector('.menu.menu-right').appendChild(login_block);
}

function AUTHORISE(){
	if (signinSignupButton.classList[2] == 'si' || signinSignupButton.classList[1] == 'si') {
	    var login = document.querySelector('.input-form__input.inplogin').value;
	    var password = document.querySelector('.input-form__input.password').value;
        Post('Users', {action: 'sign in', Login: login, Password: password});
	}
	else if (signinSignupButton.classList[2] == 'su') {
	    var login = document.querySelector('.input-form__input.inplogin').value;
	    var password = document.querySelector('.input-form__input.password').value;
	    var vpassword = document.querySelectorAll('.input-form__input.password')[1].value;
	    Post('Users', {action: 'sign up', Login: login, Password: password, VPassword: vpassword});
	}
}

document.getElementsByClassName('logo logo-input align-center')[0].onclick = function() {
window.location.href = 'index.html';
};


var elem = document.getElementsByClassName('header')[0];

var bgColor1 = {r:0,g:0,b:0,a:1}//Из какого цвета
var bgColor2 = {r:85,g:223,b:186,a:1}//В какой цвет



window.onload = function(){
	window.dispatchEvent(new Event("scroll"));
}
window.addEventListener("scroll",function(){
	var scrollTop = window.pageYOffset || document.documentElement.scrollTop;
	var scrollHeight = Math.max(document.body.scrollHeight, document.documentElement.scrollHeight,document.body.offsetHeight, document.documentElement.offsetHeight,document.body.clientHeight, document.documentElement.clientHeight) - innerHeight;
	
	var percent = scrollTop/scrollHeight;
	var color = {r:0,g:0,b:0,a:1};
	
	var tmp = Math.abs(bgColor1.r - bgColor2.r)*percent;
	color.r =  Math.ceil(bgColor1.r > bgColor2.r ? bgColor1.r - tmp: bgColor1.r + tmp);

	tmp = Math.abs(bgColor1.g - bgColor2.g)*percent;
	color.g =  Math.ceil(bgColor1.g > bgColor2.g ? bgColor1.g - tmp: bgColor1.g + tmp);

	tmp = Math.abs(bgColor1.b - bgColor2.b)*percent;
	color.b =  Math.ceil(bgColor1.b > bgColor2.b ? bgColor1.b - tmp: bgColor1.b + tmp);
	
	color.r = color.r.toFixed(2);
	color.g = color.g.toFixed(2);
	color.b = color.b.toFixed(2);
	
	elem.style.backgroundColor = `rgba(${color.r},${color.g},${color.b},${color.a})`;
	});
