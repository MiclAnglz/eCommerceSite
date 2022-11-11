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

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="styles.css" />
    <script src="https://kit.fontawesome.com/bd846823d7.js" crossorigin="anonymous"></script>
    <title>Home Page</title>
    <script>
        var hidden = "<?= $hidden ?>";

        if (hidden == "false") {

            window.addEventListener('load', function() {
                document.getElementById("proFi").hidden = false;
                document.getElementById("loginMenu").hidden = true;
                document.getElementById("logoffMenu").hidden = false;
            });
        }
    </script>
    <script defer src="action.js"></script>
</head>

<body>
    <header>
        <?php include('navigation.php'); ?>
    </header>


    <?php
    //this code will execut if an existing customer logs back in.
    if (isset($_SESSION['logFname'])) { ?>

        <div class="outercontainer">
            <div class="container">
                <div>
                    <p>
                    <div class="input-field">
                        <h1>Welcome back to e<em class="l1">S</em><em class="l2">H</em><em class="l3">O</em><em class="l4">P</em><i class="com1">.com</i> <span class="welcome"><?= $_SESSION['logFname'] ?>!!</span>
                        </h1>
                    </div>
                    <a class="homeNav" href="product.php?sS=<?= $sS ?>"><input type="submit" class="isset" style="width:200px;" value="Start Shopping" name="shop"></a>
                    <?php if (isset($_SESSION['cart'])) { ?>
                        <a class="homeNav" href="checkout.php?sS=<?= $sS ?>"><input type="submit" class="tester" style="width:200px" value="Checkout" name="login"></a>
                    <?php } ?>
                    </p>
                </div>
            </div>
        </div>

    <?php }
    //this code will execut if a new customer logs in.
    if (isset($_SESSION['upFname'])) { ?>

        <div class="outercontainer">
            <div class="container">
                <div>
                    <div class="input-field">
                        <h1>Hi <?= $_SESSION['upFname'] ?>, thankyou for joining e<em class="l1">S</em><em class="l2">H</em><em class="l3">O</em><em class="l4">P</em><i class="com1">.com</i></h1>
                    </div>
                    <p>
                        We have added you to our mailing list. You will be among the first people to get all of our special offers, newest updates, and announcements. We will do our best not to bore you with marketing emails!
                    </p>
                    <div class="input-field">Once again we Thankyou - ENJOY!!.</div>
                    <a class="homeNav" href="product.php?sS=<?= $sS ?>"><input type="submit" class="isset" style="width:200px;" value="Start Shopping" name="shop"></a>
                </div>
            </div>
        </div>


    <?php }

    //this code will exectue if they are a general brower.
    if (!isset($_SESSION['upFname']) && !isset($_SESSION['logFname'])) { ?>
        <div class="outercontainer">
            <div class="container">
                <div>
                    <p>

                    <h1>Welcome to e<em class="l1">S</em><em class="l2">H</em><em class="l3">O</em><em class="l4">P</em><i class="com1">.com</i></h1>

                    </h1>
                    <div class="input-field">
                        <p>Feel free to browse and add items to your cart. If you are not a member, please hit the button below to start registration. ENJOY!</p>
                        </p>
                    </div>
                    <a class="homeNav" href="register.php?sS=<?= $sS ?>"><input type="submit" class="isset" style="width:200px;" value="Register" name="shop"></a>
                </div>
            </div>
        <?php  } ?>

</body>

</html>