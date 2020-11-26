
async function GetPhones() {
	var response = await fetch('GetPhones.php',{
    method: 'POST',
    headers: {
        'Content-Type': 'application/json'
    },
    body: JSON.stringify({type: 'GetPhones', model: 'all'})
	});
	if(response.ok) {
		var phones = await response.text();
		if(phones) {
			if(phones[0] == 'OK')
			ShowPhones(phones[1]);
		}
	}
}

function ShowPhones(phones){
    for(var i = 0; i < phones.length; i++) {
		//phone
		var phone = document.createElement('div');
		phone.classList.add('phone');
		
		//phone image
		var image = document.createElement('div');
		{	
			image.classList.add('phone__image');
			var img = document.createElement('img');
			img.src = phones[i]['Image'];
			image.appendChild(img);
			phone.appendChild(image);
		}
		
		//phone properties
		var properties = document.createElement('div');
		properties.classList.add('phone__properties');
		{	
			var classes = ['phone__name', 'phone__display', 'phone__processor', 'phone__rom', 'phone__ram', 'phone__camera'];
			var values = ['Name', 'Display', 'Processor', 'ROM', 'RAM', 'Camera'];
			for(var j = 0; j < 6; j++) {
				var block = document.createElement('div');
				block.classList.add(classes[j]);
				block.textContent = phones[i][vales[j]];
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
			value.textContent = phones[i]['Price'];
			var buy = document.createElement('input');
			buy.classList.add('phone__cost_buy');
			buy.type = 'button';
			buy.value = 'Buy it now';
			price.appendChild(value);
			price.appendChild(buy);
			phone.appendChild(price);
		}
		
		document.querySelector('phones').appendChild(phone);
	}
}