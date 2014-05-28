<?php

	connectDb(); // Connection à la base de données

	/*************************************************************************
	*******************  Récupérer toutes les emprunts  **********************
	**************************************************************************/

	//Récupérer l'administrateur avec l'id
	function getAllRent() {
		$sql = 'SELECT * FROM loan';
		// on envoie la requête à la base de données 
    	$result = mysql_query($sql);
    	return $result;
		//$results = NULL ;
		// on utilise mysql_fetch_array pour ranger les résultats de la requête dans un tableau associatif
		/*while ($ligne = mysql_fetch_object($result)) {
			$results = $ligne;
		}
		return $results;*/
	}

	function getAllKits() {
		$sql = 'SELECT * FROM kit';
		// on envoie la requête à la base de données 
    	$result = mysql_query($sql);
    	return $result;
	}

	//Récupérer l'administrateur avec l'id
	function getAllRentNow() {
		$sql = 'SELECT * FROM loan
		WHERE loan.ID_State = 3
		OR loan.ID_State = 1';
		// on envoie la requête à la base de données 
    	$result = mysql_query($sql);
    	return $result;
		//$results = NULL ;
		// on utilise mysql_fetch_array pour ranger les résultats de la requête dans un tableau associatif
		/*while ($ligne = mysql_fetch_object($result)) {
			$results = $ligne;
		}
		return $results;*/
	}

	function getAllWaitRent() {
		$sql = 'SELECT * FROM loan
		WHERE loan.ID_State = 2';
		// on envoie la requête à la base de données 
    	$result = mysql_query($sql);
    	return $result;
		//$results = NULL ;
		// on utilise mysql_fetch_array pour ranger les résultats de la requête dans un tableau associatif
		/*while ($ligne = mysql_fetch_object($result)) {
			$results = $ligne;
		}
		return $results;*/
	}

	function getAllInfoRent($id_loan) {
		$sql = 'SELECT * FROM lending
				LEFT JOIN kit ON kit.ID_Kit = lending.ID_Kit
				WHERE lending.ID_Loan = '.$id_loan;
		// on envoie la requête à la base de données 
    	$result = mysql_query($sql);
    	return $result;
	}

	function getAllKitsByKeyword($keyword) {
		$sql = 'SELECT * FROM kit
		WHERE kit.label LIKE \'%'.mysql_real_escape_string($keyword).'%\'';
		// on envoie la requête à la base de données 
    	$result = mysql_query($sql);
    	return $result;
	}
	function getAllGategories() {
		$sql = 'SELECT * FROM category';
		// on envoie la requête à la base de données 
    	$result = mysql_query($sql);
    	return $result;
		//$results = NULL ;
		// on utilise mysql_fetch_array pour ranger les résultats de la requête dans un tableau associatif
		/*while ($ligne = mysql_fetch_object($result)) {
			$results = $ligne;
		}
		return $results;*/
	}
	function getAllSubCategories(§id_category) {
		$sql = 'SELECT * FROM type WHERE ID_Category='.§id_category;
		// on envoie la requête à la base de données 
    	$result = mysql_query($sql);
    	return $result;
		//$results = NULL ;
		// on utilise mysql_fetch_array pour ranger les résultats de la requête dans un tableau associatif
		/*while ($ligne = mysql_fetch_object($result)) {
			$results = $ligne;
		}
		return $results;*/
	}
	/*************************************************************************
	************  Récupérer tous les matos en fonction du kit  ***************
	**************************************************************************/

	//Récupérer l'administrateur avec l'id
	function getItemFromKit($id_kit) {
		$sql = 'SELECT * FROM item
				WHERE ID_Kit = '.$id_kit;
		// on envoie la requête à la base de données 
    	$result = mysql_query($sql);
    	return $result;
		//$results = NULL ;
		// on utilise mysql_fetch_array pour ranger les résultats de la requête dans un tableau associatif
		/*while ($ligne = mysql_fetch_object($result)) {
			$results = $ligne;
		}
		return $results;*/
	}


	function getUserByIdLoan($id_loan) {
		$sql = 'SELECT * FROM user
				LEFT JOIN lending ON lending.ID_User = user.ID_User
				LEFT JOIN loan ON lending.ID_Loan = loan.ID_Loan
				WHERE loan.ID_Loan = '.$id_loan;
		// on envoie la requête à la base de données 
    	$result = mysql_query($sql);
    	return $result;
	}


	function getNameState($id_state) {
		$sql = 'SELECT name_state FROM state
				WHERE state.ID_State = '.$id_state;
		// on envoie la requête à la base de données 
    	$result = mysql_query($sql);
    	$results = mysql_fetch_object($result);
    	return $results;
    }


	function updateState($state, $id_loan) {

		switch($state) {
			case "emprunte" : 
				$id_state = 1;
				break;

			case "en cours" : 
				$id_state = 2;
				break;

			case "valide" : 
				$id_state = 3;
				break;

			case "annule" : 
				$id_state = 4;
				break;

			case "refuse" : 
				$id_state = 5;
				break;

			case "retourne" : 
				$id_state = 6;
				break;
		}

		$sql = 'UPDATE loan
				SET loan.ID_State = '.$id_state.'
				WHERE loan.ID_Loan = '.$id_loan;
			if (!mysql_query($sql))
			{
				die('Error: ' . mysql_error());
				return 0;
			}
			return 1;
	}

?>