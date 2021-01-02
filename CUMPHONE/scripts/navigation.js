
class AJAX {
	constructor(url, type) {
		this.url = url;
		this.type = type;
	}
	
	setLoading(block, classes) {
		this.loading = new Loading(block, classes);
	}
	
	async send(Data) {
		let response = await fetch(this.url,{
		method: 'POST',
		headers: {
			'Content-Type': 'application/json',
		},
		body: JSON.stringify({Type: this.type, Data})
		});
		if(response.ok) {
			response = await response.text();
			if(response) {
			response = JSON.parse(response);
			return response;
			}
		}
		else return false;
	}
}

class Loading {
	constructor(parent, classes) {
		this.parent = parent;
		if(Array.isArray(classes)) this.classes = [...classes];
		else this.classes = classes;
			let loading = GetElement('div', 'loading');
			let point1 = GetElement('div', [classes, 'loading__point1']);
			let point2 = GetElement('div', [classes, 'loading__point2']);
			let point3 = GetElement('div', [classes, 'loading__point3']);
			loading.appendChild(point1);
			loading.appendChild(point2);
			loading.appendChild(point3);
		this.loading = loading;
	}
	
	show() {
		this.parent.appendChild(this.loading);
	}
	
	hide() {
		this.parent.removeChild(this.loading);
	}
}

class Menu {
    constructor(block) {
        this.block = block;
		this.hide();
		this.visible = false;
    }
	
	add(item) {
		this.block.appendChild(item);
	}
	listen() {
		const outsideClick = e => {
			if(e.target != this.block.parentNode && !this.block.contains(e.target) && !this.block.classList.contains('disabled')) {
				this.hide();
				removeListener();
			}
		}
		const removeListener = () => {
			document.removeEventListener('click', outsideClick);
		}
		if(this.visible) document.addEventListener('click', outsideClick);
		else removeListener();
	}
	toggleVision() {
		this.block.classList.toggle('disabled');
		if(!this.block.classList.contains('disabled')) {
			this.visible = true;
			this.listen();
		}
		this.visible = false;
	}
	hide() {
		this.block.classList.add('disabled');
		this.visible = false;
	}
}

const login_form = {
	block: document.querySelector('.input-form'),
	signIn: true,
	
	toggleAction() {
		if(this.signIn) this.signIn = false;
		else this.signIn = true;
	},
	toggleVision() {
		this.block.classList.toggle('disabled');
	}
}

function changeLoginDisplay(){
	login_form.toggleVision();
	clearSay();
	clearPasswords();
}

function changeSigning(){
	clearFormInputs();
	let passwordResetText = document.querySelector('.forgot-password');
	let vpassword = document.querySelector('.confirm-password');
	let signinSignupButton = document.querySelector('.input-form__button');
	vpassword.classList.toggle('disabled');
	passwordResetText.classList.toggle('disabled');
	let toggleButton = document.querySelector('.page__content-text.text-title.link');
	if (!login_form.signIn) {
		signinSignupButton.value = "SIGN IN";
		toggleButton.textContent = "REGISTRATION";
		login_form.signIn = true;
	}
	else {
		signinSignupButton.value = "SIGN UP";
		toggleButton.textContent = "SIGN IN";
		login_form.signIn = false;
	}
	clearSay();
}

function Authorisation(login) {
	changeLoginDisplay();
	let loginbutton = document.querySelector('.login');
    loginbutton.parentNode.removeChild(loginbutton);
    let login_block = GetElement('div', ['menu__item', 'login'], login);
	let menu = new Menu(GetElement('div', 'login-menu'));
	let exit = GetElement('div', 'login-menu__item', 'Exit');
	exit.addEventListener('click', () => {
		window.location.reload();
	});
	menu.add(exit);
	login_block.appendChild(menu.block);
	login_block.addEventListener('click', () => {
		menu.toggleVision();
	});

    document.querySelector('.menu.menu-right').appendChild(login_block);
}

function Registration() {
    clearFormInputs();
    changeSigning();
    SayBefore('Succesful registration', document.querySelector('.input-form__button'), 'message__row_green');
}

function GetSay(txt, elem, cls) {
    let block = GetElement('div', 'message');
    if(Array.isArray(txt)) {
        for (let i = 0; i < txt.length; i++) {
        let message = GetElement('span', ['message__row', cls], txt[i]);
        block.appendChild(message);
        }
    }
    else {
		block.textContent = txt;
		block.classList.add(cls);
	}
	return block;
}

function SayBefore(txt, elem, cls) {
	clearSay();
    let say = GetSay(txt, elem, cls);
    elem.before(say);
}

function Say(txt, elem, cls) {
	clearSay();
    let say = GetSay(txt, elem, cls);
    elem.appendChild(say);
}

function clearSay() {
    let messages = document.querySelectorAll('.message');
    if(messages) {
		for(let message of messages) {
		message.parentNode.removeChild(message);
		}
	}
}

function clearPasswords() {
    document.querySelector('.password').value = '';
    document.querySelector('.confirm-password').value = '';
}

function clearFormInputs() {
	document.querySelector('.inplogin').value = '';
	clearPasswords();
}

function isFilled(fields) {
	if(Array.isArray(fields)) {
		for (let field of fields) {
		if(field == '') return false;
		}
	}
	else return fields == '';
    return true;
}

async function GoUser(){	    
	let login = document.querySelector('.input-form__input.inplogin').value.substring(0, 55);
	let password = document.querySelector('.input-form__input.password').value.substring(0, 55);
	let button = document.querySelector('.input-form__button');
	let errorClass = 'message__row_red';
	if (login_form.signIn) {

        if(isFilled([login, password])) {
			let ajax = new AJAX('Users.php', 'Users');
			let response = await ajax.send({Action: 'Sign in', Login: login, Password: password});
			if(response.Data) Authorisation(response.Data);
			else {
				SayBefore(response.Errors, button, errorClass);
			}
		}
        else SayBefore('Fill in all fields', button, errorClass);
	}
	else {
		let vpassword = document.querySelector('.confirm-password').value.substring(0 ,55);
	    if(isFilled([login, password, vpassword])) {
	        if(password === vpassword) {
				let ajax = new AJAX('Users.php', 'Users');
				let response = await ajax.send({Action: 'Sign up', Login: login, Password: password, VPassword: vpassword});
				if(response.Data) Registration();
				else {
					SayBefore(response.Errors, button, errorClass);
				}
			}
	        else SayBefore('Passwords don\'t match', button, errorClass);
	    }
	    else SayBefore('Fill in all fields', button, errorClass);
	}
}

function GetElement(tag, classes, text = '') {
	let element = document.createElement(tag);
	if(Array.isArray(classes)) {
		for (let value of classes) {
			element.classList.add(value);
		}
	}
	else element.classList.add(classes);
	if(text == null && teg == 'span') element.textContent = 'Not found';
	else element.textContent = text;
	return element;
}

function GetImg(classes, source) {
	let img = GetElement('img', classes);
	img.src = source;
	return img;
}

window.onload = function(){
	window.dispatchEvent(new Event("scroll"));
	let loginField = document.querySelector('.inplogin');
	loginField.onchange = () => {clearSay();}
	document.querySelector('.logo.logo-input.align-center').onclick = () => {window.location.href = 'index.php';};
	let passwordFields = document.querySelectorAll('.password');
	for (let field of passwordFields) 
	{
		field.onchange = () => {clearSay();}
	}

	window.addEventListener("scroll",function(){
		let scrollTop = window.pageYOffset || document.documentElement.scrollTop;
		let scrollHeight = Math.max(document.body.scrollHeight, document.documentElement.scrollHeight,document.body.offsetHeight, document.documentElement.offsetHeight,document.body.clientHeight, document.documentElement.clientHeight) - innerHeight;
		
		let percent = scrollTop/scrollHeight;
		let color = {r:0,g:0,b:0,a:1};
		
		let bgColor1 = {r:0,g:0,b:0,a:1}//Из какого цвета
		let bgColor2 = {r:85,g:223,b:186,a:1}//В какой цвет
		
		let tmp = Math.abs(bgColor1.r - bgColor2.r)*percent;
		color.r =  Math.ceil(bgColor1.r > bgColor2.r ? bgColor1.r - tmp: bgColor1.r + tmp);

		tmp = Math.abs(bgColor1.g - bgColor2.g)*percent;
		color.g =  Math.ceil(bgColor1.g > bgColor2.g ? bgColor1.g - tmp: bgColor1.g + tmp);

		tmp = Math.abs(bgColor1.b - bgColor2.b)*percent;
		color.b =  Math.ceil(bgColor1.b > bgColor2.b ? bgColor1.b - tmp: bgColor1.b + tmp);
		
		color.r = color.r.toFixed(2);
		color.g = color.g.toFixed(2);
		color.b = color.b.toFixed(2);
		
		document.querySelector('.header').style.backgroundColor = `rgba(${color.r},${color.g},${color.b},${color.a})`;
	});
};