<?
function create_cache()
{
	$file = "../inc/cache/mainmenu.php";
	$str = "<? \$menuarray = array();";
	$sql = db_query("SELECT * FROM mainmenu WHERE invisible = 0 ORDER BY showorder");
	while($r = db_fetch_assoc($sql))
	{
		$str .= " \$menuarray['".$r["link"]."'] = '".$r["title"]."';";
	}
	$str .= " ?>";
	unlink($file);
	file_put_contents($file,$str);
}
function after_insert($id)
{
	create_cache();
}
function after_update($id)
{
	create_cache();
}
?>