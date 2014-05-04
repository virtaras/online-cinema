<?
$title = "События";
$source = "SELECT events.id,eventtype,CONCAT(siteusers.r46,' ',siteusers.r47,' ',siteusers.r48) as fio,events.start_date,events.finish_date,events.title,events.ispublish FROM events
LEFT JOIN siteusers ON siteusers.id = events.userid
";
$title_fields["fio"] = "Пользователь";
$title_fields["start_date"] = "Дата начала";
$title_fields["finish_date"] = "Дата окончания";
$title_fields["title"] = "Наименование";
$title_fields["eventtype"] = "Тип события";
$edit_title_fields["title"] = "Наименование";
$title_fields["ispublish"] = "Публиковать";


$controls["userid"] = new Control("userid","list","Автор","SELECT id,CONCAT(siteusers.r46,' ',siteusers.r47,' ',siteusers.r48) as name FROM siteusers");
$controls["ispublish"] = new Control("ispublish","checkbox","Публиковать");
$body = new Control("info","template","Содержание");
$body->template = "templates/body.php";

$report = new Control("report","template","Отчет о событии");
$report->template = "templates/body.php";

$controls["info"] = $body;
$controls["report"] = $report;

$controls["start_date"] = new Control("start_date","date","Дата начала");
$controls["finish_date"] = new Control("finish_date","date","Дата окончания");

global $sourceid;
	$sourceid = 40;
	if(isset($_GET["id"]) && $_GET["id"] != "-1" )
	{
		$edit_content_bottom = "templates/img.php";
}
$eval_fields["ispublish"] = "set_ispublish(\$row);";
if(!function_exists("set_ispublish"))
{
	function set_ispublish($row)
	{
		?>
		<input type="checkbox" onclick="$.post('udf/ajax.php',{action:'events_ispublish',id:<?=$row["id"]?>,status:this.checked},function() {});" value="1" <?=($row["ispublish"] == "1" ? "checked='checked'" : "")?> />
		<?
	}
}
$controls["eventtype"] = new Control("eventtype","list","Тип события",array("1"=>"Событие","2"=>"Грант"));
?>