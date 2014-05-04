<?php 
	//table section
	$table_page = "";//load custom list page
	$edit_page = "";//load custom edit page
	$title = "Новости";//Page title
	$source = "
  SELECT 
  news.id,
  CONCAT(siteusers.r46,' ',siteusers.r47,' ',siteusers.r48) as fio,
  DATE_FORMAT(news.ndate,'%d.%m.%Y') as ndate,
  news.title,news.in_index
  FROM news
  LEFT JOIN siteusers ON siteusers.id = news.userid
  ORDER BY news.ndate DESC ";//source sql for table;key field is required
	$source_key_field = "id";//key field,usually primary key
	$table  = "news";//destination table,use for save action	
	$title_fields = array("ndate"=>"Дата","title"=>"Заголовок","newstype"=>"Тип новости","in_index"=>"На главную","fio"=>"Ф.И.О.");//advanced title field in table header
	$exclude_fields = array("id");//this fields will be exclude from table listing
	$template_fields = array();//this fields will be load from template
	$pagesize = 20;
	$unsorted_fields = array();//This fields will not  sort by engine
	$csv_type = "";//0 - use $source,1 - use users query,2 - users defined function
	$csv_source = "";//csv source
	$csv_argument = array();//array of arguments for csv function,only if $csv_type = 2
	$edit_buttons = array(true,true);//array enable/disable standart edit button in row - array(<edit>,<delete>)
	$filters = array(); // array of filters
	//end table section
	//row section
	$generator_name = "";//Generator name, only for Firebird
	$exclude_fields_edit = array("id","ddate");//this fields will be exclude from edit page
	$required_fields = array("title");//this fields are required
	$edit_title_fields = array("title"=>"Заголовок");//advanced title field in edit  page
	$number_fields = array();//array represent number fields
	$select_fields = "*,DATE_FORMAT(ndate,'%d.%m.%Y') ddate";//this string reprsent custom select fields
	
	$edit_mode_buttons = array(true,true,true);
	
	
	$controls = array();//predefined controls
	$controls["title"] = new Control("title","longtext","Заголовок");
	$controls["title"]->css_style = "width:300px;";
	$controls["titleen"] = new Control("titleen","longtext","Заголовок (en)");
	$controls["titleen"]->css_style = "width:300px;";
	$date =  new Control("ndate","date","Дата");
	$date->required = true;
	$date->date_display = "ddate";
	$controls["ndate"] = $date;
	$body = new Control("info","template","Содержание");
	$body->template = "templates/body.php";
	$controls["info"] = $body;
	$controls["publish"] = new Control("publish","checkbox","Публиковать");
	$controls["publish"]->default_value = 1;
	$controls["newstype"] = new Control("newstype","list","Тип новости","SELECT id,name FROM newstype ORDER by sortorder");
	$controls["newstype"]->default_value = 3;
	
	$controls["userid"] = new Control("userid","list","Автор","SELECT id,CONCAT(siteusers.r46,' ',siteusers.r47,' ',siteusers.r48) as name FROM siteusers");
	$controls["in_index"] = new Control("in_index","checkbox","На главную");
  //end row section
	
	
	
	//start programm settings
	$sort_tablename = true;//add tablename to sort conditions
	//end programm settings
	
	//filter section
	//end filter section
	
	//start content section
	$table_content_top_1 ="";
	$table_content_top_2 ="";
	$table_content_bottom_1 ="";
	$table_left_content = "";
	$table_right_content = "";
	$edit_content_top = "";
	$edit_content_right = "";
	$edit_content_bottom = "";
	//end content section
	
		global $sourceid;
	$sourceid = 20;
	if(isset($_GET["id"]) && $_GET["id"] != "-1" )
	{
		$edit_content_bottom = "templates/img.php";
}
$eval_fields["in_index"] = "set_in_index(\$row);";
if(!function_exists("set_in_index"))
{
	function set_in_index($row)
	{
		?>
		<input type="checkbox" onclick="$.post('udf/ajax.php',{action:'news_in_index',id:<?=$row["id"]?>,status:this.checked},function() {});" value="1" <?=($row["in_index"] == "1" ? "checked='checked'" : "")?> />
		<?
	}
}
?>