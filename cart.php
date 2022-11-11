<!--
 * Student ID: 20455936
 * Name: Michael Angeles
 * Campus:  Parramatta South
 * Tutor Name: Kieran Luken
 * Class Day: Thursday
 * Class Time: 2pm
-->

<!------------------------------------------------------------------------------------*
*   Below, the mojority of my code was inspired from: https://youtu.be/YloyMFPJyV4.   *                                                                                 
*   (From lines 29 - 54 & The function line on line 130)                              *                                      
*                                                                                     *   
*   You will notice that the code is not completely the same -  In my code, i have    *
*   printed my data with  an sql query.                                               *                
*                                                                                     * 
-------------------------------------------------------------------------------------->

<?php
require_once('sessionStarter.php');
include("functions.php");

$total = 0;


//this block of code will remoce the arry id if the item chosen to be removed for the cart.
if (isset($_GET['action'])) {

    if ($_GET['action'] == "remove") {

        foreach ($_SESSION['cart'] as $key => $value) {

            $removeId =  (int)$_GET['id'];

            if ((int)$value['id'] == $removeId) {

                unset($_SESSION['cart'][$key]);
            }
        }
    }
}

if (isset($_GET['addToCart'])) {

    if (isset($_SESSION['cart'])) {

        $cart_array_id = array_column($_SESSION['cart'], 'id');               //declaring the prioduct id

        /*
            Below the block of code disabled the user from entering the same product twice by seaching the array for a mactch.
            In this instance the program searches for the product_id
        */
        if (!in_array($_GET['id'], $cart_array_id)) {

            $cart_array = array(

                'id' => $_GET["id"],
                'qty' => $_GET["qty"],
                'price' => $_GET['pPrice']
            );

            $_SESSION['cart'][] = $cart_array;
        } else {
            echo "<script>alert('That product is already in your cart')</script>";              //will display error message is a match is found
        }
    } else {

        //creating a new array from the get_request and storing them is a session array.
        $cart_array = array(

            'id' => $_GET["id"],
            'qty' => $_GET["qty"],
            'price' => $_GET['pPrice']
        );

        $_SESSION['cart'][] = $cart_array;
    }
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="styles.css" />
    <script src="https://kit.fontawesome.com/bd846823d7.js" crossorigin="anonymous"></script>
    <title>Shopping Cart</title>
    <script>
        var hidden = "<?= $hidden ?>"

        if (hidden == "false") {

            window.addEventListener('load', function() {
                document.getElementById("proFi").hidden = false;
                document.getElementById("loginMenu").hidden = true;
                document.getElementById("logoffMenu").hidden = false;
                document.getElementById("media").hidden = false;
            });

        }
    </script>
</head>

<body>
    <header>
        <?php include('navigation.php'); ?>
    </header>
    <?php

    /*
        Below the code will out put the data and format the results in a table.
    */
    if (isset($_SESSION['cart'])) {

        require_once("conn.php"); ?>

        <div class="outercontainer">
            <div class="container">
                <div>
                    <table class="orderHistoryTable">
                        <tr>
                            <th></th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Qty</th>
                            <th>Total</th>
                            <th>Action</th>
                        </tr>

                        <?php foreach ($_SESSION['cart'] as $key => $value) {

                            // this variable will change through each iteration of this foreach loop. The array holds the product_id's
                            $pid = intval($value['id']);

                            //creating the query and storing it in an array
                            $sql = "select * ";
                            $sql .= "from product ";
                            $sql .= "where product_id = '$pid'";        //search throught each Product id in the array.

                            $rs = $connObj->query($sql)
                                or die('There was a problem with query' . $connObj->error);


                            if ($rs->num_rows) {

                                while ($row = $rs->fetch_assoc()) { ?>
                                    <tr>
                                        <td><img class="cartImages" src="<?= $row['product_image'] ?>"></img></td>
                                        <td><?= $row['product_name'] ?></td>
                                        <td>$<?= number_format((float)$value['price'], 2) ?></td>
                                        <td><?= $value['qty'] ?></td>
                                        <td>$<?= number_format((float)intval($row['product_price']) * intval($value['qty']), 2) ?></td>
                                        <td>
                                            <a href="cart.php?sS=<?= $sS ?>&action=remove&id=<?= $pid ?>">
                                                <button class='removeB isset'>Remove</button>
                                            </a>
                                        </td>
                                    </tr>

                                    <?php $total += intval($row['product_price']) * intval($value['qty']);   //this code calculates the total vof the cart

                                    $_SESSION['gtotal'] = $total;
                                    ?>

                                <?php } ?>

                            <?php } else {

                                echo "A search was not found";
                            }
                        }

                        // printing out the array and displaying products chosen
                        // this block of code will also unset the session cart array if == 0, to symbolise that the cart is empty.
                        if (isset($_SESSION['gtotal'])) {

                            if ($total == 0) {
                                unset($_SESSION['cart']);
                                unset($_SESSION['total']);
                                $_SESSION['gtotal'] = 0;
                            } else { ?>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td colspan="2">Total price of the Cart</td>
                                    <td>$<?= number_format((float)$total, 2) ?></td>
                                    <!-- <td></td> -->
                                </tr>
                        <?php }
                        } ?>

                    </table>

                    <?php
                    /**
                     * the below code is used to determine wether the user is logged in or not. 
                     * if the user is logged in, it will display the checkout button, if not it will prompt the user to log in
                     */
                    if ($_GET['sS'] == "browser" && isset($_SESSION['cart'])) { ?>
                        <div>
                            <a class="homeNav" href="login.php?sS=<?= $sS ?>"><input type="submit" class="isset" value="Login" name="login"></a>
                            <div class="input-field" style="color:gray"> You must be logged in to checkout </div>
                        </div>
                        <?php } else {

                        if (isset($_SESSION['cart'])) { ?>
                            <div><a class="homeNav" href="checkout.php?sS=<?= $sS ?>"><input type="submit" class="isset" herf value="Checkout" name="checkout"></a></div>
                    <?php }
                    } ?>

                <?php } else { ?>
                </div>
            </div>
        </div>

        <div class="outercontainer">
            <div class="container">
                <div>
                    <div class="input-field">
                        <h2>You have no items in your cart</h2>
                    </div>
                    <a class="homeNav" href="product.php?sS=<?= $sS ?>"><input type="submit" class="isset" style="width:200px;" value="Start Shopping" name="shop"></a>

                    <?php
                    //keep items in the cart in cart if the cart still has itmes and user logs off.
                    if (!isset($_SESSION['key'])) { ?>
                        <a class="homeNav" href="login.php?sS=<?= $sS ?>"><input type="submit" class="tester" style="width:200px" value="Login" name="login"></a>
                    <?php } ?>
                </div>
            </div>
        </div>
    <?php }

    ?>


</body>

</html>