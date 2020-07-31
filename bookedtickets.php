<html>
	<head>
		<meta charset="utf-8">
		<title>handkerchief</title>
		<link rel="stylesheet" type="text/css" href="main.css">
		<style>

			body
			{
				font-family: verdana;
			}

			#main
			{
				padding-left: 60px;
			}

			.info
            {
                font-weight: normal;
                font-size: 16px;
            }

            .transaction
			{
                font-weight: bold;
                font-size: 18px;
             	margin-bottom: 6px; 
             	display: block;  
           	}

            h3
            {
                font-size: 26px;
                margin-bottom: 40px;
            }

            table, th, td {
			  border: 1px solid black;
			}

			th, td
			{
				padding: 10px;
			}

            table {
			  width: 50%;
			  border: 1px solid black;
			  border-collapse: collapse;
			  margin-bottom: 70px;
			}

			th {
			  height: 50px;
			  font-weight: normal;
			  text-align: left;
			}

		</style>
	</head>

	<body>

<?php
include 'db.php';
session_start();

$username = @$_SESSION["username"];

if(!@$username) {
	header('location:'.$loginUrl);
}

?>

		<div id="header">
			
			<div id="logo">
				<a href='<?php echo $indexUrl; ?>'>handkerchief</a>
			</div>

			<div id="login">
				<div class='dropdown'>

<?php

$userId = @$_SESSION["userid"];
echo "
		<a class='dropbtn'>Profile</a>
		<div class='dropdown-content'>
			<a href='#' style='color: #254E58; font-weight: bold;'>$username</a>
			<a href='$logoutUrl'>Logout</a>
		</div>";

?>
				</div>
			</div>
		</div>

		<div id="main">

<?php 

$sql1 = "SELECT transaction_id, amount, payment_method, time_of_booking, number_of_tickets, movie_name, screen_name, theatre_name, show_date, show_time from transaction WHERE user_id=$userId ORDER BY time_of_booking DESC";


if($result1 = mysqli_query($conn, $sql1)) {

	if(mysqli_num_rows($result1) == 0) {
		echo "<p>You have not made any bookings yet.</p>";
	}
	else {
		echo "<h3>Booked tickets:</h3>";
		while($row = mysqli_fetch_assoc($result1)) {
		
			$transactionId = $row["transaction_id"];
			$amount = $row["amount"];
			$payment_method = $row["payment_method"];
			$time_of_booking = $row["time_of_booking"];
			$number_of_tickets = $row["number_of_tickets"];
			$movie_name = $row["movie_name"];
			$screen_name = $row["screen_name"];
			$theatre_name = $row["theatre_name"];

		    $show_date = date_create($row['show_date']);
		    $show_date = date_format($show_date, "l, j M Y");
		    $show_time = date_create($row['show_time']. " ". $row['show_date']);
		    $show_time = date_format($show_time, "h:i A");

		    echo "
		    	<p class='info'>
			    	<span class='transaction'>Transaction ID: $transactionId </span>
			    	$movie_name <br>
			    	$theatre_name $screen_name <br>
			    	$show_date $show_time <br>
			    	<br>
			    	Amount: </span>&#8377; $amount $payment_method<br>
			    	Time of Booking: </span>$time_of_booking<br>
			    </p>";

		    $sql2 = "SELECT * FROM ticket WHERE transaction_id=$transactionId";

			if($result2 = mysqli_query($conn, $sql2)){
				
				if(mysqli_num_rows($result2)>0){
					echo "
						<table>
							<tr>
								<th>Seat Number</th>
								<th>Seat Type</th>
								<th>Price (&#8377;)</th>
							</tr>";
					
					while($row = mysqli_fetch_array($result2,MYSQLI_ASSOC)){
						echo "<tr>";
						echo "<td>" . $row["seat_number"] . "</td>";
						echo "<td>" . $row["seat_type"] . "</td>";
						echo "<td>" . $row["price"] . "</td>";
						echo "</tr>";
					}

					echo "</table>";
					mysqli_free_result($result2);
				}
			}
			else{
				echo "<p>Unable to excecute: $sql2. " .	mysqli_error($conn) ."</p>";
			}
		}
	}
}
else {
	echo "<p>Unable to excecute: $sql1. " .	mysqli_error($conn) ."</p>";
}
mysqli_close($conn);

?>
			<div class="clear"></div>
		</div>

		<div id="footer"></div>

		<script>
			
		</script>

	</body>

</html>