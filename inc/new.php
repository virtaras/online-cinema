<?
if(isset($_GET["rg"])){
	session_start();
	//ini_set("display_errors","On");
	header('Content-Type: text/html; charset=utf-8');
	require("constant.php");
	require("connection.php");
	require("global.php");
	require("emarket.php");
	require("protection.php");
	require(_DIR."virtaras/functions.php");
	foreach(array_keys($_POST) as $key){
		$_POST[$key] = mysql_real_escape_string($_POST[$key]);
	}
	?>
	<script language="JavaScript">
		function show_message(text){
			alert(text);
		}
	</script>
	<?
	$_POST["email"] = trim($_POST["email"]);
	$email = execute_scalar("SELECT count(*) FROM clients WHERE email = '$_POST[email]'");
	$r_email=$_POST["email"];
	$r_passw=$_POST["passw"];
	$r_repassw=$_POST["repassw"];
	$error_str="";
	if($email > 0){?>
		<script language="JavaScript">show_message('Email <?=$_POST["email"]?> уже есть в базе данных !');</script>
		<?exit();
	}else{
		if(!check_email($r_email)){?>
			<script language="JavaScript">show_message('Вы ввели некорректный E-mail адрес !'+'<?=$r_email?>');</script>
			<?exit();
		}
		if(strlen($r_passw) < 5){?>
			<script language="JavaScript">show_message('Длинна пароля меньше, чем 5 символов !');</script>
			<?exit();
		}
		if($r_passw!=$r_repassw){?>
			<script language="JavaScript">show_message('Поля пароль и повторите пароль не совпадают !');</script>
			<?exit();
		}
		
		$values = array();
		$fields = sql_arr("SELECT * FROM clients_fields WHERE in_register=1 ORDER BY showorder");
		foreach($fields as $field){
			if(isset($_POST[$field["code"]]))
				$values[]="`".$field["code"]."`='".$_POST[$field["code"]]."'";
			if(($field["isrequired"]==1) && ($_POST[$field["code"]]==""))
				$error_str.="Поле ".$field["title"]." обязательное! ";
		}
		if($error_str!=""){?>
			<script language="JavaScript">show_message("<?=$error_str?>");</script>
			<?exit();
		}
		mysql_query("INSERT INTO clients(create_date,email,passw,last_login,last_ip,confirmed) VALUES (now(),'".$_POST["email"]."','".md5(trim($_POST["passw"]))."',now(),'".$_SERVER["REMOTE_ADDR"]."',0)");
		$id = get_last_id("clients");
		$sql_upd="UPDATE clients SET ".implode(",",$values)." WHERE id=$id";
		if(count($values))
			mysql_query($sql_upd);
		$_SESSION["login_user"] = execute_row_assoc("SELECT * FROM clients WHERE id = $id");

		//Send mail
		/*
		$body = html2("registr_mail");
		$body = str_replace("@email",$r_email,$body);
		$body = str_replace("@passw",trim($r_passw),$body);
		$confirm_email="<br/><br/>Подтвердить E-mail можно <a href='http://".$_SERVER["HTTP_HOST"]."/confirm-email/".$confirmstr."'>здесь</a>";
		$body.=$confirm_email;
		send_mime_mail($_SERVER['HTTP_HOST'], "no_reply@".str_replace("www.","",$_SERVER['HTTP_HOST']), "",$r_email,"UTF-8", "UTF-8", "Уведомление о регистрации на сайте ".$_SERVER['HTTP_HOST'], $body );
		if(execute_scalar("SELECT count(*) FROM emailsdb WHERE email = '".$_POST["email"]."'") == 0)
		{
			mysql_query("INSERT INTO emailsdb (email) VALUES ('".$_POST["email"]."')");
		}
		*/
		?>
		<script language="JavaScript">
			window.parent.document.location.href = '<?=_SITE?>recomendation/';
		</script>
	<?} 
}
else
{
	$title = "Регистрация нового пользователя";
	function get_content()
	{
		include(_DIR._TEMPLATE."register.html");
	}
}
?>
