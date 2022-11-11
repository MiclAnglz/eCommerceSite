<!--
 * Student ID: 20455936
 * Name: Michael Angeles
 * Campus:  Parramatta South
 * Tutor Name: Kieran Luken
 * Class Day: Thursday
 * Class Time: 2pm
-->

<?php

/*
a function to customise a where clause in an sql query
 */
function whereClause($earch, $sql, $connObj, $where)
{

    $search = $connObj->escape_string($_GET[$earch]);           //sanitising the users entry
    return $sql .= "where $where = '$search'";                  // adding a where clause to display specific query details
}

/*
    This function outputs chosen products from the session array using an sql query.
*/
function cartPrintOut($temp1, $connObj)
{
    $total = 0;

    foreach ($temp1 as $key => $value) {

        // this variable will change through each iteration of this foreach loop. The array holds the product_id's
        $pid = intval($value['id']);

        //creating the query and storing it in an array
        $sql = "select * ";
        $sql .= "from product ";
        $sql .= "where product_id = '$pid'";        //search throught each Product id in the array.

        $rs = $connObj->query($sql)
            or die('There was a problem with query' . $connObj->error);

        // $total = 0;

        if ($rs->num_rows) {

            while ($row = $rs->fetch_assoc()) { ?>
                <tr>
                    <td><img class="cartImages" src="<?= $row['product_image'] ?>"></img></td>
                    <td><?= $row['product_name'] ?></td>
                    <td>$<?= number_format((float)$value['price'], 2) ?></td>
                    <td><?= $value['qty'] ?></td>
                    <td>$<?= number_format((float)intval($row['product_price']) * intval($value['qty']), 2) ?></td>
                    <td>
                        <a href="cart.php?action=remove&id='<?= $pid ?>'">
                            <button class='removeBtn'>Remove</button>
                        </a>
                    </td>
                </tr>

                <?php $total += intval($row['product_price']) * intval($value['qty']);  ?> //this code calculates the total vof the cart

                <tr>
                    <td></td>
                    <td></td>
                    <td colspan="2">Total price of the Cart</td>
                    <td>$<?= number_format($total, 2) ?></td>
                    <!-- <td></td> -->
                </tr>

    <?php }
        } else {

            echo "A search was not found";
        }
    } ?>



<?php

    $connObj->close();
}
?>