<?php

include 'db.php';
session_start();

$userId = $_GET["userId"];
$movieId = $_GET["movieId"];
$userrating = $_GET["rating"];

$sql = "INSERT INTO movie_rating (user_id, movie_id, rating) VALUES ($userId, $movieId, $userrating)";

if(!mysqli_query($conn, $sql)) {
	echo "<p>ERROR: Failed to execute query $sql ".mysqli_error($conn)."</p>";
}
else {

	//Extracting average movie rating from the table movie_rating
	$sql = "SELECT AVG(rating) AS avg, COUNT(rating) AS votes FROM movie_rating WHERE movie_id=$movieId ";
	if($result = mysqli_query($conn, $sql)) {
	    $row = mysqli_fetch_assoc($result);
	    
	    $rating = round($row['avg']);
	    $number_of_votes = $row['votes'];
	}
	else {
	    echo "<p>ERROR: Failed to execute query $sql ".mysqli_error($conn)."</p>";
	}

	//Inserting the computed average movie rating into the table movie
	$sql = "UPDATE movie SET rating=$rating WHERE movie_id=$movieId";
	if(!mysqli_query($conn, $sql)) {
	    echo "<p>ERROR: Failed to execute query $sql ".mysqli_error($conn)."</p>";
	}

	echo "<p><span id='heart'>&#9829;</span> <span id='value'> $rating% </span> &nbsp;($number_of_votes votes)</p><div id='slider-container'><p>Your rating: <span id='userrating'> $userrating%</span></p>";
}
?>
