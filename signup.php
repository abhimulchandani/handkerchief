<html>
	<head>
		<meta charset="utf-8">
		<title>handkerchief</title>
		<link rel="stylesheet" type="text/css" href="main.css">
		<style>
		#button
		{
			border-radius: 6px;
		    color: #FFFFFF;
		    background-color: #1072d6;
		    transition: all 0.2s;
		    padding: 6px 20px;
		}
		
		#button:hover
		{
			opacity: 0.9;
		}
		</style>
	</head>

	<body>

<?php
include 'db.php';
session_start();

if(@$_POST["submit"]){
	
	$errors = "";
	
	$name = $_POST["name"];
	$email = $_POST["email"];
	$password = $_POST["password1"];
	$birth_date = $_POST["birth_date"];
	
	$f_name = filter_var($name, FILTER_SANITIZE_STRING);
	$f_email = filter_var($email, FILTER_SANITIZE_EMAIL);
	
	$f_name = mysqli_real_escape_string($conn, $f_name);
	$f_email = mysqli_real_escape_string($conn, $f_email);
	$f_password= md5($password);
	
	$query = "SELECT * FROM user WHERE email='$f_email'";
	$result = mysqli_query($conn, $query);
	
	if(mysqli_num_rows($result) != 0) {
		$errors .= "<p>The entered email id is already used</p>";
	}
	else {
		$query = "INSERT INTO user (name, email, password, birth_date) VALUES ('$f_name', '$f_email', '$f_password', '$birth_date')";
		if(mysqli_query($conn, $query)) {
			header('location:login.php');
		}
		else {
			echo "<p><strong>ERROR: Unable to execute $query: ".mysqli_error($conn)."</strong></p>";
		}
	}
	
}

$username = @$_SESSION["username"];

if(@$username) {
	header('location:'.$_SESSION["url"]);
}

?>

		<div id="header">
			
			<div id="logo">
				<a href="index.php">handkerchief</a>
			</div>
		</div>

		<div id="main">

			<form method="post" onsubmit="return validatePassword()">
				<h3>Create a new account</h3>

				<label for="name">Name:&nbsp;</label>
				<input type="text" name="name" value="<?php echo @$name ?>" id="name" size="25px" pattern="[A-Za-z ]{1,40}" required>&nbsp;&nbsp;<br><br>
				
				<label for="email">Email Id:&nbsp;</label>
				<input type="email" name="email" value="<?php echo @$email ?>" id="email" size="30px" required><br><br>

				<label for="birth_date">Birth Date:&nbsp;</label>
				<input type="date" id="birth_date" name="birth_date" placeholder="YYYY-MM-DD" required pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}"><br><br>				

				<label for="password1">Set up a password:&nbsp;</label>
				<input type="password" name="password1" value="<?php echo @$password ?>" id="password1" size="18px" required>&nbsp;&nbsp;<br><br>
				
				<label for="password2">Retype password:&nbsp;</label>
				<input type="password" name="password2" value="<?php echo @$password ?>" id="password2" size="18px" required>&nbsp;&nbsp;<br><br>
				
				<input type="submit" id="button" name="submit" value="Sign up">
				<span class="error"><?php echo @$errors; ?></span>
				<span class="error" id="error" ></span>
			</form>

		</div>

		<div class="clear"></div>
		<div id="footer"></div>

		<script>
			function validatePassword()
			{
				password1 = document.getElementById("password1").value;
				password2 = document.getElementById("password2").value;
				
				reg1 = /\d{1}/;
				reg2 = /[A-Z]{1}/;
				reg3 = /[~`!@#$%^&*?.,<>:;()+={}|-]{1}/;
				//Following characters not allowed _[]\"
				
				if(password1.length < 8 | !reg1.test(password1) | !reg2.test(password1) | !reg3.test(password1))
				{
					document.getElementById("error").innerHTML = "<p>Password must be 8 characters long and it must have an upper case, a numeric and a special character</p>";	
					return false;
				}
				
				else if(password1 != password2)
				{
					document.getElementById("error").innerHTML = "<p>Passwords do not match</p>";	
					return false;
				}
				else
				{	
					document.getElementById("error").innerHTML = "";
					return true;
				}
			}
		</script>

	</body>

</html>
