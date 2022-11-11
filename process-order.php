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
$today = date('Y/m/d h:i:s A');                 //creating current date
$success = false;                               //variable to tell that the transaction is successful   

if (isset($_GET['pO'])) {


    if (isset($_SESSION['cart'])) {

        require_once('conn.php');

        $id = $_SESSION['who'];                     //current active user new or existing.

        //inserting the users order with an sql query
        $sql = "INSERT INTO user_order(

            order_datetime,
            order_user_id
        )
    VALUES (

            '$today', 
            '$id'

        )";

        if ($connObj->query($sql) === TRUE) {

            $last_id = $connObj->insert_id;                 //code for the last entered id
            $_SESSION['lastId'] = $last_id;

            //inserting each product into the data base using the session array created when adding items to cart.
            foreach ($_SESSION['cart'] as $key => $value) {

                $pid = $value['id'];                                        //each product id in the array
                $qty = $value['qty'];                                       //each qty entered for each product in the array
                $price = number_format(floatval($value['price']), 2);       //The price of each product (singular value)

                //inserting details from the array to the database.
                $sql1 = "INSERT INTO order_detail(

                detail_product_id,
                detail_qty,
                detail_price,
                detail_order_id
            )
        VALUES (

            '$pid', 
            '$qty', 
            '$price', 
            '$last_id'

            )";
                if ($connObj->query($sql1) == true) {

                    $success = true;                                    //boolean variable used to tell the program that the transaction is successful
                    unset($_SESSION['cart']);                           //unsetting the array once transaction is complete, leaving the cart empty.
                } else {
                    echo "Error: " . $sql . "<br>" . $conn->error;
                }
            }
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }

        $connObj->close();
    }
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
    <title>Process-Order</title>
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
    <header>
        <?php include('navigation.php'); ?>
    </header>

    <?php if ($success == true) {

        echo "<script>alert('Payment Accepted')</script>"

    ?>

        <div class="outercontainer">
            <div class="container">
                <div class="thankyou">
                    <div>
                        <h1>Your transaction was successful</h1>
                    </div>
                    <div>
                        <h2>Thank you for shopping at e<em class="l1">S</em><em class="l2">h</em><em class="l3">o</em><em class="l4">p</em>.<i class="com1">com</i>
                    </div>

                    <div>
                        <h3>Your oder id is: <?= $_SESSION['lastId'] ?></h3>
                    </div>
                    <div><em>Please take note of your order id, alternatively you can view your order history under order history in the profile <i class="fa fa-user user" style="font-size:15px"></i> menu.</em></div>
                </div>
            </div>
        </div>

    <?php
    } ?>

</body>

</html>