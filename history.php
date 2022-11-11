<?php

require_once('sessionStarter.php');

$noRecords = "";
$empty = false;

if (isset($_GET['sS'])) {

    require_once('conn.php');

    $uId = $_SESSION['who'];
    // $fname = $_SESSION['fname'];

    //below is a nested query. this is used to extract the users order history from the database.
    $sql = "select order_id, order_datetime, ";
    $sql .= "(select sum(detail_qty * detail_price) from order_detail  where detail_order_id = order_id) as total ";
    $sql .= "from user_order ";
    $sql .= "where order_user_id = '$uId'";

    $rs = $connObj->query($sql)
        or die('There was a problem with query' . $connObj->error);

    if ($rs->num_rows) {
    } else {

        $noRecords = "You have no records in the database";
        $empty = true;
    }

    $connObj->close();
}


if ($inSession == "false") {
    header('location: login.php');
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="styles.css" />
    <script src="https://kit.fontawesome.com/bd846823d7.js" crossorigin="anonymous"></script>
    <title>Order Page</title>
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

    <?php

    //this code will only display results if the user has results in the database.
    if ($empty == true) { ?>

        <div class="outercontainer">
            <div class="container">
                <div class="tab">
                    <p>
                        <?php echo $noRecords ?>
                    </p>
                </div>
            </div>
        </div>
    <?php } else { ?>
        <div class="outercontainer">
            <div class="container">
                <div>
                    <table class="orderHistoryTable">
                        <tr class="title" style="background:rgb(0, 102, 255); color:white">
                            <td colspan="3">Your Order History</td>
                        </tr>
                        <tr>
                            <th>Order Id</th>
                            <th>Date</th>
                            <th>Total Cost of Order</th>
                        </tr>

                        <?php

                        //will only display info if user is logged in.
                        if (isset($_GET['sS'])) { ?>

                            <?php while ($row = $rs->fetch_assoc()) { ?>

                                <tr>
                                    <td><?= $row['order_id'] ?></td>
                                    <td><?= $row['order_datetime'] ?></td>
                                    <td>$<?= number_format((float)$row['total'], 2) ?></td>
                                </tr>

                            <?php  } ?>

                        <?php }
                        ?>

                    </table>
                </div>
            </div>
        </div>

    <?php } ?>


</body>

</html>