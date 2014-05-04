<?
$subject = "";
global $content_type;
if($content_type == "message")
{
	$subject = "Re: ".$head["subject"];
}
?>
<div id="message_body" style="display:none;">
			<br />
			<iframe style="display:none;" name="msg_frame" id="msg_frame"></iframe>
			<form method="post" target="msg_frame" action="<?=_SITE?>ajax.php">
			<input type="hidden" name="action" value="<?=$object_action?>" />
			<input type="hidden" name="<?=$object_name?>" value="<?=intval($_GET["id"])?>" />
			<table cellspacing="0" cellpadding="2" border="0" class="formRegister">
					<tbody>
					<tr>
						<td height="40">Тема:</td>
						<td height="40"><input value="<?=$subject?>" type="text" name="msg_title" id="msg_title"  style="width: 450px;"></td>
					</tr>
					<tr>
						<td height="40">Сообщение:</td>
						<td height="40">
							<textarea id="msg_body" name="msg_body" style="width:450px;" rows="10"></textarea>
						</td>
					</tr>
					<tr>
						<td height="40"></td>
						<td height="40">
						<input type="submit" value="Отправить сообщение">
					</td>
					</tr>
				</tbody></table>
				</form>
		</div>