<div class="col-md-6 item">
	<div class="row">
		<div class="col-xs-4">
			<img src="http://fakeimg.pl/100/">
		</div>
		<div class="col-xs-8">
			<p>nom</p>
			<a href="">Calendrier</a>
			<a href="">Ajouter à la liste</a>

		</div>
	</div>
</div>
<div class="col-md-6 item">
	<div class="row">
		<div class="col-xs-4">
			<img src="http://fakeimg.pl/100/">
		</div>
		<div class="col-xs-8">
			<p>nom</p>
			<a href="">Calendrier</a>
		</div>
	</div>
</div>
<div class="col-md-6 item">
	<div class="row">
		<div class="col-xs-4">
			<img src="http://fakeimg.pl/100/">
		</div>
		<div class="col-xs-8">
			<p>nom</p>
			<a href="">Calendrier</a>
		</div>
	</div>
</div>
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

