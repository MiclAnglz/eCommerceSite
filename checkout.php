<!--
 * Student ID: 20455936
 * Name: Michael Angeles
 * Campus:  Parramatta South
 * Tutor Name: Kieran Luken
 * Class Day: Thursday
 * Class Time: 2pm
-->

<?php

require_once('sessionStarter.php');
include("functions.php");

//the below block of code maintains user session thought out the whole add to cart - process order transaction.
if (isset($_POST['cpSubmit'])) {

    require_once("nocache.php");
    $processOrder = "begin";
    $_SESSION['pO'] = $processOrder;
    $pO = $_SESSION['pO'];
    $key = $_SESSION["key"];
    header("Location: process-order.php?sS=$key&pO=$pO");
} else {

    //will redirect the user to the login page if they some how manage to access the page without logging in. 
    if ($inSession == "false") {

        header('location: login.php?sS=browser');
    }
}


?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="styles.css" />
    <script defer src="action1.js"></script>
    <script src="https://kit.fontawesome.com/bd846823d7.js" crossorigin="anonymous"></script>
    <title>Checkout</title>
    <script>
        var hidden = "<?= $hidden ?>"

        if (hidden == "false") {

            window.addEventListener('load', function() {
                document.getElementById("proFi").hidden = false;
                document.getElementById("loginMenu").hidden = true;
                document.getElementById("logoffMenu").hidden = false;
            });

        }
    </script>
</head>

<body>
    <?php include('navigation.php'); ?>
    <div class="outercontainer">
        <div class="container">
            <div class="loginWrap">

                <form id="paymentForm" name="form" method="post" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" onsubmit="return validatePaymentForm(this)" novalidate>
                    <div>
                        <h3>Payment Details</h3>
                    </div>
                    <div class="input-field">
                        <span><input type="radio" id="Visa" name="cardType" value="visa" /><span style="padding: 0 10px 0 10px;"></span><label for="Visa"><i class="fa fa-cc-visa" style="font-size:36px; color:rgb(0, 102, 255)"></i></label></span>
                        <span style="padding: 0 10px 0 10px;"></span>
                        <span><input type="radio" id="masterCard" name="cardType" value="mc" required /><span style="padding: 0 10px 0 10px;"></span><label for="masterCard"><i class="fa fa-cc-paypal" style="font-size:36px; color:rgb(0, 102, 255)"></i></label></span>
                        <div><span id="radioB" class="errorMessages">An option must be chosen</span></div>
                    </div>
                    <div class="input-field">
                        <label for="creditCard1" class="doYou">Credit Card Number<em>*</em></label>
                        <input class="tBox" type="text" name="creditCard1" id="creditCard1" placeholder="eg: 1234 1234 1234 1234 " required />
                        <div><span class="requiredError">This is a required field</span></div>
                        <div><span id="creditCard1Error" class="errorMessages">Credit card detials must be 16 digits long (a space after
                                4 digits is optional)</span></div>
                    </div>
                    <div class="input-field">
                        <label for="CCV" class="doYou">CCV#<em>*</em></label>
                        <input type="text" name="CCV" id="CCV" class="tBox" placeholder="eg: 123 " required />
                        <div><span class="requiredError">This is a required field</span></div>
                        <div><span id="CCVError" class="errorMessages">CCV must only contain 3 digits</span></div>
                    </div>

                    <div class="input-field">
                        <p>
                            <em class="headsUp doYou">(The last three digits at the back of your card. Your payment
                                cannot be processed without the CVV#)</em>
                        </p>
                    </div>
                    <div class="input-field">
                        <label for="cardHoldersName" class="doYou">Card Holders Name<em>*</em></label>
                        <input class="tBox" type="text" name="chn" id="cardHoldersName" placeholder="Enter Card Holder's Name" />
                        <div><span class="requiredError">This is a required field</span></div>
                        <div><span id="chnError" class="errorMessages">Must contain only characters and space</span></div>
                    </div>
                    <div class="input-field">
                        <label for="amount" class="doYou">Authorised Amount<em>*</em></label>
                        <input class="tBox" type="text" value="<?= number_format((float)$_SESSION['gtotal'], 2) ?>" name="amount" id="amount" readonly />
                    </div>

                    <div class="input-field">
                        <label for="Expiry" class="doYou">Expiry<em>*</em></label>
                        <input class="tBox" type="text" name="Expiry" id="Expiry" onblur="return valMonthYr(this)" placeholder="eg: MM/YY" />

                        <div><span class="requiredError">This is a required field</span></div>

                        <div><span id="expyError" class="errorMessages">Must be 4 digits separated by a "/" and not a past date. eg:
                                mm/yy
                            </span></div>

                    </div>
                    <div class="input-field">
                        <div>
                            <p>
                                <em class="headsUp doYou">(Month should be entered from 01-12 & year greater or equal
                                    than the last 2 digits of the current year (<span id="currentYear"></span>)</em>
                            </p>
                        </div>

                    </div>
                    <input type="textbox" value="<?= $sS ?>" name="sS" hidden>

                    <div class="submitButton">
                        <input type="submit" class="isset" value="Confirm Payment" name="cpSubmit" />
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>



</html