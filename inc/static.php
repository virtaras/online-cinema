<?php
$_GET["id"] = !empty($_GET["id"]) ? $_GET["id"] : "index";
$currentpage = execute_row_assoc("SELECT pages.*,modules.path FROM pages 
LEFT JOIN modules ON modules.id = pages.script
WHERE pages.name = '$_GET[id]'");
$title = $currentpage["title"];
$description = $currentpage["description"];
$keywords = $currentpage["keywords"];
if($currentpage["id"] == "")
{
	header("HTTP/1.0 404 Not Found");
	header("HTTP/1.1 404 Not Found");
	header("Status: 404 Not Found");
	die(); 
}
function get_content()
{
	global $currentpage;
	$filename = _DIR."/inc/static/".$currentpage["id"].".inc";
	if(file_exists($filename))
	{	
		include($filename);
		if(file_exists($currentpage["path"]))
		{
			include($currentpage["path"]);
		}
		if($currentpage["formid"] != "0" && $currentpage["formid"] != "-1")
		{
			content("form",$currentpage["formid"]);
		}
	}
	else
	{
		
		echo "<p>Запрошенная Вами страница не найдена !</p>";
	
	}
}
?>