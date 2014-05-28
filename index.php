<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="utf-8">
    <title>Materimac !</title>
    <meta name="description" content="IMAC location de materiel"/>
    <meta name="viewport" content="width=1000, initial-scale=1.0, maximum-scale=1.0">

    <!-- Loading Bootstrap -->
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Loading Flat UI -->
    <link href="css/flat-ui.css" rel="stylesheet">
    <link href="css/demo.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">

    <link rel="shortcut icon" href="images/favicon.ico">

  <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
      <![endif]-->
  </head>
  <body>
<div id="page">
  <div id="sticky-footer-wrap">
    <div class="site-main">
      <!--MAIN MENU-->
        <div class="col-xs-2 column" id="main-menu">
          <?php include 'mainMenu.php'; ?>
        </div>

        <!--Contenu principal de la page-->
        <div class="col-xs-7 column" id="main-content">
          <!-- mettre des conditions pour gérer les pages -->
          <?php include 'listing.php'; ?>
        </div>

        <!--liste du materiel à louer-->
        <div class="col-xs-3 column" id="rent-status">
          <?php include 'rentCart.php'; ?>
        </div>
        </div>
  </div>
</div>
    <footer>
      <p>@ 2014 Ingénieur IMAC - Site réalisé par des élèves</p>
    </footer>
  </div>
      <!-- Load JS here for greater good =============================-->
      <script src="js/jquery-1.8.3.min.js"></script>
      <script src="js/jquery-ui-1.10.3.custom.min.js"></script>
      <script src="js/jquery.ui.touch-punch.min.js"></script>
      <script src="js/bootstrap.min.js"></script>
      <script src="js/bootstrap-select.js"></script>
      <script src="js/bootstrap-switch.js"></script>
      <script src="js/flatui-checkbox.js"></script>
      <script src="js/flatui-radio.js"></script>
      <script src="js/jquery.tagsinput.js"></script>
      <script src="js/jquery.placeholder.js"></script>
      <script src="js/jquery.stacktable.js"></script>
      <script src="http://vjs.zencdn.net/4.3/video.js"></script>
      <script src="js/application.js"></script>
      <script src="js/main.js"></script>
    </body>
