<?
session_start();
include("inc/protection.php");
include("inc/constant.php");
include("inc/connection.php");
include("inc/global.php");
function rm_subobjects_all($parentid,$imagesourceid)
{
	$sql = mysql_query("SELECT * FROM images WHERE parentid = $parentid AND source = $imagesourceid AND userid = ".$_SESSION["login_user"]["id"]);
	while($r = mysql_fetch_assoc($sql))
	{
		if(file_exists("images/files/".$r["image"]))
		{
			unlink("images/files/".$r["image"]);
		}
	}
	mysql_query("DELETE FROM images WHERE parentid = $parentid AND source = $imagesourceid AND userid = ".$_SESSION["login_user"]["id"]);
	
}
if(isset($_POST["action"]))
{
	header('Content-Type: text/javascript; charset=utf-8');
	switch($_POST["action"])
	{			
				case "show_profile":
					$row = execute_row_assoc("SELECT * FROM siteusers WHERE id = '".$_SESSION["login_user"]["id"]."'");
					?>
					<iframe style="display:none;"  name="save_account"></iframe>
					<form method="post" action="<?=_SITE?>ajax.php" enctype="multipart/form-data" target="save_account">
					<input type="hidden" name="action" value="save_profile" />
					<table cellspacing="0" class="formRegister" cellpadding="2"  border="0">
						<tr>
							<td height="40" >E-Mail:</td>
							<td><strong><?=$row["email"]?></strong>
							</td>
							<td></td>
						</tr>
					<?
			$fsql = mysql_query("SELECT * FROM siteusers_fields ORDER BY showorder");
			while($f = mysql_fetch_assoc($fsql))
			{
				echo "<tr>";
				if($f["fieldtype"] == "2")
				{
				?>
				<td height="40"><?=$f["title"]?>:</td>
				<td>
				<select class="ibox" name="<?=$f["code"]?>">
				<option value="">.....</option>
				<?
					$arr = explode(";",$f["items"]);
					foreach($arr as $current)
					{
						?>
						<option <?=($row[$f["code"]] == $current ? "selected='selected'" : "")?> value="<?=$current?>" ><?=$current?></option>
						<?
					}
					?></select></td><?
				}
				else if($f["fieldtype"] == "8")
				{
					?>
					<td height="40"><?=$f["title"]?>:</td>
					<td><input type="checkbox" <?=($row[$f["code"]] == "1" ? "checked='checked'" : "")?> name="<?=$f["code"]?>" id="<?=$f["code"]?>" /></td>
					<?
				}
				else
				{
				if($f["fieldtype"] != "4")
				{
					?>
					<td height="40"><?=$f["title"]?>:</td>
					<td height="40"><input size="40"  id="<?=$f["code"]?>" name="<?=$f["code"]?>" value="<?=htmlspecialchars_decode($row[$f["code"]],ENT_QUOTES)?>"  type="text" /></td>
					<?
				}
				else
				{
				?>
				<td><?=$f["title"]?>:</td>
				<td height="40">
				<textarea  rows="5" style="margin-top:3px;width:450px;" id="<?=$f["code"]?>" name="<?=$f["code"]?>" ><?=htmlspecialchars_decode($row[$f["code"]],ENT_QUOTES)?></textarea></td>
					<?
					} }
				?>
				<td height="40"></td> <?
				echo "</tr>";
			}
			?>	
						<tr>
							<td height="40" >Изображение:</td>
							<td>
							<?
							$imid = execute_scalar("SELECT id FROM images WHERE source = 21 AND parentid = '".$_SESSION["login_user"]["id"]."'");
							if($imid != "")
							{
								?>
								<p>
									<img alt="" src="<?=_SITE?>images/w/150/<?=$imid?>.jpg" />
								</p>
								<?
							}
							?>
							<input type="file" name="profileimage" /></td>
						</tr>
			
			<tr>
						<td height="40" ></td>
						<td height="40">
							<input type="submit" value="Сохранить изменения" />
						</td>
					</tr>
					</table>	
					<?
					break;
				case "save_profile":
					header('Content-Type: text/html; charset=utf-8');
					$values = array();
					$varray = array();
					$fsql = mysql_query("SELECT * FROM siteusers_fields ORDER BY showorder");
					while($f = mysql_fetch_assoc($fsql))
					{
						$varray[] = $f["code"];
						if($f["fieldtype"] == "8")
						{
							$cbarray[] = $f["code"];
						}
					}
					foreach($varray as $current)
					{
						if(in_array($current,$cbarray))
						{
							array_push($values,"$current = '".($_POST[$current] == "on" ? "1" : "0")."'");
						}
						else
						{
							if($current == "r55")
							{
								array_push($values,"$current = '".htmlspecialchars(stripslashes($_POST[$current]),ENT_QUOTES)."'");
							}
							else
							{
								array_push($values,"$current = '".htmlspecialchars(stripslashes(strip_tags($_POST[$current])),ENT_QUOTES)."'");
							}	
						}	
					}
					mysql_query("UPDATE siteusers SET 
			".implode(",",$values)."
			WHERE id = '".$_SESSION["login_user"]["id"]."'");
			
			if(isset($_FILES["profileimage"]) && $_FILES["profileimage"]["name"] != "")
			{
				$key = "profileimage";
				$uploaddir = "images/files/";
				$sourceid = 21;
				$parent = $_SESSION["login_user"]["id"];
				$_FILES[$key]['name'] = $sourceid."_".$parent.".jpg";
				$uploadfile = $uploaddir.basename($_FILES[$key]['name']);
				if(file_exists($uploadfile))
				{
					unlink($uploadfile);
				}
				move_uploaded_file($_FILES[$key]["tmp_name"],$uploadfile);
				$size = getimagesize($uploadfile);
				$width = $size[0];
				$height = $size[1];
				$format = strtolower(substr($size['mime'], strpos($size['mime'], '/')+1));
				mysql_query("INSERT INTO images (parentid,image,is_main,source,showorder,width,height,format,userid) VALUES ('".$parent."','".($_FILES[$key]['name'])."',1,'$sourceid','1','$width','$height','$format','".$_SESSION["login_user"]["id"]."')");	
			}
			
				$_SESSION["login_user"] = execute_row_assoc("SELECT * FROM siteusers WHERE id = ".$_SESSION["login_user"]["id"]);
				?>
				<script language="JavaScript">
					window.parent.show_html_message("Данные успешно сохранены ! <a href='javascript:void(0);' onclick='show_profile()' >Вернуться к редактированию</a>.");
				</script>
				<?
					break;
				case "show_password":
					$row = execute_row_assoc("SELECT * FROM siteusers WHERE id = '".$_SESSION["login_user"]["id"]."'");
					?>
					<iframe style="display:none;"  name="save_account"></iframe>
					<form method="post" action="<?=_SITE?>ajax.php" target="save_account">
					<input type="hidden" name="action" value="save_password" />
					<table cellspacing="0" class="formRegister" cellpadding="2"  border="0">
						<tr>
							<td height="40">E-Mail</td>
							<td><strong><?=$row["email"]?></strong></td>
						</tr>
						<tr>
							<td height="40">Новый пароль</td>
							<td><input class="ibox" size="40" name="newpassw" type="password" />
							<div style="font-size:10px;">Длина минимум 5 символов.</div>
							</td>
						</tr>
						<tr>
							<td  height="40">Повторите пароль</td>
							<td><input size="40"  name="renewpassw" type="password" /></td>
						</tr>
						<tr>
							<td height="40">Старый пароль</td>
							<td><input size="40"  name="oldpassw" type="password" /></td>
						</tr>
						<tr>
						<td height="40" ></td>
						<td height="40">
							<input type="submit" value="Сохранить изменения" />
						</td>
					</tr>
					</table>
					</form>
					<?
					break;
				case "save_password":
					header('Content-Type: text/html; charset=utf-8');
					?>
					<script language="JavaScript">
						function show_message(text)
						{
							window.parent.$("#info_block").attr("title","Изменение пароля");
							window.parent.$("#info_block").html(text);
							window.parent.$("#info_block").dialog("open");
						}
					</script>
					<?
					if(!empty($_POST["newpassw"]))
					{
						if(strlen($_POST["newpassw"]) < 5)
						{
							?>
								<script>show_message('Длинна пароля меньше, чем 5 символов !');</script>
								<?
							exit();
						}
						if($_POST["newpassw"] != $_POST["renewpassw"])
						{
							?>
								<script>show_message('Поля Новый пароль и Повторите пароль не совпадают !');</script>
							<?
							exit();
						}
						else
						{
							if(md5($_POST["oldpassw"]) != $_SESSION["login_user"]["passw"])
							{
								?>
								<script>show_message('Вы ввели неверный Старый пароль !');</script>
							<?
							exit();
							}
							else
							{
								mysql_query("UPDATE siteusers SET passw = '".md5($_POST["newpassw"])."' WHERE id = '".$_SESSION["login_user"]["id"]."'");
								
								$_SESSION["login_user"]["passw"] = md5($_POST["newpassw"]);
									?>
										<script>show_message('Данные успешно сохранены !');</script> 
									<?
									exit();
							}
						
						}
					}
					break;
				case "restore_password":
					header('Content-Type: text/html; charset=utf-8');
						?>
						<script language="JavaScript">
							function show_message(text)
							{
								window.parent.$("#info_block").attr("title","Восстановление пароля");
								window.parent.$("#info_block").html(text);
								window.parent.$("#info_block").dialog("open");
							}
						</script>
						<?
					$sql = mysql_query("SELECT * FROM siteusers WHERE email = '$_POST[remail]'");
					$row = mysql_fetch_assoc($sql);
					if($row["id"] == "")
					{
						?>
						<script>show_message('E-Mail не найден !');</script>
						<?
					}
					else
					{
						$newpassword = random_password(5,false,true) ;
						mysql_query("UPDATE siteusers SET passw = '".md5($newpassword)."' WHERE id = ".$row["id"]);
												
						send_mime_mail($_SERVER['HTTP_HOST'], "no_reply@".str_replace("www.","",$_SERVER['HTTP_HOST']), "",$row["email"], "UTF-8", "UTF-8", "Восстановление пароля на ".$_SERVER["SERVER_NAME"], "<p>Ваш новый пароль: $newpassword</p>" );
						?>
						<script>show_message('Пароль отправлен на Ваш E-Mail !');</script>
						<?
						
					}
					exit();
					break;
				case "edit_news":	
					
					$row = execute_row_assoc("SELECT *,DATE_FORMAT(sdate,'%d.%m.%Y') as dsdate FROM content WHERE siteuser = ".$_SESSION["login_user"]["id"]." AND id = $_POST[id]");
					if($_POST["type"] == "a")
					{
						$row = execute_row_assoc("SELECT *,title as name,DATE_FORMAT(start_date,'%d.%m.%Y') as sdate,DATE_FORMAT(finish_date,'%d.%m.%Y') as fdate FROM events WHERE userid = ".$_SESSION["login_user"]["id"]." AND id = $_POST[id]");
					}
					else
					{
						$row = execute_row_assoc("SELECT *,DATE_FORMAT(sdate,'%d.%m.%Y') as dsdate FROM content WHERE siteuser = ".$_SESSION["login_user"]["id"]." AND id = $_POST[id]");
					}
					$parentid = "";
					
					$action_name = $_POST["id"] > 0 ? "Редактировать" : "Добавить";
					
					switch($_POST["type"])
					{
						case "n":
							$parentid = $_SESSION["login_user"]["userregion"];
							if($parentid == 0)
							{
								$parentid = 4;
							}
							?>
							<div><h1><?=$action_name?> новость</h1></div>
							<?
							break;
						case "i":
							$parentid = 10;
							?>
							<div><h1><?=$action_name?> интервью</h1></div>
							<?
							break;	
						case "a":
							?>
							<div><h1><?=$action_name?> анонс</h1></div>
							<?
							break;	
					}
					?>					
					<iframe name="eventsFunc" style="display:none;"></iframe>
					<form method="post" enctype="multipart/form-data" target="eventsFunc" action="<?=_SITE?>ajax.php?action=news_save&id=<?=$_POST["id"]?>&parentid=<?=$parentid?>&type=<?=$_POST["type"]?>" >
					<input type="hidden" name="action" value="news_save" />
					<table class="formRegister" cellspacing="0" cellpadding="5" border="0">
						<? if($_POST["type"] != "a") { ?>
						<tr>
							<td>Дата:</td>
							<td><input type="text" value="<?=$row["dsdate"]?>" name="sdate" id="sdate" /></td>
						</tr>
						<? } else { ?>
						<tr>
							<td>Дата начала:</td>
							<td><input type="text" value="<?=$row["sdate"]?>" name="start_date" id="start_date" /></td>
						</tr>
						<tr>
							<td>Дата окончания:</td>
							<td><input type="text" value="<?=$row["fdate"]?>" name="finish_date" id="finish_date" /></td>
						</tr>
						<? } ?>
						<tr>
							<td>Наименование:</td>
							<td><input style="width:400px;" value="<?=htmlspecialchars_decode($row["name"],ENT_QUOTES)?>" type="text" id="name" name="name" /></td>
						</tr>
						<? if($_POST["type"] != "a") { ?>
						<tr>
							<td>Кратко:</td>
							<td><textarea rows="7" name="preview" id="preview" style="width:400px;"><?=htmlspecialchars_decode($row["preview"],ENT_QUOTES)?></textarea></td>
						</tr>
						<? } ?>
						<tr>
							<td>Текст:</td>
							<td><textarea rows="7" name="info" id="info" style="width:400px;"><?=htmlspecialchars_decode($row["info"],ENT_QUOTES)?></textarea></td>
						</tr>
							<tr>
							<td >Изображения:</td>
							<td ><? include("templates/img.php");?><div id="imagelist"></div></td>
					</tr>
					<tr>
							<td></td>
							<td><input type="submit" value="Сохранить" /></td>
						</tr>
					</table>
					</form>
					
					<?
					break;
				case "news_save":
				header('Content-Type: text/html; charset=utf-8');
					$msg_title = "";
					$msg_body = "";
					if($_GET["type"] == "a")
					{
						$name = htmlspecialchars($_POST["name"],ENT_QUOTES);
						$info = htmlspecialchars($_POST["info"],ENT_QUOTES);
						
						$start_date = explode(".",$_POST["start_date"]);
						$start_date = $start_date[2]."-".$start_date[1]."-".$start_date[0];
						
						$finish_date = explode(".",$_POST["finish_date"]);
						$finish_date = $finish_date[2]."-".$finish_date[1]."-".$finish_date[0];
						if($_GET["id"] == "0")
						{
							mysql_query("INSERT INTO events(userid,start_date,finish_date,title,info,ispublish,eventtype) VALUES ('".$_SESSION["login_user"]["id"]."','$start_date','$finish_date','$name','$info','".$_SESSION["login_user"]["istrust"]."',1)");
							$msg_title = "Добавлено новое событие";
							$id = mysql_insert_id();
						}
						else
						{
							mysql_query("UPDATE events SET
							title = '$name',
							start_date = '$start_date',finish_date = '$finish_date',
							info = '$info',
							ispublish = '".$_SESSION["login_user"]["istrust"]."'
							WHERE id = $_GET[id] AND userid = ".$_SESSION["login_user"]["id"]."
							");
							$id = $_GET["id"];
							$msg_title = "Обновлено событие";
							}
						upload_mages($id,40);
						$msg_body  = "<a target='_blank' href='"._SITE."direct/index.php?t=events&id=$id&sort=events.id+DESC'>$name</a>";
					}
					else
					{
					$sdate = explode(".",$_POST["sdate"]);
					$sdate = $sdate[2]."-".$sdate[1]."-".$sdate[0];
					$name = htmlspecialchars($_POST["name"],ENT_QUOTES);
					$preview = htmlspecialchars($_POST["name"],ENT_QUOTES);
					$info = htmlspecialchars($_POST["info"],ENT_QUOTES);
					$urlname = create_urlname($_POST["name"]);
					$id = "";
					
					if($_GET["id"] == "0")
					{
						mysql_query("INSERT INTO content(parentid,name,sdate,urlname,create_date,preview,info,siteuser,ispublish) VALUES ('$_GET[parentid]','$name','$sdate','$urlname',now(),'$preview','$info','".$_SESSION["login_user"]["id"]."','".$_SESSION["login_user"]["istrust"]."')");
						$id = mysql_insert_id();
						
						switch($_GET["type"])
						{
							case "n":
								$msg_title = "Добавлена новая новость";
								break;
							case "ш":
								$msg_title = "Добавлено новое интервью";
								break;	
						}
						
					}
					else if($_GET["id"] > 0)
					{
						mysql_query("UPDATE content SET
						name = '$name',
						sdate = '$sdate',
						urlname = '$urlname',
						info = '$info',
						preview = '$preview',
						ispublish = '".$_SESSION["login_user"]["istrust"]."'
						WHERE id = $_GET[id] AND siteuser = ".$_SESSION["login_user"]["id"]."
						");
						$id = $_GET["id"];
						switch($_GET["type"])
						{
							case "n":
								$msg_title = "Обновлена новость";
								break;
							case "i":
								$msg_title = "Обновлено интервью";
								break;	
						}
					}
					upload_mages($id,1);
					$msg_body  = "<a target='_blank' href='"._SITE."direct/index.php?t=content&id=$id&sort=showorder+ASC'>$name</a>";
					}
					send_mime_mail($_SERVER['HTTP_HOST'], "no_reply@".str_replace("www.","",$_SERVER['HTTP_HOST']), "",setting("contact_email"),"UTF-8", "UTF-8", $msg_title, $msg_body );
					?>
				<script language="JavaScript">
					window.parent.show_html_message("Данные успешно сохранены ! <a href='/editnews.html?<?=$_GET["type"]?>=<?=$id?>'  >Вернуться к редактированию</a>.");
				</script>
					<?
					break;
				case "show_news":
					$parentid = "";
					switch($_POST["type"])
					{
						case "n":
							$parentid = $_SESSION["login_user"]["userregion"];
							if($parentid == 0)
							{
								$parentid = 4;
							}
							?>
							<div><h1>Новости</h1></div>
							<?
							break;
						case "i":
							$parentid = 10;
							?>
							<div><h1>Интервью</h1></div>
							<?
							break;	
						case "a":
							?>
							<div><h1>Анонсы</h1></div>
							<?
							break;	
					}
					echo "<ul>";
					?>
					<script language="JavaScript">
						function rm_item(item)
						{
							if(confirm('Удалить запись ?'))
							{
								$.post(baseurl+"ajax.php",{action:'rm_item',type:'<?=$_POST["type"]?>',id:item},function() {  document.location.href = 'mynews.html?t=<?=$_POST["type"]?>';  })
							}
						}
					</script>
					<?
					if($_POST["type"] == "n" || $_POST["type"] == "i")
					{
						
						
						$sql = mysql_query("SELECT id,name FROM content WHERE siteuser = ".$_SESSION["login_user"]["id"]." AND parentid = $parentid");
						while($r = mysql_fetch_assoc($sql))
						{
							?>
							<li><a title="Редактировать" href="<?=_SITE?>editnews.html?<?=$_POST["type"]?>=<?=$r["id"]?>"><?=$r["name"]?></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="rm_item(<?=$r["id"]?>)" style="color:red;">удалить</a></li>
							<?
						}
					}
					if($_POST["type"] == "a") {
						$sql = mysql_query("SELECT id,title FROM events WHERE userid = ".$_SESSION["login_user"]["id"]." ORDER BY id DESC");
						while($r = mysql_fetch_assoc($sql))
						{
							?>
							<li><a title="Редактировать" href="<?=_SITE?>editnews.html?a=<?=$r["id"]?>"><?=$r["title"]?></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="rm_item(<?=$r["id"]?>)" style="color:red;">удалить</a></li>
							<?
						}
					
					}
					echo "</ul>";
					break;
					case "rm_item":
						if($_POST["type"] == "n" || $_POST["type"] == "i")
						{
							mysql_query("DELETE FROM content WHERE siteuser = ".$_SESSION["login_user"]["id"]." AND id = $_POST[id]");
							rm_subobjects_all($_POST["id"],1);
						}
						if($_POST["type"] == "a" )
						{
							mysql_query("DELETE FROM events WHERE userid = ".$_SESSION["login_user"]["id"]." AND id = $_POST[id]");
							rm_subobjects_all($_POST["id"],40);
						}
						break;
				default:
					echo $_POST["action"];
					break;
				case "subscribe":
				header('Content-Type: text/html; charset=utf-8');
				?>
					<script language="JavaScript">
						function show_message(text)
						{
							window.parent.$("#info_block").attr("title","Восстановление пароля");
							window.parent.$("#info_block").html(text);
							window.parent.$("#info_block").dialog("open");
						}
					</script>	
				<?		
				if(!check_email($_POST["semail"])){ ?><script>show_message('Вы ввели некорректный E-Mail !');</script><? exit(); }
				
				$id = execute_scalar("SELECT id FROM subscriber WHERE email = '".$_POST["semail"]."'");
				
				if($id != "") {	?><script>show_message('Введенный E-Mail уже есть в базе данных !');</script><? exit(); }
					
				mysql_query("INSERT INTO subscriber(email,code,create_date) VALUES ('".$_POST["semail"]."','".md5($_POST["semail"])."',now())");	
				?><script>show_message('Ваш E-Mail успешно добавлен в базу данных!');</script><?	
					break;
						case "accept_registr":
			mysql_query("UPDATE siteusers SET isactive = 1 WHERE id = '".$_POST["id"]."'");
			$row = execute_row_assoc("SELECT * FROM siteusers WHERE id = '".$_POST["id"]."'");
			$body = html3("accept_user_info");
			$body = str_replace("@name",$row["r47"],$body);
			$body = str_replace("@sname",$row["r48"],$body);
			send_mime_mail($_SERVER['HTTP_HOST'], "no_reply@".str_replace("www.","",$_SERVER['HTTP_HOST']), "",$row["email"],"UTF-8", "UTF-8", "Уведомление о подтверждении регистрации на сайте ".$_SERVER['HTTP_HOST'], $body );
			break;
		case "regect_registr":
			mysql_query("UPDATE siteusers SET isactive = 0,reject = 1 WHERE id = '".$_POST["id"]."'");
			$row = execute_row_assoc("SELECT * FROM siteusers WHERE id = '".$_POST["id"]."'");
			$body = html3("regect_user_info");
			$body = str_replace("@name",$row["r47"],$body);
			$body = str_replace("@sname",$row["r48"],$body);
			send_mime_mail($_SERVER['HTTP_HOST'], "no_reply@".str_replace("www.","",$_SERVER['HTTP_HOST']), "",$row["email"],"UTF-8", "UTF-8", "Отклонение регистрации на сайте ".$_SERVER['HTTP_HOST'], $body );
			break;
			case "edit_blogs":
				$values = execute_row_assoc("SELECT *,DATE_FORMAT(ndate,'%d.%m.%Y') as news_date FROM blogs WHERE id = ".$_POST["eventid"]." AND userid = '".$_SESSION["login_user"]["id"]."'");
				?>
				<iframe name="eventsFunc" style="display:none;"></iframe>
				<form method="post" target="eventsFunc" action="<?=_SITE?>ajax.php?action=blogs_save&id=<?=$_POST["eventid"]?>" >
				<table cellspacing="0" class="formRegister" cellpadding="2"  border="0">
					<? if($_POST["eventid"] > 0) { ?>
					<tr>
						<td  >Дата записи:</td>
						<td ><?=$values["news_date"]?></td>
					</tr>
					<? } ?>
					<tr>
						<td >Заголовок:</td>
						<td ><input type="text" style="width:450px;" value="<?=htmlspecialchars_decode($values["title"],ENT_QUOTES)?>" id="title"  name="title" /></td>
					</tr>
					<tr>
						<td  >Детально:</td>
						<td ><textarea rows="8" style="width:450px;" id="info" name="info"><?=htmlspecialchars_decode($values["info"],ENT_QUOTES)?></textarea></td>
					</tr>
					<tr>
						<td  ></td>
						<td >
							<?
							if($_POST["eventid"] == "0")
							{
								?>
								<input type="submit" value="Добавить запись" />
								<?
							}
							else
							{
								?>
								<input type="submit" value="Сохранить изменения" />
								<?
							}
							?>
						</td>
					</tr>
				</table>
				</form>
				<?
				break;
				case "show_my_blogs":
					?>
					<script language="JavaScript">
						function rm_item(item)
						{
							if(confirm('Удалить запись ?'))
							{
								$.post(baseurl+"ajax.php",{action:'rm_blogs',id:item},function() {  document.location.href = 'myblogs.html';  })
							}
						}
					</script>
					<?
				echo "<ul>";
				$sql = mysql_query("SELECT id,title FROM blogs WHERE userid = ".$_SESSION["login_user"]["id"]." ORDER BY ndate DESC");
						while($r = mysql_fetch_assoc($sql))
						{
							?>
							<li><a title="Редактировать" href="<?=_SITE?>editblogs.html?id=<?=$r["id"]?>"><?=$r["title"]?></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="rm_item(<?=$r["id"]?>)" style="color:red;">удалить</a></li>
							<?
						}
						echo "</ul>";
					break;
					case "rm_blogs":
					mysql_query("DELETE FROM blogs WHERE id = '$_POST[id]' AND userid = '".$_SESSION["login_user"]["id"]."'");
					rm_subobjects_all($_POST["eventid"],0,30);
					break;
					case "message_info":
					$new = execute_scalar("SELECT count(id) FROM messages WHERE isread = 0 AND user_to = '".$_SESSION["login_user"]["id"]."'");
					if($new > 0)
					{
						?>
						<table>
						<tr>
						<td style="vertical-align:middle;">
							<img title='У Вас новые сообщения' alt='' src='<?=_TEMPL?>images/message.gif' />
						</td>
						<td style="vertical-align:middle;">&nbsp;
						<?
						if($new < 10)
						{
							echo "<a href='"._SITE."messages.html' style='text-decoration:none;'>У Вас <strong>$new</strong> новое сообщение</a>";
						}
						else
						{
							echo "<a href='"._SITE."messages.html' style='text-decoration:none;'>У Вас <strong>$new</strong> новых сообщений</a>";
						}
						?></td>
							
						</table>
						<?
						
					}
					break;
				case "send_msg":
				header('Content-Type: text/html; charset=utf-8');
					if(trim($_POST["msg_body"]) == "")
					{
						?>
						<script language="JavaScript" type="text/javascript">window.parent.show_info_message("Отправка сообщения","Заполните, пожалуйста, поле 'Сообщение'.")</script>
						<?
						exit();
					}
					mysql_query("INSERT INTO messages (create_date,subject,info,user_form,user_to) VALUES (
						now(),'".htmlspecialchars($_POST["msg_title"])."','".htmlspecialchars($_POST["msg_body"])."','".$_SESSION["login_user"]["id"]."','$_POST[userid]')");

						$html = "
						<table>
						<tr>
								<td><strong>Автор:&nbsp;</strong></td>
								<td>".execute_scalar("SELECT CONCAT(r46,' ',r47,' ',r48) as name FROM siteusers WHERE id = '".$_SESSION["login_user"]["id"]."' ")."</td>
							</tr>
							<tr>
								<td><strong>Тема:&nbsp;</strong></td>
								<td>".$_POST["msg_title"]."</td>
							</tr>
							<tr>
								<td><strong>Сообщение:&nbsp;</strong></td>
								<td>".$_POST["msg_body"]."</td>
							</tr>
						</table>
						";
						send_mime_mail($_SERVER['HTTP_HOST'], "no_reply@".str_replace("www.","",$_SERVER['HTTP_HOST']), "",
						execute_scalar("SELECT email FROM siteusers WHERE id = '$_POST[userid]' "), "UTF-8", "UTF-8", "Уведомление о новом сообщение на сайте ".$_SERVER["SERVER_NAME"], $html );
						?>
						<script language="JavaScript" type="text/javascript">window.parent.show_info_message("Отправка сообщения","Сообщение успешно отправлено !");
						window.parent.setTimeout("document.location.href = '<?=_SITE?>messages.html'",2000);
						</script>
						<?
					break;
					case "show_messages":
					?>
						<strong>Входящие сообщения</strong>
						<br /><br />
						<table style="font-size:12px;" class="msgtable" width="100%">
						<?
						$sql = mysql_query("SELECT messages.*,CONCAT(siteusers.r46,' ',siteusers.r47,' ',siteusers.r48) as name,DATE_FORMAT(messages.create_date,'%d.%m.%Y %H:%i:%s') as mdate FROM messages 
						INNER JOIN siteusers ON siteusers.id = messages.user_form
						WHERE user_to = '".$_SESSION["login_user"]["id"]."' AND tvisible = 1 LIMIT 0,10");
						while($r = mysql_fetch_assoc($sql))
						{
							?>
								<tr  <?=($r["isread"] == "0" ? "style='font-weight:bold;'" : "")?>>
									<td><button onclick="delete_message(<?=$r["id"]?>,0)" class="btn2">&nbsp;</button></td>
									<td width="30%"><a href="<?=_SITE?>message/<?=$r["id"]?>.html" ><?=$r["name"]?></a></td>
									<td width="50%"><a href="<?=_SITE?>message/<?=$r["id"]?>.html"><?=$r["subject"]?></a></td>
									<td><?=$r["mdate"]?></td>
								</tr>
							<?
						}
						?>
						</table>
						<br /><br /><br />
						<strong>Отправленные сообщения</strong>
						<br /><br />
						<table class="msgtable" style="font-size:12px;" width="100%">
						<?
						$sql = mysql_query("SELECT messages.*,CONCAT(siteusers.r46,' ',siteusers.r47,' ',siteusers.r48) as name,DATE_FORMAT(messages.create_date,'%d.%m.%Y %H:%i:%s') as mdate FROM messages 
						INNER JOIN siteusers ON siteusers.id = messages.user_to
						WHERE user_form = '".$_SESSION["login_user"]["id"]."' AND fvisible = 1 LIMIT 0,10");
						while($r = mysql_fetch_assoc($sql))
						{
							?>
								<tr >
									<td><button onclick="delete_message(<?=$r["id"]?>,1)" class="btn2">&nbsp;</button></td>
									<td width="30%"><a href="<?=_SITE?>message/<?=$r["id"]?>.html"><?=$r["name"]?></a></td>
									<td width="50%"><a href="<?=_SITE?>message/<?=$r["id"]?>.html"><?=$r["subject"]?></a></td>
									<td><?=$r["mdate"]?></td>
								</tr>
							<?
						}
						?>
						</table>
					<?	
						break;
						case "rm_message":
					if($_POST["source"] == "0")
					{
						mysql_query("UPDATE messages SET tvisible = 0 WHERE id = '$_POST[message]' AND user_to = '".$_SESSION["login_user"]["id"]."'");
					}
					else if ($_POST["source"] == "1")
					{
						mysql_query("UPDATE messages SET fvisible = 0 WHERE id = '$_POST[message]' AND user_form = '".$_SESSION["login_user"]["id"]."'");
					}
					
					break;
						case "send_multiple_message":
			?>
			<iframe style="display:none;" name="msg_frame" id="msg_frame"></iframe>
			<form method="post" target="msg_frame" action="<?=_SITE?>ajax.php">
			<input type="hidden" name="action" value="send_messages" />
			<table cellspacing="0" cellpadding="2" border="0" class="formRegister">
				<tr>
					<td height="40">Пользователь:</td>
					<td height="40" style="width:310px;">
						<select style="width:300px;" name="user_list[]" id="user_list" multiple="true" size="10" >
							<?
							$sql = mysql_query("SELECT *,CONCAT(r46,' ',r47,' ',r48) as uname FROM siteusers WHERE isactive = 1 AND reject  = 0 AND id != '".$_SESSION["login_user"]["id"]."' ORDER BY r46 ASC");
							while($r = mysql_fetch_assoc($sql))
							{
								?>
								<option value="<?=$r["id"]?>"><?=$r["uname"]?></option>
								<?
							}
							?>
						</select>
					</td>
					<td  style="vertical-align:top;">
						Для выбора нескольких строк используйте <strong>Ctrl</strong>
					</td>
				</tr>
				<tr>
						<td height="40">Тема:</td>
						<td height="40" colspan="2"><input type="text" name="msg_title" id="msg_title" value="" style="width: 450px;"></td>
					</tr>
					<tr>
						<td height="40">Сообщение:</td>
						<td height="40" colspan="2">
							<textarea id="msg_body" name="msg_body" style="width:450px;" rows="10"></textarea>
						</td>
					</tr>
					<tr>
						<td height="40"></td>
						<td height="40" colspan="2">
						<input type="submit" value="Отправить сообщение">
					</td>
					</tr>
			</table>
			</form>
			<?
			break;
			case "send_messages":
				header('Content-Type: text/html; charset=utf-8');
					if(count($_POST["user_list"]) == 0)
					{
						?>
						<script language="JavaScript" type="text/javascript">window.parent.show_info_message("Отправка сообщения","Необходимо выбрать пользователей для отправки.")</script>
						<?
						exit();
					}
					if(strip_tags(trim($_POST["msg_body"])) == "")
					{
						?>
						<script language="JavaScript" type="text/javascript">window.parent.show_info_message("Отправка сообщения","Заполните, пожалуйста, поле 'Сообщение'.")</script>
						<?
						exit();
					}
					foreach($_POST["user_list"] as $current)
					{
						mysql_query("INSERT INTO messages (create_date,subject,info,user_form,user_to) VALUES (
						now(),'".htmlspecialchars($_POST["msg_title"])."','".htmlspecialchars($_POST["msg_body"])."','".$_SESSION["login_user"]["id"]."','$current')");

						$html = "
						<table>
						<tr>
								<td><strong>Автор:&nbsp;</strong></td>
								<td>".execute_scalar("SELECT CONCAT(r46,' ',r47,' ',r48) as name FROM siteusers WHERE id = '".$_SESSION["login_user"]["id"]."' ")."</td>
							</tr>
							<tr>
								<td><strong>Тема:&nbsp;</strong></td>
								<td>".$_POST["msg_title"]."</td>
							</tr>
							<tr>
								<td><strong>Сообщение:&nbsp;</strong></td>
								<td>".$_POST["msg_body"]."</td>
							</tr>
						</table>
						";
						send_mime_mail($_SERVER['HTTP_HOST'], "no_reply@".str_replace("www.","",$_SERVER['HTTP_HOST']), "",
						execute_scalar("SELECT email FROM siteusers WHERE id = '$current' "), "UTF-8", "UTF-8", "Уведомление о новом сообщение на сайте ".$_SERVER["SERVER_NAME"], $html );
					}
					?>
						<script language="JavaScript" type="text/javascript">window.parent.show_info_message("Отправка сообщения","Сообщение успешно отправлено выбранным адресатам !");
						window.parent.setTimeout("document.location.href = '<?=_SITE?>messages.html'",2000);
						</script>
						<?
				break;
	}
}
function upload_mages($parentid,$source)
{
	if(count($_FILES) > 0) 
	{
		$imindex = 0;
		$uploaddir = "images/files/";
		foreach(array_keys($_FILES) as $key)
		{
			$imindex++;
			$_FILES[$key]['name'] = $source."_".$parentid."_".date("dmYHis")."_$imindex.jpg";
			$uploadfile = $uploaddir.basename($_FILES[$key]['name']);
			if(move_uploaded_file($_FILES[$key]["tmp_name"],$uploadfile))
			{
				if(file_exists($uploadfile))
				{
					$size = getimagesize($uploadfile);
					$width = $size[0];
					$height = $size[1];
					$format = strtolower(substr($size['mime'], strpos($size['mime'], '/')+1));
					$title = "";
					if(isset($_POST["t".$key]) && strip_tags(trim($_POST["t".$key])) != "")
					{
							$title = htmlspecialchars(strip_tags(trim($_POST["t".$key])),ENT_QUOTES);
					}
					mysql_query("INSERT INTO images (title,parentid,image,is_main,source,showorder,width,height,format,userid) VALUES ('".$title."','".$parentid."','".($_FILES[$key]['name'])."','$is_main','$source','1','$width','$height','$format','".$_SESSION["login_user"]["id"]."')");	
				}	
			}
		}
	}	
}
if(isset($_GET["action"]))
{
	
	switch($_GET["action"])
	{
case "blogs_save":

		
		$title = htmlspecialchars($_POST["title"],ENT_QUOTES);
		$info = htmlspecialchars($_POST["info"],ENT_QUOTES);
		if($_GET["id"] == "0")
		{
			mysql_query("INSERT INTO blogs(userid,ndate,title,info) VALUES ('".$_SESSION["login_user"]["id"]."',now(),'$title','$info')");
			$eventid = mysql_insert_id();
			send_mime_mail($_SERVER['HTTP_HOST'], "no_reply@".str_replace("www.","",$_SERVER['HTTP_HOST']), "",setting("contact_email"),"UTF-8", "UTF-8", "Добавлена новая запись в блог", "<p><a href='"._SITE."direct/index.php?t=blogs&id=$eventid' >$title</a></p>" );
		}
		else
		{
			mysql_query("UPDATE blogs SET 
			title = '$title',
			info = '$info'
			WHERE id = '$_GET[id]'
			");
			$eventid = $_GET["id"];
			send_mime_mail($_SERVER['HTTP_HOST'], "no_reply@".str_replace("www.","",$_SERVER['HTTP_HOST']), "",setting("contact_email"),"UTF-8", "UTF-8", "Обновлена запись в блоге", "<p><a href='"._SITE."direct/index.php?t=blogs&id=$eventid' >$title</a></p>" );
		}
		upload_mages($eventid,30);
		
		?>
		<script language="JavaScript">
			window.parent.show_html_message("Запись успешно сохранена ! <a href='/myblogs.html'>Перейти к блогам</a> или <a href='/editblogs.html?id=<?=$eventid?>' >вернуться к редактированию</a>.");
			
		</script>
		<?
			break;	
			
	}	
}
?>
