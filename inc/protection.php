<?php
foreach(array_keys($_GET) as $key)
{
	$_GET[$key] = str_ireplace(array("drop","delete","update","insert","select"),"",$_GET[$key]);
}
foreach(array_keys($_POST) as $key)
{
	$_POST[$key] = str_ireplace(array("drop","delete","update","insert","select"),"",$_POST[$key]);
}
?>
