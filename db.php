<?php

$host = "localhost";
$dbuser = "abhi";
$dbpass = "abhi";
$db = "handkerchief";

$conn = mysqli_connect($host, $dbuser, $dbpass, $db);

if(mysqli_connect_errno($conn)) {
	echo "ERROR: ".mysqli_error($conn);
}
?>
