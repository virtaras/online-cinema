<?
$title = "Сообщения";
$source = "SELECT messages.id,messages.create_date,CONCAT(siteusers.r46,' ',siteusers.r47,' ',siteusers.r48) as uf,CONCAT(s.r46,' ',s.r47,' ',s.r48) as ut,messages.subject 
FROM messages
LEFT JOIN siteusers  ON siteusers.id = messages.user_form
LEFT JOIN siteusers s ON s.id = messages.user_to
";

$title_fields["create_date"] = "Дата";
$title_fields["ut"] = "Кому";
$title_fields["uf"] = "От кого";
$title_fields["subject"] = "Тема";
$edit_title_fields["subject"] = "Тема";

$controls["user_form"] = new Control("user_form","list","Автор","SELECT id,CONCAT(siteusers.r46,' ',siteusers.r47,' ',siteusers.r48) as name FROM siteusers");
$controls["user_to"] = new Control("user_to","list","Автор","SELECT id,CONCAT(siteusers.r46,' ',siteusers.r47,' ',siteusers.r48) as name FROM siteusers");
$controls["isread"] = new Control("isread","checkbox","Прочитано");
$body = new Control("info","template","Содержание");
$body->template = "templates/body.php";
$controls["info"] = $body;

$controls["create_date"] = new Control("create_date","label","Дата создания");

?>