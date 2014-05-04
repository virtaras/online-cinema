
<?php
if(isset($_GET["id"]))
{
	$title = execute_scalar("SELECT name FROM newstype WHERE id = '$_GET[id]' ");
}
function get_content()
{
  global $title;
	?>
	
	<div class="path" ><a class="path" href="<?=_SITE?>">Главная</a>&nbsp;/&nbsp;<a class="path" href="<?=_SITE?>news.html">Новости</a>&nbsp;/&nbsp;<a class="path" href="<?=_SITE?>newstype/<?=$_GET["id"]?>.html"><?=$title?></a></div>
<?php
			$sql_text = "SELECT id,DATE_FORMAT(ndate,'%d/%m/%Y') as newsdate,title FROM news WHERE publish = '1' 
      AND newstype= $_GET[id]
      ORDER BY ndate DESC ";
			$pager_size = 10;
			$pagesize = 5;
			require("paging.php");
			$sql = mysql_query($sql_text.$limit);
			//echo $sql_text.$limit;
      if($pagecount > 1)
	     {		
      	?>
      	<div style="text-align:center;margin-top:3px;margin-bottom:3px;"><?=$pager?></div>
      	<?php
        } 
			while($row = mysql_fetch_assoc($sql))
			{
				?>
				
				<div  class="news_date" style="margin-top:10px;margin-left:10px; " ><?=$row["newsdate"]?></div>
				<div><a class="news_name" style="margin-left:10px; " href="<?=_SITE?>news/<?=$row["id"]?>.html" style="font-size:11px;"><?=$row["title"]?></a></div>
				<?
			}
		
			if($pagecount > 1)
	{		
	?>
	<div style="text-align:center;margin-top:3px;margin-bottom:3px;"><?=$pager?></div>

  <? } 	

}

?>