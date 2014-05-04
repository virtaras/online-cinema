<?
$head = execute_row_assoc("SELECT *,DATE_FORMAT(start_date,'%d.%m.%Y') as sdate,DATE_FORMAT(finish_date,'%d.%m.%Y') as fdate,datediff( start_date, now( ) ) AS rd FROM events WHERE id = '".intval($_GET["id"])."'");
$title = $head["title"];
function get_content()
{
	global $head;
	 if($head["start_date"] != $head["finish_date"]) { ?>
	<p class="eventListDate"><?=$head["sdate"]?> &mdash; <?=$head["fdate"]?></p>
	<? } else { ?>
	<p class="eventListDate"><?=$head["sdate"]?></p>
	<? } ?>
	<p></p>
	<?
	echo htmlspecialchars_decode($head["info"]);
	$source = 1;
	$parentid = $head["id"];
	
	$imagesource = 40;
	if($head["rd"] > 0) {
	
	include("imagelist.php");

	}
	else
	{
		if($head["report"] != "")
		{
			?>
			<h1>Отчет о событии</h1>
			<a name="report"></a>
			<?
			echo htmlspecialchars_decode($head["report"]);
			if($head["video"] != "")
			{
				?>
				<p style="text-align:center;"><?=htmlspecialchars_decode($head["video"])?></p><br />
				<?
			}
			$source = 1;
	$parentid = $head["id"];
	
	$imagesource = 40;
	include("imagelist.php");
		
			?>
	<?
		}
	}

}

?>