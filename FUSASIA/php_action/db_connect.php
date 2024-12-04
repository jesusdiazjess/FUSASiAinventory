<?php 	

$localhost = "localhost";
$dbname = "database";
$username = "root";
$password = "";

$store_url = "http://localhost/htdocs/FUSASIA/";
// db connection
$connect = new mysqli($localhost, $username, $password, $dbname);
// check connection
if($connect->connect_error) {
  die("Connection Failed : " . $connect->connect_error);
} else {
  // echo "Successfully connected";
}

?>