<?
$title = "Материалы";

$source = "SELECT materials.id,content.name FROM materials 
LEFT JOIN content ON content.id = materialid
WHERE materials.parentid = $_GET[parent]";

$controls["parentid"] = new Control("parentid","hidden");
$controls["parentid"]->default_value = $_GET["parent"];


$controls["source"] = new Control("parentid","hidden");
$controls["source"]->default_value = $_GET["parent"];

$exclude_fields_edit = array("id","parentid","source");

$controls["video"] = new Control("video","longtext","Код видео");
$controls["video"]->rows = 7;
$controls["video"]->css_style = "width:300px;";


$controls["materialid"] = new Control("materialid","list","Материал","SELECT id,name FROM content WHERE parentid IN (SELECt id FROM content WHERE parentid = 2) ORDER BY name");
$controls["materialid"]->reuired = true;

$get_params = array("source");


$title_fields["video"] = "Видео";

?>