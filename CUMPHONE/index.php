<!DOCTYPE html>
<html>
<head>
    <title>CUMPHONE</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="styles/main.css">
    <script src="scripts/jquery.js"></script>
	<link rel="shortcut icon" href="images/icon.png" type="image/png">
</head>
<body class="body">
	<?php
	require 'templates/login_form.php';
	?>
	

    <div class="content-holder-prime">
        <?php 
        require 'templates/header.php';
        ?>



		<div class="page__content">
			<div class="page__content sl">
				<div class="page__content-holder-holder align-center">
					<div class="page__content-holder content-left">
						<a class="page__content-text text-left text-title">
							Cumphone 7 PRO 16/512 Gb
						</a>
						<div class="page__content-text text-left">
							Display: 6.67” AMOLED Display 2340 x 1080<br>
							Processor: Snapdragon 955 Plus (12 cores) 2.3 GHz<br>
							ROM: 512 Gb<br>
							RAM: 16 Gb<br>
							Camera: 108 MP + 12 MP + 24 MP
						</div>
						<div class="page__content-text text-left text-title">
							ALREADY ON SALE!
						</div>
					</div>
					<img class="CUMPHONE" src="images/CUMPHONE.png">
				</div>
			</div>
			<div class="page__content sl">
				<div class="page__content-holder-holder align-center">
					<div class="page__content-holder content-left">
						<a class="page__content-text text-left text-title">
							Cumphone 7 8/256 Gb
						</a>
						<div class="page__content-text text-left">
							Display: 6.67” AMOLED Display 2340 x 1080<br>
							Processor: Snapdragon 955 Plus (12 cores) 2.3 GHz<br>
							ROM: 256 Gb<br>
							RAM: 8 Gb<br>
							Camera: 108 MP + 12 MP<br>
						</div>
						<div class="page__content-text text-left text-title">
							ALREADY ON SALE!
						</div>
					</div>
					<img class="CUMPHONE" src="images/CUMPHONE.png">
				</div>
			</div>
			<div class="sl__dots">
				<div class="sl__dots-dot-holder" onclick="slide(0)"><svg class="sl__dots-dot" ><circle class="sl__dots-circle" r="20" cx="30" cy="30" stroke="black" stroke-width="5" fill="none"></svg></div>
				<div class="sl__dots-dot-holder" onclick="slide(1)"><svg class="sl__dots-dot" ><circle class="sl__dots-circle" r="20" cx="30" cy="30" stroke="black" stroke-width="5" fill="none"></svg></div>
			</div>
        </div>
		
        <div class="page__content background-gradient">
			<img src="images/asian.png" class="page__content-background-image page__content-background-image_top">
            <div class="page__content-holder-holder align-center">
                <div class="page__content-holder">
                    <div class="page__content-text text-title">
                        DO YOU WANT TO BE A PART OF SOMETHING BIGGER?
                    </div>
                    <div class="page__content-text">
                        Send your portfolio by email vacancy@veslo.corp and get your dream job! We need highly qualified specialists!
                    </div>
                    <div class="page__content-holder content-holder-big">
                        <div class="page__content-holder content-holder-small">
                            <div class="page__content-text text-title">
                                Career growth
                            </div>
                            <img class="page__content-img img-small" src="images/stonks.svg">
                            <div class="page__content-text text-left">
                                We always have growth opportunities for those who are willing to do a good job
                            </div>
                        </div>
                        <div class="page__content-holder content-holder-small">
                            <div class="page__content-text text-title">
                                Bonuses
                            </div>
                            <img class="page__content-img img-small" src="images/gift.svg">
                            <div class="page__content-text text-left">
                                Special offers, discounts and bonuses from partner companies are available for our employees
                            </div>
                        </div>
                    </div>
                    <div class="page__content-text text-title content-bottom">WE ARE WAITING FOR YOU!</div>
                </div>
            </div>
        </div>

        <div class="page__content background-inversed-gradient">
			<img src="images/colleagues.svg" class="page__content-background-image">
            <div class="page__content-holder-holder align-center">
                <div class="page__content-holder">
                    <div class="page__content-text text-title">
                        By purchasing our products you become part of a large Corporation and sponsor our further inventions!
                    </div>
                    <div class="page__content-text">
                        5 percent of every purchase you make goes to our relief Fund, which we use to help people affected by natural disasters.
                    </div>
                    <div class="page__content-text text-title content-bottom link">GO TO PRODUCTS</div>
                </div>
            </div>
        </div>
	
    <?php 
    require 'templates/footer.php';
    ?>
    <script src="scripts/main.js"></script>
    <script src="scripts/navigation.js"></script>
</body>
</html>