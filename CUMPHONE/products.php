<html>
    <head>
        <title>Progmen</title>
        <link rel="stylesheet" href="styles/main.css">
        <link rel="stylesheet" href="styles/stylesForQuery.css">
        <link rel="stylesheet" href="styles/products.css">
		<link rel="shortcut icon" href="images/icon.png" type="image/png">
		<script src="scripts/jquery.js"></script>
    </head>
    <body class="body">
        <div class="background"></div>
		
		<?php
		require 'templates/login_form.php';
		?>
		
	<div class="content-holder-prime">
		<?php 
		require 'templates/header.php';
		?>
		
		
		
        <form class="filter">
            <input type="text" class="filter__text">
            <button class="filter_search"><img src="images/searchIcon.png" class="filter__pic"></button>
        </form>
		<div class='phones'>
			
		</div>
	</div>
		
		<?php 
		require 'templates/footer.php';
		?>
        <script src="scripts/products.js"></script>
        <script src="scripts/navigation.js"></script>
    </body>
</html>
