<?php
function get_url($id)
{
    if ($_GET["content"] == 'news' || $_GET["content"] == 'action_activity') {
        $url = "/".$_GET["category"]."/".$id;
    }
    else{
	global $head;
	$url = "/".$head["url"]."/".$id;
    }
	return $url;
}
$sql_arr = explode("order by",strtolower($sql_text));
$sql_arr2 = explode("from",$sql_arr[0],2);
unset($sql_arr2[0]);
$count_sql_str = !isset($count_sql_str) ? "SELECT count(*)  FROM ".implode("",$sql_arr2) : $count_sql_str;
//echo $count_sql_str;
global $str_counter;
$count  = execute_scalar($count_sql_str);

$pagesize = isset($pagesize) ? $pagesize : 2;
$pager_size = isset($pager_size) ? $pager_size : 10;
$limit = "";
$pagecount = ceil($count/$pagesize);

$current_page = isset($_GET["page"]) ? $_GET["page"] : 1;
$limit = " LIMIT ".($pagesize*($current_page-1)).",$pagesize";
$pager = "";
$intervals = ceil($pagecount/$pager_size);
for($i = 0;$i < $intervals;$i++)
{
	
	$finish = ($i+1)*$pagesize*$pager_size;
	$start = $finish - ($pagesize*$pager_size) + 1;
	if(($current_page*$pagesize ) >= $start && $current_page*$pagesize <= $finish)
	{
		for($ind = 0; $ind < $pager_size;$ind++)
		{
			$end_value = $start+($ind*$pagesize) + $pagesize - 1;
			$page = ceil($end_value/$pagesize);
			if($i > 0 && $ind == 0)
			{
				$page_number = isset($arr2) ? $arr2[$page - 1] : $page - 1;
				//$pager .= "<a class='pl' href='".get_url($page_number)."'>� �����</a>&nbsp;&nbsp;&nbsp;&nbsp;";
			}
			
			if($end_value >= $count)
			{
				$end_value = $count;
			}
			if($page == $current_page)
			{
				$class = "cpl";
				$pager .= "<a  href='".get_url($page_number)."' class='active'>".$page."</a>";
			}
			else
			{
				$class = "pl";
				$page_number = isset($arr2) ? $arr2[$page] : $page;
				$pager .= "<a  href='".get_url($page_number)."'>".$page."</a>";
			}
			$pager .= "&nbsp;&nbsp;";
			if($end_value >= $count)
			{
				break;
			}
			if((($pager_size - $ind) == 1) && (($intervals - $i) > 1))
			{
				$page_number = isset($arr2) ? $arr2[$page + 1] : $page + 1;
				//$pager .= "&nbsp;&nbsp;<a class='pl' href='".get_url($page_number)."'>����� �</a>";
			}
		}
	}
}
