<html>
	<head>
		<title>Movie</title>
        <link href="main.css" rel="stylesheet" type="text/css">
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
            
            #shows
            {
                padding: 20px;
                padding-top: 30px;
            }

            .show
            {
                margin: 10px 20px 50px 0px;
                background-color: white;
                color: green;
                height: 30px;
                font-size: 16px;
                border: 1px solid grey;
                border-radius: 1px;
                cursor: pointer;
                font-family: monospace;
                font-weight: bold;
            }
            
            #date
            {
                display: block;
                font-family: monospace;
                font-weight: bold;
                font-size: 18px;
            }
            
            #name
            {
                font-size: 30px;
                font-weight: bold;
                display: block;
                font-family: monospace;
                margin: 20px 0px;
            }
            
            #movie_info
            {
                font-family: monospace;
                font-weight: bold;
                font-size: 16px;
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
            $movie_id = $_POST['movieInput'];

            $sql = "SELECT * FROM movie WHERE id = $movie_id";
            $result = $conn->query($sql);
            $row = mysqli_fetch_assoc($result);
            $name = $row['name'];
            $language = $row['language'];
            $genre = $row['genre'];
            $certificate = $row['certificate'];
            $release_date = $row['release_date'];
            $runtime = $row['runtime'];
            $poster = $row['poster'];
            ?>
            
            <div id='movie_left'><img src='<?php echo $poster ?>'></div>
            
            <div id='movie_right'>
            <?php
            echo "<span id='name'>".$name."</span><span id='movie_info'>".$language."  &nbsp;|&nbsp;  ".$genre."  &nbsp;|&nbsp;  ".$certificate."<br>Release Date: ".$release_date."<br>Runtime: ".$runtime." mins </span>";
            ?>
            
            <div id='clear'></div>
            <div id='shows'>
                <br>
                <?php 
                $query = "SELECT * FROM movie_show WHERE movie_id = $movie_id order by date,time";
                $result = $conn->query($query);

                $date = '1st Jan, 0000';
                
                while($row = mysqli_fetch_assoc($result))
                {
                    $temp_date = $row['date'];
                    $temp_query = "SELECT DATE_FORMAT(\"$temp_date\", \"%D %b, %a\") AS date";
                    $temp_result = $conn->query($temp_query);
                    $temp_row = mysqli_fetch_assoc($temp_result);
                    $temp_date = $temp_row['date'];

                    if($temp_date != $date)
                    {
                        echo "<span id='date'>$temp_date</span>";
                        $date = $temp_date;
                    }
                    $temp_time = $row['time'];
                    $temp_query = "SELECT TIME_FORMAT(\"$temp_time\", \"%h:%i %p\") AS time";
                    $temp_result = $conn->query($temp_query);
                    $temp_row = mysqli_fetch_assoc($temp_result);
                    $time = $temp_row['time'];

                    echo "<button class='show' id=".$row['id']." onclick='getShowTime(this.id)'>".$time."</button>";
                }
                ?>
            </div>
            </div>
            <form id='showForm' method='post' action='http://localhost/handkerchief/screenpage.php'>
                <input type="text" name='showInput' id='showInput' style='display:none'>
            </form>
        </div>
        
        <script>
        	function getShowTime(showTime)
        	{
        		document.getElementById('showInput').value = showTime;
                document.getElementById('showForm').submit();
        	}
        </script>
	</body>
</html>