<div id="logo_qr">
	<img class="img-responsive" alt="logo QR" src="images/logo_qr.png"></img>
	
</div>
<div id="calendarStart" class="calendarSearch">
    <label>Date de début :</label>
    <input id="dateDebut" name="dateDebut" type="text" />
</div>
<div id="calendarStop" class="calendarSearch">
    <label>Date de fin :</label>
    <input id="dateFin" name="dateFin" type="text" />
</div>
<nav>
<?php
    require_once('conf/top.php');
    require_once('all-variables.php');

    $allCat = getAllCategories();
    $allSubCat = null;

    while($cat = mysql_fetch_object($allCat)) {
        echo '<a href="#">'; 
            echo "<span class=\"fui-arrow-right\"></span> $cat->label";
            $allSubCat = getAllSubCategoriesById($cat->ID_Category);
            echo '<nav class="menu-sub">';
                while($subCat = mysql_fetch_object($allSubCat)) {
                   echo "<a href=\"#\"> $subCat->label</a>";  
                }
            echo '</nav>';
        echo '</a>';    
    }
?>
</nav>
