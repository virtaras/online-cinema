<?
$head = execute_row_assoc("SELECT blogs.*,DATE_FORMAT(ndate,'%d.%m.%Y') as ndate,CONCAT(siteusers.r47,' ',siteusers.r46,' ',siteusers.r48) as username FROM blogs 
LEFT JOIN siteusers ON siteusers.id = blogs .userid
WHERE blogs.id = '".intval($_GET["id"])."'");
$title = $head["title"];
function get_content()
{
	global $head;
	if($head["ndate"] != "0000-00-00")
	{
		?>
		<p style="font-size:11px;"><?=$head["ndate"]?>
		<?
		if(trim($head["username"]) != "")
		{
			?>&nbsp;<a href="<?=_SITE?>user/<?=$head["userid"]?>.html"><?=$head["username"]?></a><?
		}
		?>
		</p>
		<?
	}
	echo htmlspecialchars_decode($head["info"]);
	$source = 0;
	$parentid = $head["id"];
	$imagesource = 30;

	include("comments.php");
}

?>
