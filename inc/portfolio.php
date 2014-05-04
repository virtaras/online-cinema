<?
if(isset($_GET["id"]))
{
	$title = execute_scalar("SELECT title FROM news WHERE id = '$_GET[id]' ");
}
else
{
	$title = "Портфолио";
}
function get_content()
{	?>
	<div class="promo-gallery">
				
				<div class="gallery-holder1" style="margin:0;">
				<ul>
			<?
   $sql = mysql_query("SELECT * FROM content WHERE parentid IN (SELECT id FROM content WHERE  urlname = '$_GET[url]') AND ispublish = 1 ");
   
   while($r = mysql_fetch_assoc($sql))
   {
   
    ?>
    <li>

      <a  href="/<?=$r["url"]?>">
     <span class="visual" style="">
     <img src="<?=get_main_image($r["id"],170,1)?>" alt=""  style="max-height: 120px;"/>
     </span>
     <span class="text-holder">

      <span style="font-size: 11px;"><?=$r["name"]?></span>
	
     </span>
     </a>

    </li>
    <?
   
   }?>
				</ul>
				</div>

			</div>

<?}?>