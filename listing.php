<p>listing materiel</p>

<?php

	$allKits = getAllKits();
	while($kit = mysql_fetch_object($allKits)) {

		echo ($kit-> label);
		echo ($kit-> ID_Kit);

		$materiaux = getItemFromKit($kit-> ID_Kit);

		while($matos = mysql_fetch_object($materiaux)) {
			echo ($matos-> label);
			echo ($matos-> description);
			echo ($matos-> brand);
			echo ($matos-> model);
		}
	}

?>