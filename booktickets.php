<?php
include 'db.php';
$str = $_GET['q'];

$index= strpos($str, "_", 0);
$len = strlen($str);

$show_id = substr($str,0,$index);
$seats = substr($str,$index+1,$len-$index);

echo "<html> <body>";

echo "<div style=\"font-family: monospace; font-size:24px;\"> Tickets booked successfully!<br>";

$sql = "SELECT * FROM movie_show WHERE id = $show_id";
$result = $conn->query($sql);
$row = mysqli_fetch_assoc($result);

$date = $row['date'];
$time = $row['time'];

$screen_id = $row['screen_id'];
$movie_id = $row['movie_id'];

$sql = "SELECT name,certificate FROM movie WHERE id=$movie_id";
$result = $conn->query($sql);
$row = mysqli_fetch_assoc($result);

$movie = $row['name'];
$certificate = $row['certificate'];

$sql = "SELECT name,theatre_id FROM screen WHERE id=$screen_id";
$result = $conn->query($sql);
$row = mysqli_fetch_assoc($result);

$screen = $row['name'];
$theatre_id = $row['theatre_id'];

$sql = "SELECT name FROM theatre WHERE id=$theatre_id";
$result = $conn->query($sql);
$row = mysqli_fetch_assoc($result);

$theatre = $row['name'];

$sql = "SELECT name FROM theatre WHERE id=$theatre_id";
$result = $conn->query($sql);
$row = mysqli_fetch_assoc($result);

$theatre = $row['name'];


$flag=0;
$seatsLen = strlen($seats);
$start = 0;

while($flag==0)
{
    $commaIndex= strpos($seats, ",", $start);
    if($commaIndex == false)
    {
        $flag=1;
        $commaIndex = $len;
    }
    $seat = substr($seats,$start,$commaIndex-$start);
    $start = $commaIndex+1;
    
    $sql = "INSERT INTO ticket VALUES (NULL,'$seat','$screen','$theatre','$movie','$date','$time','$show_id')";
    $result = $conn->query($sql);
}

echo "<br> Date: ".$date."<br>";
echo "<br> Time: ".$time."<br>";
echo "<br> Movie: ".$movie."<br>";
echo "<br> Certificate: ".$certificate."<br>";
echo "<br> Seats: ".$seats."<br>";
echo "<br> Screen: ".$screen."<br>";
echo "<br> Theatre: ".$theatre."<br></div></body></html>";

?>