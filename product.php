<!--
 * Student ID: 20455936
 * Name: Michael Angeles
 * Campus:  Parramatta South
 * Tutor Name: Kieran Luken
 * Class Day: Thursday
 * Class Time: 2pm
-->
<?php

require_once("nocache.php");            //enables the no cache feature
require_once("conn.php");               //connets the user to the database once.
require_once('sessionStarter.php');     //starts session
include("functions.php");               //includes functions created       

$search = "";
$searchValErrMsg = "";
$firstError = false;
$qntErrMsg = "";
$searchFound = "false";
$notFound = "";
$outOfStock = "";

$sql = "select * ";    //creating the query and storing it in an array
$sql .= "from product ";

// This block of code will only execute if the search button is pressed.
if (isset($_GET["submit"])) {

    // below is a customised where clause.
    $sql = whereClause("searchItem", $sql, $connObj, 'product_name');
}

if (isset($_GET["srcName"])) {

    //below is the customised where clause for this function.
    $sql = whereClause("srcName", $sql, $connObj, 'product_image');
}

/* 
  The following code will display a an error message if the below query conatins errors.
  If not, the program will create an array to store the information for the query. 
*/
$rs = $connObj->query($sql)
    or die('There was a problem with query' . $connObj->error);

/*
    This block of code is to tell the program wether the SQL search result were successful or not.
    If no searfch results were found the program will display an error message. 
*/
if ($rs->num_rows) {
    if (isset($_GET["submit"])) {
        $searchFound = "true";                                                      //boolean variable to tell the program that a search has been made and found
    }
} else {
    if (isset($_GET["submit"])) {
        echo "<script>alert('The item that you are searching could not be found')</script>";              //will display the error msg if search is not found
    }
}


?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles.css" />
    <script defer src="action.js"></script>
    <script src="https://kit.fontawesome.com/bd846823d7.js" crossorigin="anonymous"></script>
    <title>Eshop Products</title>
    <script>
        //parsing a php variable to a javascript variable.
        var hidden = "<?= $hidden ?>"

        //the below code will enable the nav bar to toggle between a registered user and a non-registered user.
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
        <div class="navBar">
            <div class="logo">
                <a class="logoStyle" href="index.php?sS=<?= $sS ?>">
                    <div>e<em class="l1">S</em><em class="l2">H</em><em class="l3">O</em><em class="l4">P</em><i class="com">.com</i></div>
                </a>
                <div class="sBar">
                    <div class="owrapper">
                        <form class="searchBar" method="get" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>">
                            <div class="input-wrapper">
                                <div class="fa fa-search"></div>
                                <label for="searchItem"></label><input type="textbox" placeholder="  Search..." name="searchItem" id="sItem">
                                <input type="textbox" value="<?= $sS ?>" name="sS" hidden>
                                <input id="srBtn" type="submit" value="Search" name="submit">
                            </div>
                        </form>
                    </div>
                </div>
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
    </header>

    <span class="error"><?php echo $searchValErrMsg; ?></span>


    <?php
    /*
        This block of code will diaplay all the products in the database when the page is loaded.
    */
    if (!isset($_GET["srcName"]) && !isset($_GET["submit"])) { ?>
        <div class="outercontainer">
            <div class="imgContainer">
                <?php //below the code creates a hyperlink for the product images.
                while ($row = $rs->fetch_assoc()) { ?>
                    <div class="imgtxt"> <a href="product.php?srcName=<?php echo $row["product_image"] ?>&sS=<?= $sS ?>"><img class="sI2" src="<?php echo $row["product_image"] ?>" alt="<?php echo $row["product_name"] ?>"></a>
                        <div class="imgt">
                            <div class="imgt"><strong><?php echo $row["product_name"] ?></strong></div>
                            <div class="imgt">AU $<?php echo $row["product_price"] ?></div>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </div>
        <?php }

    //the code below disables the img hyperlink feature if the user perform a search for a product.
    if (isset($_GET["submit"])) {

        while ($row = $rs->fetch_assoc()) {

            $_SESSION['id'] = $row["product_id"]; ?>

            <div class="outercontainer">
                <div class="icontainer">
                    <div>
                        <form class="singleItems" id="searchForm" name="form" method="GET" action="cart.php?" onsubmit="return validateCartForm(this)">
                            <?php $sProduct = $row["product_image"]; ?>
                            <div>
                                <input type="textbox" value="<?= $sS ?>" name="sS" hidden>
                                <?php // hidden values to parse the values for as a get rest in the cart table
                                ?>
                                <input type="hidden" id="hiddenQyt" name="stock" value="<?= $row['product_stock'] ?>">
                                <input type="hidden" name="pPrice" value="<?= $row['product_price'] ?>">
                                <input type="hidden" name="id" value="<?= $row['product_id'] ?>">
                                <img class="singleImg" src=<?php echo $sProduct ?> />
                            </div>
                            <div>
                                <?php
                                /*
                    Below the code will only execute if the if the product_stock is greater than 0.
                    If there is no stock, the program will displlay an "out of stock" message under the item
                */
                                if ($row["product_stock"] > 0) { ?>
                                    <div name="pdes"><?php echo $row["product_description"] ?></div>
                                    <div class="proName"><b><?php echo $row["product_name"] ?></b></div>
                                    <div class="price">AU $<?php echo number_format((float)$row["product_price"], 2) ?></div>
                                    <div>Available Stock: <?php echo $row["product_stock"] ?></div>
                                    <div><label for="qnt">Quantity:</label></div>
                                    <div><input type="textbox" onblur="qtyval(this)" value="0" class="tBoxSmall" placeholder="0" name="qty" id="pQty"></div>
                                    <span id="sError" class="errorMessages">There is only <?= $row["product_stock"] ?> units available</span>
                                    <input type="textbox" value="<?= $row["product_id"] ?>" name="id" hidden>
                                    <div><span id="sErrors" class="errorMessages">Qty must be greater than 1 and must not contain any charaters.</span></div>
                                    <div class="input-field"><input type="submit" value="Add to Cart" class="tester" id="searchatc" name="addToCart"></div>
                        </form>
                    <?php } else { ?>

                        <div><?php echo $row["product_name"] ?></div>
                        <div>Price: $<?php echo $row["product_price"] ?></div>
                    <?php echo "Out of stock";
                                } ?>
                    </div>
                </div>
            </div>
            </div>

        <?php }
    }


    /*
            This block of code will display the item that the user clicks on.
            */
    if (isset($_GET["srcName"])) {

        while ($row = $rs->fetch_assoc()) {

            $_SESSION['id'] = $row["product_id"];
            //a form created to parse get requests for cart.php
        ?>
            <div class="outercontainer">
                <div class="icontainer">
                    <div class="s">
                        <form class="singleItems" method="GET" id="pressForm" name="form" action="cart.php" onsubmit="return validateCartForm1(this)">
                            <?php $poduct = $row["product_image"]; ?>
                            <div class="ndFlex">
                                <img class="singleImg" src=<?php echo $poduct ?> />

                                <?php // hidden values to parse the values for as a get rest in the cart table
                                ?>
                                <input type="textbox" value="<?= $sS ?>" name="sS" hidden>
                                <input type="hidden" id="hiddenQyt1" name="stock" value="<?= $row['product_stock'] ?>">
                                <input type="hidden" name="pPrice" value="<?= $row['product_price'] ?>">
                                <input type="hidden" name="id" value="<?= $row['product_id'] ?>">
                            </div>
                            <div class="ndFlex">

                                <?php if ($row["product_stock"] > 0) {

                                ?>
                                    <div name="pdes"><?php echo $row["product_description"] ?></div>
                                    <div class="proName" name="pName">
                                        <h3><?php echo $row["product_name"] ?></h3>
                                    </div>
                                    <div class="price">AU $<?php echo number_format((float)$row["product_price"], 2) ?></div>
                                    <div>Available Stock: <?php echo $row["product_stock"] ?></div>
                                    <div><label for="qnt">Quantity:</label><span style="padding: 0 10px 0 10px;"></div>
                                    <div><input type="textbox" onblur="qtyval1(this)" value="0" placeholder="0" class="tBoxSmall" name="qty" id="pQty1"></div>
                                    <div><span id="s1Error" class="errorMessages">There is only <?= $row["product_stock"] ?> units available</span></div>
                                    <div><span id="sErrors1" class="errorMessages">Qty must be greater than 1 and must not contain any characters</span></div>
                                    <div class="input-field"><input type="submit" value="Add to Cart" class="tester" name="addToCart" id="atcPress"></div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        <?php } else {

        ?>
            <div name="pName"><?php echo $row["product_name"] ?></div>
            <div>Price: $<?php echo $row["product_price"] ?></div>

            <?php echo "Out of stock"; ?>
            </div>
            </form>
            </div>
            </div>
            </div>
<?php
                                }
                            }
                        } ?>


<div><?php echo $notFound ?></div>

<?php
$connObj->close();
?>

</body>

</html>