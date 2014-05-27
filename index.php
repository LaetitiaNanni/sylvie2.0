<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Materimac !</title>
    <meta name="description" content="Flat UI Kit Free is a Twitter Bootstrap Framework design and Theme, this responsive framework includes a PSD and HTML version."/>

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

  </body>
