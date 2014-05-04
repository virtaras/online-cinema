<?php
global $tmdb_api_key;
$tmdb_api_key="62f80b94c8e6c0b81a4653e1c7a66afe";
global $tmdb_api_url;
$tmdb_api_url="https://api.themoviedb.org/";
global $tmdb_api_img_url;
$tmdb_api_img_url="http://image.tmdb.org/t/p/w500/";
function get_content(){
	global $tmdb_api_key;
	global $tmdb_api_url;
	global $tmdb_api_img_url;
	$tmdb_url=$tmdb_api_url."/3/discover/movie?api_key=$tmdb_api_key";
	if(isset($_GET["year"]) && is_numeric($_GET["year"]) && $_GET["year"]>0)
		$tmdb_url.="&year=".mysql_real_escape_string($_GET["year"]);
	if(isset($_GET["with_genres"]) && is_numeric($_GET["with_genres"]) && $_GET["with_genres"]>0)
		$tmdb_url.="&with_genres=".implode("|",explode(",",mysql_real_escape_string($_GET["with_genres"])));
	$json=file_get_contents($tmdb_url);
	//echo $json;
	$json_arr=json_decode($json,true);
	$movies_arr=$json_arr["results"];
	include _DIR."templates/moviesitems.php";
}
?>