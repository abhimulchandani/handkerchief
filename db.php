<?php

$host = "localhost";
$dbuser = "abhi";
$dbpass = "abhi";
$db = "handkerchief";

$loginUrl = "login.php";
$logoutUrl = "logout.php";
$indexUrl = "index.php";
$moviepageUrl = "moviepage.php";
$screenpageUrl = "screenpage.php";
$bookedticketsUrl = "bookedtickets.php";

$conn = mysqli_connect($host, $dbuser, $dbpass, $db);

if(mysqli_connect_errno($conn)) {
	echo "ERROR: ".mysqli_error($conn);
}
?>