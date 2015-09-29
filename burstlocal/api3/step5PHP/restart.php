<?php
	// remove all session variables
	session_unset(); 
	header("Location: step2.php");
	exit;
?>