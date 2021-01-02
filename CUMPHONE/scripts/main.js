
var sliderElements = document.getElementsByClassName('sl');
var sliderCircles = document.getElementsByClassName('sl__dots-dot');


var currentIndex = 0;
sliderElements[currentIndex].style.zIndex = 2;
sliderCircles[currentIndex].firstChild.style.fill = 'black';


for (var i = 1; i < sliderElements.length; i++)
{
	sliderElements[i].style.zIndex = -1;
	sliderElements[i].style.opacity = 0;
}


setInterval(increaseIndex, 6000);

function increaseIndex(){
	var index = currentIndex;
	
	index+=1;
	if (index == sliderElements.length) index = 0;
	
	slide(index);
}

function slide(index)
{
	sliderElements[currentIndex].style.zIndex = -1;
	sliderElements[currentIndex].style.opacity = 0;
	sliderCircles[currentIndex].firstChild.style.fill = 'none';
	
	sliderElements[index].style.zIndex = 2;
	sliderElements[index].style.opacity = 1;
	sliderCircles[index].firstChild.style.fill = 'black';
	
	currentIndex = index;
}




document.getElementsByClassName('page__content-text text-title content-bottom link')[0].onclick = function() {
window.location.href = 'products.php';
};
