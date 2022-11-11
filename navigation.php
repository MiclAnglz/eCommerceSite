<!--
 * Student ID: 20455936
 * Name: Michael Angeles
 * Campus:  Parramatta South
 * Tutor Name: Kieran Luken
 * Class Day: Thursday
 * Class Time: 2pm
-->

<?php

/*
* A shortcut for the navigation bar.
*/ ?>


<div class="navBar">
    <div class="logo">
        <a class="logoStyle" href="index.php?sS=<?= $sS ?>">
            <div>e<em class="l1">S</em><em class="l2">H</em><em class="l3">O</em><em class="l4">P</em><i class="com">.com</i></div>
        </a>
    </div>
    <nav>
        <ul>
            <li class="Home">
                <a class="homeNav" href="index.php?sS=<?= $sS ?>"><i class="fa fa-home" style="font-size:28px"></i></a>
            </li>
            <li class="Products">
                <a class="homeNav" href="product.php?sS=<?= $sS ?>"><i class="fa fa-store" style="font-size:24px"></i></a>
            </li>
            <li class="Cart">
                <a class="homeNav" href="cart.php?sS=<?= $sS ?>"><i class="fas fa-shopping-cart" style="font-size:24px"></i></a>
            </li>
            <li>
                <a class="homeNav" id="proFi" href="#" hidden><i class="fa fa-user" style="font-size:24px"></i></a>
                <ul>
                    <li>
                        <a class="homeNav" href="profile.php?sS=<?= $sS ?>">My Profile</a>
                    </li>
                    <li>
                        <a class="homeNav" href="history.php?sS=<?= $sS ?>">Order History</a>
                    </li>
                    <li>
                        <a class="homeNav" id="logoffMenu" href="logoff.php?sS=<?= $sS ?>">Log out <i class="fa fa-door-open" style="font-size:24px"></i></a>
                    </li>
                </ul>
            </li>
            <li class="Login">
                <a class="homeNav" id="loginMenu" href="login.php"><i class="fa fa-door-closed" style="font-size:24px"></i></a>
            </li>
        </ul>
    </nav>

</div>