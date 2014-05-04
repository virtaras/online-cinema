<?php
if(isset($_GET["registr"]))
{
	session_start();
	header('Content-Type: text/html; charset=utf-8');
	require("constant.php");
	require("connection.php");
	require("global.php");
	require("protection.php");
	foreach(array_keys($_POST) as $key)
	{
		$_POST[$key] = str_ireplace("'","''",$_POST[$key]);
	}
	
	?>
	<script language="JavaScript">
		function show_message(text)
		{
			window.parent.$("#registration_info").html(text);
			window.parent.$("#registration_info").dialog("open");
		}
	</script>
	<?
	$_POST["email"] = trim($_POST["email"]);
	$email = execute_scalar("SELECT count(*) FROM clients WHERE email = '$_POST[email]'");
	
	if($email > 0)
	{
		?>
		<script language="JavaScript">show_message('Email <?=$_POST["email"]?> уже есть в базе данных !');</script>
		<?
		exit();
	}
	else
	{
		$array = array("email","passw","repassw");
		$title_array = array("email"=>"E-Mail","passw"=>"Пароль","repassw"=>"Повторите пароль");
		$varray = array();	
		$fsql = mysql_query("SELECT * FROM clients_fields ORDER BY showorder");
		while($f = mysql_fetch_assoc($fsql))
		{
			$varray[] = $f["code"];
			$title_array[$f["code"]] = $f["title"];
			if($f["isrequired"] == "1")
			{
				$array[] = $f["code"];
			}
		}
		$err_count = 0;
		foreach($array as $current)
		{
			if(empty($_POST[$current]))
			{
				$err_count++;
				?>
					<script language="JavaScript"> window.parent.$("#<?=$current?>").css('border-color',"red"); </script>
				<?
				
				
			}
		}
		if($err_count > 0)
		{
			?>
				<script language="JavaScript">show_message('Необходимо заполнить все обязательные поля !');window.parent.$("#email").css('border-color',"red");</script>
				<?
				exit();
		}
		if(!check_email($_POST["email"]))
		{
			?>
				<script language="JavaScript">show_message('Вы ввели некорректный E-mail адрес !');</script>
				<?
				exit();
		}
		if($_POST["passw"] != $_POST["repassw"])
		{
			?>
				<script language="JavaScript">show_message('Поля Пароль и Повторите пароль не совпадают !');</script>
				<?
			exit();
		}
		if(strlen($_POST["passw"]) < 5)
		{
			?>
				<script language="JavaScript">show_message('Длинна пароля меньше, чем 5 символов !');</script>
				<?
			exit();
		}
		include_once ('captcha/securimage/securimage.php');

		$securimage = new Securimage();
		$valid = $securimage->check($_POST['code']);
		if($valid)
		{
			$values = array();
			foreach($varray as $current)
			{
				array_push($values,"'".htmlspecialchars(strip_tags($_POST[$current]),ENT_QUOTES)."'");
			}
			mysql_query("INSERT INTO clients(create_date,email,passw,".implode(",",$varray).",last_login,last_ip) VALUE (now(),'".$_POST["email"]."','".md5(trim($_POST["passw"]))."',".implode(",",$values).",now(),'".$_SERVER["REMOTE_ADDR"]."')");
			
			$id = get_last_id("clients");
			
			$_SESSION["login_user"] = execute_row_assoc("SELECT * FROM clients WHERE id = $id");
			?>
			<script>
				window.parent.location = '<?=_SITE?>account.html';
			</script>
				<?
		}
		else
		{
			?>
			<script language="JavaScript">show_message("Вы ввели неправильный код картинки !");</script>
			<?
			exit();
		}
		

	}
}
else
{
	$title = "Регистрация нового пользователя";
	function get_content()
	{
		?>

		<iframe  name="registration" style="display:none;" ></iframe>
		<form method="post" action="<?=_SITE?>inc/new.php?registr" target="registration">
		<div class="new_title">Регистрация нового пользователя</div>
		<table cellspacing="0" class="rtable" cellpadding="2"  border="0">
				<tr>
					<td class="title2">E-Mail:</td>
					<td><input type="text" class="ibox" id="email" name="email" /></td><td>&nbsp;<sup style="color:red;">*</sup></td>
				</tr>
				<tr>
					<td class="title2">Пароль</td>
					<td><input type="password" class="ibox" id="passw" name="passw" />
					<div style="font-size:10px; color:#999999;">Длина минимум 5 символов.</div>
					</td><td>&nbsp;<sup style="color:red;">*</sup></td>
				</tr>
				<tr>
					<td class="title2">Повторите пароль</td>
					<td><input type="password" class="ibox" id="repassw" name="repassw" /></td><td>&nbsp;<sup style="color:red;">*</sup></td>
					<td></td>
				</tr>
				<?
			$fsql = mysql_query("SELECT * FROM clients_fields ORDER BY showorder");
			while($f = mysql_fetch_assoc($fsql))
			{
				echo "<tr>";
				if($f["fieldtype"] != "4")
				{
					?>
					<td><?=$f["title"]?></td>
					<td><input class="ibox" id="<?=$f["code"]?>" name="<?=$f["code"]?>" value="" style="width:300px;" type="text" /></td>
					<?
				}
				else
				{
				?>
				<td><?=$f["title"]?></td>
				<td >
				<textarea class="ibox" rows="5" style="width:300px;margin-top:3px;" id="<?=$f["code"]?>" name="<?=$f["code"]?>" ></textarea></td>
					<?
					} 
				?>
				<td>&nbsp;<? if($f["isrequired"] == "1") { ?><sup style="color:red;">*</sup><? } ?></td> <?
				echo "</tr>";
			}
			?>
				<tr>
					<td><img src="<?=_SITE?>inc/captcha/securimage/securimage_show.php?sid=<?php echo md5(uniqid(time())); ?>" id="captcha" align="absmiddle" />
					<img style="cursor:pointer;" onclick="document.getElementById('captcha').src = '<?=_SITE?>inc/captcha/securimage/securimage_show.php?' + Math.random(); return false" alt="" src="<?=_SITE?>inc/captcha/securimage/images/refresh.gif" />
					</td><td>Введите текст на картинке:
					<br /><input type="text" class="ibox" name="code" />&nbsp;<sup style="color:red;">*</sup>
				</td><td></td>
				</tr>
				<tr>
					<td></td>
					<td style="padding-top:20px;"><input type="submit" class="buttons" value="Регистрация" /></td><td></td>
				</tr>
				
			</table>
			<sup style="color:red;">*</sup>&nbsp;-&nbsp;поля обязательные для заполнения
			<br />
		</form>
		<p>Если Вы зарегистрированный пользователь - перейдите на <a href="<?=_SITE?>login.html">страницу входа</a>.</p>
		<div id="registration_info" title="Регистрация"></div>
		<script language="JavaScript" type="text/javascript">
		$("#registration_info").dialog({
			modal: true,
			autoOpen: false,
			minHeight:200,
			width:400,
			minWidth:400,
			buttons: {
				Ok: function() {
					$(this).dialog('close');
				}
			}
		});
		</script>
		<?	
		
		
	}
}
?>
