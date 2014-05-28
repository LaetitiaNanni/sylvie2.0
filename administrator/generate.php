<?php 
  require_once('../conf/top.php');
  include('../all-variables.php');

  $error = "";
  //if (isset($_POST['submit_add_matos'])) {
    if(isset($_POST["ref"]) && !empty($_POST["ref"]) &&isset($_POST["label"]) && !empty($_POST["label"]) && isset($_POST["kit"]) && !empty($_POST["kit"]) && isset($_POST["type"]) && !empty($_POST["type"]) && isset($_POST["marque"]) && !empty($_POST["marque"])){

      $kits = getAllKits();
      $id_Kit = 0;
      while($kit = mysql_fetch_object($kits)) {
        if($kit-> label) 
          $id_Kit = ($kit-> ID_Kit);
      }

      if($id_Kit!=0) {
        $types = getAllSubCategories();
        $id_Type = 0;
        while($type = mysql_fetch_object($types)) {
          if($type-> label) 
            //$booleanType = 1;
            $id_Type = ($type-> ID_Type);
        }

        if($id_Type != 0){

          $description = "";
          $model = "";
          $id_brand = 0;

          if(isset($_POST["modele"]) && !empty($_POST["modele"]))
            $model = $_POST["modele"];
          else
            $model = "none";

          if(isset($_POST["description"]) && !empty($_POST["description"]))
            $description = $_POST["description"];
          else
            $description = "none";

          $brands = getAllBrand();
          while($brand = mysql_fetch_object($brands)) {
            if(mysql_real_escape_string($_POST["marque"]) == mysql_real_escape_string($brand-> label))
              $id_brand = $brand-> ID_Brand;
          }

          $id_product = addMateriel($_POST["ref"], $_POST["label"], $description, $id_Kit, $id_Type, $model, $id_brand);
          echo $id_product;
        }
        else {
           $error += "Cette sous-catégorie n'existe pas. <br />";
        }
      }
      else
        $error += "Ce qui n'existe pas. <br />";
    }
    else 
      $error += "Erreur : il y a un champs vide.";
  ///}
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
      <?php 
        if($error != "") 
          echo '<div class="error">'.$error.'</div>';
      ?>
      <h3>Générer le QRCode</h3>
      
     <!-- /*************************************************************************
    
                            Code generation du QRCode

      **************************************************************************/-->

      <?php
        $qrcode_color = getColorFromProductId($id_product);
        $qrcode_color = $qrcode_color->Color;
      ?>

      <div id="qrcode-resources">
        <img class="logo-imac" style="display: none" src="../images/logo-imac.png" alt="" />

        <a href="#" target="_blank" title="Télécharger" id="qrcode-download">Télécharger le QRcode pour impression</a>
      </div>

      <form id="form-qrcode-gen" method="post" action="index.html">
        <input type="hidden" name="ID" id="f-qg-id" value="<?php echo $id_product ?>" />
        <input type="hidden" name="color" id="f-qg-color" value="<?php echo $qrcode_color ?>" />

        <select name="size" id="f-qg-size">
          <option value="100" selected>Petit</option>
          <option value="200">Moyen</option>
          <option value="300">Grand</option>
          <option value="400">Très grand</option>
        </select>
      </form>

      <div id="qrcode-buffer">
      </div>

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
