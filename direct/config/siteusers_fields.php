<?
$title = "Поля регистрации";
$exclude_fields = array("id","fieldtype");
$title_fields["code"] = "Идентификатор";
$title_fields["title"] = "Заголовок";
$title_fields["isrequired"] = "Обязательное поле";
$title_fields["items"] = "Список";
$title_fields["order_field"] = "Поле заказа";
$edit_title_fields["title"] = "Заголовок";
$edit_title_fields["code"] = "Идентификатор";
$controls["code"] = new Control("code","label","Идентификатор");
$controls["isrequired"] = new Control("isrequired","checkbox","Обязательное поле");
$edit_title_fields["showorder"] = "Порядок вывода";
$title_fields["showorder"] = "Порядок вывода";
$controls["items"] = new Control("items","longtext","Позиции");
$controls["items"]->rows = "10";
$controls["fieldtype"] = new Control("fieldtype","list","Тип поля","SELECT * FROM requestfieldtype WHERE id IN(1,2,4,8)");
$controls["fieldtype"]->required = true;
$required_fields = array("title");
$controls["order_field"] = new Control("order_field","list","Поле заказа","SELECT id,title FROM order_fields ORDER BY title","id","title");


$controls["last_login"] = new Control("last_login","label","Последний вход");
$controls["last_ip"] = new Control("last_ip","label","Последний IP");

$source = "SELECT siteusers_fields.id,siteusers_fields.title,siteusers_fields.code,siteusers_fields.items,siteusers_fields.isrequired,
siteusers_fields.showorder
FROM siteusers_fields
";

$sort_changes = array("order_field"=>"order_fields.title");
?>