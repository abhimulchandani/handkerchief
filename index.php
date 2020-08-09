<html>
	<head>
		<meta charset="utf-8">
		<title>handkerchief</title>
		<link rel="stylesheet" type="text/css" href="main.css">
		<style>

			#main {height: 100%;}

			.movie
	        {
	            width: 240px;
	            float: left;
	            margin: 10px 0px;
	            margin-right: 30px;
	            cursor: pointer;
	        }

	        .movie img
	        {
	            width: 240px;
	            height: 340px;
	        }

	        .movie:hover
	        {
	            opacity: 0.85;
	        }
		</style>
	</head>

	<body>

<?php
include 'db.php';
session_start();

$url = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
$_SESSION["url"] = filter_var($url, FILTER_VALIDATE_URL);

$username = @$_SESSION["username"];
?>

		<div id="header">
			
			<div id="logo">
				<a href='index.php'>handkerchief</a>
			</div>

			<div id="login">

<?php
if(@$username) {
	echo "
			<a>Profile</a>
			<div id='menu'>
				<span id='username'>$username</span>
				<a href='bookedtickets.php'>Booked Tickets</a>
				<a href='logout.php'>Logout</a>
			</div>";
}
else {
	echo "<a href='login.php'>Login</a>";
}
?>
			</div>
		</div>

		<div id="main">

<?php 
$sql = "SELECT movie_id, poster FROM movie ORDER BY release_date DESC";

if($result = mysqli_query($conn, $sql)) {
	while($row = mysqli_fetch_assoc($result)) {
	    echo "
	    <div class='movie' id='".$row['movie_id']."' onclick='getMovieId(this.id)'>
	    	<img src='".$row['poster']."'>
	    </div>";
	}
}
else {
	echo "<p>ERROR: Failed to execute query $sql ".mysqli_error($conn)."</p>";
}

mysqli_close($conn);
?>
			<form id='movieForm' method='get' action='moviepage.php' style='display:none'>
				<input type="text" name='movieId' id='movieId'>
			</form>

			<div class="clear"></div>

		</div>

		
		<div id="footer"></div>

		<script>
			function getMovieId(movieId) {
				document.getElementById('movieId').value = movieId;
	            document.getElementById('movieForm').submit();
	        }
		</script>

	</body>

</html>
