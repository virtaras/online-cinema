<?
$title = "Блоги";
$source = "SELECT blogs.id,CONCAT(siteusers.r46,' ',siteusers.r47,' ',siteusers.r48) as fio,blogs.ndate,blogs.title FROM blogs
LEFT JOIN siteusers ON siteusers.id = blogs.userid
";

$title_fields["fio"] = "Пользователь";
$title_fields["title"] = "Заголовок";
$edit_title_fields["title"] = "Заголовок";
$title_fields["ndate"] = "Дата";
$controls["ndate"] = new Control("start_date","date","Дата записи");

$body = new Control("info","template","Содержание");
$body->template = "templates/body.php";
$controls["info"] = $body;

$controls["userid"] = new Control("userid","list","Автор","SELECT id,CONCAT(siteusers.r46,' ',siteusers.r47,' ',siteusers.r48) as name FROM siteusers");

global $sourceid;
	$sourceid = 30;
	if(isset($_GET["id"]) && $_GET["id"] != "-1" )
	{
		$edit_content_bottom = "templates/img.php";
}
?>