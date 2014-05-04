<?//print_r($movie)?>
<?$img_path=$tmdb_api_img_url;
$img_path.=($movie["poster_path"]!="") ? $movie["poster_path"] : $movie["backdrop_path"];
$tmdb_video_url=$tmdb_api_url."3/movie/".$movie["id"]."/videos"."?api_key=$tmdb_api_key";
$video_json=file_get_contents($tmdb_video_url);
$video_json_arr=json_decode($video_json,true);
$video_arr=$video_json_arr["results"];?>
<div class="movie">
	<div class="title">id=<?=$movie["id"]?></div>
	<div class="title"><?=$movie["original_title"]?></div>
	<div class="title"><?foreach($video_arr as $video_ar){?><a href="//youtube.com/watch?v=<?=$video_ar["key"]?>"><?=$video_ar["name"]?></a><?}?></div>
	<div class="date"><?=$movie["release_date"]?></div>
	<div class="image" style="background:url('<?=$img_path?>') 50%/cover"></div>
</div>