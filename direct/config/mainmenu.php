<?php
$title = "Настрока меню";
$title_fields["title"] = "Заголовок";
$title_fields["link"] = "Ссылка";
$title_fields["invisible"] = "Скрыть";
$title_fields["showorder"] = "Порядок";
$edit_title_fields["showorder"] = "Порядок";
$edit_title_fields["title"] = "Заголовок";
$edit_title_fields["link"] = "Ссылка";
$source = "SELECT * FROM mainmenu ORDER BY showorder";

$controls["invisible"] = new Control("invisible","checkbox","Скрыть");
$table_edit_mode = 1;

?>
