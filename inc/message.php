<?
$head = execute_row_assoc("SELECT messages.*,CONCAT(siteusers.r48,' ',siteusers.r47,' ',siteusers.r48) as name,DATE_FORMAT(messages.create_date,'%d.%m.%Y %H:%i:%s') as mdate FROM messages 
INNER JOIN siteusers ON siteusers.id = messages.user_form WHERE messages.id = '".intval($_GET["id"])."'");
$title = $head["subject"];
function get_content()
{
	global $head;
	$imid = execute_scalar("SELECT id FROM images WHERE source = 21 AND parentid = '".$head["user_form"]."'");
	$src = _TEMPL."images/nouserpic.jpg";
	if($imid != "")
	{
		$src = _SITE."images/50/$imid.jpg";
	}
	mysql_query("UPDATE messages SET isread = 1 WHERE id = '".$head["id"]."'");
	?>
	<table width="100%">
		<tr>
			<td style="width:100px;vertical-align:top;text-align:center;"><img alt="" src="<?=$src?>" />
				<br /><br />
				<div><label style="font-size:11px;" ><?=$head["mdate"]?></label></div>
				<br />
				<div><a style="font-size:11px;" href="<?=_SITE?>user/<?=$head["user_form"]?>.html"><?=$head["name"]?></a></div>
			</td>
			<td style="padding-left:10px;vertical-align:top;"><?=htmlspecialchars_decode($head["info"])?></td>
		</tr>
	</table>
	<? if($head["user_form"] != $_SESSION["login_user"]["id"]) { ?>
	<hr />
	<?
	
		$_GET["id"] = $head["user_form"];
		$object_action = "send_msg";
		$object_name = "userid";
		include("msgform.php");
		?>
		<script language="JavaScript" type="text/javascript">$("#message_body").show(); createEditor("msg_body");</script>
		<?
	}
	
	
}
?>