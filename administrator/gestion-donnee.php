<?php 
  require_once('../conf/top.php');
  include('../all-variables.php');

  if (isset($_GET['id'])) {

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
        <a href="#"> > Les demandes emprunts</a>
        <a href="#"> > Les emprunts </a>
        <a href="#"> > Matériel disponible</a>
        <a href="#"> > Historique</a>
        <a href="#" class="actif"> > Gestion du matériel</a>
        <a href="#"> > Gestions des adminstrateurs</a>
        <a href="#"> > Déconnexion</a>
      </nav>
    </div>
    <div class="col-xs-10 column" id="content">
      <h3>Ajouter un matériel</h3>
      
      <form id="form-add-matos" method="post" action="generate.php" >
        <div class="line-form">
            <label for="ref">Référence : </label>
            <input type="text" id="ref" name="ref" class="form-control" value="">
        </div>

        <div class="line-form">
            <label for="label">Nom du matériel : </label>
            <input type="text" id="label" name="label" class="form-control" value="">
        </div>

        <div class="line-form">
            <label for="kit">Appartient au set : </label>
            <input type="text" id="kit" name="kit" class="form-control" value="">
        </div>

        <div class="line-form">
            <label for="type">Appartient à la sous-catégorie : </label>
            <input type="text" id="type" name="type" class="form-control" value="">
        </div>

        <div class="line-form">
            <label for="description">Description : </label>
            <textarea class="form-control" name="description" ></textarea>
        </div>

        <div class="line-form">
            <label for="marque">Marque : </label>
            <select id="marque" name="marque" class="btn dropdown-toggle clearfix btn-primary">
              <?php
                 $brands = getAllBrand();
                 while($brand = mysql_fetch_object($brands)) {
                    echo "<option>".($brand-> label)."</option>";
                }
              ?>
            </select>
        </div>

        <div class="line-form">
            <label for="modele">Modèle : </label>
            <input type="text" id="modele" name="modele" class="form-control" value="">
        </div>

         <input type="submit" class="button" name="submit_add_matos" value="Ajouter le matériel" />

      </form>
    </div>
    <div class="clear"></div>
    <footer>
      <p>@ 2014 Ingénieur IMAC - Site réalisé par des élèves</p>
    </footer>

    <!-- Load JS here for greater good =============================-->
    <script src="../js/jquery-1.8.3.min.js"></script>
    <script src="../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="../js/jquery-1.8.3.min.js"></script>
    <script src="../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="../js/jquery.ui.touch-punch.min.js"></script>
    <script src="../js/jquery.autocomplete.js"></script>
    <script src="../js/autocomplete.js"></script> 
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
    <script src="../js/jquery.qrcode-0.7.0.min.js"></script>
    <script src="../js/qrcode-generator.js"></script>
    <script src="../js/autocomplete.js"></script>
 
  </body>
</html>