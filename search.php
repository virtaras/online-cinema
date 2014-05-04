<?php
session_start();
require("inc/constant.php");
require("inc/connection.php");
require("inc/global.php");
foreach(array_keys($_GET) as $key)
{
	$_GET[$key] = str_ireplace(array(".","drop","delete","update","insert","select","#"),"",$_GET[$key]);
}
foreach(array_keys($_POST) as $key)
{
	$_POST[$key] = str_ireplace(array(".","drop","delete","update","insert","select","#"),"",$_POST[$key]);
}
if(isset($_POST["stext"]))
{
	$_POST["stext"] = str_ireplace(array(".","drop","delete","update","insert","select","#","\\","/",":","%"),"",$_POST["stext"]);
	if(empty($_POST["stext"]))
	{
		header("Location: "._SITE); 
	}
	else
	{
		header("Location: search/".urlencode($_POST["stext"]).".html");
	}	
}
?>
