<?
session_start();
ini_set("display_errors","On");
include $_SERVER["DOCUMENT_ROOT"]."//inc/protection.php";
include $_SERVER["DOCUMENT_ROOT"]."//inc/constant.php";
include $_SERVER["DOCUMENT_ROOT"]."//inc/connection.php";
include $_SERVER["DOCUMENT_ROOT"]."//inc/global.php";
include $_SERVER["DOCUMENT_ROOT"]."//inc/engine.php";
include $_SERVER["DOCUMENT_ROOT"]."//virtaras/functions.php";
if(isset($_POST["action"])){
	switch($_POST["action"]){
	
		case "addToBasket":
			$values=prep_arr($_POST);
			$id=$values["id"];
			$quantity=max((int)($values["quantity"]),1);
			$params=$values["params"];
			echo addToBasket($id,$quantity,$params);
			break;
			
		case "removeFromBasket":
			$values=prep_arr($_POST);
			$id=$values["id"];
			echo removeFromBasket($id);
			break;
			
		case "setSessionKeyValue":
			$post=prep_arr($_POST);
			$key=$post["key"];
			$value=$post["value"];
			$_SESSION[$key]=$value;
			echo $value;
			break;
			
		case "clear_basket":
			$empty=array();
			$_SESSION["basket"]=serialize($empty);
			setcookie("basket",$_SESSION["basket"],(time()-60*60*24*30),"/");
			echo "Корзина очищена!";
			break;
			
	}
}
?>