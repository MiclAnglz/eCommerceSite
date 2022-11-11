<!--
 * Student ID: 20455936
 * Name: Michael Angeles
 * Campus:  Parramatta South
 * Tutor Name: Kieran Luken
 * Class Day: Thursday
 * Class Time: 2pm
-->
<?php

//code used to add a new user and update user to the session. This code is used at the registration.php and profile.php.
if (isset($_POST['uptdated'])) {

    $sql = "select * from user where user_id = '$id'";
    $rs = $connObj->query($sql);
} else {
    $sql1 = "select * from user where user_email = '$email' and user_password = '$hashedPassword'";
    $rs = $connObj->query($sql1);
}

if ($rs->num_rows) {
    // start a new session for the user
    session_start();

    // Store the user details in session variables
    $user = $rs->fetch_assoc();
    $_SESSION['upFname'] = $user['user_fname'];
    $_SESSION['who'] = $user['user_id'];
    $_SESSION['type'] = $user['user_type'];
    $_SESSION["key"] = $user['user_type'] . "AndSessionKey:" . $_SESSION['who'] . rand(65, 99);
    $_SESSION['hidden'] = "false";
    $key = $_SESSION["key"];
    // Redirect the user to the secure page

    if (isset($_POST['uptdated'])) {
        header("Location: profile.php?sS=$key");
    } else {
        header("Location: index.php?sS=$key");
    }
} else {
    echo "Denied!";
}
