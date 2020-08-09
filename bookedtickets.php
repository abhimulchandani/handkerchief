<html>
	<head>
		<meta charset="utf-8">
		<title>handkerchief</title>
		<link rel="stylesheet" type="text/css" href="main.css">
		<style>

			h2
            {
                font-size: 34px;
                margin-bottom: 40px;
                font-weight: normal;
            }

			#main
			{
				padding-left: 60px;
				padding-top: 16px;
			}

			#info
            {
                font-weight: normal;
                font-size: 16px;
            }

            #info .transaction
			{
                margin-bottom: -4px; 
             	display: block;
             	color: #1072d6;
             	color: #1034a6;
                font-size: 22px;
           	}

            #info p
            {
            	margin-bottom: -8px;
            }

            

			th, td
			{
				padding: 10px;
				border: 1px solid black;
			}

            table {
			  width: 50%;
			  border: 1px solid black;
			  border-collapse: collapse;
			  margin-bottom: 70px;
			  margin-top: 30px;
			}

			th {
			  height: 50px;
			  font-weight: normal;
			  text-align: center;
			  background-color: #111;
			  color: #fff;
			}

			td
			{
				background-color: #dcdcdc;
				text-align: center;
			}

		</style>
	</head>

	<body>

<?php
include 'db.php';
session_start();

$username = @$_SESSION["username"];

if(!@$username) {
	header('location:login.php');
}

?>

		<div id="header">
			
			<div id="logo">
				<a href='index.php'>handkerchief</a>
			</div>

			<div id="login">

<?php

$userId = @$_SESSION["userid"];
echo "
	<a>Profile</a>
	<div id='menu'>
		<span id='username'>$username</span>
		<a href='logout.php'>Logout</a>
	</div>";

?>
			</div>
		</div>

		<div id="main">

<?php 

//Extract booking information from the table transaction
$sql1 = "SELECT transaction_id, amount, time_of_booking, number_of_tickets, movie_name, screen_name, theatre_name, show_date, show_time from transaction WHERE user_id=$userId ORDER BY time_of_booking DESC";


if($result1 = mysqli_query($conn, $sql1)) {

	if(mysqli_num_rows($result1) == 0) {
		echo "<p>You have not made any bookings yet.</p>";
	}
	else {
		echo "<h2>Booked tickets:</h2>";
		while($row = mysqli_fetch_assoc($result1)) {
		
			$transactionId = $row["transaction_id"];
			$amount = $row["amount"];
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
		    	<div id='info'>
			    	<span class='transaction'>Transaction ID: $transactionId </span>
			    	<p>$movie_name | $theatre_name $screen_name </p>
			    	<p>$show_date &nbsp;$show_time </p>
			    	<p>Total Amount: </span>&#8377;$amount</p>
			    	<p>Time of Booking: </span>$time_of_booking</p>
			    </div>";

		    $sql2 = "SELECT * FROM ticket WHERE transaction_id=$transactionId";

			if($result2 = mysqli_query($conn, $sql2)){
				
				if(mysqli_num_rows($result2)>0){
					echo "
						<table>
							<tr>
								<th>SEAT NUMBER</th>
								<th>SEAT TYPE</th>
								<th>PRICE (&#8377;)</th>
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

	</body>

</html>
