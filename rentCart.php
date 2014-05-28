
<?php

	$product_id = $_GET[id];	 //the product id from the URL 
	$action 	= $_GET[action]; //the action from the URL 

	//if there is an product_id and that product_id doesn't exist display an error message
	if($product_id && !productExists($product_id)) {
		die("Error. Product Doesn't Exist");
	}

	switch($action) {	//decide what to do	
	
		case "add":
			$_SESSION['cart'][$product_id]++; //add one to the quantity of the product with id $product_id 
		break;
		
		case "remove":
			$_SESSION['cart'][$product_id]--; //remove one from the quantity of the product with id $product_id 
			if($_SESSION['cart'][$product_id] == 0) unset($_SESSION['cart'][$product_id]); //if the quantity is zero, remove it completely (using the 'unset' function) - otherwise is will show zero, then -1, -2 etc when the user keeps removing items. 
		break;
		
		case "empty":
			unset($_SESSION['cart']); //unset the whole cart, i.e. empty the cart. 
		break;
	
	}
	
?>


<?php	

	if($_SESSION['cart']) {	//if the cart isn't empty
		//show the cart
		
		echo "<ul>";	//format the cart using a HTML table
		
			//iterate through the cart, the $product_id is the key and $quantity is the value
			foreach($_SESSION['cart'] as $product_id => $quantity) {	
			echo "<li class=\"item\">"	
				//get the name, description and price from the database - this will depend on your database implementation.
				//use sprintf to make sure that $product_id is inserted into the query as a number - to prevent SQL injection
				$sql = sprintf("SELECT name, description, price FROM php_shop_products WHERE id = %d;",
								$product_id); 
					
				$result = mysql_query($sql);
					
				//Only display the row if there is a product (though there should always be as we have already checked)
				if(mysql_num_rows($result) > 0) {
				
					list($name, $description, $price) = mysql_fetch_row($result);
				
					$line_cost = $price * $quantity;		//work out the line cost
				
					echo "<tr>";
						//show this information in table cells
						echo "<td align=\"center\">$name</td>";
						//along with a 'remove' link next to the quantity - which links to this page, but with an action of remove, and the id of the current product
						echo "<td align=\"center\">$quantity <a href=\"$_SERVER[PHP_SELF]?action=remove&id=$product_id\">X</a></td>";
						echo "<td align=\"center\">$line_cost</td>";
					
					echo "</tr>";
					
				}
			
			}
			

			
			//show the empty cart link - which links to this page, but with an action of empty. A simple bit of javascript in the onlick event of the link asks the user for confirmation
			
			echo "<li><a href=\"$_SERVER[PHP_SELF]?action=empty\" onclick=\"return confirm('Are you sure?');\">Empty Cart</a></li>";
					
		echo "</ul>";
		
		
	
	}else{
		//otherwise tell the user they have no items in their cart
		echo "You have no items in your shopping cart.";
		
	}
	
	//function to check if a product exists
	function productExists($product_id) {
			//use sprintf to make sure that $product_id is inserted into the query as a number - to prevent SQL injection
			$sql = sprintf("SELECT * FROM php_shop_products WHERE id = %d;",
							$product_id); 
				
			return mysql_num_rows(mysql_query($sql)) > 0;
	}
?>

<a href="products.php">Continue Shopping</a>


<?php

/*

products table:
	CREATE TABLE `products` (
		`id` INT NOT NULL AUTO_INCREMENT ,
		`name` VARCHAR( 255 ) NOT NULL ,
		`description` TEXT,
		`price` DOUBLE DEFAULT '0.00' NOT NULL ,
		PRIMARY KEY ( `id` )
	);

*/

?>
<h4>Mes commandes</h4>
<ul>
	<li class="item">
		<div class="row">
			<div class="col-md-10">
				<p>name</p>
				<p><small>Ref : 1424125</small></p>
			</div>
			<nav class="col-md-2 cart_actions">
				<a href=""><span class="fui-cross"></span></a>
			</nav>	
		</div>
	</li>
	<li class="item">
		<div class="row">
			<div class="col-md-10">
				<p>name</p>
				<p><small>Ref : 1424125</small></p>

			</div>
			<nav class="col-md-2 cart_actions">
				<a href=""><span class="fui-cross"></span></a>
			</nav>	
		</div>
	</li>
	<li class="item">
		<div class="row">
			<div class="col-md-10">
				<p>name</p>
				<p><small>Ref : 1424125</small></p>
			</div>
			<nav class="col-md-2 cart_actions">
				<a href=""><span class="fui-cross"></span></a>
			</nav>	
		</div>
	</li>
</ul>
<a href="pdfGen.php">
<button class="btn btn-embossed btn-primary center-block">
  Louer ce materiel
</button>	
</a>
