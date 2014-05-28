<?php

	require_once('../conf/top.php');
	include('../all-variables.php');

	$q = null;
	
	// si on reçoit une donnée
	if(isset($_GET['q'])) {
		$q = htmlentities($_GET['q']); // protection
		$requete = getAllKitsByKeyword($q);

		while($label = mysql_fetch_object($requete)) {
			echo ($label-> label)."\n";
		}
	}
?>