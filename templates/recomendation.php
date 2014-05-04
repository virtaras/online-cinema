<?
global $tmdb_api_key;
global $tmdb_api_url;
global $tmdb_api_img_url;
$user=$_SESSION["login_user"];
//$user=execute_row_assoc("SELECT site_users.* FROM site_users WHERE id=1");
$movies=explode(",",$user["recomended_movies"]);?>
<div class="movies">
<?foreach($movies as $movie){
	$tmdb_url=$tmdb_api_url."3/movie/".$movie."?api_key=$tmdb_api_key";
	$json=file_get_contents($tmdb_url);
	//echo $json;
	$json_arr=json_decode($json,true);
	$movie=$json_arr;
	$img_path=$tmdb_api_img_url;
	$img_path.=($movie["poster_path"]!="") ? $movie["poster_path"] : $movie["backdrop_path"];
	if(isset($movie["id"])){
	$tmdb_video_url=$tmdb_api_url."3/movie/".$movie["id"]."/videos"."?api_key=$tmdb_api_key";
	$video_json=file_get_contents($tmdb_video_url);
	$video_json_arr=json_decode($video_json,true);
	$video_arr=$video_json_arr["results"];?>
	<div class="movie">
		<div class="title">id=<?=$movie["id"]?></div>
		<div class="title"><?=$movie["original_title"]?></div>
		<div class="title"><?foreach($video_arr as $video_ar){?><a href="//youtube.com/watch?v=<?=$video_ar["key"]?>"><?=$video_ar["name"]?></a> <?}?></div>
		<div class="date"><?=$movie["release_date"]?></div>
		<div class="image" style="background:url('<?=$img_path?>') 50%/cover"></div>
		
	</div>
	<?}
}?>