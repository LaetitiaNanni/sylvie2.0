<?php
require('PDFGen/fpdf.php');
require('conf/top.php');

//var temp
$id_user=1;
$id_loan=3;

function getAllDataByIdUser($id_user) {
		$sql = 'SELECT * FROM user WHERE user.ID_User = '.$id_user;
		// on envoie la requête à la base de données 
    	$result = mysql_query($sql);
    	return $result;
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

$pdf = new FPDF();

$pdf->SetFont('Arial','',14);

$pdf->AddPage();
$pdf->Cell(95,10,'');
$pdf->Image('PDFGen/logo.png',50,10,25);
$pdf->SetFont('Arial','B',14);
$chaine="Fiche prêt de matériel";
$chaine=utf8_decode($chaine);
$pdf->Cell(80,40,$chaine);
$pdf->SetFont('Arial','',14);

$pdf->Cell(95,50,'',0);
$pdf->Ln();
$pdf->Cell(95,7,'',1);
$pdf->Cell(95,7,'',1);
$pdf->Ln();

$pdf->Cell(95,7,'',1);
$pdf->Cell(95,7,'',1);
$pdf->Ln();

$pdf->Cell(95,7,'',1);
$pdf->Cell(95,7,'',1);
$pdf->Ln();

$pdf->Cell(95,35,'',1);
$pdf->Cell(95,35,'',1);
$pdf->Ln();

$pdf->Cell(95,7,'',1);
$pdf->Cell(95,7,'',1);
$pdf->Ln();

$pdf->Cell(95,14,'',1);
$pdf->Cell(95,14,'',1);
$pdf->Ln();

$pdf->Cell(95,7,'',1);
$pdf->Cell(95,7,'',1);
$pdf->Ln();

$pdf->Cell(95,7,'',1);
$pdf->Cell(95,7,'',1);
$pdf->Ln();

$pdf->Cell(95,7,'',1);
$pdf->Cell(95,7,'',1);
$pdf->Ln();


$pdf->Cell(95,47,'',1);
$pdf->Cell(95,47,'',1);
$pdf->Ln();

$pdf->Cell(95,23,'',1);
$pdf->Cell(95,23,'',1);
$pdf->Ln();


$pdf->Cell(95,23,'',1);
$pdf->Cell(95,23,'',1);
$pdf->Ln();

$pdf->Cell(95,23,'',1);
$pdf->Cell(95,23,'',1);
$pdf->Ln();



$pdf->SetXY(10,60);

$pdf->Cell(95,7,'Nom de l\'emprunteur',0);
$pdf->Ln();

$chaine="Prénom de l'emprunteur";
$chaine=utf8_decode($chaine);

$pdf->Cell(95,7,$chaine,0);
$pdf->Ln();

$chaine="Adresse électronique";
$chaine=utf8_decode($chaine);

$pdf->Cell(95,7,$chaine,0);
$pdf->Ln();

$chaine="Nom de tous les utilisateurs lors du prêt";
$chaine=utf8_decode($chaine);

$pdf->Cell(95,35,$chaine,0);
$pdf->Ln();

$chaine="Année (IMAC 1, IMAC 2 ou IMAC 3)";
$chaine=utf8_decode($chaine);

$pdf->Cell(95,7,$chaine,0);
$pdf->Ln();

$pdf->MultiCell(95,7,'Nom de l\'enseignant responsable du projet/cours',0);

$pdf->Cell(95,7,'Nom du projet ou du cours',0);
$pdf->Ln();

$pdf->Cell(95,7,'Date et heure d\'emprunt',0);
$pdf->Ln();

$pdf->Cell(95,7,'Date et heure de retour',0);
$pdf->Ln();

$chaine="Matériel emprunté";
$chaine=utf8_decode($chaine);

$pdf->Cell(95,47,$chaine,0);
$pdf->Ln();

$chaine="Signature de l'enseignant responsable ou du responsable d'année";
$chaine=utf8_decode($chaine);

$pdf->MultiCell(95,12,$chaine,0);

$chaine="Signature de l'étudiant emprunteur à la réception du matériel (avec date et heure)";
$chaine=utf8_decode($chaine);

$pdf->MultiCell(95,11,$chaine,0);

$chaine="Signature de l'étudiant emprunteur au retour du matériel (avec date et heure)";
$chaine=utf8_decode($chaine);

$pdf->MultiCell(95,10,$chaine,0);

$results_user=getAllDataByIdUser($id_user);
while($data = mysql_fetch_array($results_user))
{
	$lastname=$data['lastname'];
	$firstname=$data['firstname'];
	$mail=$data['e_mail'];
	$grade=$data['grade'];
}	

$results_loan=getUserByIdLoan($id_loan);
while($data = mysql_fetch_array($results_loan))
{
	$tutor=$data['tutor'];
	$project_name=$data['project_name'];
	$loan_date=$data['loan_date'];
	$due_date=$data['due_date'];
	$collaborators=$data['collaborators'];
}	

$pdf->SetXY(105,60);

$lastname=utf8_decode($lastname); 
$pdf->MultiCell(95,7,$lastname,0); //nom
$pdf->Cell(95,7,'',0);

$firstname=utf8_decode($firstname); 
$pdf->MultiCell(96,7,$firstname,0); //prenom
$pdf->Cell(95,7,'',0);

$mail=utf8_decode($mail); 
$pdf->MultiCell(95,7,$mail,0);// mail
$pdf->Cell(95,35,'',0);

$collaborators=utf8_decode($collaborators); 
$pdf->MultiCell(95,7,$collaborators,0);// Noms collabo

$pdf->SetXY(105,116);

$grade=utf8_decode($grade); 
$pdf->MultiCell(95,7,$grade,0);// année
$pdf->Cell(95,7,'',0);

$tutor=utf8_decode($tutor); 
$pdf->MultiCell(95,7,$tutor,0);// nom enseignant
$pdf->Cell(95,7,'',0);

$pdf->SetXY(105,137);

$project_name=utf8_decode($project_name); 
$pdf->MultiCell(95,7,$project_name,0);// nom projet
$pdf->Cell(95,7,'',0);

$loan_date=utf8_decode($loan_date); 
$pdf->MultiCell(95,7,$loan_date,0);// loan date
$pdf->Cell(95,7,'',0);

$due_date=utf8_decode($due_date); 
$pdf->MultiCell(95,7,$due_date,0);// due date
$pdf->Cell(95,47,'',0);

$collaborators=utf8_decode($collaborators); 
$pdf->MultiCell(95,7,'dfsgsfdg gdsdsgdsg dgdgsdgf dsgfdg ijgoidjsgoi dgjoijodfsgj godj oigjoifdjgoidsfjg ',0);// matos emprunté
$pdf->Cell(95,12,'',0);

//ob_clean();
//$buffer = ob_get_clean();

$pdf->Output();
?>