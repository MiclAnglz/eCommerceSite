<?php
$connObj = new mysqli('localhost', 'root', '', 'eshop');        //connecting to the database

// will display an error message if the connection to the database cannot be established.
if ($connObj->connect_error) {
    die('Connection Error (' . $connObj->connect_errno . ')'
        . $connObj->connect_error);
}
