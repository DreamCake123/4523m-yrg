<?php
    $user_type = $_POST['user_type'];
    if($user_type == "manager"){
        header("Location: /4523m/view/manager.php");
        exit();
    }else if($user_type = "supplier"){
        header("Location: /4523m/view/supplier.php");
        exit();
    }else{
        
    }
?>