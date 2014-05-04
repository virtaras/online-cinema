<?
if(isset($_POST["action"]))
{
	session_start();
	ini_set("display_errors","On");
	require("constant.php");
	require("connection.php");
	require("global.php");
	header('Content-Type: text/html; charset=utf-8');
		?>
	<script language="JavaScript">
				function show_message(text)
				{
					window.parent.$("#info_block").attr("title","Регистрация");
					window.parent.$("#info_block").html(text);
					window.parent.$("#info_block").dialog("open");
					
				}
				show_message('Комментарий успешно добавлен !');
			</script>
	
	<?
	if(trim(strip_tags($_POST["comment"])) == "")
	{
		?>
		<script language="JavaScript">
		show_message('Необходимо написать комментарий !');
			</script>
		<?
		exit();
	}
	mysql_query("INSERT INTO comments(parentid,source,userid,create_date,info) VALUES ('$_POST[parent]','$_POST[source]','".$_SESSION["login_user"]["id"]."',now(),'".htmlspecialchars(str_replace("\r\n","<br />",strip_tags($_POST["comment"])),ENT_QUOTES)."')");
	send_mime_mail($_SERVER['HTTP_HOST'], "no_reply@".str_replace("www.","",$_SERVER['HTTP_HOST']), "",setting("contact_email"),"UTF-8", "UTF-8", "Добавлен новый комментарий", str_replace("\r\n","<br />",strip_tags($_POST["comment"])) );
?>
		<script language="JavaScript">
		show_message('Комментарий успешно добавлен !');
		window.parent.setTimeout("document.location = document.location.href;",1000);
			</script>
		<?
	
	
}
else
{
	if(isset($_SESSION["login_user"])) {
	?>
				<br /><br />
				<iframe name="comment_frame" style="display:none;"></iframe>
				<form method="post" target="comment_frame" action="<?=_SITE?>inc/comments.php">
				<input type="hidden" name="action" value="add_comment" />
				<input type="hidden" name="source" value="<?=$source?>" />
				<input type="hidden" name="parent" value="<?=$parentid?>" />
				<a name="addcomment"></a>
				<table cellspacing="0" cellpadding="2" border="0" class="formRegister">
					<tbody>
					<tr>
						<td height="40">Комментарий:</td>
						<td height="40">
						<textarea name="comment" id="comment" rows="7" style="width:400px;"></textarea>
						</td>
					</tr>
					<tr>
						<td height="40"></td>
						<td height="40"><input type="submit" value="Добавить комментарий"></td>
					</tr>
				</tbody></table>
				</form>
				<? } else { ?>
				<p>Для добавления комментария Вам необходимо <a href="/new.html">зарегистрироваться</a>.</p>
				<br />
				<? } ?>
				<a name="comments"></a>
	<?
	$sql = mysql_query("SELECT comments.*,CONCAT(siteusers.r48,' ',siteusers.r47,' ',siteusers.r46) as fio,DATE_FORMAT(comments.create_date,'%H:%i, %d.%m.%Y') as post_date FROM comments 
	LEFT JOIN siteusers ON siteusers.id = comments.userid
	WHERE comments.parentid = $parentid AND comments.source = $source 
	
	ORDER BY id DESC");
	while($r = mysql_fetch_assoc($sql))
	{
		$imid = execute_scalar("SELECT id FROM images WHERE source = 21 AND parentid = '".$r["userid"]."'");
		?>
		<table><tr>
		<td width="90">
			<?
			if($imid != "")
			{
				?>
				<a href="<?=_SITE?>user/<?=$r["userid"]?>.html"><img alt="<?=$r["fio"]?>" src="<? echo _SITE."images/w/70/$imid.jpg"; ?>" /></a>
				<?
			}
			?>
		</td>
		<td><div style="font-size:12px;">
		<a href="<?=_SITE?>user/<?=$r["userid"]?>.html"><?=$r["fio"]?></a>&nbsp;&nbsp;<?=$r["post_date"]?></div>
		<p style="font-size:12px;"><?=htmlspecialchars_decode($r["info"],ENT_QUOTES)?></p>
	
		</td>
		</tr></table>
		<div style="height:1px;border-top:1px dashed #7CBCDC;"></div>
			<br />
		<?
	}
}
?>