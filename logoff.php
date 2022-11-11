<?php
// ensure the page is not cached
require_once("nocache.php");

// get access to the session variables
session_start();

//this code is written so that the user will still have access to items in the cart(if any), if they log off mid session without emptying thier cart.
// if (isset($_SESSION['cart'])) {

//     header("location: login.php?sS=browser");
// } else {

// Now destroy the session
session_destroy();

// Redirect the user to the starting page (login.php)
header("location: login.php");
// }
