<?php
session_start();
header('Content-Type: text/javascript; charset=utf-8');
require("../config/global.php");
require("../lib/user.php");
require("../function/connection.php");
require("../function/db.php");
require("../function/global.php");
function show_menu_item($parentid,$level = 100)
{
	$sql = db_query("SELECT id,title,parentid FROM menuitem WHERE  parentid = '$parentid' ORDER BY showorder");
	while($r = db_fetch_assoc($sql))
	{
		$blank ="";
		for($i = 0;$i < 100 - $level;$i++)
		{
			$blank .= "&nbsp;&nbsp;&nbsp;&nbsp;";
		}
		?>
		<div style="vertical-align:center;margin-top:3px;" ><?=$blank?>
		<img onclick="up_menu(<?=$r["id"]?>,-1)" src="images/rasc.gif" />&nbsp;
		<img onclick="up_menu(<?=$r["id"]?>,1)" src="images/rdesc.gif" />&nbsp;
		<img src="images/ac.gif" onclick="$('#item<?=$r["id"]?>').load('udf/ajax.php',{action:'menuitem',id:-1,parentid:<?=$r["id"]?>,divid:'item<?=$r["id"]?>',menuid:<?=$_POST["menuid"]?>})" />&nbsp;
		<img onclick="rm_menuitem('<?=$r["id"]?>')" src="images/dc.gif" />&nbsp;
		<a onclick="$('#item<?=$r["id"]?>').load('udf/ajax.php',{action:'menuitem',id:<?=$r["id"]?>,parentid:<?=$r["parentid"]?>,divid:'item<?=$r["id"]?>'})" href="#"><?=$r["title"]?></a>
				<div id="item<?=$r["id"]?>"></div></div>
		<?
		show_menu_item($r["id"],$level-1);
		
	}
		
}
if(isset($_POST["action"]))
{
switch($_POST["action"])
{
	case "menuitem":
		$r = db_get_row("SELECT * FROM menuitem WHERE id = '$_POST[id]'");
		?>
		<input type="hidden" id="parentid<?=$_POST["id"]?>" value="<?=$_POST["parentid"]?>" />
		<table>
			<tr>
				<td class='title'>Заголовок</td>
				<td><input type="text" value="<?=$r["title"]?>" class='input_box' id="title<?=$_POST["id"]?>" /></td>
			</tr>
			<tr>
				<td class='title'>Ссылка</td>
				<td><input type="text" value="<?=$r["link"]?>" class='input_box' id="link<?=$_POST["id"]?>" /></td>
			</tr>
			<tr>
				<td class='title'>SQL для субменю</td>
				<td><textarea rows="9" class='input_box' id="sql<?=$_POST["id"]?>"><?=$r["childsql"]?></textarea>
				</td>
			</tr>
			<tr>
				<td class='title'>Шаблон ссылки</td>
				<td><input type="text" value="<?=$r["linktemplate"]?>" class='input_box' id="linktemplate<?=$_POST["id"]?>" /></td>
			</tr>
			
			<tr>
				<td></td>
				<td><input type="button" onclick="save_menuitem('<?=$_POST["id"]?>')" class="buttons" value="Сохранить" />
				&nbsp;
				<input onclick="$('#<?=$_POST["divid"]?>').empty()"  type="button" class="buttons" value="Закрыть" />
				</td>
			</tr>
		</table>
		<?
		break;
		case "showmenu":
			$sql = db_query("SELECT id,title,parentid FROM menuitem WHERE menuid = '$_POST[menuid]' AND parentid = '-1' ORDER BY showorder");
			while($r = db_fetch_assoc($sql))
			{
				?>
				<div style="vertical-align:center;margin-top:3px;" ><img onclick="up_menu(<?=$r["id"]?>,-1)" src="images/rasc.gif" />&nbsp;<img onclick="up_menu(<?=$r["id"]?>,1)" src="images/rdesc.gif" />&nbsp;<img onclick="$('#item<?=$r["id"]?>').load('udf/ajax.php',{action:'menuitem',id:-1,parentid:<?=$r["id"]?>,divid:'item<?=$r["id"]?>',menuid:<?=$_POST["menuid"]?>})" src="images/ac.gif" />&nbsp;<img onclick="rm_menuitem('<?=$r["id"]?>')" src="images/dc.gif" />&nbsp;<a onclick="$('#item<?=$r["id"]?>').load('udf/ajax.php',{action:'menuitem',id:<?=$r["id"]?>,parentid:<?=$r["parentid"]?>,divid:'item<?=$r["id"]?>'})" href="#"><?=$r["title"]?></a>
				<div id="item<?=$r["id"]?>"></div></div>
				<?
				show_menu_item($r["id"],99);
			
			}
			break;
			case "save_menu":
			
			if($_POST["id"] == "-1")
			{
				
				$max_order = execute_scalar("SELECT max(showorder) FROM menuitem WHERE parentid = '$_POST[parentid]'");
				db_query("INSERT INTO menuitem (menuid,parentid,title,link,childsql,showorder,linktemplate) VALUES ('$_POST[menuid]','$_POST[parentid]','$_POST[title]','$_POST[link]','$_POST[sql]','".($max_order + 1)."','$_POST[linktemplate]')");
			}
			else
			{
				db_query("UPDATE menuitem SET parentid = '$_POST[parentid]',title = '$_POST[title]',link = '$_POST[link]',childsql = '$_POST[sql]',linktemplate='$_POST[linktemplate]' WHERE id = '$_POST[id]'");
			}
				break;
			case "rm_menu":
				function rm_menu($parentid)
				{
					$sql = db_query("SELECT id FROM menuitem WHERE parentid = '$parentid'");
					while($r = db_fetch_assoc($sql))
					{
						db_query("DELETE FROM menuitem WHERE id = '$r[id]'");
						rm_menu($r["id"]);
					}
					db_query("DELETE FROM menuitem WHERE id = '$parentid'");
				}
				rm_menu($_POST["id"]);
				break;
			case "up_menu":
				$parent = execute_scalar("SELECT parentid FROM menuitem WHERE id = '$_POST[up]'");
	$count_item = execute_scalar("SELECT count(*)  FROM menuitem WHERE parentid = '$parent'");
	$currentsql = mysql_query("SELECT id,showorder FROM menuitem WHERE id = '$_POST[up]'");
	$current = mysql_fetch_assoc($currentsql);
	if(($current["showorder"] == 1 && $_POST["position"] == "-1") || ($current["showorder"] == $count_item && $_POST["position"] == "1"))
	{
		
	}
	else
		{
			$old_position = $current["showorder"];
			$new_position = $current["showorder"] + $_POST["position"];
			
			//echo $old_position." ".$new_position;
			
			$old_id_sql = mysql_query("SELECT id FROM menuitem WHERE parentid = '$parent' AND showorder = '$new_position'");
			$old_id = mysql_fetch_assoc($old_id_sql);
			$old = $old_id["id"];
			
			mysql_query("UPDATE menuitem SET showorder = '$old_position' WHERE id = '$old'");
			mysql_query("UPDATE menuitem SET showorder = '$new_position' WHERE id = '$_POST[up]'");
		}
				break;	
				case "show_editor":
				$base_path = "../";
				include("../templates/fck.php");
				//$oFCKeditor->BasePath = "../fckeditor/" ;
				$oFCKeditor->InstanceName = $_POST["name"];
				$oFCKeditor->Height = $_POST["height"];
				$oFCKeditor->Width = isset($_POST["width"]) ? $_POST["width"] : "100%";
				$oFCKeditor->Value	 = htmlspecialchars_decode(execute_scalar($_POST["sql"]));
				$oFCKeditor->Create() ;
				break;

		case "news_in_index":
			mysql_query("UPDATE news SET in_index = '".($_POST["status"] == "true" ? "1" : "0")."' WHERE id = '$_POST[id]'");
			break;
		case "events_ispublish":
			mysql_query("UPDATE events SET ispublish = '".($_POST["status"] == "true" ? "1" : "0")."' WHERE id = '$_POST[id]'");
			break;	
		case "accept_registr":
			mysql_query("UPDATE siteusers SET isactive = 1 WHERE id = '".$_POST["id"]."'");
			break;
		case "regect_registr":
			mysql_query("UPDATE siteusers SET isactive = 0,regect = 1 WHERE id = '".$_POST["id"]."'");
			break;
	
	

} 


}
?>