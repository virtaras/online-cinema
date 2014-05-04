<?php
$sql_text = "SELECT content.*,modules.path,DATE_FORMAT(sdate,'%d.%m.%Y') as item_date FROM content
LEFT JOIN modules ON modules.id = content.script
WHERE content.urlname = '".trim($_GET["url"])."' AND content.parentid = 33 ";

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

function get_content()
{
    global $head;
   	if(isset($_GET["url"]) && $head['id'] != 2)
	{
	?>
    <div class="mainblock">
		<div class="sidebar_w">
			<div class="sidebar">
				<div class="side-menu scroll-pane">
					<div class="heading">Магазины</div>
                    <?
                    $arr = get_content_info($parent = $head["id"], $where = "", $limit = '');
                         $sql=mysql_query("SELECT *	FROM content WHERE parentid IN ($head[id])  AND ispublish='1' ORDER BY name");
				while ($r=mysql_fetch_assoc($sql))
                        {
                    ?>
					<a class="cat-item" href="/<?=$r['url']?>"><?=$r['name']?></a>
					<?  }?>
				</div>
			</div>
		</div>
		<div class="content_w">
			<div class="content">
				<div class="shop-cat-list shop-inner">
                <?
                    $ind= 0;
                        foreach($arr as $k)
                        {
                    $width = '150';
                    $img_width = execute_scalar("SELECT width FROM images WHERE parentid = '$k[id]' AND is_main = 1");
                    $img_width < $width ? $width = $img_width : $width = $width;
                    ?>
					<a href="/<?=$k['url']?>" class="item <?=$ind == 1 ? 'mid' : ''?>">
						<span class="img"><span class="vfix"></span><img src="<?=get_main_image_path($k['id'],
1)?>" alt="<?=$k['name']?>" width="<?=$width?>" title="<?=$k['name']?>"/></span>

					</a>
					<?  $ind++;
                        If ($ind == 3) {$ind = 0;}
                        }?>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>

    <?
         include('blocks/newsNav.php');
    }
    else {
        echo htmlspecialchars_decode($head['info']);
    }
} ?>