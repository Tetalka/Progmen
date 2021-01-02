        <?php 
        $index = 'index.php';
        $products = 'products.php';
        $about = 'about.php';
        ?>
        <html>
            <div class="header">
            <div class="header__holder">
                <a class="logo" href=<?php echo $index ?>>
                    <img src="images/VESLO.svg">
                </a>
                <div class="menu">
                    <a class="menu__item link" href=<?php echo $index ?>>HOME</a>
                    <a class="menu__item link" href=<?php echo $products ?>>PRODUCTS</a>
                    <a class="menu__item link" href=<?php echo $about ?>>ABOUT US</a>
                    <a class="menu__item link">SUPPORT</a>
                </div>
                <div class="menu menu-right">
                    <img class="menu__image" src="images/phone.svg">
                    <img class="menu__image" src="images/cart.svg">
                    <a class="menu__item link login" onclick="changeLoginDisplay()">LOGIN</a>
                </div>
            </div>
        </div>
        </html>