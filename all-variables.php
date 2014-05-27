<?php

	connectDb(); // Connection à la base de données

	/*************************************************************************
	*******************  Récupérer toutes les emprunts  **********************
	**************************************************************************/

	//Récupérer l'administrateur avec l'id
	function getAllRent() {
		$sql = 'SELECT * FROM lending
				INNER JOIN user ON user.ID_User = lending.ID_User
				INNER JOIN loan ON loan.ID_Loan = lending.ID_Loan
				INNER JOIN kit ON kit.ID_Kit = lending.ID_Kit';
		// on envoie la requête à la base de données 
    	$result = mysql_query($sql);
		$results = NULL ;
		// on utilise mysql_fetch_array pour ranger les résultats de la requête dans un tableau associatif
		while ($ligne = mysql_fetch_array($result)) {
			$results = $ligne;
		}
		return $results;
	}


?>