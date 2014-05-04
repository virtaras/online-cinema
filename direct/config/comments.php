<?
$title = "Комментарии";

$title_fields["info"] = "Комментарий";
$title_fields["create_date"] = "Дата";
$title_fields["fio"] = "Пользователь";


$source = "SELECt comments.id,comments.create_date,comments.info,CONCAT(siteusers.r46,' ',siteusers.r47,' ',siteusers.r48) as fio FROM comments
LEFT JOIN siteusers ON siteusers.id = comments.userid
";


?>