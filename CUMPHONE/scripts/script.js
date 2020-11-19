var sliderElements = document.getElementsByClassName('sl');

var currentIndex = 0;
sliderElements[currentIndex].style.zIndex = 2;



for (var i = 1; i < sliderElements.length; i++)
{
	sliderElements[i].style.zIndex = -1;
	sliderElements[i].style.opacity = 0;
}

function slide(direction)
{
	sliderElements[currentIndex].style.zIndex = -1;
	sliderElements[currentIndex].style.opacity = 0;
	if (direction =='right' && currentIndex + 1 < sliderElements.length) currentIndex++;
	if (direction =='left' && currentIndex - 1 > -1)currentIndex--;
	sliderElements[currentIndex].style.zIndex = 2;
	sliderElements[currentIndex].style.opacity = 1;
}


