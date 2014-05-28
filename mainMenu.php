<div id="logo_qr">
	<img class="img-rounded img-responsive" alt="logo QR" src="images/logo_qr.jpg"></img>
	
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
