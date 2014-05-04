<?php
if(isset($_GET["url"]))
{
    $head = execute_row_assoc("SELECT * FROM content WHERE urlname = '$_GET[url]' ");
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
else
{
	$head = execute_row_assoc("SELECT * FROM content WHERE urlname = '$_GET[category]' ");
    $title = $head["title"] != "" ? $head["title"] : $head["name"];
$keywords = $head["keywords"];
$description = $head["description"];
$script = $head["script"];
}
function get_content()
{
    global $head;
	if(isset($_GET["url"]))
	    {
        if($head["id"] == "2")
            {
                echo htmlspecialchars_decode( $head["info"],ENT_QUOTES);
            }
        else {
    $icon = $head['showtype'] == 7 ? 'icon-star' : ($head['showtype'] == 6 ? 'icon-hand' : '');
	?>
    <div class="img-events-list">
           <div class="item inside">
			<div class="img"><img src="<?=get_main_image($head['id'], 240, 1)?>" alt="" /></div>
			<div class="desc">
				<h2 class="title"><span class="icon <?=$icon?>"></span><?=$head['name']?></h2>
				<div class="itext">
					<?=htmlspecialchars_decode($head['info'])?>
				</div>
			</div>
		</div>
		<div class="clear"></div>
    </div>
        <?
            include "blocks/socLikes.php";
            }

	    }
	else 
	{
	$sql_text = "SELECT * FROM content WHERE parentid = '$head[id]' AND ispublish = 1 ORDER BY showorder DESC";
    $pagesize = 6;
	include(_DIR."inc/paging.php");
	$sql = mysql_query($sql_text.$limit);
    include('blocks/newsNav.php');
	?>
	<div class="img-events-list">
	<?
	while ($head = mysql_fetch_assoc($sql))
	{
        $icon = $head['showtype'] == 7 ? 'icon-star' : ($head['showtype'] == 6 ? 'icon-hand' : '');
		?>
		<div class="item">
			<div class="img"><a href="/<?=$head['url']?>"><img src="<?=get_main_image($head['id'], 240, 1)?>" alt="" /></a></div>
			<div class="desc">
				<h2 class="title"><span class="icon <?=$icon?>"></span><?=$head['name']?></h2>
				<div class="itext">
					<?=htmlspecialchars_decode($head['preview'])?> 
				</div>
				<div class="details jNice">
					<a href="/<?=$head['url']?>" class="button">подробнее</a>
				</div>
			</div>
		</div>
		<div class="clear"></div>
		<?
	}
	?>  
	</div>
    <?
    include('blocks/newsNav.php');
    } } ?>