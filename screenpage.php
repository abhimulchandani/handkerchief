<html>
<head>
    <meta charset="utf-8">
	<title>Show</title>
    <link rel="stylesheet" type="text/css" href="main.css">
    <style>
        .section
        {
            font-family: monospace;
            font-weight: bolder;
            font-size: 14px;
        }

		.seat
		{
            color: green;
            width: 40px;
            height: 40px;
            text-align: center;
            line-height: 40px;
            border: 1px solid green;
			border-radius: 12px;
			margin: 5px;
		}

		.space
		{
            width: 40px;
            height: 40px;
            border: 1px dotted;
            border-radius: 12px;
            margin: 5px;
			display: none;
        }

		.available
        {
            background-color: white;
            color: green;
        }
            
        .available:hover
        {
            cursor: pointer;
        }

        .booked
        {
            background-color: darkgray;
            color: white;
            border-color: darkgray; 
        }
            
        .booked:hover
        {
            cursor: default;
            background-color: darkgray;
            border-color: darkgray;
        }
        
        .clicked
        {
            background-color: green;
            color: white;
            cursor: pointer;
        }
        
        #bookButton
        {
            cursor: pointer;
        	width: 250px;
        	height: 35px;
        	color: white;
        	background-color: #0066D9;
            display: block;
        	margin-left: auto;
        	margin-right: auto;
        	margin-top: 20px;
        }
            
		</style>
	
</head>

<body>
	<div id="header">
		<div id="logo">
	        <a href="http://localhost/handkerchief/index.php">handkerchief</a>
	    </div>
	</div>
    <div id="main">
        
        <?php 
        include 'db.php';
        $show_id = $_POST['showInput'];
            
        $sql = "SELECT * FROM movie_show WHERE id = $show_id";
        $result = $conn->query($sql);
        $row = mysqli_fetch_assoc($result);
            
        $movie_id = $row['movie_id'];
        $screen_id = $row['screen_id'];
        
        $sql = "SELECT seat_map FROM screen WHERE id = $screen_id";
        $result = $conn->query($sql);
        $row = mysqli_fetch_assoc($result);
        
        echo $row['seat_map'];
        
        $sql = "SELECT seat FROM ticket WHERE show_id = $show_id";
        $result = $conn->query($sql);
        $numrows = mysqli_num_rows($result);
        
        $seats ="";
        for($i=0; $i<$numrows; $i++)
        {
            $row = mysqli_fetch_assoc($result);
            $seats = $seats.$row['seat'].",";
        }
        
        echo "<input type='text' id='bookedSeats' value='$seats' style='display:none'>"
        ?>
        
        <input type='text' name='seatInput' id='seatInput' value='<?php echo $show_id ?>' style='display:none'>
        <button id='bookButton' onclick='booktickets()'>Book Tickets</button>
        
	</div>	
	<div class="clear"></div>
	<div id="footer"></div>

	<script>
        
        booked = document.getElementById('bookedSeats').value;
        len = booked.length;
        i=0;
        
        while(i<len)
        {
            seat="";
            while(booked.charAt(i)!=",")
            {
                seat = seat + booked.charAt(i);
                i=i+1;
            }
            document.getElementById(seat).className = 'seat booked';
            i=i+1;
        }
            
		function clicked(str)
        {
            obj = document.getElementById(str);
            	
            if(obj.className == 'seat available')
                obj.className = 'seat clicked';
                
            else if(obj.className == 'seat clicked')
                obj.className = 'seat available';
        }
        
        function booktickets()
        {
            arr = document.getElementsByClassName('seat clicked');
            len = arr.length;
                        
            str = "";
               
            for(i=0; i<len; i++)
            {
                str += arr[i].id;
                if(i!=len-1)
                    str += ",";
            }
            
            if(str == "")
          	{
            	window.alert("Please select seats !");
            }
            else
            {
                str = document.getElementById('seatInput').value + "_" + str;
		    }
            
            if (window.XMLHttpRequest)
            {
                xmlhttp=new XMLHttpRequest();
            }
            xmlhttp.onreadystatechange=function()
            {
                if (this.readyState==4 && this.status==200)
                {
                    document.getElementById('main').innerHTML = this.responseText;
                }
            }
            xmlhttp.open("GET","booktickets.php?q="+str,true);
            xmlhttp.send();
        }
	</script>
</body>

</html>
