<div style="clear:both;"></div>
<?
$sql = mysql_query("SELECT * FROM images WHERE  parentid = '$head[id]' AND source = 1");
if(mysql_num_rows($sql) > 1)
{
	?>
	<br />
	<?
while($r = mysql_fetch_assoc($sql))
{
	?>
	<div style="float:left;height:150px;text-align:center;margin-right:10px;margin-bottom:10px;"><a rel="prettyPhoto[gallery1]" href="<?=_SITE?>images/files/<?=$r["image"]?>"><img  align="center" src="<?=_SITE?>images/h/150/<?=$r["id"]?>.jpg" /></a></div>
	<?
}
?>
<div style="clear:both;"></div>
<br /><br />
<script type="text/javascript" charset="utf-8">
		$(document).ready(function(){
			$("a[rel^='prettyPhoto']").prettyPhoto({});
		});
		</script>
		<? } ?>
