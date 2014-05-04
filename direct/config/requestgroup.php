<?php
$title = "Управление формами";
$title_fields["buttontext"] = "Текст кнопки";
$edit_title_fields["buttontext"] = "Текст кнопки";
$title_fields["email"] = "E-Mail";
$edit_title_fields["email"] = "E-Mail";
if(isset($_GET["id"]) && $_GET["id"] != "-1")
{
	$edit_content_right = "templates/requestsfields.php";
}
?>