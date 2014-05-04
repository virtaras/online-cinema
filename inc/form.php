<?php
function get_fields($id)
{
	global $content_type;
	?>
	<div class="feedback-form">
					<div class="cform jNice">
	<iframe id="rframe" name="rframe" style="display:none;" ></iframe>
	<form method="post" target="rframe" enctype="multipart/form-data" action="<?=_SITE?>request.php?action=add&id=<?=$id?>">
	<?
	if($content_type == "content")
	{
		global $head;
		?>
		<input type="hidden" value="<?=$head["siteuser"]?>" name="siteuser" />
		<?
	}
	?>

	
	<?
	$arr = array();
	$sql = mysql_query("SELECT * FROM request WHERE parentid = '$id' ORDER BY showorder");
	while($r = mysql_fetch_assoc($sql))
	{
		 array_push($arr,$r);
	}
	$narr = array_chunk($arr,2);
	foreach($narr as $current)
		{
		?>
		<div class="irow">
		<?
		foreach($current as $r)
			{
		?>
		
			<?php
			switch($r["fieldtype"])
			{
				case "1": //text
					?>
					<span class="double">
					<span class="ititle">
					<?=$r["isrequired"] == "1" ? '<span class="req">*</span>' : ''?>
					<?=$r["title"]?>:</span>
					<input class="ibox" type="text" name="f<?=$r["id"]?>" />
					</span>
					<?
					break;
				case "2": //list
				?>
				<span class="double">
				<span class="ititle">
					<?=$r["isrequired"] == "1" ? '<span class="req">*</span>' : ''?>
					<?=$r["title"]?>:</span>
					<span class="ivalue">
						<select name="f<?=$r["id"]?>" placeholder="Выбирите тему">
							<option value="">.....</option>
						<?
							$arr = explode(",",$r["items"]);
							foreach($arr as $current)
							{
								?>
								<option value="<?=$current?>" ><?=$current?></option>
								<?
							}
							?>
						</select>
					</span>
				</span>	
					<?
					break;	
				case "3": //number
				?>
				<input class="ibox" type="text" name="f<?=$r["id"]?>" />
				<?
					break;	
				case "4": //long text
				?>
				<div class="irow">
				<span class="ititle">
					<?=$r["isrequired"] == "1" ? '<span class="req">*</span>' : ''?>
					<?=$r["title"]?>:</span>
				<span class="ivalue">
				<textarea class="ibox" cols="30" rows="15" name="f<?=$r["id"]?>"></textarea>
				</span>
				</div>
				<?
					break;
				case "5": //e-mail
				?>
				<span class="double">
				<span class="ititle">
					<?=$r["isrequired"] == "1" ? '<span class="req">*</span>' : ''?>
					<?=$r["title"]?>:</span>
					<span class="ivalue">
				<input class="ibox" type="text" name="f<?=$r["id"]?>" />
				</span>
				</span>
				<?
					break;	
				case "6": //file
				?>
					<input class="ibox" type="file" name="f<?=$r["id"]?>" />
				<?
					break;
				case "7": //programm
				?>
					<input  type="hidden" id="f<?=$r["id"]?>" name="f<?=$r["id"]?>" />
				<?
					if(file_exists($r["modules"])) 
					{
						include($r["modules"]);
					}
					break;					
				case "8": //radio list
				?>
				<?
					$arr = explode(",",$r["items"]);
					foreach($arr as $current)
					{
						?>
						<input type="radio" name="f<?=$r["id"]?>" value="<?=$current?>" />&nbsp;-<?=$current?>&nbsp;&nbsp;
						<?
					}
					break;	
			}
			
			
			}
			?>
			<span class="juster"></span>
		</div>	
		<?
	}
	?>
	<div class="irow">
		<span class="ititle"><span class="req">*</span>Защитный код:</span>
		<span class="ivalue">
			<img src="<?=_SITE?>inc/captcha/securimage/securimage_show.php?sid=<?php echo md5(uniqid(time())); ?>" id="captcha" align="absmiddle" />
            <img style="cursor:pointer;margin-bottom: 5px;" onclick="document.getElementById('captcha').src = '<?=_SITE?>inc/captcha/securimage/securimage_show.php?' + Math.random(); return false" alt="" src="<?=_SITE?>inc/captcha/securimage/images/refresh.gif" />
			<span class="double"><input type="text"  name="code" value="" required="required" /></span>
		</span>
	</div>
					
	<div class="irow submit"><input type="submit" value="<?=execute_scalar("SELECT buttontext FROM requestgroup WHERE id = '$id'")?>" class="red icon-send"></div>				
				
		
		
		
	
	</form>
	</div>
	</div>
	<?
}
if(!function_exists("get_content"))
{
	function get_content()
	{
		?>
		<h1><?=execute_scalar("SELECT name FROM requestgroup WHERE id = '$_GET[id]'")?></h1>
		<?
		get_fields($_GET["id"]);
	}
}
?>