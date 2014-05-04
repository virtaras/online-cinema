<?php
if(!isset($_GET["id"]))
{
	$_GET["id"] = "index";
}
if(!isset($_GET["content"]) && $_SERVER["REQUEST_URI"] != "/")
{
	$_GET["id"] = "";
}
if( substr($_GET["id"],strlen($_GET["id"])-1) == "/")
{
	//$_GET["id"] = substr($_GET["id"],0,strlen($_GET["id"])- 1);
}
 $sql_text = "SELECT content.*,modules.path,DATE_FORMAT(sdate,'%d.%m.%Y') as item_date FROM content
LEFT JOIN modules ON modules.id = content.script
WHERE content.url = '".trim($_GET["id"])."' OR content.url='".trim($_GET["url"])."'";
//echo $sql_text;
$head = execute_row_assoc($sql_text);
if($head["id"] == "")
{
	header("HTTP/1.0 404 Not Found");
	header("HTTP/1.1 404 Not Found");
	header("Status: 404 Not Found");
	
	 $sql_text = "SELECT content.*,modules.path,DATE_FORMAT(sdate,'%d.%m.%Y') as item_date FROM content
	LEFT JOIN modules ON modules.id = content.script
WHERE content.url = '404' ";

$head = execute_row_assoc($sql_text);
}
$parent = $head["parentid"];
$title = $head["title"] != "" ? $head["title"] : $head["name"];
$keywords = $head["keywords"];
$description = $head["description"];
$script = $head["script"];


function get_content()
{
    global $cr;
    global $head;
	//print_r($head);
	
	if($head["hide_content"] == "0")
	{
		echo htmlspecialchars_decode( $head["info"],ENT_QUOTES);
	}
	if($head["path"] != "" && file_exists(_DIR.$head["path"]))
    {
		include(_DIR.$head["path"]);
    }
    if( $head["formid"] > 0 )
    {
        content("form", $head["formid"]);
    }

	
	
}

?>
