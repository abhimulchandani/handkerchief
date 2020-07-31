<html>
	<head>
		<meta charset="utf-8">
		<title>handkerchief</title>
		<link rel="stylesheet" type="text/css" href="main.css">
		<style>
			
			#movie_left
            {
                width: 240px;
                float: left;
                margin: 10px 0px;
                margin-right: 15px;
                cursor: pointer;
            }

            #movie_left img
            {
                width: 240px;
                height: 340px;
            }

            #movie_left a:hover
            {
                opacity: 0.9;
            }
            
            #movie_right
            {
                float: left;
                margin-left: 12px;
            }

            #name
            {
                font-size: 36px;
                font-weight: bold;
                display: block;
                font-family: verdana;
                margin: 20px 0px;
            }
            
            #movie_info
            {
                font-family: verdana;
                font-weight: normal;
                font-size: 18px;
            }
            
            #shows
            {
                padding-top: 40px;
            }

            .show
            {
                margin: 10px 20px 50px 0px;
                background-color: white;
                color: green;
                height: 36px;
                font-size: 16px;
                border: 1px solid grey;
                border-radius: 1px;
                cursor: pointer;
                font-family: verdana;
                border-radius: 10px;
            }

            .show:hover
            {
            	color: white;
                background-color: green;
            }
            
            #date
            {
                display: block;
                font-weight: bold;
                font-size: 18px;
                font-family: verdana;
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
				<a href='<?php echo $indexUrl; ?>'>handkerchief</a>
			</div>

			<div id="login">
				<div class='dropdown'>

<?php
if(@$username) {
	echo "
			<a class='dropbtn'>Profile</a>
			<div class='dropdown-content'>
				<a href='#' style='color: #254E58; font-weight: bold;'>$username</a>
				<a href='$bookedticketsUrl'>Booked Tickets</a>
				<a href='$logoutUrl'>Logout</a>
			</div>";
}
else {
	echo "<a href='$loginUrl'>Login</a>";
}
?>
				</div>
			</div>
		</div>

		<div id="main">

<?php

$movieId = $_GET["movieId"];
$sql = "SELECT * FROM movie WHERE movie_id=$movieId";

if($result = mysqli_query($conn, $sql)) {
	$row = mysqli_fetch_assoc($result);
    
    $name = $row['name'];
    $language = $row['language'];
    $genre = $row['genre'];
    $age_certificate = $row['age_certificate'];
    $release_date = date_create($row['release_date']);
    $release_date = date_format($release_date, "j M Y");
	$format = $row['format'];
    $runtime = $row['runtime'];
    $poster = $row['poster'];
    $rating = $row['rating'];
}
else {
	echo "<p>ERROR: Failed to execute query $sql ".mysqli_error($conn)."</p>";
}


?>
			<div id='movie_left'><img src='<?php echo $poster ?>'></div>
	        
	        <div id='movie_right'>
<?php
	echo "
	<span id='name'>$name</span>
	<span id='movie_info'>$language | $format | $age_certificate | $genre <br><br>Release Date: $release_date <br><br>Runtime: $runtime mins </span>";
?>
		
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
			<div id="shows">

<?php

$sql = "SELECT * FROM movie_show WHERE movie_id=$movieId order by date,time";
$temp = '1st Jan, 0000';

if($result = mysqli_query($conn, $sql)) {
	while($row = mysqli_fetch_assoc($result)) {

		$show_date = date_create($row['date']);
		$show_date = date_format($show_date, "j M, D");

		if($show_date != $temp){
			echo "<span id='date'>$show_date</span>";
            $temp = $show_date;
		}

		$show_time = date_create($row['date']. " ". $row['time']);
		$show_time = date_format($show_time, "h:i A");

		echo "<button class='show' id=".$row['show_id']." onclick='getShowTime(this.id)'>".$show_time."</button>";

	}
}
mysqli_close($conn);
?>
			</div>

			<form id='showForm' method='get' action='<?php echo $screenpageUrl; ?>' style='display:none'>
		            <input type="text" name='showId' id='showId'>
		    </form>

		    <div class="clear"></div>

	    </div>

		<div id="footer"></div>

		<script>
			function getShowTime(showTime)
        	{
        		document.getElementById('showId').value = showTime;
                document.getElementById('showForm').submit();
        	}
		</script>

	</body>

</html>