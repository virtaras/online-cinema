<?
$title = "Пользователи";


$fsql = db_query("SELECT * FROM siteusers_fields ORDER BY showorder");
$farray = array();
while($f = db_fetch_assoc($fsql))
{
	$title_fields[$f["code"]] = $f["title"];
	array_push($farray,$f["code"]);
	switch($f["fieldtype"])
	{
		case "1":
			$edit_title_fields[$f["code"]] = $f["title"];
			break;
		case "2":
		$edit_title_fields[$f["code"]] = $f["title"];
			break;
		case "4":
		$controls[$f["code"]] = new Control($f["code"],"longtext",$f["title"]);
			break;
		case "8":
		$controls[$f["code"]] = new Control($f["code"],"checkbox",$f["title"]);
			break;	
	}
}
$where = " WHERE isactive = 1 AND reject = 0";
$ar = "";
if(isset($_GET["parent"]))
{
	switch($_GET["parent"])
	{
		case "0":
			$where = " WHERE isactive = 0 AND reject = 0";
			$title = "Новые пользователи";
			$ar = "0 as accept,1 as regect,";
			$eval_fields["accept"] = "set_accept_regect(\$row,0);";
			$eval_fields["regect"] = "set_accept_regect(\$row,1);";
			$title_fields["accept"] = "";
			$title_fields["regect"] = "";
			break;
		case "1":
			$where = " WHERE reject = 1";
			$title = "Отклоненные пользователи";
			break;
	}
}
$source = "SELECT $ar siteusers.id,email, ".implode(",",$farray)."
FROM siteusers $where ";

$title_fields["summa"] = "Сумма";

$unsorted_fields = array("accept","regect");



$exclude_fields = array("id","passw","create_date","last_login","last_ip","r55");
$exclude_fields_edit = array("id","reject");

$controls["isactive"] = new Control("isactive","checkbox","Активен");




$controls["last_login"] = new Control("last_login","label","Последний вход");
$controls["last_ip"] = new Control("last_ip","label","Последний IP");
$controls["create_date"] = new Control("create_date","label","Дата создания");


$title_fields["email"] = "E-Mail";
$edit_title_fields["email"] = "E-Mail";
$edit_title_fields["passw"] = "Пароль";

$controls["passw"] = new Control("passw","template","Пароль");
$controls["passw"]->template_mode = "standart";
$controls["passw"]->template = "templates/passw.php";

$controls["userregion"] = new Control("userregion","list","Регион",array("100"=>"Москва","4"=>"Регионы","458"=>"Украина"));

$edit_title_fields["email"] = "E-Mail";

if(!function_exists("set_accept_regect"))
{
	function set_accept_regect($row,$type)
	{
		switch($type)
		{
			case "0":
				?>
				<input onclick="if( confirm('Подтвердить регистрацию ?')) { $.post('../ajax.php',{action:'accept_registr',id:<?=$row["id"]?>},function() {document.location.href = document.location.href;}); }" type="button" class="buttons" value="Подтвердить" />
				<?
				break;
			case "1":
			?>
				<input onclick="if( confirm('Отклонить регистрацию ?')) { $.post('../ajax.php',{action:'regect_registr',id:<?=$row["id"]?>},function() {document.location.href = document.location.href;}); }" type="button" class="buttons" value="Отклонить" />
				<?
				break;
		}
	}
}

	global $sourceid;
	$sourceid = 21;
	if(isset($_GET["id"]) && $_GET["id"] != "-1" )
	{
	$edit_content_bottom = "templates/img.php";
	}
	
	$controls["isblog"] = new Control("isblog","checkbox","Включить блог");
	$controls["istrust"] = new Control("istrust","checkbox","Отключить модерацию");

?>
