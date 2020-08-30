<html>
    <head>
        <meta charset="utf-8">
        <title>handkerchief</title>
        <link rel="stylesheet" type="text/css" href="main.css">
        <style>
            
            #poster
            {
                width: 240px;
                float: left;
                margin: 10px 0px;
                margin-right: 15px;
            }

            #poster img
            {
                width: 240px;
                height: 340px;
            }
            
            #details
            {
                float: left;
                margin-left: 28px;

            }

            #details #name
            {
                font-size: 42px;
                font-weight: bold;
                display: block;
                margin: 20px 0px;
                color: #1034a6;
            }
            
            #details p
            {
                font-size: 17px;
                margin-bottom: -12px;
            }

            
            #rating
            {
                float: left;
                margin-top: 36px;
            }

            #rating #slider-container
            {
                margin-top: 24px;
            }

            #rating p #heart
            {
                font-size: 36px;
                color: red;
            }
            
            #rating p #value
            {
                font-size: 28px;
                color: #1034a6;
            }

            #rating #userrating
            {
                color: #1034a6;
                font-size: 18px;
            }

            #rating #slider
            {
                vertical-align: text-top;
            }

            #rating #slider:hover
            {
                cursor: pointer;
            }

            #rating a
            {
                text-decoration: none;
            }


            #shows {padding-top: 40px;}

            #date
            {
                display: block;
                font-weight: bold;
                font-size: 18px;
                margin-bottom: 4px;
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
                border-radius: 10px;
                font-family: verdana;
            }

            .show:hover
            {
                color: white;
                background-color: green;
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
$userId = 0;
$hasUserRated = 0;

if(@$username) {
    $userId = @$_SESSION["userid"];
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

$movieId = $_GET["movieId"];

//Extracting movie details from the table movie
$sql = "SELECT name, language, genre, age_certificate, release_date, format, runtime, poster FROM movie WHERE movie_id=$movieId";

if($result = mysqli_query($conn, $sql)) {
    $row = mysqli_fetch_assoc($result);
    
    $name = $row['name'];
    $language = $row['language'];
    $genre = $row['genre'];
    $age_certificate = $row['age_certificate'];
    $release_date = date_create($row['release_date']);
    $release_date = date_format($release_date, "jS F Y");
    $format = $row['format'];
    $runtime = $row['runtime'];
    $poster = $row['poster'];
}
else {
    echo "<p>ERROR: Failed to execute query $sql ".mysqli_error($conn)."</p>";
}

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


//Extracting the user rating for the movie
$sql = "SELECT rating FROM movie_rating WHERE user_id=$userId AND movie_id=$movieId";
if($result = mysqli_query($conn, $sql)) {
    $row = mysqli_fetch_assoc($result);
    
    $user_rating = $row['rating'];
    if($user_rating != 0) {
        $hasUserRated = true;
    }
    else {
        $hasUserRated = false;    
    }
}
else {
    echo "<p>ERROR: Failed to execute query $sql ".mysqli_error($conn)."</p>";
}

?>
            <div id='poster'><img src='<?php echo $poster ?>'></div>
            
            <div id='details'>
<?php
    echo "
    <p id='name'>$name</p>
    <p>$language &nbsp;$format<p>
    <p>$genre &nbsp;($age_certificate)</p>
    <p>$release_date</p>
    <p>$runtime mins</p>";


?>
                <div id='rating'>
                    <p><span id='heart'>&#9829;</span> <span id='value'><?php echo $rating; ?>%</span> &nbsp;(<?php echo $number_of_votes; ?> votes)</p>
                    <div id='slider-container'>

<?php

if($hasUserRated) {
    echo "<p>Your rating: <span id='userrating'> $user_rating%</span></p>";
}
else {
    echo "
    <p>Rate it:</p>
    <p>
        <input type='range' min='10' max='100' value='10' step='10' id='slider'>
        &nbsp;<span id='output'></span>% &nbsp;<a href='javascript:rateMovie()'>Submit</a>
    </p>";
}
?>
                    </div>
                </div>
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

            <form id='ratingForm' method='get' action='ratemovie.php' style='display:none'>
                    <input type="text" name='userId' value='<?php echo @$userId; ?>' id='userId'>
                    <input type="text" name='movieId' value='<?php echo @$movieId; ?>' id='movieId'>
            </form>

            <form id='showForm' method='get' action='screenpage.php' style='display:none'>
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

            // Display the default slider value
            var slider = document.getElementById("slider");
            var output = document.getElementById("output");
            output.innerHTML = slider.value;

            // Update the current slider value (each time you drag the slider handle)
            slider.oninput = function() {
              output.innerHTML = this.value;
            }

            function rateMovie()
            {
                var userId = document.getElementById("userId").value;
                var movieId = document.getElementById("movieId").value;
                
                if(userId == 0){
                    alert("Please login to your account to give a rating");
                }
                else {
                    var givenRating = slider.value;
                    
                    if (window.XMLHttpRequest){
                            xmlhttp=new XMLHttpRequest();
                        }

                        xmlhttp.onreadystatechange=function(){
                            if (this.readyState==4 && this.status==200){
                                document.getElementById('slider-container').innerHTML = this.responseText;
                            }
                        }
                        xmlhttp.open("GET","ratemovie.php?userId="+ userId +"&movieId="+ movieId +"&rating="+ givenRating, true);
                        xmlhttp.send();

                }
            }

        </script>

    </body>

</html>