var inputForm = document.getElementsByClassName('input-form')[0];

function changeLoginDisplay(){
	inputForm.classList.toggle("disabled");
	clearSay();
}


var loginField = document.getElementsByClassName('inplogin')[0];
loginField.onchange = () => {clearSay();}
var passwordField = document.getElementsByClassName('password')[0];
passwordField.onchange = () => {clearSay();}
var confirmPasswordField = document.getElementsByClassName('password')[1];
confirmPasswordField.onchange = () => {clearSay();}
var passwordResetText = document.getElementsByClassName('forgot-password')[0];

var signinSignupButton = document.querySelector('.input-form__button');


function changeSigning(){
	confirmPasswordField.classList.toggle('disabled');
	passwordResetText.classList.toggle('disabled');
	signinSignupButton.classList.toggle('si');
	signinSignupButton.classList.toggle('su');
	let sender = document.querySelector('.page__content-text.text-title.link');
	if (signinSignupButton.classList[2] == 'si') {
		signinSignupButton.value = "SIGN IN";
		sender.innerHTML = "REGISTRATION";
	}
	else if (signinSignupButton.classList[2] == 'su') {
		signinSignupButton.value = "SIGN UP";
		sender.innerHTML = "SIGN IN";
	}
	clearSay();
}

async function Post(type, data) {
	var response = await fetch('Users.php',{
    method: 'POST',
    headers: {
        'Content-Type': 'application/json'
    },
    body: JSON.stringify({Type: type, data})
	});
	if(response.ok) {
		var answer = await response.text();
		answer = JSON.parse(answer);
		if(answer) {
			if(answer['Type'] == 'Authorisation') {changeLoginDisplay(); OnAuthorise(answer['Value']['Login'])}
			else if (answer['Type'] == 'Registration') OnRegistration();
			else if(answer['Type'] == 'Error') {
			    SayBefore(answer['Value']['Value']);
			    clearPasswords();
			    
			}
		}
	}
}

function OnAuthorise(login) {
    document.querySelector('.input-form__input.inplogin').value = '';
    document.querySelector('.input-form__input.password').value = '';
    document.querySelectorAll('.input-form__input.password')[1].value = '';
    document.querySelector('.login').parentNode.removeChild(document.querySelector('.login'));
    let login_block = document.createElement('div');
    login_block.classList.add('menu__item');
    login_block.classList.add('login');
    login_block.textContent = login;
    document.querySelector('.menu.menu-right').appendChild(login_block);
}

function OnRegistration() {
    document.querySelector('.input-form__input.inplogin').value = '';
    document.querySelector('.input-form__input.password').value = '';
    document.querySelectorAll('.input-form__input.password')[1].value = '';
    changeSigning();
    SayBefore('Succesful registration', undefined, true);
}

function SayBefore(text, elemSelector = '.input-form__button', status = false) {
    clearSay();
    let block = document.createElement('div');
    block.classList.add('input-form__message-block');
    if(!status) block.classList.add('input-form__message_error');
    else block.classList.add('input-form__message_good');
    if(Array.isArray(text)) {
        for (let i = 0; i < text.length; i++) {
        let message = document.createElement('span');
        message.classList.add('input-form__message');
        message.textContent = text[i];
        block.appendChild(message);
        }
    }
    else block.textContent = text;
    let button = document.querySelector(elemSelector);
    button.before(block);
}

function clearSay() {
    let message = document.querySelector('.input-form__message-block');
    if(message) message.parentNode.removeChild(message);
}

function clearPasswords() {
    document.querySelector('.input-form__input.password').value = '';
    document.querySelectorAll('.input-form__input.password')[1].value = '';
}

function isFilled(fields) {
    for (let field of fields) {
    if(field == '') return false;
    }
    return true;
}

function AUTHORISE(){
	if (signinSignupButton.classList[2] == 'si' || signinSignupButton.classList[1] == 'si') {
	    var login = document.querySelector('.input-form__input.inplogin').value;
	    var password = document.querySelector('.input-form__input.password').value;
        if(isFilled([login, password])) Post('Users', {Action: 'Sign in', Login: login, Password: password});
        else SayBefore('Fill in all fields');
	}
	else if (signinSignupButton.classList[2] == 'su') {
	    var login = document.querySelector('.input-form__input.inplogin').value.substring(0, 55);
	    var password = document.querySelector('.input-form__input.password').value.substring(0 ,55);
	    var vpassword = document.querySelectorAll('.input-form__input.password')[1].value.substring(0 ,55);
	    if(isFilled([login, password, vpassword])) {
	        if(password === vpassword) Post('Users', {Action: 'Sign up', Login: login, Password: password, VPassword: vpassword});
	        else SayBefore('Passwords don\'t match');
	    }
	    else SayBefore('Fill in all fields');
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