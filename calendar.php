<html>

<head>
	<title> Calendrier - Test </title>
	<link href="css/calendar.css" rel="stylesheet">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
</head>

<body>
	<label>Date :</label><br />
	<input id="datedebut" name="dateFiltre" type="text" />

<script>

	$(document).ready(function() {
	    $(function(){
		 	$.datepicker.setDefaults(
		    	$.extend($.datepicker.regional['Fr'])
		 	);
		    $('#datedebut').datepicker({  
	            showOtherMonths: true,  
	            dayNamesMin: ['Dim', 'Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam'],  
	        });  

		});
	});
</script>

</body>

</html>