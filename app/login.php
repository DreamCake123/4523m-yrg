<?php
    $user_type = $_POST['user_type'];
    if($user_type == "manager"){
        header("Location: /view/manager.php");
        exit();
    }else if($user_type = "supplier"){
        header("Location: /view/supplier.php");
        exit();
    }
?>