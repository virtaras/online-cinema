<?
$title = "Видео";

$source = "SELECT id,video FROM video WHERE parentid = $_GET[parent] AND source = $_GET[source]";

$controls["parentid"] = new Control("parentid","hidden");
$controls["parentid"]->default_value = $_GET["parent"];

$controls["source"] = new Control("parentid","hidden");
$controls["source"]->default_value = $_GET["parent"];

$exclude_fields_edit = array("id","parentid","source");

$controls["video"] = new Control("video","longtext","Код видео");
$controls["video"]->rows = 7;
$controls["video"]->css_style = "width:300px;";


$get_params = array("source");

$title_fields["video"] = "Видео";

?>