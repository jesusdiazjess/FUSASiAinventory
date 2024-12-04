<?php 
require_once 'php_action/core.php';
// REMOVE ALL SESSION VARIABLES
session_unset(); 
// DESTROY THE SESSION
session_destroy(); 
header('location:'.$FUSASIA.'index.php');	
?>