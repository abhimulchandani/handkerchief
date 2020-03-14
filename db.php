<?php

$host = "localhost";
$user = "abhi";
$pass = "abhi";
$db = "handkerchief";

$conn = mysqli_connect($host, $user, $pass, $db);

if(mysqli_connect_errno($conn))
{
	echo "Error";
}
?>