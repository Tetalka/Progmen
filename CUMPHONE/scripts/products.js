
function GetSrc(string) {
	if(string[4] == ':' || string[5] == ':') return string;
	else return '/images/' + string;
}

function GetElement(teg, classValue, text) {
	var element = document.createElement(teg);
	element.classList.add(classValue);
	if(text == null && teg == 'span') element.textContent = 'Not found';
	else element.textContent = text;
	return element;
}

async function GetPhones(object) {
	var response = await fetch('GetPhones.php',{
    method: 'POST',
    headers: {
        'Content-Type': 'application/json'
    },
    body: JSON.stringify({type: 'GetPhones', object})
	});
	if(response.ok) {
		var phones = await response.text();
		phones = JSON.parse(phones);
		if(phones) {
			if(phones[0] == 'OK') return(phones[1]);
		}
	}
}

async function ShowPhones(){
var phones = await GetPhones({model: 'all'});
    for(var i = 0; i < phones.length; i++) {
		//phone
		var phone = document.createElement('div');
		phone.classList.add('phone');

		//phone image
		var image = document.createElement('div');
		{
			image.classList.add('phone__image');
			var img = document.createElement('img');
			img.src = GetSrc(phones[i]['Face_image']);
			image.appendChild(img);
			phone.appendChild(image);
		}

		//phone properties
		var properties = document.createElement('div');
		properties.classList.add('phone__properties');
		{
			var classes = ['phone__name', 'phone__display', 'phone__processor', 'phone__rom', 'phone__ram', 'phone__camera'];
			var values = ['Model', 'Display', 'Processor', 'ROM', 'RAM', 'Camera'];
				var model = document.createElement('div');
				model.classList.add(classes[0]);
				model.textContent = phones[i][values[0]];
				model.addEventListener('click', function() {
    			ShowPhone(this.parentNode.childNodes[0].textContent);
    		});
				properties.appendChild(model);
			for(var j = 1; j < 6; j++) {
				var block = document.createElement('div');
				block.classList.add(classes[j]);
				block.textContent = values[j] + ': ' + phones[i][values[j]];
				properties.appendChild(block);
			}
			phone.appendChild(properties);
		}

		//phone price
		var price = document.createElement('div');
		price.classList.add('phone__cost');
		{
			var value = document.createElement('div');
			value.classList.add('phone__sum');
			value.textContent = phones[i]['Price'] + ' ₽';
			var buy = document.createElement('input');
			buy.classList.add('phone__cost_buy');
			buy.type = 'button';
			buy.value = 'Buy it now';
			price.appendChild(value);
			price.appendChild(buy);
			phone.appendChild(price);
		}

		phone.addEventListener('click', function() {
			ShowPhone(this.childNodes[1].childNodes[0].textContent);
		});
		document.querySelector('.phones').appendChild(phone);
	}
}

async function ShowPhone(model, color = null) {
	var phone = await GetPhones({model: model, color: color,});

	//phone page
	var block = document.createElement('div');
	block.classList.add('phone-page');

	//phone images (slider)
	var images_column = document.createElement('div');
	images_column.classList.add('phone-page__images-column');
	var image_main = document.createElement('img');
	image_main.classList.add('phone-page__image');
	image_main.classList.add('phone-page__image_active');
	image_main.src = GetSrc(phone['Face_image']);
	image_main.addEventListener('click', function() {
			var main = document.querySelector('.phone-page__main-image');
			main.classList.remove('phone-page__image_active');
			main.src = this.src;
			this.classList.add('phone-page__image_active');
		});
		images_column.appendChild(image_main);
	for(let i = 0; i < phone['Images'].length; i++) {
		let image = document.createElement('img');
		image.src = GetSrc(phone['Images'][i]);
		image.classList.add('phone-page__image');
		image.addEventListener('click', function() {
			var main = document.querySelector('.phone-page__main-image');
			main.classList.remove('phone-page__image_active');
			main.src = this.src;
			this.classList.add('phone-page__image_active');
		});
		images_column.appendChild(image);
	}
	block.appendChild(images_column);

	//phone main image
	var main_image_column = document.createElement('div');
	main_image_column.classList.add('phone-page__main-image-column');
	var image = document.createElement('img');
	image.classList.add('phone-page__main-image');
	image.src = GetSrc(phone['Face_image']);
	main_image_column.appendChild(image);
	//phone color selecting
	var color_block = document.createElement('div');
	color_block.classList.add('phone-page__colors');
	for(var i = 0; i < phone['Colors'].length; i++) {
	    let div = document.createElement('div');
	    div.classList.add('phone-page__color-block');
	    let box = document.createElement('div');
	    box.classList.add('phone-page__color-box');
	    let color = document.createElement('div')
	    color.classList.add('phone-page__color');
	    color.style.backgroundColor = phone['Colors_value'][i];
	    box.appendChild(color);
	    div.appendChild(box);
	    let value = GetElement('span', 'phone-page__color-value', phone['Colors'][i]);
	    div.appendChild(value);
	    let title = phone['Model'];
	    div.addEventListener('click', () => {UpdatePhonePage(title, value.textContent);});
	    div.addEventListener('mouseover', () => {
	        box.classList.add('phone-page__color-box_active');
	        color.classList.add('phone-page__color_active');
	        //value.classList.add('phone-page__color-value_active');
	        box.style.borderColor = color.style.backgroundColor;
	        value.style.color = color.style.backgroundColor;
	    });
	    div.addEventListener('mouseout', () => {
	        box.classList.remove('phone-page__color-box_active');
	        color.classList.remove('phone-page__color_active');
	        //value.classList.remove('phone-page__color-value_active');
	        box.style.borderColor = '';
	        value.style.color = '';
	    });
	    color_block.appendChild(div);
	}
	main_image_column.appendChild(color_block);
	block.appendChild(main_image_column);

	//phone info
	var info_column = document.createElement('div');
	info_column.classList.add('phone-page__info-column');
	{
		let title = GetElement('h2', 'phone-page__title', phone['Model']);
		info_column.appendChild(title);

		//screen block
		var screen_block = document.createElement('div');
		screen_block.classList.add('phone-page__info-block');
		var screen_block_title = GetElement('h3', 'phone-page__info-block-title', 'Screen:');
		screen_block.appendChild(screen_block_title);
		var resolution = GetElement('div', 'phone-page__info-label', 'Resolution: ');
		var resolution_value = GetElement('span', 'phone-page__info-value', phone['Resolution']);
		resolution.appendChild(resolution_value);
		screen_block.appendChild(resolution);
		var diagonal = GetElement('div', 'phone-page__info-label', 'Diagonal: ');
		var diagonal_value = GetElement('span', 'phone-page__info-value', phone['Diagonal']);
		diagonal.appendChild(diagonal_value);
		screen_block.appendChild(diagonal);
		var display = GetElement('div', 'phone-page__info-label', 'Display type: ');
		var display_value = GetElement('span', 'phone-page__info-value', phone['Display']);
		display.appendChild(display_value);
		screen_block.appendChild(display);
		info_column.appendChild(screen_block);

		//memory and processor block
		var memory_block = document.createElement('div');
		memory_block.classList.add('phone-page__info-block');
		var memory_block_title = GetElement('h3', 'phone-page__info-block-title', 'Memory & Processor:');
		memory_block.appendChild(memory_block_title);
		var processor = GetElement('div', 'phone-page__info-label', 'Processor: ');
		var processor_value = GetElement('span', 'phone-page__info-value', phone['Processor'])
		processor.appendChild(processor_value);
		memory_block.appendChild(processor);
		var rom = GetElement('div', 'phone-page__info-label', 'ROM: ');
		var rom_value = GetElement('span', 'phone-page__info-value', phone['ROM'] + 'Gb');
		rom.appendChild(rom_value);
		memory_block.appendChild(rom);
		var ram = GetElement('div', 'phone-page__info-label', 'RAM: ');
		var ram_value = GetElement('span', 'phone-page__info-value', phone['RAM'] + 'Gb');
		ram.appendChild(ram_value);
		memory_block.appendChild(ram);
		var cores = GetElement('div', 'phone-page__info-label', 'Cores of processor: ');
		var cores_value = GetElement('span', 'phone-page__info-value', phone['Cores']);
		cores.appendChild(cores_value);
		memory_block.appendChild(cores);
		var videoproc = GetElement('div', 'phone-page__info-label', 'Videoprocessor: ');
		var videoproc_value = GetElement('span', 'phone-page__info-value', phone['Videoprocessor']);
		videoproc.appendChild(videoproc_value);
		memory_block.appendChild(videoproc);
		info_column.appendChild(memory_block);

		//camera block
		var camera_block = document.createElement('div');
		camera_block.classList.add('phone-page__info-block');
		var camera_block_title = GetElement('h3', 'phone-page__info-block-title', 'Camera:');
		camera_block.appendChild(camera_block_title);
		var mainCum = GetElement('div', 'phone-page__info-label', 'Main camera: ');
		var mainCum_value = GetElement('span', 'phone-page__info-value', phone['Camera']);
		mainCum.appendChild(mainCum_value);
		camera_block.appendChild(mainCum);
		var frontCum = GetElement('div', 'phone-page__info-label', 'Front camera: ');
		var frontCum_value = GetElement('span', 'phone-page__info-value', phone['Front_camera']);
		frontCum.appendChild(frontCum_value);
		camera_block.appendChild(frontCum);
		info_column.appendChild(camera_block);

		//communication block
		var communication_block = document.createElement('div');
		communication_block.classList.add('phone-page__info-block');
		var communication_block_title = GetElement('h3', 'phone-page__info-block-title', 'Communication: ');
		communication_block.appendChild(communication_block_title);
		var wireless = GetElement('div', 'phone-page__info-label', 'Wireless interface: ');
		var wireless_value = GetElement('span', 'phone-page__info-value', phone['Wireless_interface']);
		wireless.appendChild(wireless_value);
		communication_block.appendChild(wireless);
		var unit = GetElement('div', 'phone-page__info-label', 'Unit of Wi-Fi: ');
		var unit_value = GetElement('span', 'phone-page__info-value', phone['Unit_of_WiFi']);
		unit.appendChild(unit_value);
		communication_block.appendChild(unit);
		var numsim = GetElement('div', 'phone-page__info-label', 'Number of SIM-card: ');
		var numsim_value = GetElement('span', 'phone-page__info-value', phone['Numbers_of_SIMCard']);
		numsim.appendChild(numsim_value);
		communication_block.appendChild(numsim);
		var typesim = GetElement('div', 'phone-page__info-label', 'Type of SIM: ');
		var typesim_value = GetElement('span', 'phone-page__info-value', phone['Type_of_SIM']);
		typesim.appendChild(typesim_value);
		communication_block.appendChild(typesim);
		info_column.appendChild(communication_block);

		//battery block
		var battery_block = document.createElement('div');
		battery_block.classList.add('phone-page__info-block');
		var battery_block_title = GetElement('h3', 'phone-page__info-block-title', 'Battery: ');
		var battery_value = GetElement('span', 'phone-page__info-value', phone['Battery'] + 'mAh');
		battery_block_title.appendChild(battery_value);
		battery_block.appendChild(battery_block_title);
		info_column.appendChild(battery_block);
	}
	block.appendChild(info_column);

	//panel
	var panel = document.createElement('div');
	panel.classList.add('phone-page__panel-column');
	var buy = GetElement('div', 'phone-page__buy', null);
	var buy_price = GetElement('span', 'phone-page__price', phone['Price'] + ' ₽');
	buy.appendChild(buy_price);
	var buy_button = GetElement('button', 'phone-page__buy-button', 'Buy it now');
	buy.appendChild(buy_button);
	panel.appendChild(buy);
	var notify = GetElement('div', 'phone-page__notify', null)
	var notify_label = GetElement('span', 'phone-page__notify-label', 'Are you want know when price down?');
	notify.appendChild(notify_label);
	var notify_button = GetElement('button', 'phone-page__notify-button', 'Notify');
	notify.appendChild(notify_button);
	panel.appendChild(notify);
	block.appendChild(panel);

	//exit button
	var exit = GetElement('button', 'phone-page__exit', 'X');
	exit.addEventListener('click', function() {
	    document.body.removeChild(document.querySelector('.phone-page'));
	});
	block.appendChild(exit);

	document.body.appendChild(block);
}

async function UpdatePhonePage(model, color) {
    let phonepages = document.querySelectorAll('.phone-page');
    for(let i = 0; i < phonepages.length; i++) {
        phonepages[i].parentNode.removeChild(phonepages[i]);
    }
    ShowPhone(model, color);
}

document.body.onload = ShowPhones();
