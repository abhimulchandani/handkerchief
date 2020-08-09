<?php

include 'db.php';
session_start();

$userId = $_GET["userId"];
$showId = $_GET["showId"];
$seats = $_GET["seats"];
$prices = $_GET["prices"];
$types = $_GET["types"];

//Extracting data from the table movie_show
$sql = "SELECT movie_id, date, time, screen_id FROM movie_show WHERE show_id=$showId";

if($result = mysqli_query($conn, $sql)) {
	$row = mysqli_fetch_assoc($result);
    
    $movieId = $row['movie_id'];
    $show_date = $row['date'];
    $date = date_create($show_date);
    $date = date_format($date, "l, j M Y");
    $show_time = $row['time'];
    $time = date_create($show_date. " ". $show_time);
    $time = date_format($time, "h:i A");
    $screenId = $row['screen_id'];
    
}
else {
	echo "<p>ERROR: Failed to execute query $sql ".mysqli_error($conn)."</p>";
}


//Extracting data from the table movie
$sql = "SELECT name, language, age_certificate, format, runtime FROM movie WHERE movie_id=$movieId";

if($result = mysqli_query($conn, $sql)) {
    $row = mysqli_fetch_assoc($result);
    
    $movie_name = $row['name'];
    $language = $row['language'];
    $format = $row['format'];
    $runtime = $row['runtime'];
    $age_certificate = $row['age_certificate'];

}
else {
    echo "<p>ERROR: Failed to execute query $sql ".mysqli_error($conn)."</p>";
}


//Extracting data from the table screen
$sql = "SELECT name, theatre_id, seat_map FROM screen WHERE screen_id=$screenId";

if($result = mysqli_query($conn, $sql)) {
    $row = mysqli_fetch_assoc($result);
    
    $screen_name = $row['name'];
    $theatreId = $row['theatre_id'];
    $seatmap = $row['seat_map'];

}
else {
    echo "<p>ERROR: Failed to execute query $sql ".mysqli_error($conn)."</p>";
}


//Extracting data from the table theatre
$sql = "SELECT name FROM theatre WHERE theatre_id=$theatreId";

if($result = mysqli_query($conn, $sql)) {
    $row = mysqli_fetch_assoc($result);
    
    $theatre_name = $row['name'];

}
else {
    echo "<p>ERROR: Failed to execute query $sql ".mysqli_error($conn)."</p>";
}


$seatArray = array();
$priceArray = array();
$typeArray = array();

$flag=0;
$len = strlen($seats);
$start = 0;

while($flag==0)
{
    $commaIndex = strpos($seats, ",", $start);
    if($commaIndex == false)
    {
        $flag=1;
        $commaIndex = $len;
    }
    $seat = substr($seats,$start,$commaIndex-$start);
    $start = $commaIndex+1;
    
    array_push($seatArray, $seat);
}

$flag=0;
$len = strlen($prices);
$start = 0;

while($flag==0)
{
    $commaIndex = strpos($prices, ",", $start);
    if($commaIndex == false)
    {
        $flag=1;
        $commaIndex = $len;
    }
    $price = (int)substr($prices,$start,$commaIndex-$start);
    $start = $commaIndex+1;
    
    array_push($priceArray, $price);
}

$flag=0;
$len = strlen($types);
$start = 0;

while($flag==0)
{
    $commaIndex = strpos($types, ",", $start);
    if($commaIndex == false)
    {
        $flag=1;
        $commaIndex = $len;
    }
    $type = substr($types,$start,$commaIndex-$start);
    $start = $commaIndex+1;
    
    array_push($typeArray, $type);
}


//$sql = "INSERT INTO ticket VALUES (NULL,'$seat','$screen','$theatre','$movie','$date','$time','$show_id')";
//$result = $conn->query($sql);

$len = count($seatArray);
$amount = 0;

for($i=0; $i<$len; $i++) {
	$amount += $priceArray[$i];
}


date_default_timezone_set('Asia/Kolkata');
$time_of_booking = date("Y-m-d H:i:s");

//Putting data into the table transaction
$sql = "INSERT INTO transaction (amount, time_of_booking, number_of_tickets, movie_name, screen_name, theatre_name, show_date, show_time, show_id, user_id) VALUES ($amount, '$time_of_booking', $len, '$movie_name', '$screen_name', '$theatre_name', '$show_date', '$show_time', $showId, $userId)";

if(!mysqli_query($conn, $sql)) {
	echo "<p>ERROR: Failed to execute query $sql ".mysqli_error($conn)."</p>";
}


//Getting the transaction_id of the transaction
$transaction_id = 0;
$sql = "SELECT transaction_id FROM transaction WHERE time_of_booking='$time_of_booking'";

if($result = mysqli_query($conn, $sql)) {
	$row = mysqli_fetch_assoc($result);
	$transaction_id = $row['transaction_id'];
}
else {
	echo "<p>ERROR: Failed to execute query $sql ".mysqli_error($conn)."</p>";
}

//Putting data into the table ticket
for($i=0; $i<$len; $i++) {

	$sql = "INSERT INTO ticket (seat_number, seat_type, price, transaction_id, show_id) VALUES ('$seatArray[$i]', '$typeArray[$i]', $priceArray[$i], $transaction_id, $showId)";

	if(!mysqli_query($conn, $sql)) {
		echo "<p>ERROR: Failed to execute query $sql ".mysqli_error($conn)."</p>";
	}
}

mysqli_close($conn);

echo "
	<div id='ticket'>
		<h2>Tickets booked successfully!</h2>
		<p id='transaction'>Transaction ID: $transaction_id</p>
		<p>$movie_name ($language $format) ($age_certificate)</p>
		<p>$theatre_name $screen_name</p>
		<p>$date &nbsp; $time</p>
		<p>Total Amount &#8377;$amount</p>
		<p>";

for($i=0; $i<$len; $i++) {
	echo "$seatArray[$i] ($typeArray[$i])<br>";
}

echo "</p></div>";

?>
