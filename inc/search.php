<?
if(isset($_GET["type"]) && $_GET["type"]!=""){
	$type=mysql_real_escape_string($_GET["type"]);
	switch($type){
		default:
			if(file_exists(_DIR."inc/search/".$type.".php"))
				include _DIR."inc/search/".$type.".php";
			break;
	}
}
?>