<?php
ini_set("display_errors","On");
include("inc/protection.php");
include("inc/constant.php");
include("inc/connection.php");
include("inc/global.php");

define('DATE_FORMAT_RFC822','r');
header("Content-type: application/xml; charset=utf-8");
$lastBuildDate=date(DATE_FORMAT_RFC822);
$site = _SITE;
echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>
<rss version=\"2.0\">
<channel>
<title>Общецерковный информационный портал 'Православное образование'</title> 
<language>ru</language>
";

$sql = mysql_query("SELECT id,name,urlname,preview,sdate FROM content ORDER BY id DESC LIMIT 0,20");
while($row = mysql_fetch_assoc($sql))
{
	$title = strip_tags(trim($row['name'])); 
	$anon = strip_tags(htmlspecialchars_decode($row['preview'],ENT_QUOTES)); 
	$anon  = str_replace("&nbsp"," ",$anon);
	$url = _SITE."content/$row[urlname].html"; 
	$date = explode("-",$row['sdate']);
    $pubdate = date('D, d M Y H:i:s O', mktime(0,0, 0, $date[1], $date[2], $date[0]));
	 $img = get_main_image($row["id"],150,1);
	echo "<item> 
	<title>$title</title> 
	<description>
	<![CDATA[<img align='left' style='border:none;margin-right:15px;' alt='$title' src='$img'>]]>
	$anon
	</description> 
	<link>$url</link> 
	<pubDate>$pubdate </pubDate>
	</item>";
	
}
echo "
</channel> 
</rss> ";

?>