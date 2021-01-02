
function ShowPhones(phones){
    for(let i = 0; i < phones.length; i++) {
		//phone
		let phone = document.createElement('div');
		phone.classList.add('phone');

		//phone image
		let image = document.createElement('div');
		{	
		
		/* LOADING IS MUST BE HERE TOO */
		
			image.classList.add('phone__image');
			let img = document.createElement('img');
			img.src = phones[i]['Image'];
			image.appendChild(img);
			phone.appendChild(image);
		}

		//phone properties
		let properties = document.createElement('div');
		properties.classList.add('phone__properties');
		{
			let classes = ['phone__name', 'phone__display', 'phone__processor', 'phone__rom', 'phone__ram', 'phone__camera'];
			let values = ['Model', 'Display', 'Processor', 'ROM', 'RAM', 'Camera'];
				let model = document.createElement('div');
				model.classList.add(classes[0]);
				model.textContent = phones[i][values[0]];
				model.addEventListener('click', async function() {
				let ajax = new AJAX('GetPhones.php', 'GetPhones');
				let phone = await ajax.send({Model: model.textContent});
				if(phone.Data) ShowPhone(phone.Data);
    		});
				properties.appendChild(model);
			for(let j = 1; j < 6; j++) {
				let block = document.createElement('div');
				block.classList.add(classes[j]);
				block.textContent = values[j] + ': ' + phones[i][values[j]];
				properties.appendChild(block);
			}
			phone.appendChild(properties);
		}

		//phone price
		let price = document.createElement('div');
		price.classList.add('phone__cost');
		{
			let value = document.createElement('div');
			value.classList.add('phone__sum');
			value.textContent = phones[i]['Price'] + ' ' + String.fromCharCode('0x20bd');
			let buy = document.createElement('input');
			buy.classList.add('phone__cost_buy');
			buy.type = 'button';
			buy.value = 'Buy it now';
			price.appendChild(value);
			price.appendChild(buy);
			phone.appendChild(price);
		}
		
		document.querySelector('.phones').appendChild(phone);
	}
}

function ShowPhone(phone, page = GetElement('div', 'phone-page')) {
	
	//phone images (slider)
	let images_column = GetElement('div', 'phone-page__images-column');
	for(let img in phone['Images']) {
		let image_wrap = GetElement('div', 'phone-page__image-wrap');
		let image = GetImg('phone-page__image', phone['Images'][img]);
		image.addEventListener('click', function() {
			let main = document.querySelector('.phone-page__main-image');
			document.querySelector('.phone-page__image_active').classList.remove('phone-page__image_active');
			main.src = this.src;
			this.classList.add('phone-page__image_active');
		});
		let image_placeholder = GetElement('div', ['phone-page__image', 'phone-page__image-loading']);
		let image_loading = new Loading(image_placeholder, 'loading__point_black');
		image_loading.show();
		image_wrap.appendChild(image_placeholder);
		image.onload = () => {
			image_wrap.removeChild(image_placeholder);
		}
		image_wrap.appendChild(image);
		images_column.appendChild(image_wrap);
	}
	page.appendChild(images_column);

	//phone main image
	let main_image_column = GetElement('div', 'phone-page__main-image-column')
	let main_image_wrap = GetElement('div', 'phone-page__main-image-wrap');
	let image = GetImg('phone-page__main-image', phone['Images'][0]);
	let main_image_placeholder = GetElement('div', ['phone-page__main-image', 'phone-page__image-loading']);
	let main_image_loading = new Loading(main_image_placeholder, 'loading__point_black');
	main_image_loading.show();
	main_image_wrap.appendChild(main_image_placeholder);
	image.onload = () => {
		main_image_wrap.removeChild(main_image_placeholder);
	}
	main_image_wrap.appendChild(image);
	main_image_column.appendChild(main_image_wrap);
	//phone color selecting
	let color_block = GetElement('div', 'phone-page__colors');
	for(let entry in phone['Colors']) {
	    let block = GetElement('div', 'phone-page__color-block');
	    let box = GetElement('div', 'phone-page__color-box');
	    let color = GetElement('div', 'phone-page__color')
	    color.style.backgroundColor = phone['Colors'][entry];
	    box.appendChild(color);
	    block.appendChild(box);
	    let value = GetElement('span', 'phone-page__color-value', entry);
	    block.appendChild(value);
	    let title = phone['Model'];
	    block.addEventListener('click', () => {UpdatePhonePage(title, value.textContent, page);});
	    block.addEventListener('mouseover', () => {
	        box.classList.add('phone-page__color-box_active');
	        color.classList.add('phone-page__color_active');
	        box.style.borderColor = color.style.backgroundColor;
	        value.style.color = color.style.backgroundColor;
	    });
	    block.addEventListener('mouseout', () => {
	        box.classList.remove('phone-page__color-box_active');
	        color.classList.remove('phone-page__color_active');
	        box.style.borderColor = '';
	        value.style.color = '';
	    });
	    color_block.appendChild(block);
	}
	main_image_column.appendChild(color_block);
	page.appendChild(main_image_column);

	//phone info
	let info_column = document.createElement('div');
	info_column.classList.add('phone-page__info-column');
	{
		let title = GetElement('h2', 'phone-page__title', phone['Model']);
		info_column.appendChild(title);

		//screen block
		let screen_block = GetElement('div', 'phone-page__info-block');
		let screen_block_title = GetElement('h3', 'phone-page__info-block-title', 'Screen:');
		screen_block.appendChild(screen_block_title);
		let resolution = GetElement('div', 'phone-page__info-label', 'Resolution: ');
		let resolution_value = GetElement('span', 'phone-page__info-value', phone['Resolution']);
		resolution.appendChild(resolution_value);
		screen_block.appendChild(resolution);
		let diagonal = GetElement('div', 'phone-page__info-label', 'Diagonal: ');
		let diagonal_value = GetElement('span', 'phone-page__info-value', phone['Diagonal']);
		diagonal.appendChild(diagonal_value);
		screen_block.appendChild(diagonal);
		let display = GetElement('div', 'phone-page__info-label', 'Display type: ');
		let display_value = GetElement('span', 'phone-page__info-value', phone['Display']);
		display.appendChild(display_value);
		screen_block.appendChild(display);
		info_column.appendChild(screen_block);

		//memory and processor block
		let memory_block = GetElement('div', 'phone-page__info-block');
		let memory_block_title = GetElement('h3', 'phone-page__info-block-title', 'Memory & Processor:');
		memory_block.appendChild(memory_block_title);
		let processor = GetElement('div', 'phone-page__info-label', 'Processor: ');
		let processor_value = GetElement('span', 'phone-page__info-value', phone['Processor'])
		processor.appendChild(processor_value);
		memory_block.appendChild(processor);
		let rom = GetElement('div', 'phone-page__info-label', 'ROM: ');
		let rom_value = GetElement('span', 'phone-page__info-value', phone['ROM']);
		rom.appendChild(rom_value);
		memory_block.appendChild(rom);
		let ram = GetElement('div', 'phone-page__info-label', 'RAM: ');
		let ram_value = GetElement('span', 'phone-page__info-value', phone['RAM']);
		ram.appendChild(ram_value);
		memory_block.appendChild(ram);
		let cores = GetElement('div', 'phone-page__info-label', 'Cores of processor: ');
		let cores_value = GetElement('span', 'phone-page__info-value', phone['Cores']);
		cores.appendChild(cores_value);
		memory_block.appendChild(cores);
		let videoproc = GetElement('div', 'phone-page__info-label', 'Videoprocessor: ');
		let videoproc_value = GetElement('span', 'phone-page__info-value', phone['Videoprocessor']);
		videoproc.appendChild(videoproc_value);
		memory_block.appendChild(videoproc);
		info_column.appendChild(memory_block);

		//camera block
		let camera_block = GetElement('div', 'phone-page__info-block');
		let camera_block_title = GetElement('h3', 'phone-page__info-block-title', 'Camera:');
		camera_block.appendChild(camera_block_title);
		let mainCum = GetElement('div', 'phone-page__info-label', 'Main camera: ');
		let mainCum_value = GetElement('span', 'phone-page__info-value', phone['Camera']);
		mainCum.appendChild(mainCum_value);
		camera_block.appendChild(mainCum);
		let frontCum = GetElement('div', 'phone-page__info-label', 'Front camera: ');
		let frontCum_value = GetElement('span', 'phone-page__info-value', phone['FrontCamera']);
		frontCum.appendChild(frontCum_value);
		camera_block.appendChild(frontCum);
		info_column.appendChild(camera_block);

		//communication block
		let communication_block = GetElement('div', 'phone-page__info-block');
		let communication_block_title = GetElement('h3', 'phone-page__info-block-title', 'Communication: ');
		communication_block.appendChild(communication_block_title);
		let wireless = GetElement('div', 'phone-page__info-label', 'Wireless interface: ');
		let wireless_value = GetElement('span', 'phone-page__info-value', phone['WirelessInterface']);
		wireless.appendChild(wireless_value);
		communication_block.appendChild(wireless);
		let unit = GetElement('div', 'phone-page__info-label', 'Unit of Wi-Fi: ');
		let unit_value = GetElement('span', 'phone-page__info-value', phone['UnitOfWiFi']);
		unit.appendChild(unit_value);
		communication_block.appendChild(unit);
		let numsim = GetElement('div', 'phone-page__info-label', 'Number of SIM-card: ');
		let numsim_value = GetElement('span', 'phone-page__info-value', phone['NumbersOfSIMCard']);
		numsim.appendChild(numsim_value);
		communication_block.appendChild(numsim);
		let typesim = GetElement('div', 'phone-page__info-label', 'Type of SIM: ');
		let typesim_value = GetElement('span', 'phone-page__info-value', phone['TypeOfSIM']);
		typesim.appendChild(typesim_value);
		communication_block.appendChild(typesim);
		info_column.appendChild(communication_block);

		//battery block
		let battery_block = GetElement('div', 'phone-page__info-block');
		let battery_block_title = GetElement('h3', 'phone-page__info-block-title', 'Battery: ');
		let battery_value = GetElement('span', 'phone-page__info-value', phone['Battery'] + 'mAh');
		battery_block_title.appendChild(battery_value);
		battery_block.appendChild(battery_block_title);
		info_column.appendChild(battery_block);
	}
	page.appendChild(info_column);

	//panel
	let panel = GetElement('div', 'phone-page__panel-column');
	let buy = GetElement('div', 'phone-page__buy');
	let buy_price = GetElement('span', 'phone-page__price', phone['Price'] + ' ' + String.fromCharCode('0x20bd'));
	buy.appendChild(buy_price);
	let buy_button = GetElement('button', 'phone-page__buy-button', 'Buy it now');
	buy.appendChild(buy_button);
	panel.appendChild(buy);
	let notify = GetElement('div', 'phone-page__notify')
	let notify_label = GetElement('span', 'phone-page__notify-label', 'Are you want know when price down?');
	notify.appendChild(notify_label);
	let notify_button = GetElement('button', 'phone-page__notify-button', 'Notify');
	notify.appendChild(notify_button);
	panel.appendChild(notify);
	page.appendChild(panel);

	//exit button
	let exit = GetElement('button', 'phone-page__exit', 'X');
	exit.addEventListener('click', function() {
	    document.body.removeChild(document.querySelector('.phone-page'));
	});
	page.appendChild(exit);
	
	document.body.appendChild(page);
	document.querySelectorAll('.phone-page__image')[1].classList.add('phone-page__image_active');
}

function ClearPhones() {
    let chunk = document.querySelector('.phones');
    for(let i = 0; i < chunk.childNodes.length;) {
        chunk.removeChild(chunk.childNodes[0]);
    }
}

async function UpdatePhonePage(model, color, page) {
    let pageChunk = page.childNodes;
    for(let i = 0; i < pageChunk.length;) {
        page.removeChild(pageChunk[i]);
    }
	let ajax = new AJAX('GetPhones.php', 'GetPhones');
	ajax.setLoading(page, 'loading__point_black');
	ajax.loading.show();
	let phone = await ajax.send({Model: model, Color: color});
	if(phone) ajax.loading.hide();
    if(phone.Data) ShowPhone(phone.Data, page);
}

window.onload = async () => {
	let ajax = new AJAX('GetPhones.php', 'GetPhones');
	ajax.setLoading(document.querySelector('.phones'), 'loading__point_white');
	ajax.loading.show();
    let phones = await ajax.send({Model: 'All'});
	if(phones) ajax.loading.hide();
	if(phones.Data) ShowPhones(phones.Data);
    let search = document.querySelector('.filter__text');
    search.addEventListener('keyup', () => {
        clearTimeout(search.timer);
        search.timer = setTimeout(async () => {
            ClearPhones();
			let ajax = new AJAX('GetPhones.php', 'GetPhones');
			ajax.setLoading(document.querySelector('.phones'), 'loading__point_white');
			ajax.loading.show();
            if(search.value === '') phones = await ajax.send({Model: 'All'});
            else phones = await ajax.send({Model: 'All', Filter: search.value});
			if(phones) ajax.loading.hide();
            if(phones.Data) ShowPhones(phones.Data);
            else Say('No such models', document.querySelector('.phones'), 'message__row_white');
        }, 1250);
    });
    search.addEventListener('keydown', () => {
        clearTimeout(search.timer);
    });
}
