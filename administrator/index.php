<?php 
  require_once('../conf/top.php');
  include('../all-variables.php');

  if (isset($_GET['action'])) {

    if($_GET['action']=="s")
      updateState("annule", $_GET['id']);

    if($_GET['action']=="r")
      updateState("refuse", $_GET['id']);


  }
 ?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Flat UI - Free Bootstrap Framework and Themes</title>
    <meta name="description" content="Flat UI Kit Free is a Twitter Bootstrap Framework design and Theme, this responsive framework includes a PSD and HTML version."/>

    <meta name="viewport" content="width=1000, initial-scale=1.0, maximum-scale=1.0">

    <!-- Loading Bootstrap -->
    <link href="../bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Loading Flat UI -->
    <link href="../css/flat-ui.css" rel="stylesheet">
    <link href="../css/admin.css" rel="stylesheet">

    <link rel="shortcut icon" href="../images/favicon.ico">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->

  </head>
  <body>
    <div class="col-xs-2 column" id="menu">
      <img src="../images/icons/svg/clipboard.svg" alt="Clipboard">
      <h4>Navigation</h4>
      <nav>
        <a href="#" class="actif"> > Les demandes emprunts</a>
        <a href="#"> > Les emprunts </a>
        <a href="#"> > Matériel disponible</a>
        <a href="#"> > Historique</a>
        <a href="#"> > Gestion du matériel</a>
        <a href="#"> > Gestions des adminstrateurs</a>
        <a href="#"> > Déconnexion</a>
      </nav>
    </div>
    <div class="col-xs-10 column" id="content">
      <h3>Liste des demandes d'emprunts</h3>
      <table>
        <tbody>
          <tr>
            <th>Eleve</th>
            <th>Nom du set</th>
            <th>Matériels</th>
            <th>Date d'emprunt</th>
            <th>Date de rendu</th>
            <th>Modifier</th>
            <th>Refuser</th>
          </tr>

          <?php 
                $rent = getAllWaitRent();
                if(mysql_num_rows($rent) == 0)
                  echo '<tr><td colspan="7">Aucune demande d\'emprunt de matériel</td></tr>';
                while($rents = mysql_fetch_object($rent)) {
                  echo "<tr>";
                    $user = getUserByIdLoan($rents-> ID_Loan);
                    $users = $infoRents = mysql_fetch_object($user);
                    echo "<td>".strtoupper ($users-> lastname). " ".($users-> firstname)."</td>";

                    echo "<td>";
                    $allMateriel = "";
                    $infoRent = getAllInfoRent($rents-> ID_Loan);
                    while($infoRents = mysql_fetch_object($infoRent)) {
                      echo "<span>".($infoRents-> label)."</span>";
                      $matos = getItemFromKit($infoRents-> ID_Kit);
                      while($mato = mysql_fetch_object($matos)) {
                        $allMateriel =  $allMateriel."<span>".($mato-> label)."</span>";
                      }
                    }
                    echo "</td>";
                    echo "<td>".$allMateriel."</td>";

                    echo "<td>".($rents-> loan_date)."</td>";
                    echo "<td>".($rents-> due_date)."</td>";
                    echo '<td><a href="#"><span class="fui-new"></span></a></td>';
                    echo '<td><a href="?action=r&id='.($rents-> ID_Loan).'"><span class="fui-cross"></span></a></td>';
                  echo "</tr>";
                }
              ?>

        </tbody>
      </table>
    </div>
    <div class="clear"></div>
    <footer>
      <p>@ 2014 Ingénieur IMAC - Site réalisé par des élèves</p>
    </footer>

    <!-- Load JS here for greater good =============================-->
    <script src="../js/jquery-1.8.3.min.js"></script>
    <script src="../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="../js/jquery.ui.touch-punch.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/bootstrap-select.js"></script>
    <script src="../js/bootstrap-switch.js"></script>
    <script src="../js/flatui-checkbox.js"></script>
    <script src="../js/flatui-radio.js"></script>
    <script src="../js/jquery.tagsinput.js"></script>
    <script src="../js/jquery.placeholder.js"></script>
    <script src="../js/jquery.stacktable.js"></script>
    <script src="http://vjs.zencdn.net/4.3/video.js"></script>
    <script src="../js/application.js"></script>
  </body>
</html>