<? php
	error_reporting(E_ALL ^ E_NOTICE);
	ini_set('session.use_only_cookies', '1');
	session_start();
	if( isset($_SESSION['user_id']))
		echo "Welcome: " . $_SESSION['user_id'];
	else 
		echo "Enter Valid Credentials " . $_SESSION['user_id'];
?>
<DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ABC University</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>

<nav class="navbar navbar-expand-lg bg-primary" data-bs-theme="dark" id="myNavbar">
  	<div class="container-fluid">
    	<a class="navbar-brand" href="#">ABC University</a>
    	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon"></span>
    	</button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      	<ul class="navbar-nav me-auto mb-2 mb-lg-0">
		  	<li class="nav-item">
        		<a class="nav-link active" aria-current="page" href="index.php">Home</a>
        	</li>
			<li class="nav-item">
				<a class="nav-link active" aria-current="page" href="calendar.php">Calendar & Enrollment</a>
        	</li>
		</ul>

		<u1 class="nav navbar-nav navbar-right">
		<?php
			if( isset($_SESSION['user_id']))
			{
				echo '<a href="profile.php"> Profile</a></li>&nbsp;';
				echo '<a href="Logout.php"> Logout</a></li>';
			}
			else
			{
				echo '<a href="login.php"> Login </a>&nbsp;';
				echo '<a href="register.php"> Registration </a>';
			}
		?>

		</u1>
    </div>
  </div>
</nav>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
<html>