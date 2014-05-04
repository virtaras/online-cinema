<?
$title = "Колумнисты";
function get_content()
{
$sql = mysql_query("SELECT blogs.id,title,DATE_FORMAT(ndate,'%m.%d.%Y') as item_date,CONCAT(siteusers.r47,' ',siteusers.r46,' ',siteusers.r48) as username,userid,info FROM blogs 
LEFT JOIN siteusers ON siteusers.id = blogs .userid
ORDER BY ndate DESC");
while($r = mysql_fetch_assoc($sql))
{
		?>
			<table width="100%">
			<tr>
				<td width="85">
					<?
					$imid = execute_scalar("SELECT id FROM images WHERE source = 21 AND parentid = '".$r["userid"]."'");
					?>
					<a href="<?=_SITE?>user/<?=$r["userid"]?>.html"><img alt="<?=$r["fio"]?>" src="<? echo _SITE."images/w/70/$imid.jpg"; ?>" /></a>
				</td>
				<td>
					<div><?=$r["item_date"]?>&nbsp;&nbsp;<a href="/user/<?=$r["userid"]?>.html"><?=$r["username"]?></a></div>
					<div><strong><a href="/blog/<?=$r["id"]?>.html"><?=$r["title"]?></a></strong></div>
					<div style="margin-top:7px;">
						<?=maxsite_str_word(strip_tags(htmlspecialchars_decode($r["info"])), 30)?>&nbsp;...
					</div>
					<div><a href="/blog/<?=$r["id"]?>.html">Читать полность</a></div>
				</td>	
			</tr>
			</table>
			<br />
		<?
	}
	
}

?>
