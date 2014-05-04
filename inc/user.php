<?
$head = execute_row_assoc("SELECT * FROM siteusers WHERE id = '".intval($_GET["id"])."'");
$title = ($head["r48"] != "" ? $head["r48"]." " : "").$head["r47"]." ".$head["r46"];
function get_content()
{
	global $head;
	$imid = execute_scalar("SELECT id FROM images WHERE source = 21 AND parentid = '".$head["id"]."'");
	$src = "";
	if($imid != "")
	{
		$src = _SITE."images/200/$imid.jpg";
	}
	?>
	<table class="userinfo"><tr>
	<? if($imid != "") { ?>
	<td style="vertical-align: top;"><img  src="<?=$src?>" ></td>
	<? } ?>
	<td style="vertical-align: top;padding-left:10px;">
	<p>Организация:&nbsp;<?=$head["r50"]?></p>
	<p>Должность:&nbsp;<?=$head["r52"]?></p></td></tr></table>
	<br />
	<?=htmlspecialchars_decode($head["r55"])?>
	
	<br />
	<p><strong>Публикации автора</strong></p>
	<ul>
		<?
		$sql = mysql_query("SELECT urlname,name FROM content WHERE siteuser = ".$head["id"]." ORDER BY sdate DESC");
		while($r = mysql_fetch_assoc($sql))
		{
			?>
			<li><a href="<?=_SITE?>content/<?=$r["urlname"]?>.html"><?=$r["name"]?></a></li>
			<?
		}
		?>
	</ul>
	<?
	$sql = mysql_query("SELECT blogs.id,title,DATE_FORMAT(ndate,'%m.%d.%Y') as item_date,CONCAT(siteusers.r47,' ',siteusers.r46,' ',siteusers.r48) as username,userid,info FROM blogs 
LEFT JOIN siteusers ON siteusers.id = blogs .userid
WHERE blogs.userid = ".$head["id"]."
ORDER BY ndate DESC");
	if(mysql_num_rows($sql) > 0)
	{
		?>
		<p><strong>Блог</strong></p>
		<ul>
		<?
		while($r = mysql_fetch_assoc($sql))
		{
			?>
			<li><a href="<?=_SITE?>blog/<?=$r["id"]?>.html"><?=$r["title"]?></a></li>
			<?
		}
		?>
		</ul>
		<?
	}
}
