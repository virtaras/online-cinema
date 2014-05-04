<?php
if (isset($_GET["url"])) {
    $head = execute_row_assoc("SELECT * FROM content WHERE urlname = '$_GET[url]' ");
    if ($head["id"] == "") {
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
    $head = execute_row_assoc("SELECT * FROM content WHERE id = 38 ");
    $title = $head["title"] != "" ? $head["title"] : $head["name"];
    $keywords = $head["keywords"];
    $description = $head["description"];
    $script = $head["script"];
}
function get_content()
{
    global $head;
    if (isset($_GET["url"])) {
        if ($head["id"] == "2") {
            echo htmlspecialchars_decode($head["info"], ENT_QUOTES);
        }
        else {

            ?>
<div class="wbl_w">
    <?
    $sql_text = "SELECT * FROM images WHERE parentid = '$head[id]' AND source = 1 ORDER BY showorder";

	$sql = mysql_query($sql_text);
    ?>
		<div class="wbl">
			<div class="paginator">

			</div>
		</div>
	</div>
	<div class="gallery-list">
        <?
        $ind = 0;
			while ($r = mysql_fetch_assoc($sql))
				{
        $ind++;
        ?>
		<div class="item <?=$ind%3 == 0 ? 'last' : ''?>">
			<a href="/images/files/<?=$r['image']?>" class="fancybox" rel="gallery">
				<img src="/images/w/600/<?=$r['id']?>.jpg" alt="" />

			</a>
		</div>
		 <?}?>

		<div class="clear"></div>
	</div>

        <?
            include "blocks/socLikes.php";
        }

    }
    else
    {
        ?>
    <div class="wbl_w">
    <?
    $sql_text = "SELECT * FROM content WHERE parentid = '$head[id]' AND ispublish = 1 ORDER BY showorder DESC";
    $pagesize = 9;
	include(_DIR."inc/paging.php");
	$sql = mysql_query($sql_text.$limit);
    ?>
		<div class="wbl">
			<div class="paginator">
				<?=$pager?>
			</div>
			<div class="wbl-nav">
				<a href="/galereja"><span class="icon"></span><span>Фотографии</span></a>
				<span class="sep"></span>
				<a href="/video"><span class="icon"></span><span>Видео</span></a>
			</div>
		</div>
	</div>
	<div class="gallery-list">
        <?
        $ind = 0;
			while ($r = mysql_fetch_assoc($sql))
				{
        $ind++;
        ?>
		<div class="item <?=$ind%3 == 0 ? 'last' : ''?>">
			<a href="/<?=$r['url']?>" class="fancybox">
				<img src="<?=get_main_image($r['id'],600,1)?>" alt="" />
				<span class="title"><?=$r['name']?></span>
			</a>
		</div>
		 <?}?>

		<div class="clear"></div>
	</div>
	<div class="wbl_w">
		<div class="wbl">
			<div class="paginator">
				<?=$pager?>
			</div>
		</div>
	</div>
    <?

    }
}

?>