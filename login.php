 <?php

    // ensure page is not cached
    require_once("nocache.php");
    require_once('sessionStarter.php');

    $errorMessage = "";

    // check that the form has been submitted
    if (isset($_POST['submit'])) {

        // check that username and password were entered
        if (empty($_POST['username']) || empty($_POST['password'])) {
            $errorMessage = "Both username and password are required";
        } else {
            // connect to the database
            require_once('conn.php');

            // parse username and password for special characters
            $username = $connObj->escape_string($_POST['username']);
            $password = $connObj->escape_string($_POST['password']);

            // hash the password so it can be compared with the db value
            $hashedPassword = hash('sha256', $password);

            // query the db
            // $sql = "select user_id, user_type from user where username_email = '$username' and user_password = '$hashedPassword'";
            $sql = "select * from user where user_email = '$username' and user_password = '$hashedPassword'";
            $rs = $connObj->query($sql);

            // check number of rows in record set. What does this mean in this context?
            if ($rs->num_rows) {
                // start a new session for the user
                session_start();

                // Store the user details in session variables
                $user = $rs->fetch_assoc();
                $_SESSION['logFname'] = $user['user_fname'];
                $_SESSION['who'] = $user['user_id'];
                $_SESSION['type'] = $user['user_type'];
                $_SESSION["key"] = $user['user_type'] . "AndSessionKey:" . $_SESSION['who'] . rand(65, 99);
                $_SESSION['hidden'] = "false";
                $key = $_SESSION["key"];
                // Redirect the user to the secure page
                header("Location: index.php?sS=$key");
            } else {
                $errorMessage = "Invalid Username or Password";
            }
        }
    }
    ?>
 <!DOCTYPE html>
 <html lang="en">

 <head>
     <meta charset="UTF-8" />
     <link rel="stylesheet" href="styles.css" />
     <script src="https://kit.fontawesome.com/bd846823d7.js" crossorigin="anonymous"></script>
     <title>Login Page</title>
     <?php

        ?>
     <script>
         var hidden = "<?= $hidden ?>"

         if (hidden == "false") {

             window.addEventListener('load', function() {

                 document.getElementById("proFi").hidden = false;
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
                 <form id="loginform" class="loginForm" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="post">
                     <div>
                         <h3>Sign In</h3>
                     </div>
                     <div class="input-field">
                         <div class="errorMsgPos">
                             <input type="text" id="uName" name="username" class="tBox" placeholder="Username" />
                         </div>
                     </div>
                     <div class="input-field">
                         <div class="errorMsgPos">
                             <input type="password" name="password" id="pword" class="tBox" placeholder="Password" />
                         </div>
                     </div>
                     <p class="red" style="color:red; font-size:18px"><?php echo $errorMessage; ?></p>
                     <div class="input-box">
                         <div class="execute"><input type="submit" class="isset" value="Sign In" name="submit"></div>
                     </div>
                     <div>
                         <p class="doYou">Don't have an account? <a class="homeNav register" href="register.php">Register here</a></p>
                     </div>
                 </form>
             </div>
         </div>
     </div>
 </body>

 </html>