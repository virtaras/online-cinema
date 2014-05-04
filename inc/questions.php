<?php

function set_clicked($id)
{
	if(setcookie("click".$id,1,time()+60*60*24*30,"/"))
	{
		
	}
	else
	{
		$_SESSION["click".$id] = 1;
	}
}
function check_clicked($id)
{
	if(isset($_COOKIE["click".$id]) || isset($_SESSION["click".$id]))
	{
		return true;
	}
	else
	{
		return false;
	}
} 	
function showuestionsresultdetails($r)
{
	?>

	<div class="question">
	<div class="ask_title">Опрос </div>
			<div class="question_title" ><?=$r["name"]?></div>
			
			<?
			$all = execute_scalar("SELECT sum(click) FROM qitem WHERE parentid = '$r[id]'");
			
			
			$sql2 = mysql_query("SELECT * FROM qitem WHERE parentid = '$r[id]' ORDER BY click DESC ");
			$color_array = explode(",",setting("color_array"));
			$i = 0;
			while($r2 = mysql_fetch_assoc($sql2))
			{
					if($all == 0)
					{
						$percent = 0;
					}
					else
					{
						$percent =  floor($r2["click"]/$all*100);
					}
				
				?>
				<div class="question_item1">
				<table width="100%" border="0">
					<tr>
						<td class="linetd" style=" background-color:<?=$color_array[$i]?>;<?=($percent == 0 ? "display:none;" : "")?>font-size:5px;" width="<?=$percent?>%">&nbsp;</td>


						<td  ></td>	
								</tr>
								<tr>
									<td colspan="2">
									<?=$r2["title"]?>&nbsp;(<?=$r2["click"]?>)
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				</div>
				<?
				$i++;
			}
			
			?>
			<div class="question_all_title" >Всего проголосовало:&nbsp;<?=$all?></div>
			<?
			if(!check_clicked($r["id"]))
			{
				?>

				<div class="question_link_back"><a onclick="show_questions()"  value="Назад" >Перейти к голосованию</a></div> </div></div>
				<?
			}
}
function showquestionsresult()
{
	$sql = mysql_query("SELECT * FROM questions WHERE invisible = '0' AND start_date <= now() AND finish_date >= now()");
		while($r = mysql_fetch_assoc($sql))
		{

			showuestionsresultdetails($r);
		}
}
function showquestions()
{
	
	
	$sql = mysql_query("SELECT * FROM questions WHERE invisible = '0' AND start_date <= now() AND finish_date >= now() ORDER BY start_date DESC,rand() LIMIT 0,1 ");
		while($r = mysql_fetch_assoc($sql))
		{
		if(check_clicked($r["id"]))
		{
			showuestionsresultdetails($r);
		}
		else
		{
			
			
			?> 
			<div class="question">
				<div class="ask_title">Опрос </div>
			<div class="question_title" ><?=$r["name"]?></div>
			
			<?
			$all = execute_scalar("SELECT sum(click) FROM qitem WHERE parentid = '$r[id]'");
			
			
			$sql2 = mysql_query("SELECT * FROM qitem WHERE parentid = '$r[id]'");
			while($r2 = mysql_fetch_assoc($sql2))
			{
				?>
				<div class="question_item"><input style="border:none;"  value="<?=$r2["id"]?>" type="radio" name="q<?=$r["id"]?>"/><span><?=$r2["title"]?></span></div>
				<?
			}
			
			?>
			<a class="vote"   onclick="set_click('<?=$r["id"]?>')">Голосовать</a>
			<a class="result"  onclick="show_result()">результаты</a>
			<div class="clear"></div></div>
			<?} }
			
}

if(isset($_POST["type"]))
{
	session_start();
	header('Content-Type: text/javascript; charset=utf-8');

	require("constant.php");
	require("connection.php");
	require("global.php");
	switch($_POST["type"])
	{
		case "showquestions":
			showquestions();
					break;
			case "showquestionsresult":
		showquestionsresult();
					break;		
			case "setclick":
			mysql_query("UPDATE qitem SET click = '".(1+execute_scalar("SELECT click FROM qitem WHERE id = '".$_POST["itemid"]."'"))."' WHERE id = '".$_POST["itemid"]."'");
			set_clicked(execute_scalar("SELECT parentid FROM qitem WHERE id = '".$_POST["itemid"]."'"));
				break;
	}

}
else
{
?>
<form method="post" >
<div id="questions" class="questions">
</div>
<script language="JavaScript">
show_questions();
</script>
</form>
<?php } ?>
