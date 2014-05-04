<?
if(isset($_GET["restore"]) || isset($_GET["login"]))
{
	session_start();
	ini_set("display_errors","On");
	require("constant.php");
	require("connection.php");
	require("global.php");
	header('Content-Type: text/html; charset=utf-8');
	
	if(isset($_GET["login"]))
	{
		$sql = mysql_query("SELECT * FROM siteusers WHERE email = '".htmlspecialchars($_POST["login_email"],ENT_QUOTES)."' AND passw = '".md5(trim($_POST["login_passw"]))."' AND isactive = 1");
		$row = mysql_fetch_assoc($sql);
		if($row["id"] == "")
		{
			?>
			<script language="JavaScript">
				function show_message(text)
				{
					window.parent.$("#info_block").attr("title","Регистрация");
					window.parent.$("#info_block").html(text);
					window.parent.$("#info_block").dialog("open");
				}
				show_message('Неверный логин или пароль !');
			</script>
			<?
		}
		else
		{
			$_SESSION["login_user"] = $row;
			if(isset($_POST["remember"]))
			{
				if(!setcookie("alttab",$row["passw"],(time()+60*60*24*30),"/"))
				{
				}
			}
			mysql_query("UPDATE siteusers SET last_login = now(), last_ip = '".$_SERVER["REMOTE_ADDR"]."' WHERE id = '$row[id]'" );
			?>
			<script language="JavaScript">
				window.parent.location.href = '<?=_SITE?>profile.html';
			</script>
			<?
		}
	}
	
}
?>