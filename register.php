<!--
 * Student ID: 20455936
 * Name: Michael Angeles
 * Campus:  Parramatta South
 * Tutor Name: Kieran Luken
 * Class Day: Thursday
 * Class Time: 2pm
-->

<?php

$errormsg = "";
$errormsg1 = "";

require_once('sessionStarter.php');
require_once('conn.php');

if (isset($_POST["submit"])) {

    $fname = $connObj->escape_string($_POST['fname']);
    $lname = $connObj->escape_string($_POST['lname']);
    $email = $_POST['email'];
    $password = $connObj->escape_string($_POST['password']);
    $cPWord = $_POST['cpassword'];
    $streetNumber = $connObj->escape_string($_POST['cNumber']);
    $street = $connObj->escape_string($_POST['Street-Address']);
    $suburb = $connObj->escape_string($_POST['Suburb-City']);
    $state = $connObj->escape_string($_POST['State']);
    $pCode = $connObj->escape_string($_POST['Postcode']);
    $user = 'user';
    $hashedPassword = hash('sha256', $password);
    $streetDeets = $streetNumber . " " .  $street;

    //validation to confirm users pasword.
    if (strcmp($cPWord, $password) !== 0) {
        $errormsg1 = "Passwords do not match. Please make sure both confirm password and password match";
    } elseif (!empty($_POST['fname']) || !empty($_POST['lname']) || !empty($_POST['email']) || !empty($_POST['sNumber']) || !empty($_POST['Street-Address']) || !empty($_POST['Suburb-City']) || !empty($_POST['State']) || !empty($_POST['Postcode']) || !empty($_POST['cpassword']) || !empty($_POST['password'])) {

        //inserting users detials from the form.
        require_once("nocache.php");

        $sql = "INSERT INTO user(
                user_email,
                user_password,
                user_fname,
                user_lname,
                user_street,
                user_suburb,
                user_state,
                user_post_code,
                user_type
            )
        VALUES (
                '$email', 
                '$hashedPassword',
                '$fname',
                '$lname',
                '$streetDeets',
                '$suburb',
                '$state',
                '$pCode',
                '$user'
            )";

        $connObj->query($sql);
        require_once('newOrUpdatedUser.php');
    } else {
        $errormsg = "Please check that all red error messages have been cleared";
    }

    $connObj->close();
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="styles.css" />
    <script defer src="action.js"></script>
    <script src="https://kit.fontawesome.com/bd846823d7.js" crossorigin="anonymous"></script>
    <title>Registration Page</title>
    <script>
        var hidden = "<?= $hidden ?>"

        if (hidden == "false") {

            window.addEventListener('load', function() {

                document.getElementById("proFi").hidden = false;
                document.getElementById("loginMenu").hidden = true;

            });
        }
    </script>
</head>

<body>
    <header>
        <?php include('navigation.php'); ?>
    </header>

    <div class="outercontainer">
        <div class="container">
            <div class="loginWrap">
                <form id="myForm" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="post" onsubmit="return validateForm(this)" novalidate>
                    <div>
                        <h3>Registration</h3>
                    </div>
                    <div class="input-field"></div>
                    <label for="fname" class="doYou">First Name <em>*</em></label>
                    <input type="text" name="fname" id="fname" class="tBox" placeholder="Enter First Name" required />
                    <div><span class="requiredError">This is a required field</span>
                    </div>
                    <div><span id="fNameError" class="errorMessages">The first letter of the first name and last name should be an uppercase character</span>
                    </div>

                    <div class="input-field">
                        <label for="lname" class="doYou">Last Name <em>*</em></label>
                        <input type="text" name="lname" id="lname" class="tBox" placeholder="Enter Surname" required />
                        <div><span class="requiredError">This is a required field</span></div>
                        <div><span id="lNameError" class="errorMessages">The first letter of the first name and last name should be an uppercase character</span></div>
                    </div>

                    <div class="input-field">
                        <label class="doYou">Postal Adress <em>*</em></label>
                        <input type="number" id="cNumber" name="cNumber" class="tBoxSmall" placeholder=" #" />&nbsp;
                        <input type="text" name="Street-Address" id="streetAddress" class="tBox" placeholder="Street Address  - eg: John St" required />
                        <div><span id="missingNumber" class="requiredError">This is a required field and Street number must greater than zero</span></div>
                        <div><span id="houseNumber" class="errorMessages">Street number must greater than zero</span></div>
                        <div><span id="streetAddyError" class="errorMessages">The Street Adress should only contain characters and space</span></div>

                        <div class="input-field">
                            <label for="suburbCity" class="doYou">City/Suburb <em>*</em></label>
                            <input type="text" name="Suburb-City" id="suburbCity" class="tBox" placeholder="Enter Suburb - eg: Parramatta" required />
                            <div><span class="requiredError">This is a required field</span></div>
                            <div><span id="suburbError" class="errorMessages">The Suburb/City should only contain characters and space</span></div>

                            <div class="input-field">
                                <label for="State" class="doYou">State <em>*</em></label>
                                <select name="State" id="State" class="tBox">
                                    <option value="" selected>Select State</option>
                                    <option value="NSW">NSW</option>
                                    <option value="NT ">NT</option>
                                    <option value="QLD">QLD</option>
                                    <option value="SA ">SA</option>
                                    <option value="TAS">TAS</option>
                                    <option value="VIC">VIC</option>
                                    <option value="WA ">WA</option>
                                </select>
                                <div><span id="stateError" class="requiredError">This is a required field</span></div>
                            </div>
                            <div class="input-field">
                                <label for="Postcode" class="doYou">Postcode <em>*</em></label>
                                <input type="text" name="Postcode" id="Postcode" class="tBox" placeholder="Enter Postcode - eg: 2000" required />
                                <div><span class="requiredError">This is a required field</span></div>
                                <div><span id="postCodeError" class="errorMessages">The post code must be a valid Australian post code and 4
                                        digits long</span></div>
                            </div>

                            <hr>
                            <div class="input-field">
                                <label for="email" class="doYou">Email <em>*</em></label>
                                <input type="text" id="email" name="email" class="tBox" placeholder="This will be your username" />
                                <div><span class="requiredError">This is a required field</span></div>
                                <div><span id="emailError" class="errorMessages">Must be a valid email eg: abdc@gmail.com</span></div>
                            </div>
                            <div class="input-field">
                                <label for="pword" class="doYou">Password <em>*</em></label>
                                <div class="errorMsgPos">
                                    <input type="password" name="password" id="pword" class="tBox" placeholder="Enter password" />
                                </div>
                            </div>
                            <div class="input-field">
                                <label for="cPWord" class="doYou">Confirm Password <em>*</em></label>
                                <input type="password" name="cpassword" id="cPWord" class="tBox" placeholder="Re - Enter password" />
                            </div>

                            <div><span id="pWordError" class="errorMessages">Password must be 8 characters long and must include at least 1 number [0-9]
                                </span></div>

                            <div><span id="CpWordError" class="errorMessages">Confirmed password and password must match and is required
                                </span></div>

                            <div class="submitButton">
                                <input type="submit" class="isset" value="Sign Up" name="submit">
                            </div>
                </form>
            </div>
        </div>
    </div>


    <span><?php echo $errormsg ?></span>
    <span><?php echo $errormsg1 ?></span>

</body>

</html>