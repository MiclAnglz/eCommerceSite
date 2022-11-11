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
require_once("conn.php");

/**
 * once the update button isset, the program will enter all the form detail into the database provided all validations have been met.
 */
if (isset($_POST['uptdated'])) {

    if (!empty($_POST['fname']) || !empty($_POST['lname']) || !empty($_POST['email']) || !empty($_POST['streetNumber']) || !empty($_POST['Street-Address']) || !empty($_POST['Suburb-City']) || !empty($_POST['State']) || !empty($_POST['Postcode'])) {


        $id =  $_SESSION['who'];
        $fname = $connObj->escape_string($_POST['fname']);
        $lname = $connObj->escape_string($_POST['lname']);
        $email = $_POST['email'];
        $streetNumber = $connObj->escape_string($_POST['streetNumber']);
        $street = $connObj->escape_string($_POST['Street-Address']);
        $suburb = $connObj->escape_string($_POST['Suburb-City']);
        $state = $connObj->escape_string($_POST['State']);
        $pCode = $connObj->escape_string($_POST['Postcode']);
        $streetDeets = $streetNumber . " " .  $street;

        $id = $_SESSION['who'];

        $sql = "UPDATE user ";
        $sql .= "SET user_fname='$fname', user_lname='$lname', user_email='$email', user_fname='$fname', user_street='$streetDeets', user_suburb='$suburb', user_state='$state', user_post_code='$pCode' ";
        $sql .= "WHERE user_id='$id'";

        $connObj->query($sql);
        require_once('newOrUpdatedUser.php');   //this code logs the user back in 
        echo "Record updated successfully";
    } else {
        echo "Error updating record: " . $conn->error;
    }
} else {

    $inSession = false;
    if ($inSession == "false") {
        header('location: login.php');
    }
}

/**
 * below the code will always display user details as long as the get request sS is set. (including updated details).
 * 
 * it performs a select all query to extracts the existing data in the db.
 */
if (isset($_GET['sS'])) {

    if ($_GET['sS'] ==  $_SESSION["key"]) {

        $who = $_SESSION["who"];

        $sql = "select * ";
        $sql .= "from user ";
        $sql .= "where user_id = '$who'";

        $rs = $connObj->query($sql)
            or die('There was a problem with query' . $connObj->error);
    }

    $connObj->close();

    if ($rs->num_rows) {
    } else {
    }
} else {

    if ($inSession == false) {
        header('location: login.php');
    }
}


echo $inSession;
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="styles.css" />
    <script src="https://kit.fontawesome.com/bd846823d7.js" crossorigin="anonymous"></script>
    <script defer src="action2.js"></script>
</head>
<title>Profile Page</title>
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

<body>
    <header>
        <?php include('navigation.php'); ?>
    </header>

    <div class="outercontainer">
        <div class="container">
            <?php

            /*
    * The below code is to display the active/current user details. A query was written to display the results.
    */

            if ($_GET['sS'] ==  $_SESSION["key"] && !isset($_GET['update'])) {

                if ($rs->num_rows) {

                    while ($row = $rs->fetch_assoc()) {

                        $id = $row['user_id'];
                        $fname = $row['user_fname'];
                        $lname = $row['user_lname'];
                        $type = $row['user_type'];
                        $street = $row['user_street'];
                        $suburb = $row['user_suburb'];
                        $state = $row['user_state'];
                        $postcode = $row['user_post_code'];
                        $email = $row['user_email'];
                    }

                    //below is the code for the active user card.
            ?>
                    <div class="card">
                        <div class="dP"><i class="fa fa-user user pic" style="font-size:150px"></i></div>
                        <div class="cdeets">
                            <div class="input-field">
                                <h3>User Details</h3>
                            </div>

                            <div><?= $fname . " " . $lname ?></div>
                            <div><?= $street . ", " . $suburb . ", " . $state . ", " . $postcode ?></div>
                            <div><?= $email ?></div>

                            <div class="input-field"><a class="homeNav" href="profile.php?sS=<?= $sS ?>&update=update"><input type="submit" class="isset" value="Update Details" name="update"></a>
                            </div>
                        </div>

                    <?php } else {
                    echo "a search was not found";
                } ?>
                    </div>
        </div>
    <?php }

            /*
    * the below code is to allow the user to update his/her details
    */
            if (isset($_GET['update'])) {

                if ($rs->num_rows) {

                    while ($row = $rs->fetch_assoc()) {

                        $id = $row['user_id'];
                        $fname = $row['user_fname'];
                        $lname = $row['user_lname'];
                        $type = $row['user_type'];
                        $street = $row['user_street'];
                        $suburb = $row['user_suburb'];
                        $state = $row['user_state'];
                        $postcode = $row['user_post_code'];
                        $email = $row['user_email'];
                        $streetNumber = explode(" ", $street);
                    }
                } ?>

        <div class="outercontainer">
            <div class="container">
                <div class="loginWrap">

                    <form id="updateForm" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="post" onsubmit="return validateForm(this)" novalidate>

                        <div class="input-field">
                            <h3>Update Details</h3>
                        </div>

                        <div class="input-field">
                            <label for="fname" class="doYou">Contact First Name<em>*</em></label>

                            <input type="text" name="fname" id="fname" class="tBox" value="<?= $fname ?>" required />

                            <div><span class="requiredError">This is a required field</span></div>

                            <div><span id="fNameError" class="errorMessages">The first letter of the first name and last name should be an uppercase character</span></div>

                        </div>
                        <div class="input-field">
                            <label for="lname" class="doYou">Contact Surname<em>*</em></label>

                            <input type="text" name="lname" id="lname" class="tBox" value="<?= $lname ?>" required />

                            <div><span class="requiredError">This is a required field</span></div>
                            <div><span id="lNameError" class="errorMessages">The first letter of the first name and last name should be an uppercase character</span></div>

                        </div>
                        <div class="input-field">
                            <label for="streetAddress" class="doYou">Postal Address<em>*</em></label>

                            <input type="number" id="cNumber" name="streetNumber" class="tBoxSmall" value="<?= $streetNumber[0] ?>" />&nbsp;
                            <input type="text" name="Street-Address" id="streetAddress" class="tBox" value="<?= $streetNumber[1] ?>" required />

                            <div><span id="missingNumber" class="requiredError">This is a required field and street number must greater than zero</span></div>

                            <div><span id="streetAddyError" class="errorMessages">The Street Adress should only contain characters and space
                                </span></div>

                        </div>
                        <div class="input-field">
                            <label for="suburbCity" class="doYou">Suburb/City<em>*</em></label>

                            <input type="text" name="Suburb-City" id="suburbCity" class="tBox" value="<?= $suburb ?>" required />

                            <div><span class="requiredError">This is a required field</span></div>

                            <div><span id="suburbError" class="errorMessages">The Suburb/City should only contain characters and space</span></div>

                        </div>
                        <div class="input-field">
                            <label for="State" class="doYou">State<em>*</em></label>

                            <select name="State" id="State" class="tBox">
                                <option value="<?= $state ?>" selected><?= $state ?></option>
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
                            <label for="Postcode" class="doYou">Postcode<em>*</em></label>

                            <input type="text" name="Postcode" id="Postcode" class="tBox" value="<?= $postcode ?>" required />

                            <div><span class="requiredError">This is a required field</span></div>

                            <div><span id="postCodeError" class="errorMessages">The post code must be a valid Australian post code and 4
                                    digits long</span></div>

                        </div>
                        <div class="input-field">
                            <label for="email" class="doYou">Email<em>*</em></label>

                            <input type="text" id="email" name="email" class="tBox" value="<?= $email ?>" />

                            <div><span class="requiredError">This is a required field</span></div>

                            <div><span id="emailError" class="errorMessages">Must be a valid email</span></div>

                        </div>

                        <div class="submitButton input-field">
                            <input type="submit" class="isset" value="Update" name="uptdated">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    <?php }

    ?>
</body>

</html>