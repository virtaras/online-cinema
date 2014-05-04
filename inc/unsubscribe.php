<?
include("protection.php");
include("constant.php");
include("connection.php");
include("global.php");

$id = execute_scalar("SELECT id FROM subscriber WHERE code = '".$_GET["code"]."'");
if($id != "")
{
	mysql_query("UPDATE subscriber SET isactive = 0 WHERE id = $id");
	?>
	<p>Ваш E-Mail удален из рассылки !</p>
	<?
}

?>