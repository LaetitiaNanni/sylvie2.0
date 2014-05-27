<?php

require_once 'settings.php';
require_once 'functions.php';


connectDb();
/*session_start();
$session=0;

if(isset($_GET["logout"])) {
	if($_GET["logout"] == 1) {
		session_destroy();
		$session=0;
		header('Location: p_accueil.php'); 
	}
}
if(isset($_SESSION['status'])) {
	$session=1;
	// session d'admin
	if($_SESSION['status']==1) {
		$session=2;
	}
*/
?>


