<?php 
require_once 'php_action/db_connect.php';
session_start();
if(isset($_SESSION['userId'])) {
	header('location:'.$FUSASIA.'dashboard.php');		
}

$errors = array();

if($_POST) {		

	$username = $_POST['username'];
	$password = $_POST['password'];

	if(empty($username) || empty($password)) {
		if($username == "") {
			$errors[] = "Username is required";
		} 

		if($password == "") {
			$errors[] = "Password is required";
		}
	} else {
		$sql = "SELECT * FROM users WHERE username = '$username'";
		$result = $connect->query($sql);

		if($result->num_rows == 1) {
			$password = md5($password);
			// exists
			$mainSql = "SELECT * FROM users WHERE username = '$username' AND password = '$password'";
			$mainResult = $connect->query($mainSql);

			if($mainResult->num_rows == 1) {
				$value = $mainResult->fetch_assoc();
				$user_id = $value['user_id'];

				// SET SESSION
				$_SESSION['userId'] = $user_id;

				header('location:'.$FUSASIA.'dashboard.php');	
			} else{
				
				$errors[] = "Incorrect username/password combination";
			} // /else
		} else {		
			$errors[] = "Username does not exists";		
		} // /else
	} // /else not empty username // password
	
} // /if $_POST
?>

<!DOCTYPE html>
<html>
<head>
	<title>FUSASiA Management System</title>
	<link rel="icon" type="image/png" href="images/favi.ico"> <!-- Adjust the path and type accordingly -->
    <!-- Alternatively, for .ico files -->
    <!-- <link rel="icon" type="image/x-icon" href="images/favicon.ico"> -->

	<!--EXTERNAL FUSASIS Libraries--><!--EXTERNAL FUSASIS Libraries--><!--EXTERNAL FUSASIS Libraries--><!--EXTERNAL FUSASIS Libraries-->
	<!-- bootstrap -->
		<link rel="stylesheet" href="assests/bootstrap/css/bootstrap.min.css">
	<!-- bootstrap theme-->
		<link rel="stylesheet" href="assests/bootstrap/css/bootstrap-theme.min.css">
	<!-- font awesome -->
		<link rel="stylesheet" href="assests/font-awesome/css/font-awesome.min.css">
	<!-- custom css -->
		<link rel="stylesheet" href="custom/css/custom.css">	
	<!-- jquery -->
		<script src="assests/jquery/jquery.min.js"></script>
	<!-- jquery ui -->  
	 <link rel="stylesheet" href="assests/jquery-ui/jquery-ui.min.css">
	 <script src="assests/jquery-ui/jquery-ui.min.js"></script>
	<!-- bootstrap js -->
	 <script src="assests/bootstrap/js/bootstrap.min.js"></script>
	 <!--EXTERNAL FUSASIS Libraries--><!--EXTERNAL FUSASIS Libraries--><!--EXTERNAL FUSASIS Libraries--><!--EXTERNAL FUSASIS Libraries-->




	 <style>
        html, body {
            height: 100%; /* Ensure full height */
            margin: 0; /* Remove default margin */
            display: flex; /* Use flexbox for centering */
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            background-size: cover; /* Cover the entire background */
            background-repeat: no-repeat; /* Do not repeat the image */
            background-position: center; /* Center the image */
            transition: background-image 1s ease-in-out; /* Transition effect */
        }

        .panel {
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent background for readability */
            width: 100%; /* Optional: full width */
            max-width: 500px; /* Set max width for the panel */
        }

		.panel-heading {
			text-align: center; /* Center the text */
		}

		.btn-blue {
    background-color: #007bff; /* Original background color (Bootstrap primary blue) */
    color: white; /* Original text color */
    transition: background-color 0.3s ease; /* Smooth transition for background color */
    border: none; /* Remove default border */
    padding: 10px 20px; /* Add padding for better appearance */
    border-radius: 5px; /* Optional: rounded corners */
}

.btn-blue:hover {
    background-color: #0056b3; /* Change to a darker blue on hover */
    color: white; /* Keep text color white */
}


        .center-button {
            text-align: center; /* Center the button */
        }

		.eye-icon {
            cursor: pointer; /* Change cursor to pointer for the eye icon */
            position: absolute; /* Position it over the input */
            right: 10px; /* Adjust right position */
            top: 50%; /* Center vertically */
            transform: translateY(-50%); /* Center it properly */
        }

        .input-group {
            position: relative; /* Make the input group relative for absolute positioning of the icon */
        }
    </style>

</head>

<body>
	<div class="container">
		<div class="row vertical">
			<div class="col-md-5 col-md-offset-4">
				<div class="panel panel-info">
				<div class="panel-heading">
                        <h3 class="panel-title">FUSASiA Inventory Ordering</h3>
                    </div>
					<div class="panel-body">

						<div class="messages">
							<?php if($errors) {
								foreach ($errors as $key => $value) {
									echo '<div class="alert alert-warning" role="alert">
									<i class="glyphicon glyphicon-exclamation-sign"></i>
									'.$value.'</div>';										
									}
								} ?>
						</div>

						<form class="form-horizontal" action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post" id="loginForm">
							<fieldset>
							  <div class="form-group">
									<label for="username" class="col-sm-2 control-label">Username</label>
									<div class="col-sm-10">
									  <input type="text" class="form-control" id="username" name="username" placeholder="Username" autocomplete="off" />
									</div>
								</div>
								<div class="form-group">
									<label for="password" class="col-sm-2 control-label">Password</label>
									<div class="col-sm-10">
									  <input type="password" class="form-control" id="password" name="password" placeholder="Password" autocomplete="off" />
									</div>
								</div>								
								<div class="form-group center-button"> <!-- Center button group -->
                                    <div class="col-sm-12"> <!-- Full width for centering -->
                                        <button type="submit" class="btn btn-blue"> <i class="glyphicon glyphicon-log-in"></i> LOG IN</button>
                                    </div>
                                </div>
							</fieldset>
						</form>
					</div>
					<!-- PANEL ID -->
				</div>
				<!-- PANEL-INFO -->
			</div>
			<!-- /col-md-4 -->
		</div>
		<!-- ROW VERTICAL -->
	</div>
	<!-- CONTAINER -->	


	<script>
        // Array of image URLs
        const images = [
            'images/serverside1.jpg',
            'images/serverside4.3.jpg',
            'images/serverside2.1.webp',
            'images/serverside5.jpg',
            'images/serverside7.webp'
        ];

        let currentIndex = 0;

        function changeBackground() {
            document.body.style.backgroundImage = `url(${images[currentIndex]})`;
            currentIndex = (currentIndex + 1) % images.length; // Cycle through the images
        }

        // Change the background every 5 seconds
        setInterval(changeBackground, 5000);
        
        // Initial background set
        changeBackground();
    </script>
</body>
</html>	