var phone={
    type:"GetPhones",
    model:"all",
}
var phones= fetch("GetPhones.php",{
    method: 'POST',
    headers: {
        'Content-Type': 'application/json'
    },
    body: JSON.stringify(phone)
});
alert(phones.response.length);
var phoneList=phones.response;
for(i=0;i<phoneList.length;i++){
    
}

function AddPhone(phoneIndex){
    var phoneForm='<div class="phone"><div class="phone__image"><img src="images/CPhone.png"></div><div class="phone__properties">';
    phoneForm+='<div class="phone__name">'+phoneList[phoneIndex].model+'</div>';
    phoneForm+='<div class="phone__display"></div>';
    phoneForm+='<div class="phone__processor"></div>';
    phoneForm+='<div class="phone__rom"></div>';
    phoneForm+='<div class="phone__ram"></div>';
    phoneForm+='<div class="phone__camera"></div></div>';
    phoneForm+='<div class="phone__cost">';
    phoneForm+='<div class="phone__sum"></div>';
    phoneForm+='<input class="phone__cost_buy" type="button" value="Buy it now"';
    phoneForm+='</div></div>';
    alert(phoneForm);
}