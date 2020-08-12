<?php
include 'db.php';
session_start();
session_destroy();
if(@$_SESSION["url"]) {
    header('location:'.$_SESSION["url"]);
}
else {
    header('location:index.php');
}
?>
