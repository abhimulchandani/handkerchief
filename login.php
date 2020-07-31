<html>
	<head>
		<meta charset="utf-8">
		<title>handkerchief</title>
		<link rel="stylesheet" type="text/css" href="main.css">
		<style>
			
		</style>
	</head>

	<body>

<?php
include 'db.php';
session_start();

if(@$_POST["submit"]){
	
	$errors = "";
	
	$email = $_POST["email"];
	$email = filter_var($email, FILTER_SANITIZE_EMAIL);
	$password = $_POST["password"];
	$password = md5($password);
	$email = mysqli_real_escape_string($conn, $email);
	
	$query = "SELECT * FROM user WHERE email='$email' AND password='$password'";
	$result = mysqli_query($conn, $query);
	
	if(mysqli_num_rows($result) == 0) {
		$errors .= "<p>Incorrect Email & Password combination</p>";
	}
	else {
		$row = mysqli_fetch_assoc($result);
		$_SESSION["username"] = $row["name"];
		$_SESSION["userid"] = $row["user_id"];
	}
	
}

$username = @$_SESSION["username"];

if(@$username) {
	header('location:'.$_SESSION["url"]);
}

?>

		<div id="header">
			
			<div id="logo">
				<a href="http://localhost/handkerchief/index.php">handkerchief</a>
			</div>
		</div>

		<div id="main">

			<form method="post">
				<h3>Login to your account</h3>

				<input type="email" placeholder="Email" value="<?php echo @$email ?>" name="email" id="email" size="28px" required>
				<input type="password" placeholder="Password" name="password" id="password" size="16px" required>
				<input type="submit" id="button" name="submit" value="Login">
				<span class="error"><?php echo @$errors; ?></span>
				<a href="http://localhost/handkerchief/signup.php">Don't have an account?</a>
			</form>

		</div>

		<div class="clear"></div>
		<div id="footer"></div>

		<script>
			
		</script>

	</body>

</html>