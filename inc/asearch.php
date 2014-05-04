<?
$title = "Результаты поиска";
$sarr = explode(":",$_GET["stext"]);
	$stext = "";
	$scategory = "";
	if(count($sarr) == 1)
	{
		$stext = urldecode($sarr[0]);
		$scategory = "0";
	}
	else
	{
		$stext = urldecode($sarr[1]);
		$scategory = $sarr[0];
	}

	$stext = substr($stext, 0, 200);
    $title = $stext;
function get_content()
{

	global $stext;
	global $scategory;
    global $currency_array;
	$stext = str_replace(array("+","-","_","/","\\","(",")"),"",$stext);
	$arr = explode(" ",$stext);
    $where = " WHERE 1 = 1 ";
	foreach($arr as $current)
	{
		if($current == "")
		{
			continue;
		}
		if(strlen($current) < 3)
		{
			//continue;
		}
        if(strlen($current) >= 3 && in_array( substr($current, strlen($current) - 1, 1), array("и","ы")))
        {
            $current = substr($current, 0, strlen($current) - 1);
        }
		$where .= " AND LCASE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CONCAT(goods.name,catalog.name,catalog.one_name,IF(brands.name is NULL,'',brands.name )),'-',''),'-',''),'.',''),'/',''),'\\\\',''),' ','')) RLIKE '".strtolower_utf8($current)."'"; 
	}

	if($scategory != "0")
	{
		//echo $scategory;
		$childarray = array($scategory);
		get_child($scategory,&$childarray);
		$where .= " AND goods.parentid IN (".implode(",",$childarray).")";
	}
	$sql_text = "SELECT content.*  FROM content $where ";
echo $sql_text;
$count_sql_str = "SELECT count(*) FROM content 
$where
";
	?>
<table width="100%" class="subfilters" border="0"><tr><td>
		<?
		//require("sort.php");
		?>
		</td><td style="text-align:right;">
		<?
		
		$pagesize = setting("default_page_size");
		require("paging.php");
		if($pagecount > 1)
        {
            ?>
            <div class="pager">Страницы:&nbsp;<?=$pager?></div>
            <?
        }
		?>
		</td></tr>
       <?
      //require("page_size.php");
       ?>
        </table>
<?
$sql_text = $sql_text.$limit; 
require("catalogitem.php");
if($pagecount > 1)
        {
            ?>
            <div class="pager" style="text-align:center;">Страницы:&nbsp;<?=$pager?></div>
            <?
        }
if($gcount == 0)
{
	?>
	<br />
	<p>По Вашему запросу ничего не найдено. Сформулируйте запрос иначе !<p>
		<br />
	<?
}
}

?>