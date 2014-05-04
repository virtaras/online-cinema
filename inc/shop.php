<?php
if(isset($_GET["url"]) && isset($_GET["parent"])) {
$parentId = execute_scalar("SELECT id FROM content WHERE urlname = '".trim($_GET["parent"])."' ");
$sql_text = "SELECT content.*,modules.path,DATE_FORMAT(sdate,'%d.%m.%Y') as item_date FROM content
LEFT JOIN modules ON modules.id = content.script
WHERE content.urlname = '".trim($_GET["url"])."' AND parentid = '$parentId' ";

$head = execute_row_assoc($sql_text);
if($head["id"] == "")
{
	header("HTTP/1.0 404 Not Found");
	header("HTTP/1.1 404 Not Found");
	header("Status: 404 Not Found");

	 $sql_text = "SELECT content.*,modules.path,DATE_FORMAT(sdate,'%d.%m.%Y') as item_date FROM content
	LEFT JOIN modules ON modules.id = content.script
WHERE content.url = '404' ";

$head = execute_row_assoc($sql_text);
}
$parent = $head["parentid"];
$title = $head["title"] != "" ? $head["title"] : $head["name"];
$keywords = $head["keywords"];
$description = $head["description"];
$script = $head["script"];
}
function get_content()
{
    global $head;
    global $parentId;
	if($head["id"] != 2 && isset($parentId) )
	{
	?>
   <div class="mainblock">
		<div class="sidebar_w">
			<div class="sidebar">
				<div class="side-menu">
					<div class="heading">Магазины</div>
                    <?
                    $arr = get_content_info($parent =  $parentId, $where = "", $limit = '');
                       $sql=mysql_query("SELECT *	FROM content WHERE parentid IN ($parentId)  AND ispublish='1' ORDER BY name");
				while ($r=mysql_fetch_assoc($sql))
                         {
                    ?>
					<a class="cat-item <?=$head['id'] == $r['id'] ? 'active' : ''?>" href="/<?=$r['url']?>"><?=$r['name']?></a>
					<?
                            }
                    ?>
				</div>
			</div>
		</div>
		<div class="content_w">
			<div class="content">
				<?=htmlspecialchars_decode($head['info'])?>
				<div class="content-slider">
					<ul id="content-slider">
                    <?
                    $arr = get_gallery($parent = $head['id'], $source = 1, $is_main = 0, $limit = '');
                        foreach($arr as $r)
                         {
                    ?>
						<li><img src="/images/files/<?=$r['image']?>" width="640" alt="" /></li>
					<?  }?>
					</ul>
				</div>

			</div>
		</div>
		<div class="clear"></div>
	</div>
    <?
        include "blocks/socLikes.php";
    }
    else {
         echo htmlspecialchars_decode($head['info']);
    }
} ?>