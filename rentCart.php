<?php 
	require_once('conf/top.php');
	require_once('all-variables.php');
	echo "<h4>Mes commandes</h4>";
	
	if(isset($_GET['id']))
	{	
		$id_kit=$_GET['id'];
		if(isset($_GET['action']))
		{	
			$_SESSION['cart'][$id_kit]--;
		}
		else{
			$_SESSION['cart'][$id_kit]++;
		}
	}
	
	/*if(isset($_GET['action']))
	{
		$id_kit=$_GET['id_rem'];
		$_SESSION['cart'][$id_kit]--;
	}*/
	
	if(isset($_SESSION['cart']))
	{	
		foreach($_SESSION['cart'] as $id_kit => $quantity) {
			$result=getKitById($id_kit);
				
			while($data = mysql_fetch_object($result)) {		
				echo '<ul><li class="item"><div class="row"><div class="col-md-10">';
				echo "<p>$data->label</p>";
				echo "<p><small>$id_kit</small></p>";
				echo'</div>';
				echo'<nav class="col-md-2 cart_actions">
								<a href="?id='.$id_kit.'&action=remove" ><span class="fui-cross"></span></a>
							</nav>	
						</div>
					</li>';
			}
		}
	}
?>
</ul>
<a href="pdfGen.php">
<button class="btn btn-embossed btn-primary center-block">
  Louer ce materiel
</button>	
</a>
