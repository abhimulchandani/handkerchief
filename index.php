<html>
<head>
    <meta charset="utf-8">
	<title>handkerchief</title>
	<link rel="stylesheet" type="text/css" href="main.css">
	<style>
        .movie
        {
            width: 240px;
            float: left;
            margin: 10px 0px;
            margin-right: 20px;
            cursor: pointer;
        }

        .movie img
        {
            width: 240px;
            height: 340px;
        }

        .movie a:hover
        {
            opacity: 0.9;
        }    
    </style>
    
</head>

<body>
	<div id="header">
		<div id="logo">
	        <a href="http://localhost/handkerchief/index.php">handkerchief</a>
	    </div>
	</div>

<?php include 'db.php' ?>
	
    <div id="main">
        
        <?php 
        $sql = "SELECT * FROM movie";
        $result = $conn->query($sql);
    
        while($row = mysqli_fetch_assoc($result))
        {
            echo "<div class='movie' id='".$row['id']."' onclick='getMovieId(this.id)'><img src='".$row['poster']."'></div>";
        }
        mysqli_close($conn);
        ?>
		
        <form id='movieForm' method='post' action='http://localhost/handkerchief/moviepage.php'>
			<input type="text" name='movieInput' id='movieInput' style='display:none'>
		</form>
	</div>	
	
	<div class="clear"></div>
	</div>
	<div id="footer"></div>

	<script>
		function getMovieId(movieId)
		{
            document.getElementById('movieInput').value = movieId;
            document.getElementById('movieForm').submit();
        }
	</script>
</body>

</html>