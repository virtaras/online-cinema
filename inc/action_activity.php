<?php
if(isset($_GET["type"]))
{
	$title = $_GET['type'] == 7 ? 'Акции' : ($_GET['type'] == 6 ? 'Мероприятия' : '');
}
function get_content()
{
	$type = $_GET['type'];
    $icon = $type == 7 ? 'icon-star' : ($type == 6 ? 'icon-hand' : '');
	$sql_text = "SELECT * FROM content WHERE parentid = '37' AND ispublish = 1 AND showtype = '$type'  ORDER BY showorder";
    $pagesize = 6;
	include(_DIR."inc/paging.php");
	$sql = mysql_query($sql_text.$limit);
	include('blocks/newsNav.php');
    ?>
   	<div class="img-events-list">
	<?
	while ($r = mysql_fetch_assoc($sql))
	{
		?>
		<div class="item">
			<div class="img"><a href="#"><img src="<?=get_main_image($r['id'], 240, 1)?>" alt="" /></a></div>
			<div class="desc">
				<h2 class="title"><span class="icon <?=$icon?>"></span><?=$r['name']?></h2>
				<div class="itext">
					<?=htmlspecialchars_decode($r['preview'])?>
				</div>
				<div class="details jNice">
					<a href="/<?=$r['url']?>" class="button">подробнее</a>
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
    }  ?>