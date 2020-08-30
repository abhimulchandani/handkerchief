<?php

include 'db.php';
session_start();

$userId = $_GET["userId"];
$movieId = $_GET["movieId"];
$rating = $_GET["rating"];

$sql = "INSERT INTO movie_rating (user_id, movie_id, rating) VALUES ($userId, $movieId, $rating)";

if(!mysqli_query($conn, $sql)) {
	echo "<p>ERROR: Failed to execute query $sql ".mysqli_error($conn)."</p>";
}
else {
	echo "<p>Your rating: <span id='userrating'> $rating%</span></p>";
}
?>