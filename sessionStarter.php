<!--
 * Student ID: 20455936
 * Name: Michael Angeles
 * Campus:  Parramatta South
 * Tutor Name: Kieran Luken
 * Class Day: Thursday
 * Class Time: 2pm
-->
<?php

$inSession = 'false';

/*
    The below code is used to start a session. 

    The first if statement starts a session if the user is ready to login.

    The else statement is used for when a user is not logged in, browsing and passing items to the cart. Session variables used are 
    to pass data from the product page to the cart page.
*/

if (!empty($_GET["sS"]) && $_GET["sS"] !== "browser") {

    session_start();

    if ($_GET["sS"] == $_SESSION['key']) {

        $inSession = 'true';
        $hidden = $_SESSION['hidden'];
        $sS = $_SESSION['key'];
    }
} else {


    $sS = "browser";
    session_start();
}
