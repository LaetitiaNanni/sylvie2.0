
<?php
	require_once('conf/top.php');
	require_once('all-variables.php');

	$allKits = getAllKits();
	while($kit = mysql_fetch_object($allKits)) {
		echo "<div class=\"col-md-6 item\">
				<div class=\"row\">
					<div class=\"col-xs-4\">
								<img src=\"http://fakeimg.pl/100/\">
					</div>				
		";
		echo "<div class=\"col-xs-8\">";
			echo ($kit-> label);
			echo ($kit-> ID_Kit);

			$materiaux = getItemFromKit($kit-> ID_Kit);
			echo "<ul>";
				while($matos = mysql_fetch_object($materiaux)) {
					
						echo ("<li>"+($matos-> label)+"</li>");
						echo ("<li>"+($matos-> brand)+"</li>");
						echo ("<li>"+($matos-> model)+"</li>");
					
				}
			echo "</ul>";
			echo '<a href="">Calendrier</a>';
			echo '<a href="">Ajouter à la liste</a>';
		echo "</div> </div> </div>";
	}

?>

